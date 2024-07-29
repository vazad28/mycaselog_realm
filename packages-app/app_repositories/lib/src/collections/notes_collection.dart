part of '../collections.dart';

class NotesCollection extends BaseCollection<NoteModel> {
  NotesCollection(super.realmDatabase) : _realm = realmDatabase.realm;

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.notes.name}';

  @override
  CollectionReference<NoteModel> get withConverter =>
      firestore.collection(path).withConverter<NoteModel>(
            fromFirestore: (snapshot, _) =>
                NoteModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  @override
  Stream<List<NoteModel>>? listenForChanges() {
    return stream?.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = NoteModelX.fromJson(change.doc.data()!);
            _realm.write(() {
              _realm.add<NoteModel>(model, update: true);
            });
            return model;
          })
          .whereType<NoteModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  Future<void> deleteNote(NoteModel noteModel) {
    return upsert(noteModel.noteID, () => noteModel..removed = 1);
  }

  RealmResults<NoteModel> search(String searchTerm) {
    final results = _realm.query<NoteModel>(
      r'title TEXT $0 OR note TEXT $0',
      ['$searchTerm*'],
    );
    return results;
  }
}
