part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [TimelineNotesCollection] collection
class TimelineNotesCollection extends DatabaseCollection<TimelineNoteModel> {
  TimelineNotesCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

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
                final localModel = _realm.find<TimelineNoteModel>(model.caseID);
                if (localModel == null) {
                  _realm.write(() => _realm.add(model));
                }
                return model;

              case DocumentChangeType.modified:
                _realm.write(
                    () => _realm.add<TimelineNoteModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<TimelineNoteModel>(model));
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

  int countAll() {
    return _realm.all<TimelineNoteModel>().where((e) => e.removed == 0).length;
  }

  /// Get notes for a case
  List<TimelineNoteModel> getCaseNotes(String caseID) {
    return _realm
        .all<TimelineNoteModel>()
        .where((e) => e.caseID == caseID)
        .toList();
  }

  List<TimelineNoteModel> getAll() {
    return _realm
        .all<TimelineNoteModel>()
        .where((e) => e.removed == 0)
        .toList();
  }

  int getCaseNoteCount(String caseID) {
    return _realm
        .all<TimelineNoteModel>()
        .where((e) => e.caseID == caseID)
        .length;
  }
}
