// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/collections_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$collectionsHash() => r'a70cc57f385fd8c1b6e80672f8c486df987d619f';

/// See also [collections].
@ProviderFor(collections)
final collectionsProvider = Provider<Collections>.internal(
  collections,
  name: r'collectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$collectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CollectionsRef = ProviderRef<Collections>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
