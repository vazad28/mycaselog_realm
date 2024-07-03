// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthInstanceHash() =>
    r'fb9c7d658061c097ccd3a054f263026006b911cb';

/// Firebase Auth Instance for use all through the app
///
/// Copied from [firebaseAuthInstance].
@ProviderFor(firebaseAuthInstance)
final firebaseAuthInstanceProvider = Provider<FirebaseAuth>.internal(
  firebaseAuthInstance,
  name: r'firebaseAuthInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthInstanceRef = ProviderRef<FirebaseAuth>;
String _$authenticationClientHash() =>
    r'5696b25b2d040e564ab6d44eecf12efd2bf5936d';

/// Authentication Client
///
/// Copied from [authenticationClient].
@ProviderFor(authenticationClient)
final authenticationClientProvider = Provider<AuthenticationClient>.internal(
  authenticationClient,
  name: r'authenticationClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationClientRef = ProviderRef<AuthenticationClient>;
String _$authenticationRepositoryHash() =>
    r'19dd832c9447efc6ac6d763f06200e4680e03d14';

/// Authentication repository
///
/// Copied from [authenticationRepository].
@ProviderFor(authenticationRepository)
final authenticationRepositoryProvider =
    AutoDisposeProvider<AuthenticationRepository>.internal(
  authenticationRepository,
  name: r'authenticationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationRepositoryRef
    = AutoDisposeProviderRef<AuthenticationRepository>;
String _$authenticationUserStreamHash() =>
    r'1a96349d48186453a8c2390e1fe940d67d9f0107';

/// Local stream listener provider of the auth state
///
/// Copied from [_authenticationUserStream].
@ProviderFor(_authenticationUserStream)
final _authenticationUserStreamProvider =
    StreamProvider<AuthenticationUser>.internal(
  _authenticationUserStream,
  name: r'_authenticationUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _AuthenticationUserStreamRef = StreamProviderRef<AuthenticationUser>;
String _$authenticationUserHash() =>
    r'138d40715346c2e7b44129ee9de3d3b0c02405bb';

/// Authenticated user provider
///
/// Exposes User in a non aasync manner as regular provider
///
/// Copied from [authenticationUser].
@ProviderFor(authenticationUser)
final authenticationUserProvider = Provider<AuthenticationUser>.internal(
  authenticationUser,
  name: r'authenticationUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationUserRef = ProviderRef<AuthenticationUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
