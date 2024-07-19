// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../media/provider/media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaTileStyleHash() => r'd76425304c33efc147e2ad898c2c8e6a272257ed';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
/// media tile style provider
///
/// Copied from [MediaTileStyle].
@ProviderFor(MediaTileStyle)
final mediaTileStyleProvider =
    AutoDisposeNotifierProvider<MediaTileStyle, MediaGridStyleEnum>.internal(
  MediaTileStyle.new,
  name: r'mediaTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaTileStyle = AutoDisposeNotifier<MediaGridStyleEnum>;
String _$mediaStreamHash() => r'e56f0f248c72ccbd4b49460fec653e60102c21f7';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [MediaStream].
@ProviderFor(MediaStream)
final mediaStreamProvider =
    StreamNotifierProvider<MediaStream, Iterable<MediaModel>>.internal(
  MediaStream.new,
  name: r'mediaStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mediaStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaStream = StreamNotifier<Iterable<MediaModel>>;
String _$mediaNotifierHash() => r'f3d2b321ad536f92a2044b880ebcfe595ee36e3e';

/// See also [MediaNotifier].
@ProviderFor(MediaNotifier)
final mediaNotifierProvider = AutoDisposeNotifierProvider<MediaNotifier,
    RealmResults<CaseModel>>.internal(
  MediaNotifier.new,
  name: r'mediaNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaNotifier = AutoDisposeNotifier<RealmResults<CaseModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
