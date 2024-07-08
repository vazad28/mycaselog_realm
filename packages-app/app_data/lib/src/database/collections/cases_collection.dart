part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [CasesCollection] collection
class CasesCollection extends DatabaseCollection<CaseModel> {
  CasesCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

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
  Future<CaseModel> upsert(CaseModel model) async {
    final caseModel = model..timestamp = ModelUtils.getTimestamp;
    await put(model.caseID, caseModel);
    return caseModel;
  }

  @override
  Stream<List<CaseModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = CaseModelX.fromJson(change.doc.data()!);
            print('CasesCollection ${model.caseID} ${change.type.toString()}');
            switch (change.type) {
              case DocumentChangeType.added:
              // final localModel = _realm.find<CaseModel>(model.caseID);
              // if (localModel == null) {
              //   _realm.write(() => _realm.add(model));
              // }
              // return model;

              case DocumentChangeType.modified:
                _realm.write(() => _realm.add<CaseModel>(model, update: true));
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
        // ignore: use_raw_strings
        _realm.query<CaseModel>('surgery TEXT \$0', ['$query*']);
    return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
  }

  List<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    // ignore: use_raw_strings
    return _realm.query<CaseModel>('caseID IN \$0', [caseIDs]).toList();
  }

  int countAll() {
    return _realm.all<CaseModel>().where((e) => e.removed == 0).length;
  }

  List<CaseModel> search(String searchTerm) {
    final casesList = _realm.query<CaseModel>(
      r'diagnosis TEXT $0 OR surgery TEXT $0 OR comments TEXT $0',
      ['$searchTerm*'],
    );

    // final casesPatientList = _realm.query<PatientModel>(
    //   r'initials TEXT $0',
    //   ['$searchTerm*'],
    // );
    // final cases = _realm.all<CaseModel>();
    // final casesList =
    //     cases.query("patientModel[*].initials == '$searchTerm'");
    return casesList.toList();
  }

  RealmResults<CaseModel> loadCases() {
    return _realm.all<CaseModel>();
  }

  /// get cases between two timestamps among caseIDs
  List<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    List<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];
    final cases = _realm.query<CaseModel>(
        'removed == \$0 AND surgeryDate >= \$1 AND surgeryDate <= \$2', params);

    if (idList != null) {
      return cases.query('caseID IN \$0', idList).toList();
    }

    return cases.toList();
  }

  int? firstCaseYear() {
    final cases =
        _realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    if (cases.isEmpty) return null;
    return cases.first.surgeryDate;
  }
}
