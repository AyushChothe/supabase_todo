import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

User? useSupabaseUser({SupabaseClient? client}) =>
    use(UserHook(client: client ?? Supabase.instance.client));

class UserHook extends Hook<User?> {
  final SupabaseClient client;

  UserHook({required this.client});

  @override
  HookState<User?, UserHook> createState() => UserHookState();
}

class UserHookState extends HookState<User?, UserHook> {
  User? _user;
  late StreamSubscription _subscription;

  @override
  void initHook() {
    _subscription = hook.client.auth.onAuthStateChange.listen((e) {
      setState(() {
        _user = e.session?.user;
      });
    });
  }

  @override
  User? build(BuildContext context) => _user;

  @override
  void dispose() => _subscription.cancel();
}
