// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../sync/provider/sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncCollectionsMapHash() =>
    r'ab28250ac1a658fbf1ccdb9f181423f6f01b6dc1';

/// See also [SyncCollectionsMap].
@ProviderFor(SyncCollectionsMap)
final syncCollectionsMapProvider = AutoDisposeNotifierProvider<
    SyncCollectionsMap, Map<DbCollection, SyncCollection>>.internal(
  SyncCollectionsMap.new,
  name: r'syncCollectionsMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncCollectionsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncCollectionsMap
    = AutoDisposeNotifier<Map<DbCollection, SyncCollection>>;
String _$syncNotifierHash() => r'3aa8f1e411476900de43ed4f7adcb50999d3eca2';

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

abstract class _$SyncNotifier extends BuildlessNotifier<StateOf<List<String>>> {
  late final DbCollection dbCollection;

  StateOf<List<String>> build(
    DbCollection dbCollection,
  );
}

/// See also [SyncNotifier].
@ProviderFor(SyncNotifier)
const syncNotifierProvider = SyncNotifierFamily();

/// See also [SyncNotifier].
class SyncNotifierFamily extends Family {
  /// See also [SyncNotifier].
  const SyncNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'syncNotifierProvider';

  /// See also [SyncNotifier].
  SyncNotifierProvider call(
    DbCollection dbCollection,
  ) {
    return SyncNotifierProvider(
      dbCollection,
    );
  }

  @visibleForOverriding
  @override
  SyncNotifierProvider getProviderOverride(
    covariant SyncNotifierProvider provider,
  ) {
    return call(
      provider.dbCollection,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SyncNotifier Function() create) {
    return _$SyncNotifierFamilyOverride(this, create);
  }
}

class _$SyncNotifierFamilyOverride implements FamilyOverride {
  _$SyncNotifierFamilyOverride(this.overriddenFamily, this.create);

  final SyncNotifier Function() create;

  @override
  final SyncNotifierFamily overriddenFamily;

  @override
  SyncNotifierProvider getProviderOverride(
    covariant SyncNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SyncNotifier].
class SyncNotifierProvider
    extends NotifierProviderImpl<SyncNotifier, StateOf<List<String>>> {
  /// See also [SyncNotifier].
  SyncNotifierProvider(
    DbCollection dbCollection,
  ) : this._internal(
          () => SyncNotifier()..dbCollection = dbCollection,
          from: syncNotifierProvider,
          name: r'syncNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncNotifierHash,
          dependencies: SyncNotifierFamily._dependencies,
          allTransitiveDependencies:
              SyncNotifierFamily._allTransitiveDependencies,
          dbCollection: dbCollection,
        );

  SyncNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbCollection,
  }) : super.internal();

  final DbCollection dbCollection;

  @override
  StateOf<List<String>> runNotifierBuild(
    covariant SyncNotifier notifier,
  ) {
    return notifier.build(
      dbCollection,
    );
  }

  @override
  Override overrideWith(SyncNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SyncNotifierProvider._internal(
        () => create()..dbCollection = dbCollection,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbCollection: dbCollection,
      ),
    );
  }

  @override
  (DbCollection,) get argument {
    return (dbCollection,);
  }

  @override
  NotifierProviderElement<SyncNotifier, StateOf<List<String>>> createElement() {
    return _SyncNotifierProviderElement(this);
  }

  SyncNotifierProvider _copyWith(
    SyncNotifier Function() create,
  ) {
    return SyncNotifierProvider._internal(
      () => create()..dbCollection = dbCollection,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      dbCollection: dbCollection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SyncNotifierProvider && other.dbCollection == dbCollection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbCollection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncNotifierRef on NotifierProviderRef<StateOf<List<String>>> {
  /// The parameter `dbCollection` of this provider.
  DbCollection get dbCollection;
}

class _SyncNotifierProviderElement
    extends NotifierProviderElement<SyncNotifier, StateOf<List<String>>>
    with SyncNotifierRef {
  _SyncNotifierProviderElement(super.provider);

  @override
  DbCollection get dbCollection =>
      (origin as SyncNotifierProvider).dbCollection;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
