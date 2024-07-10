part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [CasesCollection] collection
class CasesCollection extends DatabaseCollection<CaseModel> {
  CasesCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

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
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = CaseModelX.fromJson(change.doc.data()!);
            print('CasesCollection ${model.caseID} ${change.type}');
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(() => realm.add<CaseModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<CaseModel>(model));
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
      final diagnosisList = realm.all<CaseModel>().take(50);
      return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();
    }

    final diagnosisList =
        realm.query<CaseModel>(r'diagnosis TEXT $0', ['$query*']);
    return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();
  }

  /// surgery autocomplete data
  Future<List<String>> getAutoCompleteSurgery(
    String? query,
  ) async {
    if (query == null) {
      final surgeryList = realm.all<CaseModel>().take(50);
      return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
    }

    final surgeryList =
        // ignore: use_raw_strings
        realm.query<CaseModel>('surgery TEXT \$0', ['$query*']);
    return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
  }

  List<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    // ignore: use_raw_strings
    return realm.query<CaseModel>('caseID IN \$0', [caseIDs]).toList();
  }

  // int countAll() {
  //   return realm.all<CaseModel>().where((e) => e.removed == 0).length;
  // }

  List<CaseModel> search(String searchTerm) {
    final casesList = realm.query<CaseModel>(
      r'diagnosis TEXT $0 OR surgery TEXT $0 OR comments TEXT $0 OR patientModel[*].initials TEXT $0',
      ['$searchTerm*'],
    );
    return casesList.toList();
  }

  //RealmResults<CaseModel> loadCases() => realm.all<CaseModel>();

  /// get cases between two timestamps among caseIDs
  List<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    List<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];
    final cases = realm.query<CaseModel>(
      r'removed == $0 AND surgeryDate >= $1 AND surgeryDate <= $2',
      params,
    );

    if (idList != null) {
      return cases.query(r'caseID IN $0', idList).toList();
    }

    return cases.toList();
  }

  int? firstCaseYear() {
    final cases = realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    if (cases.isEmpty) return null;
    return cases.first.surgeryDate;
  }

  // @override
  // CaseModel? getSingle(String id) {
  //   try {
  //     return realm.query<CaseModel>(r'caseID == $0', [id]).first;
  //   } catch (err) {
  //     return null;
  //   }
  // }
}
