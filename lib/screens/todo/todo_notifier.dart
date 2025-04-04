import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/todo/todo_model.dart';
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
        return TodoState(todos: a, coins: b.take(3).toList());
      },
    );
  }

  Stream<List<TodoModel>> getTodo() {
    return ref
        .read(todoRepositoryProvider)
        .fetchTodos()
        .map((event) {
          return event.take(3).toList();
        })
        .doOnError((p0, p1) {
          print(p0);
          print(p1);
        });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await getTodo().first;
      return state.value!.copyWith(todos: data);
    });
  }
}
