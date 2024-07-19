part of '../collections.dart';

class TimelineNotesCollection extends FirestoreCollection<TimelineNoteModel>
    implements BaseCollection<TimelineNoteModel> {
  TimelineNotesCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

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

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(TimelineNoteModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<TimelineNoteModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  TimelineNoteModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<TimelineNoteModel> upsert(
      TimelineNoteModel Function() updateCallback) {
    return _realm.writeAsync<TimelineNoteModel>(updateCallback);
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<TimelineNoteModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
