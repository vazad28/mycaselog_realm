part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [UserCollection] collection
class UsersCollection extends DatabaseCollection<UserModel> {
  UsersCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

  @override
  String get path => 'users/$userID/data';

  @override
  CollectionReference<UserModel> get withConverter =>
      firestore.collection(path).withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModelX.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJson(),
          );

  @override
  Future<UserModel> upsert(UserModel model) async {
    final userModel = model..timestamp = ModelUtils.getTimestamp;
    await put(userID, userModel);
    return userModel;
  }

  @override
  Stream<List<UserModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = UserModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(() => _realm.add<UserModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<UserModel>(model));
                return null;
            }
          })
          .whereType<UserModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  Future<UserModel> getCurrentUserModel() async {
    final userModel = _realm.find<UserModel>(userID);
    if (userModel != null) return userModel;

    final serverUserModel =
        await getSingle(userID) ?? UserModelX.zero(userID: userID);

    _realm.write(() => _realm.add<UserModel>(serverUserModel, update: true));
    return serverUserModel;
  }
}
