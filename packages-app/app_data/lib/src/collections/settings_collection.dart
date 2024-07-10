part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [SettingsCollection] collection
class SettingsCollection extends DatabaseCollection<SettingsModel> {
  SettingsCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

  @override
  String get path => '$root/$userID/${DbCollection.settings.name}';

  @override
  CollectionReference<SettingsModel> get withConverter =>
      firestore.collection(path).withConverter<SettingsModel>(
            fromFirestore: (snapshot, _) =>
                SettingsModelX.fromJson(snapshot.data()!),
            toFirestore: (settingsModel, _) => settingsModel.toJson(),
          );

  @override
  Stream<List<SettingsModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SettingsModelX.fromJson(change.doc.data()!);
            //print('Settings model getting update ${modelRealm.toEJson()}');
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(
                  () => realm.add<SettingsModel>(model, update: true),
                );
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<SettingsModel>(model));
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

  // SettingsModel getSettings() {
  //   try {
  //     final settingsRealms =
  //         realm.query<SettingsModel>(r'userID == $0', [userID]).first;
  //     return settingsRealms;
  //   } catch (err) {
  //     return SettingsModelX.zero(userID);
  //   }
  // }

  // @override
  // SettingsModel? getSingle(String id) {
  //   try {
  //     final realmObject =
  //         realm.query<SettingsModel>(r'userID == $0', [id]).first;
  //     return realmObject.toModel();
  //   } catch (err) {
  //     return null;
  //   }
  // }
}
