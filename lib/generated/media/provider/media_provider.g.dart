// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../media/provider/media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaStreamHash() => r'7ec835218b00c5ef8b5bb8577aa114844ed592aa';

/// See also [mediaStream].
@ProviderFor(mediaStream)
final mediaStreamProvider =
    StreamProvider<RealmResultsChanges<MediaModel>>.internal(
  mediaStream,
  name: r'mediaStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mediaStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MediaStreamRef = StreamProviderRef<RealmResultsChanges<MediaModel>>;
String _$mediaGridTileStyleHash() =>
    r'706b8a50e2a3f55b4ea41a7e0fcadc4029105621';

/// See also [MediaGridTileStyle].
@ProviderFor(MediaGridTileStyle)
final mediaGridTileStyleProvider =
    AutoDisposeNotifierProvider<MediaGridTileStyle, int>.internal(
  MediaGridTileStyle.new,
  name: r'mediaGridTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mediaGridTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MediaGridTileStyle = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
