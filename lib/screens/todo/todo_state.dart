import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poc/screens/todo/todo_model.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  factory TodoState({required List<TodoModel> todos}) = _TodoState;

  TodoState._();
}
