import 'package:poc/screens/todo/todo_model.dart';
import 'package:poc/screens/todo/toto_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Stream<List<TodoModel>> build() {
    ref.onDispose(ref.read(todoRepositoryProvider).dispose);
    return ref.read(todoRepositoryProvider).todosStream;
  }

  Future<void> addTodo(String title) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 3));
    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    ref.read(todoRepositoryProvider).addTodo(newTodo);
  }

  Future<void> updateTodo(TodoModel todo) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 3));
    ref.read(todoRepositoryProvider).updateTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 3));
    ref.read(todoRepositoryProvider).deleteTodo(id);
  }
}
