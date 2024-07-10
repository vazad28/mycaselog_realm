part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [TimelineNotesCollection] collection
class TimelineNotesCollection extends DatabaseCollection<TimelineNoteModel> {
  TimelineNotesCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

  @override
  String get path => '$root/$userID/${DbCollection.timelineNotes.name}';

  @override
  CollectionReference<TimelineNoteModel> get withConverter =>
      firestore.collection(path).withConverter<TimelineNoteModel>(
            fromFirestore: (snapshot, _) =>
                TimelineNoteModelX.fromJson(snapshot.data()!),
            toFirestore: (timelineNoteModel, _) => timelineNoteModel.toJson(),
          );

  @override
  Stream<List<TimelineNoteModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = TimelineNoteModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(
                    () => realm.add<TimelineNoteModel>(model, update: true),);
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<TimelineNoteModel>(model));
                return null;
            }
          })
          .whereType<TimelineNoteModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// Get notes for a case
  List<TimelineNoteModel> getCaseNotes(String caseID) {
    return realm
        .all<TimelineNoteModel>()
        .where((e) => e.caseID == caseID)
        .toList();
  }
}
