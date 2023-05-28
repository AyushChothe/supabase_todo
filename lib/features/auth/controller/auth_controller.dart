import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_todo/common/providers/supabase.dart';

part 'auth_controller.g.dart';

@riverpod
GoTrueClient auth(AuthRef ref) {
  final sb = ref.watch(supabaseProvider);
  return sb.auth;
}

@riverpod
Stream<AuthState> authChanges(AuthChangesRef ref) {
  final auth = ref.watch(authProvider);
  return auth.onAuthStateChange;
}
