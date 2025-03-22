import 'package:poc/screens/todo/todo_model.dart';
import 'package:poc/screens/todo/todo_repository.dart';
import 'package:poc/screens/todo/todo_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  final _todoController = BehaviorSubject<TodoState>.seeded(
    TodoState(todos: []),
  );

  @override
  Stream<TodoState> build() {
    ref.onDispose(ref.read(todoRepositoryProvider).dispose);
    ref.onDispose(_todoController.close);

    ref.read(todoRepositoryProvider).todosStream.listen((event) {
      _todoController.add(TodoState(todos: event));
    });

    return _todoController.stream;
  }

  Future<void> addTodo(String title) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    ref.read(todoRepositoryProvider).addTodo(newTodo);
  }

  Future<void> updateTodo(TodoModel todo) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    ref.read(todoRepositoryProvider).updateTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    ref.read(todoRepositoryProvider).deleteTodo(id);
  }
}
