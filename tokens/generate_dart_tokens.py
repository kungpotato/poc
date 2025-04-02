import json
import os
import re


def pascal_case(s):
    # Split on non-alphanumeric + also insert space before capital letters (camelCase)
    s = re.sub(r'(?<=[a-z])([A-Z])', r' \1', s)
    words = re.split(r'[^a-zA-Z0-9]+', s)
    return ''.join(word.capitalize() for word in words if word)


def camel_case(s):
    # Insert space before capital letters to split camelCase too
    s = re.sub(r'(?<=[a-z])([A-Z])', r' \1', s)
    words = re.split(r'[^a-zA-Z0-9]+', s)
    return words[0].lower() + ''.join(word.capitalize() for word in words[1:] if word)


def infer_type(val):
    try:
        float_val = float(val)
        return 'int' if float_val.is_integer() else 'double'
    except:
        pass
    if isinstance(val, str) and re.match(r'^#([A-Fa-f0-9]{3,6})$', val):
        return 'String'
    return 'String'


def format_value(val):
    try:
        float_val = float(val)
        return str(int(float_val)) if float_val.is_integer() else str(float_val)
    except:
        return f"'{val}'"


def resolve_references(value, token_map):
    if isinstance(value, str) and value.startswith('{') and value.endswith('}'):
        ref_key = value.strip('{}')
        resolved = token_map.get(ref_key)
        if isinstance(resolved, str) and resolved.startswith('{'):
            return resolve_references(resolved, token_map)
        return resolved
    return value


def flatten_tokens(data, prefix='', flat_map=None):
    if flat_map is None:
        flat_map = {}

    for k, v in data.items():
        full_key = f"{prefix}.{k}" if prefix else k
        if isinstance(v, dict):
            if 'value' in v:
                # Store both with and without `.value`
                flat_map[full_key] = v['value']
                flat_map[full_key + '.value'] = v['value']
            else:
                flatten_tokens(v, full_key, flat_map)

    return flat_map


def generate_dart_class(name, props, token_map, indent=2):
    class_name = pascal_case(name)
    lines = [f'class {class_name} {{']

    def walk(sub_props, path_stack=[]):
        for key, val in sub_props.items():
            new_path = path_stack + [key]
            if isinstance(val, dict):
                if 'value' in val:
                    field_name = camel_case('_'.join(new_path))
                    resolved = resolve_references(val['value'], token_map)
                    if resolved is not None:
                        dart_type = infer_type(resolved)
                        formatted_val = format_value(resolved)
                        lines.append(
                            ' ' * indent + f'static const {dart_type} {field_name} = {formatted_val};')
                else:
                    walk(val, new_path)

    walk(props)
    lines.append('}')
    return '\n'.join(lines)


def parse_tokens(data, output_dir='../lib/generated_tokens'):
    os.makedirs(output_dir, exist_ok=True)
    token_map = flatten_tokens(data)

    for group_name, group_values in data.items():
        for class_name, class_props in group_values.items():
            dart_code = generate_dart_class(class_name, class_props, token_map)
            file_path = os.path.join(output_dir, f'{camel_case(class_name)}.dart')
            with open(file_path, 'w') as f:
                f.write(dart_code)
            print(f"Generated: {file_path}")


# === Example Usage ===
if __name__ == "__main__":
    with open('tokens.json', 'r') as f:
        token_data = json.load(f)
    parse_tokens(token_data)
