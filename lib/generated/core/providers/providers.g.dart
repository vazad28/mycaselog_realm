// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/providers.dart';

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
String _$encryptionClientHash() => r'4eba4cbca2f85dea4f17df84be1efc50cced15b5';

/// Encryption service provider
///
/// Copied from [encryptionClient].
@ProviderFor(encryptionClient)
final encryptionClientProvider = AutoDisposeProvider<EncryptionClient>.internal(
  encryptionClient,
  name: r'encryptionClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$encryptionClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EncryptionClientRef = AutoDisposeProviderRef<EncryptionClient>;
String _$decryptPatientModelHash() =>
    r'ae14bcd26ac730d2e208bfdc65548c5c3497c326';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// decrypted patient data provider
///
/// Copied from [decryptPatientModel].
@ProviderFor(decryptPatientModel)
const decryptPatientModelProvider = DecryptPatientModelFamily();

/// decrypted patient data provider
///
/// Copied from [decryptPatientModel].
class DecryptPatientModelFamily extends Family {
  /// decrypted patient data provider
  ///
  /// Copied from [decryptPatientModel].
  const DecryptPatientModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'decryptPatientModelProvider';

  /// decrypted patient data provider
  ///
  /// Copied from [decryptPatientModel].
  DecryptPatientModelProvider call(
    String crypt,
  ) {
    return DecryptPatientModelProvider(
      crypt,
    );
  }

  @visibleForOverriding
  @override
  DecryptPatientModelProvider getProviderOverride(
    covariant DecryptPatientModelProvider provider,
  ) {
    return call(
      provider.crypt,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Result<DecryptedPatientModel, EncryptionClientException> Function(
              DecryptPatientModelRef ref)
          create) {
    return _$DecryptPatientModelFamilyOverride(this, create);
  }
}

class _$DecryptPatientModelFamilyOverride implements FamilyOverride {
  _$DecryptPatientModelFamilyOverride(this.overriddenFamily, this.create);

  final Result<DecryptedPatientModel, EncryptionClientException> Function(
      DecryptPatientModelRef ref) create;

  @override
  final DecryptPatientModelFamily overriddenFamily;

  @override
  DecryptPatientModelProvider getProviderOverride(
    covariant DecryptPatientModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// decrypted patient data provider
///
/// Copied from [decryptPatientModel].
class DecryptPatientModelProvider extends AutoDisposeProvider<
    Result<DecryptedPatientModel, EncryptionClientException>> {
  /// decrypted patient data provider
  ///
  /// Copied from [decryptPatientModel].
  DecryptPatientModelProvider(
    String crypt,
  ) : this._internal(
          (ref) => decryptPatientModel(
            ref as DecryptPatientModelRef,
            crypt,
          ),
          from: decryptPatientModelProvider,
          name: r'decryptPatientModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$decryptPatientModelHash,
          dependencies: DecryptPatientModelFamily._dependencies,
          allTransitiveDependencies:
              DecryptPatientModelFamily._allTransitiveDependencies,
          crypt: crypt,
        );

  DecryptPatientModelProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.crypt,
  }) : super.internal();

  final String crypt;

  @override
  Override overrideWith(
    Result<DecryptedPatientModel, EncryptionClientException> Function(
            DecryptPatientModelRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DecryptPatientModelProvider._internal(
        (ref) => create(ref as DecryptPatientModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        crypt: crypt,
      ),
    );
  }

  @override
  (String,) get argument {
    return (crypt,);
  }

  @override
  AutoDisposeProviderElement<
          Result<DecryptedPatientModel, EncryptionClientException>>
      createElement() {
    return _DecryptPatientModelProviderElement(this);
  }

  DecryptPatientModelProvider _copyWith(
    Result<DecryptedPatientModel, EncryptionClientException> Function(
            DecryptPatientModelRef ref)
        create,
  ) {
    return DecryptPatientModelProvider._internal(
      (ref) => create(ref as DecryptPatientModelRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      crypt: crypt,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DecryptPatientModelProvider && other.crypt == crypt;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, crypt.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DecryptPatientModelRef on AutoDisposeProviderRef<
    Result<DecryptedPatientModel, EncryptionClientException>> {
  /// The parameter `crypt` of this provider.
  String get crypt;
}

class _DecryptPatientModelProviderElement extends AutoDisposeProviderElement<
        Result<DecryptedPatientModel, EncryptionClientException>>
    with DecryptPatientModelRef {
  _DecryptPatientModelProviderElement(super.provider);

  @override
  String get crypt => (origin as DecryptPatientModelProvider).crypt;
}

String _$encryptPatientModelHash() =>
    r'f4c12067ea6c7146183fe4cf3d07a89b41caeabd';

/// Encrypted patient data provider
///
/// Copied from [encryptPatientModel].
@ProviderFor(encryptPatientModel)
const encryptPatientModelProvider = EncryptPatientModelFamily();

/// Encrypted patient data provider
///
/// Copied from [encryptPatientModel].
class EncryptPatientModelFamily extends Family {
  /// Encrypted patient data provider
  ///
  /// Copied from [encryptPatientModel].
  const EncryptPatientModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'encryptPatientModelProvider';

  /// Encrypted patient data provider
  ///
  /// Copied from [encryptPatientModel].
  EncryptPatientModelProvider call(
    DecryptedPatientModel decryptedPatientModel,
  ) {
    return EncryptPatientModelProvider(
      decryptedPatientModel,
    );
  }

  @visibleForOverriding
  @override
  EncryptPatientModelProvider getProviderOverride(
    covariant EncryptPatientModelProvider provider,
  ) {
    return call(
      provider.decryptedPatientModel,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Result<String, EncryptionClientException> Function(
              EncryptPatientModelRef ref)
          create) {
    return _$EncryptPatientModelFamilyOverride(this, create);
  }
}

class _$EncryptPatientModelFamilyOverride implements FamilyOverride {
  _$EncryptPatientModelFamilyOverride(this.overriddenFamily, this.create);

  final Result<String, EncryptionClientException> Function(
      EncryptPatientModelRef ref) create;

  @override
  final EncryptPatientModelFamily overriddenFamily;

  @override
  EncryptPatientModelProvider getProviderOverride(
    covariant EncryptPatientModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Encrypted patient data provider
///
/// Copied from [encryptPatientModel].
class EncryptPatientModelProvider
    extends AutoDisposeProvider<Result<String, EncryptionClientException>> {
  /// Encrypted patient data provider
  ///
  /// Copied from [encryptPatientModel].
  EncryptPatientModelProvider(
    DecryptedPatientModel decryptedPatientModel,
  ) : this._internal(
          (ref) => encryptPatientModel(
            ref as EncryptPatientModelRef,
            decryptedPatientModel,
          ),
          from: encryptPatientModelProvider,
          name: r'encryptPatientModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$encryptPatientModelHash,
          dependencies: EncryptPatientModelFamily._dependencies,
          allTransitiveDependencies:
              EncryptPatientModelFamily._allTransitiveDependencies,
          decryptedPatientModel: decryptedPatientModel,
        );

  EncryptPatientModelProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.decryptedPatientModel,
  }) : super.internal();

  final DecryptedPatientModel decryptedPatientModel;

  @override
  Override overrideWith(
    Result<String, EncryptionClientException> Function(
            EncryptPatientModelRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EncryptPatientModelProvider._internal(
        (ref) => create(ref as EncryptPatientModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        decryptedPatientModel: decryptedPatientModel,
      ),
    );
  }

  @override
  (DecryptedPatientModel,) get argument {
    return (decryptedPatientModel,);
  }

  @override
  AutoDisposeProviderElement<Result<String, EncryptionClientException>>
      createElement() {
    return _EncryptPatientModelProviderElement(this);
  }

  EncryptPatientModelProvider _copyWith(
    Result<String, EncryptionClientException> Function(
            EncryptPatientModelRef ref)
        create,
  ) {
    return EncryptPatientModelProvider._internal(
      (ref) => create(ref as EncryptPatientModelRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      decryptedPatientModel: decryptedPatientModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EncryptPatientModelProvider &&
        other.decryptedPatientModel == decryptedPatientModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, decryptedPatientModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EncryptPatientModelRef
    on AutoDisposeProviderRef<Result<String, EncryptionClientException>> {
  /// The parameter `decryptedPatientModel` of this provider.
  DecryptedPatientModel get decryptedPatientModel;
}

class _EncryptPatientModelProviderElement extends AutoDisposeProviderElement<
    Result<String, EncryptionClientException>> with EncryptPatientModelRef {
  _EncryptPatientModelProviderElement(super.provider);

  @override
  DecryptedPatientModel get decryptedPatientModel =>
      (origin as EncryptPatientModelProvider).decryptedPatientModel;
}

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
String _$crudHash() => r'dfe47e19091047799cb47d8227e1f9ac7f405ff0';

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
