import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/todo/todo_repository.dart';
import 'package:poc/screens/todo/todo_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Stream<TodoState> build() {
    return CombineLatestStream.combine2(
      getTodo(),
      ref.watch(wsEventProvider('trade').select((value) => value)),
      (a, b) {
        return a;
      },
    );
  }

  Stream<TodoState> getTodo() {
    return ref
        .read(todoRepositoryProvider)
        .fetchTodos()
        .map((event) => TodoState(todos: event));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => getTodo().first);
  }
}
