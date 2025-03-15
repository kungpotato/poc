import 'package:poc/data/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Stream<List<Todo>> build() {
    return Stream.value([
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod', completed: false),
    ]);
  }
}
