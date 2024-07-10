// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncCollectionsMapHash() =>
    r'eeb8e125bab077bcf907e9e9b9c447d51ce22d64';

/// See also [SyncCollectionsMap].
@ProviderFor(SyncCollectionsMap)
final syncCollectionsMapProvider = NotifierProvider<SyncCollectionsMap,
    Map<DbCollection, DatabaseCollection>>.internal(
  SyncCollectionsMap.new,
  name: r'syncCollectionsMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncCollectionsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncCollectionsMap = Notifier<Map<DbCollection, DatabaseCollection>>;
String _$collectionSyncHash() => r'39cffee62f0972ffc2500d0a53e73f8091dceab4';

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

abstract class _$CollectionSync extends BuildlessNotifier<void> {
  late final DatabaseCollection collection;

  void build(
    DatabaseCollection collection,
  );
}

/// See also [CollectionSync].
@ProviderFor(CollectionSync)
const collectionSyncProvider = CollectionSyncFamily();

/// See also [CollectionSync].
class CollectionSyncFamily extends Family {
  /// See also [CollectionSync].
  const CollectionSyncFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'collectionSyncProvider';

  /// See also [CollectionSync].
  CollectionSyncProvider call(
    DatabaseCollection collection,
  ) {
    return CollectionSyncProvider(
      collection,
    );
  }

  @visibleForOverriding
  @override
  CollectionSyncProvider getProviderOverride(
    covariant CollectionSyncProvider provider,
  ) {
    return call(
      provider.collection,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(CollectionSync Function() create) {
    return _$CollectionSyncFamilyOverride(this, create);
  }
}

class _$CollectionSyncFamilyOverride implements FamilyOverride {
  _$CollectionSyncFamilyOverride(this.overriddenFamily, this.create);

  final CollectionSync Function() create;

  @override
  final CollectionSyncFamily overriddenFamily;

  @override
  CollectionSyncProvider getProviderOverride(
    covariant CollectionSyncProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [CollectionSync].
class CollectionSyncProvider
    extends NotifierProviderImpl<CollectionSync, void> {
  /// See also [CollectionSync].
  CollectionSyncProvider(
    DatabaseCollection collection,
  ) : this._internal(
          () => CollectionSync()..collection = collection,
          from: collectionSyncProvider,
          name: r'collectionSyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionSyncHash,
          dependencies: CollectionSyncFamily._dependencies,
          allTransitiveDependencies:
              CollectionSyncFamily._allTransitiveDependencies,
          collection: collection,
        );

  CollectionSyncProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collection,
  }) : super.internal();

  final DatabaseCollection collection;

  @override
  void runNotifierBuild(
    covariant CollectionSync notifier,
  ) {
    return notifier.build(
      collection,
    );
  }

  @override
  Override overrideWith(CollectionSync Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionSyncProvider._internal(
        () => create()..collection = collection,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collection: collection,
      ),
    );
  }

  @override
  (DatabaseCollection,) get argument {
    return (collection,);
  }

  @override
  NotifierProviderElement<CollectionSync, void> createElement() {
    return _CollectionSyncProviderElement(this);
  }

  CollectionSyncProvider _copyWith(
    CollectionSync Function() create,
  ) {
    return CollectionSyncProvider._internal(
      () => create()..collection = collection,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      collection: collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionSyncProvider && other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CollectionSyncRef on NotifierProviderRef<void> {
  /// The parameter `collection` of this provider.
  DatabaseCollection get collection;
}

class _CollectionSyncProviderElement
    extends NotifierProviderElement<CollectionSync, void>
    with CollectionSyncRef {
  _CollectionSyncProviderElement(super.provider);

  @override
  DatabaseCollection get collection =>
      (origin as CollectionSyncProvider).collection;
}

String _$firestoreSyncHash() => r'1ed806b2bb7e4d29b3602a63431fa1cccca40c54';

/// See also [FirestoreSync].
@ProviderFor(FirestoreSync)
final firestoreSyncProvider = NotifierProvider<FirestoreSync, void>.internal(
  FirestoreSync.new,
  name: r'firestoreSyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirestoreSync = Notifier<void>;
String _$syncResultHash() => r'39e5df573d1b162ea2041b4165afd43d2a398614';

abstract class _$SyncResult extends BuildlessNotifier<StateOf<int>> {
  late final DbCollection dbCollection;

  StateOf<int> build(
    DbCollection dbCollection,
  );
}

/// ////////////////////////////////////////////////////////////////////
/// Collection sync reset
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [SyncResult].
@ProviderFor(SyncResult)
const syncResultProvider = SyncResultFamily();

/// ////////////////////////////////////////////////////////////////////
/// Collection sync reset
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [SyncResult].
class SyncResultFamily extends Family {
  /// ////////////////////////////////////////////////////////////////////
  /// Collection sync reset
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [SyncResult].
  const SyncResultFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'syncResultProvider';

  /// ////////////////////////////////////////////////////////////////////
  /// Collection sync reset
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [SyncResult].
  SyncResultProvider call(
    DbCollection dbCollection,
  ) {
    return SyncResultProvider(
      dbCollection,
    );
  }

  @visibleForOverriding
  @override
  SyncResultProvider getProviderOverride(
    covariant SyncResultProvider provider,
  ) {
    return call(
      provider.dbCollection,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SyncResult Function() create) {
    return _$SyncResultFamilyOverride(this, create);
  }
}

class _$SyncResultFamilyOverride implements FamilyOverride {
  _$SyncResultFamilyOverride(this.overriddenFamily, this.create);

  final SyncResult Function() create;

  @override
  final SyncResultFamily overriddenFamily;

  @override
  SyncResultProvider getProviderOverride(
    covariant SyncResultProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Collection sync reset
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [SyncResult].
class SyncResultProvider
    extends NotifierProviderImpl<SyncResult, StateOf<int>> {
  /// ////////////////////////////////////////////////////////////////////
  /// Collection sync reset
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [SyncResult].
  SyncResultProvider(
    DbCollection dbCollection,
  ) : this._internal(
          () => SyncResult()..dbCollection = dbCollection,
          from: syncResultProvider,
          name: r'syncResultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncResultHash,
          dependencies: SyncResultFamily._dependencies,
          allTransitiveDependencies:
              SyncResultFamily._allTransitiveDependencies,
          dbCollection: dbCollection,
        );

  SyncResultProvider._internal(
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
    covariant SyncResult notifier,
  ) {
    return notifier.build(
      dbCollection,
    );
  }

  @override
  Override overrideWith(SyncResult Function() create) {
    return ProviderOverride(
      origin: this,
      override: SyncResultProvider._internal(
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
  NotifierProviderElement<SyncResult, StateOf<int>> createElement() {
    return _SyncResultProviderElement(this);
  }

  SyncResultProvider _copyWith(
    SyncResult Function() create,
  ) {
    return SyncResultProvider._internal(
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
    return other is SyncResultProvider && other.dbCollection == dbCollection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbCollection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncResultRef on NotifierProviderRef<StateOf<int>> {
  /// The parameter `dbCollection` of this provider.
  DbCollection get dbCollection;
}

class _SyncResultProviderElement
    extends NotifierProviderElement<SyncResult, StateOf<int>>
    with SyncResultRef {
  _SyncResultProviderElement(super.provider);

  @override
  DbCollection get dbCollection => (origin as SyncResultProvider).dbCollection;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
