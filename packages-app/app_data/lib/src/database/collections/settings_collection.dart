part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [SettingsCollection] collection
class SettingsCollection extends DatabaseCollection<SettingsModel> {
  SettingsCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

  @override
  String get path => '$root/$userID/${DbCollection.settings.name}';

  @override
  CollectionReference<SettingsModel> get withConverter =>
      firestore.collection(path).withConverter<SettingsModel>(
            fromFirestore: (snapshot, _) =>
                SettingsModel.fromJson(snapshot.data()!),
            toFirestore: (settingsModel, _) => settingsModel.toJson(),
          );

  @override
  Future<SettingsModel> upsert(SettingsModel model) async {
    final settingsModel = model.copyWith(timestamp: ModelUtils.getTimestamp);
    await put(userID, settingsModel);

    return settingsModel;
  }

  @override
  Stream<List<SettingsModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SettingsModel.fromJson(change.doc.data()!);
            final modelRealm = SettingsRealmX.fromModel(model);
            //print('Settings model getting update ${modelRealm.toEJson()}');
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(
                  () => _realm.add<SettingsRealm>(modelRealm, update: true),
                );
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<SettingsRealm>(modelRealm));
                return null;
            }
          })
          .whereType<SettingsModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  SettingsModel getSettings() {
    try {
      final settingsRealms =
          _realm.query<SettingsRealm>(r'userID == $0', [userID]).first;
      return settingsRealms.toModel();
    } catch (err) {
      return SettingsModel(userID: userID);
    }
  }
}
