import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_todo/features/todo/controller/todo_controller.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class TodoTile extends HookConsumerWidget {
  const TodoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    final todoCtrl = ref.watch(todoCtrlProvider);
    return TapDebouncer(
      onTap: () => todoCtrl.toggleTodo(todo),
      builder: (context, onTap) => Card(
        child: ListTile(
          onTap: onTap,
          onLongPress: () => todoCtrl.removeTodo(todo),
          leading: CircleAvatar(
            child: Icon(todo.status ? Icons.done : Icons.close),
          ),
          title: Text(todo.name),
          subtitle: Text(todo.id!),
        ),
      ),
    );
  }
}
