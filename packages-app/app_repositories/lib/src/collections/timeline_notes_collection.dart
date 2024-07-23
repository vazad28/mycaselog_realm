part of '../collections.dart';

class TimelineNotesCollection extends BaseCollection<TimelineNoteModel> {
  TimelineNotesCollection(super.realmDatabase) : _realm = realmDatabase.realm {
    print('creating instance of timeline note Collection');
    listenForChanges().listen((_) {}).cancelOnDisposeOf(this);
  }

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
  Stream<List<TimelineNoteModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) async {
            final model = TimelineNoteModelX.fromJson(change.doc.data()!);
            await _realm.writeAsync(() {
              _realm.add<TimelineNoteModel>(model, update: true);

              /// add media to cases collection if not exist
              final caseModel = _realm.find<CaseModel>(model.caseID);
              if (caseModel != null && !caseModel.notes.contains(model)) {
                caseModel.notes.add(model);
              }
            });
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
  Future<void> refreshTimelineNotesBacklinks() async {
    // Open a write transaction
    await _realm.writeAsync(() {
      // Query all Media objects
      final notesResults = _realm.all<TimelineNoteModel>();

      // Group media by caseID
      final groupedNotes =
          notesResults.groupFoldBy<String, List<TimelineNoteModel>>(
        (e) => e.caseID,
        (prev, e) => (prev ?? [])..add(e),
      );

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
}
