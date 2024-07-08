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
                SupportDataModel.fromJson(snapshot.data()!),
            toFirestore: (caseModel, _) => caseModel.toJson(),
          );

  @override
  Future<SupportDataModel> upsert(SupportDataModel model) async {
    final supportDataModel = model.copyWith(timestamp: ModelUtils.getTimestamp);
    await put(userID, supportDataModel);
    return supportDataModel;
  }

  @override
  Stream<List<SupportDataModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = SupportDataModel.fromJson(change.doc.data()!);
            final modelRealm = SupportDataRealmX.fromModel(model);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(() =>
                    _realm.add<SupportDataRealm>(modelRealm, update: true));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<SupportDataRealm>(modelRealm));
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

  SupportDataModel getSupportData() {
    try {
      final realm =
          _realm.query<SupportDataRealm>(r'userID == $0', [userID]).first;
      return realm.toModel();
    } catch (err) {
      return SupportDataModel(userID: userID);
    }

    //   final serverModel =
    //       await getSingle(userID) ?? SupportDataModelX.zero(userID);

    //   _realm.write(
    //     () => _realm.add<SupportDataModel>(serverModel, update: true),
    //   );

    //   return serverModel;
  }
}
