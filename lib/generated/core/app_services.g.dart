// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../core/app_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dialogServiceHash() => r'33d1fc7bae9b43c98c784b20bc476cfdd8a21ebd';

/// Riverpod provider to use the dialog service
///
/// Copied from [dialogService].
@ProviderFor(dialogService)
final dialogServiceProvider = Provider<DialogService>.internal(
  dialogService,
  name: r'dialogServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dialogServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DialogServiceRef = ProviderRef<DialogService>;
String _$encryptionServiceHash() => r'0c5fd2269e1674f3d31925f7c8c09d46091bd984';

/// Encryption service provider
///
/// Copied from [encryptionService].
@ProviderFor(encryptionService)
final encryptionServiceProvider =
    AutoDisposeProvider<EncryptionService>.internal(
  encryptionService,
  name: r'encryptionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$encryptionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EncryptionServiceRef = AutoDisposeProviderRef<EncryptionService>;
String _$ftsSearchServiceHash() => r'1c21364f486e311970d44bdf7e4f337452295a10';

/// See also [ftsSearchService].
@ProviderFor(ftsSearchService)
final ftsSearchServiceProvider = AutoDisposeProvider<FtsSearchService>.internal(
  ftsSearchService,
  name: r'ftsSearchServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ftsSearchServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FtsSearchServiceRef = AutoDisposeProviderRef<FtsSearchService>;
String _$localStorageHash() => r'6a8a2e8f5ba40d7b896a3d1b5d6b3288cd54b858';

/// Riverpod provider to use the dialog service
///
/// Copied from [localStorage].
@ProviderFor(localStorage)
final localStorageProvider = AutoDisposeProvider<LocalStorage>.internal(
  localStorage,
  name: r'localStorageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalStorageRef = AutoDisposeProviderRef<LocalStorage>;
String _$imageUploadServiceHash() =>
    r'2e2d4b581424f692b3175fa98f71374de9f05b0b';

/// Riverpod provider to use the dialog service
///
/// Copied from [imageUploadService].
@ProviderFor(imageUploadService)
final imageUploadServiceProvider =
    AutoDisposeProvider<ImageUploadService>.internal(
  imageUploadService,
  name: r'imageUploadServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageUploadServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImageUploadServiceRef = AutoDisposeProviderRef<ImageUploadService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
