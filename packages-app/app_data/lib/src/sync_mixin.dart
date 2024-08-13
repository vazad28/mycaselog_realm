import 'package:app_models/app_models.dart';
import 'package:collection/collection.dart';
import 'package:realm/realm.dart';

mixin SyncMixin {
  void refreshMediaBacklinks(Realm realm, List<String>? ids) {
    // Query all MediaModel objects
    final mediaModels = ids == null
        ? realm.all<MediaModel>()
        : realm.query<MediaModel>(r'mediaID IN $0', [ids]);

    // Group media by caseID
    final groupedMedia = mediaModels.groupFoldBy<String, List<MediaModel>>(
      (e) => e.caseID,
      (prev, e) => (prev ?? [])..add(e),
    );

    // Iterate through each caseID
    for (final caseID in groupedMedia.keys) {
      final mediaList = groupedMedia[caseID]!;
      final caseModel = realm.find<CaseModel>(caseID);

      if (caseModel == null) continue;

      // Add missing media to the case model
      caseModel.medias.addAll(
        mediaList.where(
          (media) => !caseModel.medias.any((m) => m.mediaID == media.mediaID),
        ),
      );
    }
  }

  void refreshTimelineNotesBacklinks(Realm realm, List<String>? ids) {
    // Query all TimelineNoteModel objects
    final noteModels = ids == null
        ? realm.all<TimelineNoteModel>()
        : realm.query<TimelineNoteModel>(r'noteID IN $0', [ids]);

    // Group notes by caseID
    final groupedNotes =
        noteModels.groupFoldBy<String, List<TimelineNoteModel>>(
      (e) => e.caseID,
      (prev, e) => (prev ?? [])..add(e),
    );

    // Iterate through each caseID
    for (final caseID in groupedNotes.keys) {
      final notesList = groupedNotes[caseID]!;
      final existingCase = realm.find<CaseModel>(caseID);

      if (existingCase != null) {
        // Add missing notes to the case model
        existingCase.notes.addAll(
          notesList.where(
            (note) => !existingCase.notes.contains(note),
          ),
        );
      }
    }
  }

  /// Refreshes media backlinks for a given list of CaseModel objects
  /// or all cases if not provided.
  void refreshCasesBacklinks(Realm realm, List<String>? ids) {
    // Query all CaseModel objects
    final caseModels = ids == null
        ? realm.all<CaseModel>()
        : realm.query<CaseModel>(r'caseID IN $0', [ids]);

    // Iterate through each case model
    for (final caseModel in caseModels) {
      // Query media and timeline notes for the current case
      final mediaList =
          realm.query<MediaModel>(r'caseID == $0', [caseModel.caseID]);
      final timelineNotesList =
          realm.query<TimelineNoteModel>(r'caseID == $0', [caseModel.caseID]);

      // Add missing media and notes to the case model
      caseModel.medias.addAll(
        mediaList.where((media) => !caseModel.medias.contains(media)),
      );
      caseModel.notes.addAll(
        timelineNotesList.where((note) => !caseModel.notes.contains(note)),
      );
    }
  }
}
