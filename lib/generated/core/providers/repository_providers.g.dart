// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseServiceHash() => r'19c80bc505703ba7cf25182804554aef296e6af5';

/// See also [databaseService].
@ProviderFor(databaseService)
final databaseServiceProvider = Provider<DatabaseService>.internal(
  databaseService,
  name: r'databaseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseServiceRef = ProviderRef<DatabaseService>;
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
String _$userStorageHash() => r'42488d89357b9c22dcd5443084314b29e2a91967';

/// ////////////////////////////////////////////////////////////////////
/// Repository support providers
/// ////////////////////////////////////////////////////////////////////
/// User Repository
///
/// Copied from [userStorage].
@ProviderFor(userStorage)
final userStorageProvider = AutoDisposeProvider<UserStorage>.internal(
  userStorage,
  name: r'userStorageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStorageRef = AutoDisposeProviderRef<UserStorage>;
String _$userRepositoryHash() => r'2ed94caaadc12ceb5e60ee0dd92beff137de95d8';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$casesRepositoryHash() => r'f53e55d364e9d6774cf87d745f379fec5dff0a4f';

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
String _$mediaRepositoryHash() => r'8d3be2ef7e6340f1de41ee0c84e266b179804d52';

/// Media Repository provider
///
/// Copied from [mediaRepository].
@ProviderFor(mediaRepository)
final mediaRepositoryProvider = AutoDisposeProvider<MediaRepository>.internal(
  mediaRepository,
  name: r'mediaRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MediaRepositoryRef = AutoDisposeProviderRef<MediaRepository>;
String _$templatesRepositoryHash() =>
    r'9d6569a99a19938f2a3d017ea554427bc47e50a6';

/// See also [templatesRepository].
@ProviderFor(templatesRepository)
final templatesRepositoryProvider =
    AutoDisposeProvider<TemplatesRepository>.internal(
  templatesRepository,
  name: r'templatesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templatesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemplatesRepositoryRef = AutoDisposeProviderRef<TemplatesRepository>;
String _$ftsSearchRepositoryHash() =>
    r'99f97debd3c55e57b2cf53efa5a17fe64b2c316c';

/// Full text search Repository provider
///
/// Copied from [ftsSearchRepository].
@ProviderFor(ftsSearchRepository)
final ftsSearchRepositoryProvider =
    AutoDisposeProvider<FtsSearchRepository>.internal(
  ftsSearchRepository,
  name: r'ftsSearchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ftsSearchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FtsSearchRepositoryRef = AutoDisposeProviderRef<FtsSearchRepository>;
String _$statsRepositoryHash() => r'3f7c552a1e2f93f9af730eb06d525e6b8ab5e2c3';

/// Stats Repository provider
///
/// Copied from [statsRepository].
@ProviderFor(statsRepository)
final statsRepositoryProvider = AutoDisposeProvider<StatsRepository>.internal(
  statsRepository,
  name: r'statsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$statsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StatsRepositoryRef = AutoDisposeProviderRef<StatsRepository>;
String _$settingsRepositoryHash() =>
    r'b16c395ba579fba6f4aa9bc86dd5ae2741723af5';

/// Settings repository provider
///
/// Copied from [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
  settingsRepository,
  name: r'settingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
String _$supportDataRepositoryHash() =>
    r'7901d87821cbb8b46e35c91e27a09651038c0956';

/// Settings repository provider
///
/// Copied from [supportDataRepository].
@ProviderFor(supportDataRepository)
final supportDataRepositoryProvider =
    AutoDisposeProvider<SupportDataRepository>.internal(
  supportDataRepository,
  name: r'supportDataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supportDataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupportDataRepositoryRef
    = AutoDisposeProviderRef<SupportDataRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
