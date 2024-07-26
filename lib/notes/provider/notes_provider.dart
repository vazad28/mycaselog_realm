import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';
import '../../core/app_services.dart';

part '../../generated/notes/provider/notes_provider.g.dart';

enum NoteTileStyleEnum { list, grid }

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
