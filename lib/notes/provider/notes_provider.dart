import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/notes/provider/notes_provider.g.dart';

enum NoteTileStyleEnum { list, grid }

/// App action for timelines
class NoteAction extends BaseAppAction {
  // ignore: use_super_parameters
  NoteAction({
    required CrudAction action,
    String? title,
    super.isActive,
    super.leading,
    super.subTitle,
    super.trailing,
  }) : super(action: action, title: title ?? action.name);
}

/// note tile style provider
@riverpod
class NoteTileStyle extends _$NoteTileStyle {
  @override
  NoteTileStyleEnum build() {
    final localStorage = ref.watch(localStorageProvider);
    final index = localStorage.noteListTileStyle;
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
  Stream<RealmResultsChanges<NoteModel>> build() {
    return ref
        .watch(dbProvider)
        .notesCollection
        .getAllNotes(sortByProperty: 'createdAt')
        .changes;
  }

  /// Full text search notes
  RealmResults<NoteModel> searchNotes(String searchTerm) {
    return ref.watch(dbProvider).notesCollection.search(searchTerm);
  }
}
