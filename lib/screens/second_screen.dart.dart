import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/todo/todo_notifier.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: todosAsync.when(
        data:
            (data) => ListView.builder(
              itemCount: data.todos.length,
              itemBuilder: (context, index) {
                final todo = data.todos[index];
                return ListTile(title: Text(todo.title));
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
