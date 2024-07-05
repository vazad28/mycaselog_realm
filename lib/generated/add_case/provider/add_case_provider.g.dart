// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../add_case/provider/add_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$templateModelsListHash() =>
    r'e7ae018bc30470df3e5893d6f14f0123f69ba192';

/// ////////////////////////////////////////////////////////////////////
/// Helper providers
/// ////////////////////////////////////////////////////////////////////
/// List of templates of user
///
/// Copied from [templateModelsList].
@ProviderFor(templateModelsList)
final templateModelsListProvider =
    AutoDisposeFutureProvider<Result<List<TemplateModel>, Exception>>.internal(
  templateModelsList,
  name: r'templateModelsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templateModelsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemplateModelsListRef
    = AutoDisposeFutureProviderRef<Result<List<TemplateModel>, Exception>>;
String _$decryptPatientModelHash() =>
    r'4f5eae163aac915f6ac25f20f13f278fb69521cb';

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
    r'14442fb82774687c38cfa89f3f8b50697d3c34fd';

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

String _$basicDataFormGroupHash() =>
    r'cd622d772f7aa2d35187dbed7b7c2a4cc05524e6';

/// See also [basicDataFormGroup].
@ProviderFor(basicDataFormGroup)
final basicDataFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  basicDataFormGroup,
  name: r'basicDataFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$basicDataFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BasicDataFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$templatedDataFormGroupHash() =>
    r'a0aaba6536cad2a8681c10093abe31945e8b0c5c';

/// See also [templatedDataFormGroup].
@ProviderFor(templatedDataFormGroup)
final templatedDataFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  templatedDataFormGroup,
  name: r'templatedDataFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templatedDataFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemplatedDataFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addCaseSeederHash() => r'ac693c32a9d7fcd7e9d807bb50930ae279efb1e7';

/// ////////////////////////////////////////////////////////////////////
/// Seeder provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddCaseSeeder].
@ProviderFor(AddCaseSeeder)
final addCaseSeederProvider =
    AutoDisposeNotifierProvider<AddCaseSeeder, AddCaseSeedModel?>.internal(
  AddCaseSeeder.new,
  name: r'addCaseSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addCaseSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddCaseSeeder = AutoDisposeNotifier<AddCaseSeedModel?>;
String _$addCaseNotifierHash() => r'4fb384556e52cff258fa6094b27c2062c6b3eb62';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddCaseNotifier].
@ProviderFor(AddCaseNotifier)
final addCaseNotifierProvider =
    AutoDisposeNotifierProvider<AddCaseNotifier, StateOf<CaseModel>>.internal(
  AddCaseNotifier.new,
  name: r'addCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddCaseNotifier = AutoDisposeNotifier<StateOf<CaseModel>>;
String _$currentCaseTemplateHash() =>
    r'7625b612e4ce9b122ff1d9280a2efbb26ab6e9d2';

///
/// Add case template provider
///
///
/// Copied from [CurrentCaseTemplate].
@ProviderFor(CurrentCaseTemplate)
final currentCaseTemplateProvider =
    AutoDisposeNotifierProvider<CurrentCaseTemplate, TemplateModel?>.internal(
  CurrentCaseTemplate.new,
  name: r'currentCaseTemplateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCaseTemplateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCaseTemplate = AutoDisposeNotifier<TemplateModel?>;
String _$patientDataFormGroupHash() =>
    r'772abdbd514804a0ae1dad1a290cc289e5323e34';

/// See also [PatientDataFormGroup].
@ProviderFor(PatientDataFormGroup)
final patientDataFormGroupProvider =
    AutoDisposeNotifierProvider<PatientDataFormGroup, FormGroup>.internal(
  PatientDataFormGroup.new,
  name: r'patientDataFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$patientDataFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PatientDataFormGroup = AutoDisposeNotifier<FormGroup>;
String _$templatedDataFormValueHash() =>
    r'803a2cf96ca6730beaff2d01c5f42dfb5ea19215';

/// See also [TemplatedDataFormValue].
@ProviderFor(TemplatedDataFormValue)
final templatedDataFormValueProvider = AutoDisposeNotifierProvider<
    TemplatedDataFormValue, TemplatedDataForm>.internal(
  TemplatedDataFormValue.new,
  name: r'templatedDataFormValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templatedDataFormValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplatedDataFormValue = AutoDisposeNotifier<TemplatedDataForm>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
