part of '../collections.dart';

class TimelineNotesCollection extends BaseCollection<TimelineNoteModel> {
  TimelineNotesCollection(super.realmDatabase) : _realm = realmDatabase.realm;
  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.timelineNotes.name}';

  @override
  CollectionReference<TimelineNoteModel> get withConverter =>
      firestore.collection(path).withConverter<TimelineNoteModel>(
            fromFirestore: (snapshot, _) =>
                TimelineNoteModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  @override
  Stream<List<TimelineNoteModel>>? listenForChanges() {
    return stream?.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) async {
            final model = TimelineNoteModelX.fromJson(change.doc.data()!);
            await addTimelineNote(model);
            return model;
          })
          .whereType<TimelineNoteModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
  /// Get notes for a case
  RealmResults<TimelineNoteModel> getCaseNotes(String caseID) {
    return _realm
        .all<TimelineNoteModel>()
        .query(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  /// Refresh media backlinks to cases collection  as needed
  Future<void> refreshTimelineNotesBacklinks(
      List<TimelineNoteModel>? models) async {
    var groupedNotes = <String, List<TimelineNoteModel>>{};

    var noteModels = models ?? _realm.all<TimelineNoteModel>();

    // Open a write transaction
    await _realm.writeAsync(() {
      groupedNotes = noteModels.groupFoldBy<String, List<TimelineNoteModel>>(
        (e) => e.caseID,
        (prev, e) => (prev ?? [])..add(e),
      );

      // Open a write transaction
      //await _realm.writeAsync(() {
      // if (noteModels?.isNotEmpty ?? true) {
      //   groupedNotes = noteModels!.groupFoldBy<String, List<TimelineNoteModel>>(
      //     (e) => e.caseID,
      //     (prev, e) => (prev ?? [])..add(e),
      //   );
      // } else {
      //   // Query all Media objects
      //   final notesResults = _realm.all<TimelineNoteModel>();

      //   // Group media by caseID
      //   groupedNotes = notesResults.groupFoldBy<String, List<TimelineNoteModel>>(
      //     (e) => e.caseID,
      //     (prev, e) => (prev ?? [])..add(e),
      //   );
      // }
      // Query all Media objects
      //final notesResults = _realm.all<TimelineNoteModel>();

      // Group media by caseID
      // final groupedNotes =
      //     notesResults.groupFoldBy<String, List<TimelineNoteModel>>(
      //   (e) => e.caseID,
      //   (prev, e) => (prev ?? [])..add(e),
      // );

      // Iterate through each group
      for (final caseID in groupedNotes.keys) {
        final notesList = groupedNotes[caseID]!;

        // Check if a Case object already exists for this caseID
        final existingCase = _realm.find<CaseModel>(caseID);

        if (existingCase == null) continue;

        // Check for media not already in the Cases object
        final notesToAdd = notesList
            .where((note) => !existingCase.notes.contains(note))
            .toList();

        // Update the existing Cases object
        existingCase.notes.addAll(notesToAdd);
      }
    });
  }

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
      List<TimelineNoteModel> noteList, int timestamp) {
    return _realm.writeAsync(() {
      final updatedList = noteList
        ..map((e) => e.timestamp = timestamp).toList();

      _realm.addAll<TimelineNoteModel>(updatedList, update: true);

      // final updatedNoteList = noteList
      //   ..map((e) => e.timestamp = timestamp).toList();

      // /// add to realm

      //   ..addAll<TimelineNoteModel>(updatedNoteList, update: true);

      for (final noteModel in updatedList) {
        putInFirestore(noteModel.noteID, noteModel);
      }
    });
  }
}
