// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../core/app_providers.dart';

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
    r'4b90f438b6f7ef1084865b8d6a1999e0d6e25dc3';

/// Local stream listener provider of the auth state
///
/// Copied from [authenticationUserStream].
@ProviderFor(authenticationUserStream)
final authenticationUserStreamProvider =
    StreamProvider<AuthenticationUser>.internal(
  authenticationUserStream,
  name: r'authenticationUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationUserStreamRef = StreamProviderRef<AuthenticationUser>;
String _$authenticationUserHash() =>
    r'54c8c70b75e192693aa42c46715d48d4d1f9b480';

/// Authenticated user provider
///
/// Exposes User in a non async manner as regular provider
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
String _$userIDHash() => r'e8d61e6d3bf3479b61307f5b74b90c17dbda4fdc';

/// See also [userID].
@ProviderFor(userID)
final userIDProvider = AutoDisposeProvider<String>.internal(
  userID,
  name: r'userIDProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIDHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserIDRef = AutoDisposeProviderRef<String>;
String _$logoutHash() => r'11d80aae4786bc8f25e2a544bb466b37c4df8cae';

/// See also [logout].
@ProviderFor(logout)
final logoutProvider = AutoDisposeFutureProvider<void>.internal(
  logout,
  name: r'logoutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogoutRef = AutoDisposeFutureProviderRef<void>;
String _$realmDatabaseHash() => r'30b5d0f981f5b73c9f38e0faf5fd3b4507c971fc';

/// See also [realmDatabase].
@ProviderFor(realmDatabase)
final realmDatabaseProvider = FutureProvider<RealmDatabase>.internal(
  realmDatabase,
  name: r'realmDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realmDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealmDatabaseRef = FutureProviderRef<RealmDatabase>;
String _$realmHash() => r'eb06b9134c0ced91329f77eaa48077671cf75dd2';

/// See also [realm].
@ProviderFor(realm)
final realmProvider = Provider<Realm>.internal(
  realm,
  name: r'realmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$realmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealmRef = ProviderRef<Realm>;
String _$dbHash() => r'609f539c59de2e895f0a70977d5df29f0ecb2eca';

/// See also [db].
@ProviderFor(db)
final dbProvider = Provider<Collections>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = ProviderRef<Collections>;
String _$appStartUpHash() => r'16b340b1ac38ab625951f2c6c0bc0028c2d1c9fe';

/// See also [appStartUp].
@ProviderFor(appStartUp)
final appStartUpProvider = AutoDisposeFutureProvider<void>.internal(
  appStartUp,
  name: r'appStartUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appStartUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppStartUpRef = AutoDisposeFutureProviderRef<void>;
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
String _$connectivityStatusHash() =>
    r'3cba16e6359dc4f71f1f438fe6d9dd0239e6bfb5';

/// See also [ConnectivityStatus].
@ProviderFor(ConnectivityStatus)
final connectivityStatusProvider =
    NotifierProvider<ConnectivityStatus, bool>.internal(
  ConnectivityStatus.new,
  name: r'connectivityStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConnectivityStatus = Notifier<bool>;
String _$crudHash() => r'f361ecd25af373b1d7dce35b6c6bbf316f584dbb';

/// See also [Crud].
@ProviderFor(Crud)
final crudProvider = NotifierProvider<Crud, void>.internal(
  Crud.new,
  name: r'crudProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$crudHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Crud = Notifier<void>;
String _$currentThemeModeHash() => r'7e59fd4cc020fbea713ad3f8a130394c6e35f580';

/// See also [CurrentThemeMode].
@ProviderFor(CurrentThemeMode)
final currentThemeModeProvider =
    AutoDisposeNotifierProvider<CurrentThemeMode, int>.internal(
  CurrentThemeMode.new,
  name: r'currentThemeModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentThemeMode = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
