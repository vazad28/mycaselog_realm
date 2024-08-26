part of '../collections.dart';

class NotesCollection extends SyncCollection<NoteModel> {
  NotesCollection(super.realmDatabase);

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.notes.name}';

  @override
  String getPrimaryKey(NoteModel object) => object.noteID;

  @override
  NoteModel mapToModel(Map<String, dynamic> data) => NoteModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(NoteModel object) => object.toJson();

  @override
  Future<void> add(NoteModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<NoteModel>(model, update: true);
      addToFirestore(model);
    });
  }

  // Retrieves all cases from Realm
  RealmResults<NoteModel> getAllNotes() {
    return realm.query<NoteModel>('removed == 0 SORT(timestamp DESC)');
  }

  Future<void> deleteNote(NoteModel noteModel) {
    return upsert(() => noteModel..removed = 1);
  }

  RealmResults<NoteModel> search(String searchTerm) {
    return realm.query<NoteModel>(
      r'title TEXT $0 OR noteText TEXT $0',
      ['$searchTerm*'],
    );
  }
}
