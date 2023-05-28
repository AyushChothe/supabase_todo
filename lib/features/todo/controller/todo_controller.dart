import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_todo/common/providers/supabase.dart';
import 'package:supabase_todo/features/auth/controller/auth_controller.dart';
import 'package:supabase_todo/models/todo.dart';

part 'todo_controller.g.dart';

@Riverpod(dependencies: [])
TodoModel todo(TodoRef ref) {
  return TodoModel.fromMap({});
}

@riverpod
TodoController todoCtrl(TodoCtrlRef ref) {
  final sb = ref.watch(supabaseProvider);
  final _ = ref.watch(authChangesProvider);
  return TodoController(sb);
}

@riverpod
Stream<List<TodoModel>> getTodos(GetTodosRef ref) {
  final todoCtrl = ref.watch(todoCtrlProvider);
  return todoCtrl.getTodos();
}

class TodoController {
  final _todosTable = "todos";

  final SupabaseClient _client;
  final User? _user;

  TodoController(this._client) : _user = _client.auth.currentUser;

  Stream<List<TodoModel>> getTodos() {
    if (_user == null) return Stream.error("User not found");
    return _client
        .from(_todosTable)
        .stream(primaryKey: ["id"])
        .eq("user_id", _user!.id)
        .map((event) => (event.map((e) => TodoModel.fromMap(e)).toList()));
  }

  Future<void> addTodo(TodoModel todo) async {
    return _client.from(_todosTable).insert(todo.toMap());
  }

  Future<void> removeTodo(TodoModel todo) async {
    await _client.from(_todosTable).delete().eq("id", todo.id);
  }

  Future<void> toggleTodo(TodoModel todo) async {
    await _client
        .from(_todosTable)
        .update(todo.copyWith(status: !todo.status).toMap())
        .eq("id", todo.id);
  }
}
