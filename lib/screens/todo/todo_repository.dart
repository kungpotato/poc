import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/todo/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(Ref ref) {
  final repo = TodoRepository();
  ref.onDispose(repo.dispose);
  return repo;
}

class TodoRepository {
  final _todoController = BehaviorSubject<List<TodoModel>>.seeded([]);

  Stream<List<TodoModel>> get todosStream => _todoController.stream;

  void addTodo(TodoModel todo) {
    final currentTodos = _todoController.value;
    _todoController.add([...currentTodos, todo]);
  }

  void updateTodo(TodoModel updatedTodo) {
    final currentTodos =
        _todoController.value.map((todo) {
          return todo.id == updatedTodo.id ? updatedTodo : todo;
        }).toList();
    _todoController.add(currentTodos);
  }

  void deleteTodo(String id) {
    final currentTodos =
        _todoController.value.where((todo) => todo.id != id).toList();
    _todoController.add(currentTodos);
  }

  void dispose() {
    _todoController.close();
  }
}
