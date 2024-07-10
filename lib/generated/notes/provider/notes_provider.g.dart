// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../notes/provider/notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteTileStyleHash() => r'd6025aed384d2c7ba794bfbd123acee97f370faa';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
/// note tile style provider
///
/// Copied from [NoteTileStyle].
@ProviderFor(NoteTileStyle)
final noteTileStyleProvider =
    AutoDisposeNotifierProvider<NoteTileStyle, NoteTileStyleEnum>.internal(
  NoteTileStyle.new,
  name: r'noteTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noteTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NoteTileStyle = AutoDisposeNotifier<NoteTileStyleEnum>;
String _$notesHash() => r'26d3275aeff76e331343eeb192a52296da153a90';

/// See also [Notes].
@ProviderFor(Notes)
final notesProvider =
    AutoDisposeNotifierProvider<Notes, RealmResults<NoteModel>>.internal(
  Notes.new,
  name: r'notesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Notes = AutoDisposeNotifier<RealmResults<NoteModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
