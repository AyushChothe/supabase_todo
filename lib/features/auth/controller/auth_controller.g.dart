// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authHash() => r'c55b724f83a1e1d248f6377f313740b5749b38cd';

/// See also [auth].
@ProviderFor(auth)
final authProvider = AutoDisposeProvider<GoTrueClient>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRef = AutoDisposeProviderRef<GoTrueClient>;
String _$authChangesHash() => r'083d05859489b99fa523b07b32b8afcc36d49d6c';

/// See also [authChanges].
@ProviderFor(authChanges)
final authChangesProvider = AutoDisposeStreamProvider<AuthState>.internal(
  authChanges,
  name: r'authChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthChangesRef = AutoDisposeStreamProviderRef<AuthState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
