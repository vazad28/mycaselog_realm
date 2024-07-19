part of '../collections.dart';

class UserCollection extends FirestoreCollection<UserModel>
    implements BaseCollection<UserModel> {
  UserCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => 'users/$userID/data';

  @override
  CollectionReference<UserModel> get withConverter =>
      firestore.collection(path).withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(UserModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<UserModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  UserModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<UserModel> upsert(UserModel Function() updateCallback) {
    return _realm.writeAsync<UserModel>(updateCallback);
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<UserModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
