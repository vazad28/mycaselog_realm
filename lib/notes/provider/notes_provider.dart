
import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';

part '../../generated/notes/provider/notes_provider.freezed.dart';
part '../../generated/notes/provider/notes_provider.g.dart';

enum NoteTileStyleEnum { list, grid }

/// ////////////////////////////////////////////////////////////////////
/// State
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class NotesPagedState with _$NotesPagedState {
  const factory NotesPagedState({
    required List<NoteModel> values,
    Object? error,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoading,
  }) = _NotesPagedState;

  factory NotesPagedState.init() => const NotesPagedState(values: []);
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

/// note tile style provider
@riverpod
class NoteTileStyle extends _$NoteTileStyle {
  @override
  NoteTileStyleEnum build() {
    final localStorage = ref.watch(localStorageProvider);
    final index = localStorage.getNoteListTileStyle();
    return NoteTileStyleEnum.values.elementAt(index);
  }

  // ignore: use_setters_to_change_properties
  void update(NoteTileStyleEnum noteStyle) {
    state = noteStyle;
    ref
        .read(localStorageProvider)
        .setNoteListTileStyle(NoteTileStyleEnum.values.indexOf(noteStyle));
  }
}

@riverpod
class Notes extends _$Notes {
  @override
  RealmResults<NoteModel> build() {
    return ref.read(dbProvider).notesCollection.getAll();
  }
}
