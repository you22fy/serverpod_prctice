import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/client_singleton.dart';

part 'todo_notifier.g.dart';

@riverpod
class ToDoNotifier extends _$ToDoNotifier {
  @override
  List<Todo> build() => [];

  Future<void> addTodo(String name) async {
    try {
      final client = ClientSingleton().client;
      await client.todo.addTodo(
        todo: Todo(
          name: name,
          isDone: false,
        ),
      );
      getTodoList();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getTodoList() async {
    try {
      final client = ClientSingleton().client;
      state = await client.todo.getAllTodos();
      state = state.sort(
        (a, b) => (a.id ?? 0).compareTo(
          b.id ?? 0,
        ),
      ) as List<Todo>;
      print('Todo list: $state');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> toggleIsDone(int index) async {
    try {
      print('Toggling isDone for index $index');
      final client = ClientSingleton().client;
      await client.todo.updateTodo(
        todo: Todo(
          id: state[index].id,
          name: state[index].name,
          isDone: !state[index].isDone,
        ),
      );
      await getTodoList();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final client = ClientSingleton().client;
      await client.todo.deleteTodo(
        id: id,
      );
      await getTodoList();
    } catch (e) {
      print('Error: $e');
    }
  }
}
