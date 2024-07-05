part of '../database_service.dart';

/// Implementation of [FirestoreCollection] with [CasesCollection] collection
class CasesCollection extends FirestoreCollection<CaseModel> {
  CasesCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    //print(getLastSyncTimestamp);
    stream = collectionRef
        .where(
          'timestamp',
          isGreaterThan: getLastSyncTimestamp - 500000,
        )
        .snapshots();
  }

  final Realm _realm;

  static String name = DbCollection.cases.name;

  @override
  late final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  @override
  String get path => '$root/$userID/$name';

  @override
  CollectionReference<CaseModel> get withConverter =>
      firestore.collection(path).withConverter<CaseModel>(
            fromFirestore: (snapshot, _) =>
                CaseModelX.fromJson(snapshot.data()!),
            toFirestore: (caseModel, _) => caseModel.toJson(),
          );

  @override
  Stream<List<CaseModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final changes = querySnapshot.docChanges;
      final documents = changes
          .map((change) {
            final doc = change.doc;
            final model = CaseModelX.fromJson(doc.data()!);
            print('doc listened from firestore ${model.caseID}');
            print(
                'timestampDiff = ${getLastSyncTimestamp - (model.timestamp ?? 0)}');
            switch (change.type) {
              case DocumentChangeType.added:
                final localModel = _realm.find<CaseModel>(model.caseID);
                if (localModel == null) {
                  _realm.write(() => _realm.add(model));
                }
                return model;

              case DocumentChangeType.modified:
                _realm.write(() => _realm.add<CaseModel>(model));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<CaseModel>(model));
                return null;
            }
          })
          .whereType<CaseModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Autocomplete Data
  /// ////////////////////////////////////////////////////////////////////

  /// Diagnosis autocomplete data
  Future<List<String>> getAutoCompleteDiagnosis(
    String? query,
  ) async {
    if (query == null) {
      final diagnosisList = _realm.all<CaseModel>().take(50);
      return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();
    }

    final diagnosisList =
        _realm.query<CaseModel>(r'diagnosis TEXT $0', ['$query*']);
    return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();

    // final future = query == null
    //     ? _realm.all<CaseModel>().take(30)
    //     : _realm
    //         .all<CaseModel>()
    //         .query(query)
    //         .where((e) => e.diagnosis?.contains(query) ?? false)
    //         .take(30);

    // final diagnosisList = await future;
  }

  /// surgery autocomplete data
  Future<List<String>> getAutoCompleteSurgery(
    String? query,
  ) async {
    if (query == null) {
      final surgeryList = _realm.all<CaseModel>().take(50);
      return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
    }

    final surgeryList =
        _realm.query<CaseModel>(r'surgery TEXT $0', ['$query*']);
    return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
  }
}
