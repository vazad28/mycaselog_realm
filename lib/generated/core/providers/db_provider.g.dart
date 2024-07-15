// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/db_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$realmConfigHash() => r'6f5fee839077d74912b7cb7fe59c5d3dfe4fafa4';

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

/// Realm config provider
///
/// Copied from [realmConfig].
@ProviderFor(realmConfig)
const realmConfigProvider = RealmConfigFamily();

/// Realm config provider
///
/// Copied from [realmConfig].
class RealmConfigFamily extends Family {
  /// Realm config provider
  ///
  /// Copied from [realmConfig].
  const RealmConfigFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'realmConfigProvider';

  /// Realm config provider
  ///
  /// Copied from [realmConfig].
  RealmConfigProvider call(
    String userID,
  ) {
    return RealmConfigProvider(
      userID,
    );
  }

  @visibleForOverriding
  @override
  RealmConfigProvider getProviderOverride(
    covariant RealmConfigProvider provider,
  ) {
    return call(
      provider.userID,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Configuration Function(RealmConfigRef ref) create) {
    return _$RealmConfigFamilyOverride(this, create);
  }
}

class _$RealmConfigFamilyOverride implements FamilyOverride {
  _$RealmConfigFamilyOverride(this.overriddenFamily, this.create);

  final Configuration Function(RealmConfigRef ref) create;

  @override
  final RealmConfigFamily overriddenFamily;

  @override
  RealmConfigProvider getProviderOverride(
    covariant RealmConfigProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Realm config provider
///
/// Copied from [realmConfig].
class RealmConfigProvider extends AutoDisposeProvider<Configuration> {
  /// Realm config provider
  ///
  /// Copied from [realmConfig].
  RealmConfigProvider(
    String userID,
  ) : this._internal(
          (ref) => realmConfig(
            ref as RealmConfigRef,
            userID,
          ),
          from: realmConfigProvider,
          name: r'realmConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$realmConfigHash,
          dependencies: RealmConfigFamily._dependencies,
          allTransitiveDependencies:
              RealmConfigFamily._allTransitiveDependencies,
          userID: userID,
        );

  RealmConfigProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userID,
  }) : super.internal();

  final String userID;

  @override
  Override overrideWith(
    Configuration Function(RealmConfigRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RealmConfigProvider._internal(
        (ref) => create(ref as RealmConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userID: userID,
      ),
    );
  }

  @override
  (String,) get argument {
    return (userID,);
  }

  @override
  AutoDisposeProviderElement<Configuration> createElement() {
    return _RealmConfigProviderElement(this);
  }

  RealmConfigProvider _copyWith(
    Configuration Function(RealmConfigRef ref) create,
  ) {
    return RealmConfigProvider._internal(
      (ref) => create(ref as RealmConfigRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userID: userID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RealmConfigProvider && other.userID == userID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RealmConfigRef on AutoDisposeProviderRef<Configuration> {
  /// The parameter `userID` of this provider.
  String get userID;
}

class _RealmConfigProviderElement
    extends AutoDisposeProviderElement<Configuration> with RealmConfigRef {
  _RealmConfigProviderElement(super.provider);

  @override
  String get userID => (origin as RealmConfigProvider).userID;
}

String _$realmHash() => r'1e01cf00adc3eaa69b4670df369e04ca8fc2217f';

/// Realm  provider
///
/// Copied from [realm].
@ProviderFor(realm)
final realmProvider = AutoDisposeProvider<Realm>.internal(
  realm,
  name: r'realmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$realmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealmRef = AutoDisposeProviderRef<Realm>;
String _$dbHash() => r'1f4511210cee948b25ee22cf23cd39a4c8990951';

/// See also [Db].
@ProviderFor(Db)
final dbProvider = AutoDisposeNotifierProvider<Db, DatabaseService>.internal(
  Db.new,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Db = AutoDisposeNotifier<DatabaseService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
