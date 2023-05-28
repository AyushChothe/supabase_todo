import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_todo/common/hooks/useUser/use_user.dart';
import 'package:supabase_todo/features/auth/controller/auth_controller.dart';
import 'package:supabase_todo/features/todo/controller/todo_controller.dart';
import 'package:supabase_todo/features/todo/widgets/todo_tile.dart';
import 'package:supabase_todo/models/todo.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = useSupabaseUser();
    final auth = ref.watch(authProvider);
    final todosCtrl = ref.watch(todoCtrlProvider);
    final todosStream = ref.watch(getTodosProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Supabase Todos"),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (user == null)
                auth.signInWithPassword(
                  email: "ayushmchothe@gmail.com",
                  password: "Ayush123",
                );
              else
                auth.signOut();
            },
            child:
                Icon(user == null ? Icons.login_rounded : Icons.logout_rounded),
          ),
          SizedBox(
            width: 10,
          ),
          TapDebouncer(
            onTap: () => todosCtrl.addTodo(
                TodoModel(name: "TestTodo", description: "Hello world")),
            builder: (context, onTap) => FloatingActionButton(
              onPressed: onTap,
              child: Icon(Icons.plus_one),
            ),
          ),
        ],
      ),
      body: todosStream.when(
        data: (todos) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, i) => ProviderScope(
              overrides: [todoProvider.overrideWithValue(todos[i])],
              child: TodoTile(),
            ),
          ),
        ),
        error: (e, st) => Center(
          child: Text(todosStream.error.toString()),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
