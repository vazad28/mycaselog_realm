// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreSyncHash() => r'f3fc042a25484bb99aa98a0196911f469c3f82bf';

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

abstract class _$SyncResult extends BuildlessNotifier<StateOf<int>> {
  late final DbCollection dbCollection;

  StateOf<int> build(
    DbCollection dbCollection,
  );
}

/// See also [SyncResult].
@ProviderFor(SyncResult)
const syncResultProvider = SyncResultFamily();

/// See also [SyncResult].
class SyncResultFamily extends Family {
  /// See also [SyncResult].
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

  /// See also [SyncResult].
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

/// See also [SyncResult].
class SyncResultProvider
    extends NotifierProviderImpl<SyncResult, StateOf<int>> {
  /// See also [SyncResult].
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
