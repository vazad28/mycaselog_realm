// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../sync/provider/sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncCollectionsMapHash() =>
    r'76dc25ba42f6b1f2ab8e42826021f574fd5cb1d9';

/// See also [SyncCollectionsMap].
@ProviderFor(SyncCollectionsMap)
final syncCollectionsMapProvider = AutoDisposeNotifierProvider<
    SyncCollectionsMap, Map<DbCollection, DatabaseCollection>>.internal(
  SyncCollectionsMap.new,
  name: r'syncCollectionsMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncCollectionsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncCollectionsMap
    = AutoDisposeNotifier<Map<DbCollection, DatabaseCollection>>;
String _$collectionSyncerHash() => r'68cfab0f5351a3896872daf0afb9e2c74e506d2d';

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

abstract class _$CollectionSyncer
    extends BuildlessAutoDisposeNotifier<StateOf<int>> {
  late final DbCollection dbCollection;

  StateOf<int> build(
    DbCollection dbCollection,
  );
}

/// See also [CollectionSyncer].
@ProviderFor(CollectionSyncer)
const collectionSyncerProvider = CollectionSyncerFamily();

/// See also [CollectionSyncer].
class CollectionSyncerFamily extends Family {
  /// See also [CollectionSyncer].
  const CollectionSyncerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'collectionSyncerProvider';

  /// See also [CollectionSyncer].
  CollectionSyncerProvider call(
    DbCollection dbCollection,
  ) {
    return CollectionSyncerProvider(
      dbCollection,
    );
  }

  @visibleForOverriding
  @override
  CollectionSyncerProvider getProviderOverride(
    covariant CollectionSyncerProvider provider,
  ) {
    return call(
      provider.dbCollection,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(CollectionSyncer Function() create) {
    return _$CollectionSyncerFamilyOverride(this, create);
  }
}

class _$CollectionSyncerFamilyOverride implements FamilyOverride {
  _$CollectionSyncerFamilyOverride(this.overriddenFamily, this.create);

  final CollectionSyncer Function() create;

  @override
  final CollectionSyncerFamily overriddenFamily;

  @override
  CollectionSyncerProvider getProviderOverride(
    covariant CollectionSyncerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [CollectionSyncer].
class CollectionSyncerProvider
    extends AutoDisposeNotifierProviderImpl<CollectionSyncer, StateOf<int>> {
  /// See also [CollectionSyncer].
  CollectionSyncerProvider(
    DbCollection dbCollection,
  ) : this._internal(
          () => CollectionSyncer()..dbCollection = dbCollection,
          from: collectionSyncerProvider,
          name: r'collectionSyncerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionSyncerHash,
          dependencies: CollectionSyncerFamily._dependencies,
          allTransitiveDependencies:
              CollectionSyncerFamily._allTransitiveDependencies,
          dbCollection: dbCollection,
        );

  CollectionSyncerProvider._internal(
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
  StateOf<int> runNotifierBuild(
    covariant CollectionSyncer notifier,
  ) {
    return notifier.build(
      dbCollection,
    );
  }

  @override
  Override overrideWith(CollectionSyncer Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionSyncerProvider._internal(
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
  AutoDisposeNotifierProviderElement<CollectionSyncer, StateOf<int>>
      createElement() {
    return _CollectionSyncerProviderElement(this);
  }

  CollectionSyncerProvider _copyWith(
    CollectionSyncer Function() create,
  ) {
    return CollectionSyncerProvider._internal(
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
    return other is CollectionSyncerProvider &&
        other.dbCollection == dbCollection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbCollection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CollectionSyncerRef on AutoDisposeNotifierProviderRef<StateOf<int>> {
  /// The parameter `dbCollection` of this provider.
  DbCollection get dbCollection;
}

class _CollectionSyncerProviderElement
    extends AutoDisposeNotifierProviderElement<CollectionSyncer, StateOf<int>>
    with CollectionSyncerRef {
  _CollectionSyncerProviderElement(super.provider);

  @override
  DbCollection get dbCollection =>
      (origin as CollectionSyncerProvider).dbCollection;
}

String _$firestoreSyncHash() => r'e20a5dca036b779e7fb10ac45e92a693846d2efc';

/// See also [FirestoreSync].
@ProviderFor(FirestoreSync)
final firestoreSyncProvider =
    AutoDisposeNotifierProvider<FirestoreSync, void>.internal(
  FirestoreSync.new,
  name: r'firestoreSyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirestoreSync = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
