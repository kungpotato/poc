import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/dio/dio.dart';
import 'package:poc/screens/todo/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(Ref ref) {
  return TodoRepository(ref.read(dioProvider));
}

class TodoRepository {
  TodoRepository(this._dio);

  final Dio _dio;

  Stream<List<TodoModel>> fetchTodos() {
    return Stream.fromFuture(_dio.get('/todos')).map(
      (response) =>
          (response.data as List)
              .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}
