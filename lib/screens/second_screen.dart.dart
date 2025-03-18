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
            (todos) => ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed:
                        () => ref
                            .read(todoNotifierProvider.notifier)
                            .deleteTodo(todo.id),
                  ),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      ref
                          .read(todoNotifierProvider.notifier)
                          .updateTodo(todo.copyWith(completed: value ?? false));
                    },
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => ref.read(todoNotifierProvider.notifier).addTodo('New Task'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
