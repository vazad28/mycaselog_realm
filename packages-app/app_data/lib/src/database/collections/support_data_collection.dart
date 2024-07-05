part of '../database_service.dart';

/// Implementation of [FirestoreCollection] with [SupportDataCollection] collection
class SupportDataCollection extends FirestoreCollection<SupportDataModel> {
  SupportDataCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    stream = collectionRef
        .where(
          'timestamp',
          isGreaterThan: getLastSyncTimestamp - 50000,
        )
        .snapshots();
  }

  final Realm _realm;

  static String name = DbCollection.supportData.name;

  @override
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  @override
  String get path => '$root/$userID/$name';

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
      final changes = querySnapshot.docChanges;
      final documents = changes
          .map((change) {
            final doc = change.doc;
            final model = SupportDataModelX.fromJson(doc.data()!);
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
