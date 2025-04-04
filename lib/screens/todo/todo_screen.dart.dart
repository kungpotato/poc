import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/todo/todo_notifier.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(todoNotifierProvider.notifier).refresh();
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          todosAsync.when(
            data:
                (data) => Flexible(
                  child: ListView.builder(
                    itemCount: data.todos.length,
                    itemBuilder: (context, index) {
                      final todo = data.todos[index];
                      return ListTile(title: Text(todo.title));
                    },
                  ),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          todosAsync.when(
            data:
                (data) => Flexible(
                  child: ListView.builder(
                    itemCount: data.coins.length,
                    itemBuilder: (context, index) {
                      final todo = data.coins[index];
                      return ListTile(
                        title: Text(todo.symbol),
                        trailing: Text(todo.price.toString()),
                      );
                    },
                  ),
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }
}
