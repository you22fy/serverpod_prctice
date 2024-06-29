import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mypod_flutter/views/todo_notifier.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(toDoNotifierProvider);
    final notifier = ref.watch(toDoNotifierProvider.notifier);
    final textEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'To Do',
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await notifier.getTodoList();
                },
                child: const Text('Get ToDo List'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () async {
                  await notifier.addTodo(textEditingController.text);
                },
                child: const Text('Add To Do'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    controller[index].name,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: controller[index].isDone,
                        onChanged: (_) async {
                          await notifier.toggleIsDone(index);
                        },
                      ),
                      IconButton(
                        onPressed: () async {
                          await notifier.deleteTodo(
                            controller[index].id!,
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
