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

  Future<List<TodoModel>> fetchTodos() async {
    final response = await _dio.get('/todos');
    final data = response.data as List;

    return data
        .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
