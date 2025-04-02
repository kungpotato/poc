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


def snake_case(s):
    # Add underscore between camelCase or PascalCase words
    s = re.sub(r'(?<=[a-z0-9])([A-Z])', r'_\1', s)
    # Replace non-alphanumeric characters with underscores
    s = re.sub(r'[^a-zA-Z0-9]+', '_', s)
    return s.lower()


def infer_type(val):
    if isinstance(val, str) and re.match(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{8})$', val):
        return 'Color'
    try:
        float_val = float(val)
        return 'int' if float_val.is_integer() else 'double'
    except:
        return 'String'


def format_value(val):
    if isinstance(val, str):
        if re.match(r'^#([A-Fa-f0-9]{6})$', val):
            # Convert #RRGGBB to Color(0xFFRRGGBB)
            return f'Color(0xFF{val[1:].upper()})'
        elif re.match(r'^#([A-Fa-f0-9]{8})$', val):
            # Convert #AARRGGBB directly
            return f'Color(0x{val[1:].upper()})'
        try:
            float_val = float(val)
            return str(int(float_val)) if float_val.is_integer() else str(float_val)
        except:
            return f"'{val}'"

    if isinstance(val, (int, float)):
        return str(val)

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
    lines = []
    has_color = False

    def walk(sub_props, path_stack=[]):
        nonlocal has_color
        for key, val in sub_props.items():
            new_path = path_stack + [key]
            if isinstance(val, dict):
                if 'value' in val:
                    field_name = camel_case('_'.join(new_path))
                    resolved = resolve_references(val['value'], token_map)
                    if resolved is not None:
                        dart_type = infer_type(resolved)
                        if dart_type == 'Color':
                            has_color = True
                        formatted_val = format_value(resolved)
                        lines.append(
                            ' ' * indent + f'static const {dart_type} {field_name} = {formatted_val};')
                elif 'light' in val or 'dark' in val:
                    for theme_mode in ['light', 'dark']:
                        if theme_mode in val and isinstance(val[theme_mode], dict) and 'value' in \
                                val[theme_mode]:
                            themed_path = new_path + [theme_mode]
                            field_name = camel_case('_'.join(themed_path))
                            resolved = resolve_references(val[theme_mode]['value'], token_map)
                            if resolved is not None:
                                dart_type = infer_type(resolved)
                                if dart_type == 'Color':
                                    has_color = True
                                formatted_val = format_value(resolved)
                                lines.append(
                                    ' ' * indent + f'static const {dart_type} {field_name} = {formatted_val};')
                else:
                    walk(val, new_path)

    walk(props)

    if has_color:
        lines.insert(0, "import 'package:flutter/material.dart';\n")

    lines.insert(1 if has_color else 0, f'class Kp{class_name} {{')
    lines.append('}')
    return '\n'.join(lines)


def parse_tokens(data, output_dir='../lib/theme/generated_tokens'):
    os.makedirs(output_dir, exist_ok=True)
    token_map = flatten_tokens(data)

    for group_name, group_values in data.items():
        for class_name, class_props in group_values.items():
            dart_code = generate_dart_class(class_name, class_props, token_map)
            file_path = os.path.join(output_dir, f'kp_{snake_case(class_name)}.dart')
            with open(file_path, 'w') as f:
                f.write(dart_code)
            print(f"Generated: {file_path}")


# === Example Usage ===
if __name__ == "__main__":
    with open('tokens.json', 'r') as f:
        token_data = json.load(f)
    parse_tokens(token_data)
