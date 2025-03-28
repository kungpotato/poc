import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/todo/todo_repository.dart';
import 'package:poc/screens/todo/todo_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  final _todoController = PublishSubject<TodoState>();

  @override
  Stream<TodoState> build() {
    ref.onDispose(_todoController.close);
    getTodo();

    return CombineLatestStream.combine2(
      _todoController.stream,
      ref.watch(wsEventProvider('trade').select((value) => value)),
      (a, b) {
        return a;
      },
    );
  }

  Future<void> getTodo() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    final res = await ref.read(todoRepositoryProvider).fetchTodos();
    _todoController.add(TodoState(todos: res));
  }
}
