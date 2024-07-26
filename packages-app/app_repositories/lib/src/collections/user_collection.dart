part of '../collections.dart';

class UserCollection extends BaseCollection<UserModel> {
  UserCollection(super.realmDatabase) : _realm = realmDatabase.realm {
    print('creating instance of UserCollection');
    //listenForChanges().listen((_) {}).cancelOnDisposeOf(this);
  }

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

  @override
  Stream<List<UserModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = UserModelX.fromJson(change.doc.data()!);

            _realm.write(() => _realm.add<UserModel>(model, update: true));
            return model;
          })
          .whereType<UserModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
}
