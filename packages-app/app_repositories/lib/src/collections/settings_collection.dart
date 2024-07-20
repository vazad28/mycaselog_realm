part of '../collections.dart';

class SettingsCollection extends BaseCollection<SettingsModel> {
  SettingsCollection(super.realmDatabase) : _realm = realmDatabase.realm;

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

  @override
  Stream<List<SettingsModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SettingsModelX.fromJson(change.doc.data()!);
            _realm.write(
              () => _realm.add<SettingsModel>(model, update: true),
            );
            return model;
          })
          .whereType<SettingsModel>()
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
