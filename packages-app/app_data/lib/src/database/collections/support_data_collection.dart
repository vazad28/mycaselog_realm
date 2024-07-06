part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [SupportDataCollection] collection
class SupportDataCollection extends DatabaseCollection<SupportDataModel> {
  SupportDataCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

  @override
  String get path => '$root/$userID/${DbCollection.supportData.name}';

  @override
  CollectionReference<SupportDataModel> get withConverter =>
      firestore.collection(path).withConverter<SupportDataModel>(
            fromFirestore: (snapshot, _) =>
                SupportDataModelX.fromJson(snapshot.data()!),
            toFirestore: (caseModel, _) => caseModel.toJson(),
          );

  @override
  Stream<List<SupportDataModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SupportDataModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(() => _realm.add<SupportDataModel>(model));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<SupportDataModel>(model));
                return null;
            }
          })
          .whereType<SupportDataModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }
}
