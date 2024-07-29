import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

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
class NotesNotifier extends _$NotesNotifier {
  @override
  // RealmResults<NoteModel> build() {
  //   return ref.read(dbProvider).notesCollection.getAll();
  //
  Stream<RealmResultsChanges<NoteModel>> build() {
    return ref.watch(dbProvider).notesCollection.getAll().changes;
  }

  /// Full text search notes
  RealmResults<NoteModel> searchNotes(String searchTerm) {
    return ref.watch(dbProvider).notesCollection.search(searchTerm);
  }
}
