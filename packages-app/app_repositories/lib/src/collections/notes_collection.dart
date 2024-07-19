part of '../collections.dart';

class NotesCollection extends FirestoreCollection<NoteModel>
    implements BaseCollection<NoteModel> {
  NotesCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

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

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(NoteModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<NoteModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  NoteModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<NoteModel> upsert(NoteModel Function() updateCallback) {
    return _realm.writeAsync<NoteModel>(updateCallback);
  }

  List<NoteModel> search(String searchTerm) {
    final results = _realm.query<NoteModel>(
      r'title TEXT $0 OR note TEXT $0',
      ['$searchTerm*'],
    );
    return results.toList();
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
