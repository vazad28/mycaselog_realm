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

  String get getLastSyncTimestampKey => lastSyncTimestampKey;

  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

  @override
  CollectionReference<UserModel> get withConverter =>
      firestore.collection(path).withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModelX.fromJson(snapshot.data()!),
            toFirestore: (caseModel, _) => caseModel.toJson(),
          );

  @override
  Stream<List<UserModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = UserModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
                final localModel = _realm.find<UserModel>(model.userID);
                if (localModel == null) {
                  _realm.write(() => _realm.add(model));
                }
                return model;

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

  Future<void> upsertUserModel(UserModel userModel) {
    return put(userID, userModel);
  }
}
