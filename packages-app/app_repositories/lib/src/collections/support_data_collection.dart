part of '../collections.dart';

class SupportDataCollection extends BaseCollection<SupportDataModel> {
  SupportDataCollection(super.realmDatabase) : _realm = realmDatabase.realm {
    final supportData = getSupportData();
    // must load support data from server to prevent empty write
    if (supportData.timestamp == 0) syncByTimestamp(0);
  }

  final Realm _realm;

  @override
  String get path => '$root/$userID/${DbCollection.supportData.name}';

  @override
  CollectionReference<SupportDataModel> get withConverter =>
      firestore.collection(path).withConverter<SupportDataModel>(
            fromFirestore: (snapshot, _) =>
                SupportDataModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  @override
  Stream<List<SupportDataModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SupportDataModelX.fromJson(change.doc.data()!);
            _realm.write(
              () => _realm.add<SupportDataModel>(model, update: true),
            );
            return model;
          })
          .whereType<SupportDataModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
  SupportDataModel getSupportData() {
    return _realm.findOrAdd(userID, SupportDataModelX.zero);
  }
}
