// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../notes/provider/notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteTileStyleHash() => r'd6025aed384d2c7ba794bfbd123acee97f370faa';

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
String _$notesNotifierHash() => r'e3998e15108a5f044ff7e69171ae5be8087497b0';

/// See also [NotesNotifier].
@ProviderFor(NotesNotifier)
final notesNotifierProvider = AutoDisposeStreamNotifierProvider<NotesNotifier,
    RealmResultsChanges<NoteModel>>.internal(
  NotesNotifier.new,
  name: r'notesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotesNotifier
    = AutoDisposeStreamNotifier<RealmResultsChanges<NoteModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
