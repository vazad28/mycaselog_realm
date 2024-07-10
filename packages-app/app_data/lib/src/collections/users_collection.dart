part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [UserCollection] collection
class UsersCollection extends DatabaseCollection<UserModel> {
  UsersCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

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
  Stream<List<UserModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = UserModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(() => realm.add<UserModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<UserModel>(model));
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
}
