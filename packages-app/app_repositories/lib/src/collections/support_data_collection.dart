part of '../collections.dart';

class SupportDataCollection extends FirestoreCollection<SupportDataModel>
    implements BaseCollection<SupportDataModel> {
  SupportDataCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => 'notess/$userID/data';

  @override
  CollectionReference<SupportDataModel> get withConverter =>
      firestore.collection(path).withConverter<SupportDataModel>(
            fromFirestore: (snapshot, _) =>
                SupportDataModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(SupportDataModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<SupportDataModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  SupportDataModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<SupportDataModel> upsert(SupportDataModel Function() updateCallback) {
    return _realm.writeAsync<SupportDataModel>(updateCallback);
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<SupportDataModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
