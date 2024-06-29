import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<List<Todo>> getAllTodos(Session session) async {
    return Todo.db.find(session);
  }

  Future<void> addTodo(Session session, {required Todo todo}) async {
    await Todo.db.insert(session, [todo]);
  }

  Future<List<Todo>> updateTodo(Session session, {required Todo todo}) async {
    return Todo.db.update(session, [todo]);
  }

  Future<bool> deleteTodo(Session session, {required int id}) async {
    final todo = await Todo.db.find(
      session,
      where: (t) => t.id.equals(id),
    );
    final result = await Todo.db.delete(session, todo);
    return result.length == 1;
  }
}
