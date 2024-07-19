part of '../collections.dart';

class SettingsCollection extends FirestoreCollection<SettingsModel>
    implements BaseCollection<SettingsModel> {
  SettingsCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.settings.name}';

  @override
  CollectionReference<SettingsModel> get withConverter =>
      firestore.collection(path).withConverter<SettingsModel>(
            fromFirestore: (snapshot, _) =>
                SettingsModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(SettingsModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<SettingsModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  SettingsModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<SettingsModel> upsert(SettingsModel Function() updateCallback) {
    return _realm.writeAsync<SettingsModel>(updateCallback);
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<SettingsModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
