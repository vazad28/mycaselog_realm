// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDataHash() => r'9de00d435e707a6007b9d9aab2747b95f58a8fe0';

/// See also [appData].
@ProviderFor(appData)
final appDataProvider = Provider<AppData>.internal(
  appData,
  name: r'appDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDataRef = ProviderRef<AppData>;
String _$encryptionRepositoryHash() =>
    r'f89531b779bcc15cfe132068a90703f63f488864';

/// Encryption repository
///
/// Copied from [encryptionRepository].
@ProviderFor(encryptionRepository)
final encryptionRepositoryProvider =
    AutoDisposeProvider<EncryptionRepository>.internal(
  encryptionRepository,
  name: r'encryptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$encryptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EncryptionRepositoryRef = AutoDisposeProviderRef<EncryptionRepository>;
String _$casesRepositoryHash() => r'0fbf049c508adc2fa687fdaa9d7c08dfbcc9c3b5';

/// ////////////////////////////////////////////////////////////////////
/// Repository support providers
/// ////////////////////////////////////////////////////////////////////
/// Cases repository provider
///
/// Copied from [casesRepository].
@ProviderFor(casesRepository)
final casesRepositoryProvider = AutoDisposeProvider<CasesRepository>.internal(
  casesRepository,
  name: r'casesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$casesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CasesRepositoryRef = AutoDisposeProviderRef<CasesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
