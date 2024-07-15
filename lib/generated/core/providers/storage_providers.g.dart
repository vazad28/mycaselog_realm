// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/storage_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsHash() => r'394954be62ac9fcd757598b97278fd4215bc6410';

/// SharedPreferences provider
///
/// Copied from [sharedPrefs].
@ProviderFor(sharedPrefs)
final sharedPrefsProvider = Provider<SharedPreferences>.internal(
  sharedPrefs,
  name: r'sharedPrefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPrefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPrefsRef = ProviderRef<SharedPreferences>;
String _$secureStorageHash() => r'583d067f846ca7642f24d6fd81ee1ab8520363db';

/// Secure storage provider
///
/// Copied from [secureStorage].
@ProviderFor(secureStorage)
final secureStorageProvider = AutoDisposeProvider<SecureStorage>.internal(
  secureStorage,
  name: r'secureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecureStorageRef = AutoDisposeProviderRef<SecureStorage>;
String _$persistentStorageHash() => r'e175811a8f1b8862394ce1153dbdd90bd4b719a4';

/// Persistent storage provider
///
/// Copied from [persistentStorage].
@ProviderFor(persistentStorage)
final persistentStorageProvider =
    AutoDisposeProvider<PersistentStorage>.internal(
  persistentStorage,
  name: r'persistentStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$persistentStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PersistentStorageRef = AutoDisposeProviderRef<PersistentStorage>;
String _$appDirPathHash() => r'22b325281d96a6c04d432bccec46a75a2e26b0de';

/// app dir path
///
/// Copied from [appDirPath].
@ProviderFor(appDirPath)
final appDirPathProvider = Provider<String>.internal(
  appDirPath,
  name: r'appDirPathProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDirPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDirPathRef = ProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
