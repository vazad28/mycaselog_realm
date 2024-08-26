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

  @override
  Future<void> add(TimelineNoteModel model) async {
    await _realm.writeAsync(() {
      _realm.add<TimelineNoteModel>(model, update: true);

      /// add media to cases collection if not exist
      final caseModel = _realm.find<CaseModel>(model.caseID);
      if (caseModel != null && !caseModel.notes.contains(model)) {
        caseModel.notes.add(model);
      }

      /// add timeline note to firebase
      addToFirestore(model);
    });
  }

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
