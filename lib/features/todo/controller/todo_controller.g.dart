// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoHash() => r'df49524403d6cc168be7adbe804b885ddb4e47c6';

/// See also [todo].
@ProviderFor(todo)
final todoProvider = AutoDisposeProvider<TodoModel>.internal(
  todo,
  name: r'todoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef TodoRef = AutoDisposeProviderRef<TodoModel>;
String _$todoCtrlHash() => r'c95baa61df51724ca9f3f62eb464421ca7f005ba';

/// See also [todoCtrl].
@ProviderFor(todoCtrl)
final todoCtrlProvider = AutoDisposeProvider<TodoController>.internal(
  todoCtrl,
  name: r'todoCtrlProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoCtrlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoCtrlRef = AutoDisposeProviderRef<TodoController>;
String _$getTodosHash() => r'b60c4fcf598a5517b25f426dba7bfcb379ebde95';

/// See also [getTodos].
@ProviderFor(getTodos)
final getTodosProvider = AutoDisposeStreamProvider<List<TodoModel>>.internal(
  getTodos,
  name: r'getTodosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTodosRef = AutoDisposeStreamProviderRef<List<TodoModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
