import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_todo/common/models/todo.dart';
import 'package:supabase_todo/features/todo/controller/todo_controller.dart';

void main() async {
  const supabaseUrl = String.fromEnvironment("SUPABASE_URL");
  const supabaseKey = String.fromEnvironment("SUPABASE_KEY");
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  group('Supabase Test', () {
    test('Login Test', () async {
      await client.auth
          .signInWithPassword(email: "test@gmail.com", password: "test");
    });

    test('Todo Create Test', () async {
      final ctrl = TodoController(client);
      final before = await ctrl.getTodos().first;
      await ctrl
          .addTodo(TodoModel(name: "Test Todo 1", description: "Description"));
      final after = await ctrl.getTodos().first;

      expect(before.length, equals(after.length - 1));
    });
    test('Todo Update Test', () async {
      final ctrl = TodoController(client);
      final todos = await ctrl.getTodos().first;

      final before = todos.first;

      await ctrl.toggleTodo(before);
      final after = await ctrl.getTodo(before.id!);

      expect(before.status, equals(!after.status));
    });
    test('Todo Delete Test', () async {
      final ctrl = TodoController(client);
      final todos = await ctrl.getTodos().first;
      final before = todos.first;

      await ctrl.removeTodo(before);

      expect(ctrl.getTodo(before.id!), throwsA(isA<PostgrestException>()));
    });
  });
}
