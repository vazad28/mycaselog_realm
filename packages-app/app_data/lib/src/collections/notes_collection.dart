part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [NotesCollection] collection
class NotesCollection extends DatabaseCollection<NoteModel> {
  NotesCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

  @override
  String get path => '$root/$userID/${DbCollection.notes.name}';

  @override
  CollectionReference<NoteModel> get withConverter =>
      firestore.collection(path).withConverter<NoteModel>(
            fromFirestore: (snapshot, _) =>
                NoteModelX.fromJson(snapshot.data()!),
            toFirestore: (noteModel, _) => noteModel.toJson(),
          );

  // @override
  // Future<NoteModel> upsert(NoteModel model) async {
  //   await put(model.noteID, model);
  //   return model;
  // }

  // void upsertRealm(NoteModel Function() updateCallback) {
  //   final model = realm.write<NoteModel>(updateCallback);
  //   upsert(model);
  // }

  @override
  Stream<List<NoteModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = NoteModelX.fromJson(change.doc.data()!);
            print('NotesCollection ${model.noteID} ${change.type}');
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(() => realm.add<NoteModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<NoteModel>(model));
                return null;
            }
          })
          .whereType<NoteModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  List<NoteModel> search(String searchTerm) {
    final casesList = realm.query<NoteModel>(
      r'title TEXT $0 OR note TEXT $0',
      ['$searchTerm*'],
    );
    return casesList.toList();
  }

  RealmResults<NoteModel> getLastUpdated() {
    return realm.query<NoteModel>('TRUEPREDICATE SORT(timestamp ASC)');
  }

  // @override
  // Stream<RealmObjectChanges<NoteModel>>? getSingleStream(String primaryKey) {
  //   return realm.find<NoteModel>(primaryKey)?.changes;
  // }
}
