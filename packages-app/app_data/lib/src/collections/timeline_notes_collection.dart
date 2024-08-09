part of '../collections.dart';

class TimelineNotesCollection extends SyncCollection<TimelineNoteModel> {
  TimelineNotesCollection(super.realmDatabase) : _realm = realmDatabase.realm;
  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.timelineNotes.name}';

  @override
  TimelineNoteModel mapToModel(Map<String, dynamic> data) {
    return TimelineNoteModelX.fromJson(data);
  }

  @override
  Map<String, dynamic> modelToMap(TimelineNoteModel object) => object.toJson();

  @override
  String getPrimaryKey(TimelineNoteModel object) => object.noteID;

  /// Retrieves a list of MediaModel objects based on their case IDs.
  List<TimelineNoteModel> getAllByTimelineNoteIDs(
    List<String> timelineNoteIDs,
  ) {
    return realm
        .query<TimelineNoteModel>(r'noteID IN $0', [timelineNoteIDs]).toList();
  }

  /// Get notes for a case
  RealmResults<TimelineNoteModel> getCaseNotes(String caseID) {
    return _realm
        .all<TimelineNoteModel>()
        .query(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  /// Refresh timeline backlinks to cases collection  as needed
  void refreshBacklinks() => refreshTimelineNotesBacklinks(realm, null);

  /// Refresh media backlinks to cases collection  as needed
  // Future<void> refreshBacklinks(List<String>? ids) async {
  //   ignoreRealmChanges = true;
  //   return _realm.writeAsync(() {
  //     // Query all TimelineNoteModel objects
  //     final noteModels = ids == null
  //         ? _realm.all<TimelineNoteModel>()
  //         : _realm.query<TimelineNoteModel>(r'timelineNoteID IN $0', [ids]);

  //     // Group notes by caseID
  //     final groupedNotes =
  //         noteModels.groupFoldBy<String, List<TimelineNoteModel>>(
  //       (e) => e.caseID,
  //       (prev, e) => (prev ?? [])..add(e),
  //     );

  //     // Iterate through each caseID
  //     for (final caseID in groupedNotes.keys) {
  //       final notesList = groupedNotes[caseID]!;
  //       final existingCase = _realm.find<CaseModel>(caseID);

  //       if (existingCase != null) {
  //         // Add missing notes to the case model
  //         existingCase.notes.addAll(
  //           notesList.where(
  //             (note) => !existingCase.notes.contains(note),
  //           ),
  //         );
  //       }
  //     }
  //   }).whenComplete(() => ignoreRealmChanges = false);
  // }

  Future<void> addTimelineNote(TimelineNoteModel timelineNoteModel) async {
    await _realm.writeAsync(() {
      _realm.add<TimelineNoteModel>(timelineNoteModel, update: true);

      /// add media to cases collection if not exist
      final caseModel = _realm.find<CaseModel>(timelineNoteModel.caseID);
      if (caseModel != null && !caseModel.notes.contains(timelineNoteModel)) {
        caseModel.notes.add(timelineNoteModel);
      }
    });
  }

  Future<void> changeTimelineNotesTimestamp(
    List<TimelineNoteModel> noteList,
    int timestamp,
  ) {
    return _realm.writeAsync(() {
      final updatedList = noteList
        ..map((e) => e.timestamp = timestamp).toList();

      _realm.addAll<TimelineNoteModel>(updatedList, update: true);
    });
  }
}
