part of '../collections.dart';

class CasesCollection extends SyncCollection<CaseModel> {
  CasesCollection(super.realmDatabase);

  /// The path to the cases collection in the Firestore database.
  @override
  String get path => '$root/$userID/${DbCollection.cases.name}';

  /// Retrieves the primary key value for a given CaseModel object.
  @override
  String getPrimaryKey(CaseModel object) => object.caseID;

  /// Converts a Map<String, dynamic> representation of a case to a
  /// CaseModel object.
  @override
  CaseModel mapToModel(Map<String, dynamic> data) => CaseModelX.fromJson(data);

  /// Converts a CaseModel object to a Map<String, dynamic> representation.
  @override
  Map<String, dynamic> modelToMap(CaseModel object) {
    final json = object.toJson();
    // ignore: avoid_dynamic_calls
    json['patientModel']['name'] =
        null; // set name property value to null before adding to firestore
    return json;
  }

  /// Counts the number of non-removed cases in the database.
  @override
  int count() => realm.all<CaseModel>().query(r'removed == $0', [0]).length;

  // Retrieves all cases from Realm
  RealmResults<CaseModel> getAllCases() {
    return realm.query<CaseModel>('removed == 0 SORT(surgeryDate DESC)');
  }

  /// Adds a new case to the database.
  /// Sets the timestamp of the case before adding it.
  @override
  Future<void> add(CaseModel caseModel) async {
    return realm.writeAsync(() {
      caseModel.timestamp = ModelUtils.getTimestamp;
      realm.add<CaseModel>(caseModel, update: true);
      addToFirestore(caseModel);
    });
  }

  /// Retrieves autocomplete data for a specific field in cases.
  ///
  /// Takes an optional query string and the field name as parameters.
  /// Performs a case-insensitive text search on the specified field.
  /// Returns a list of unique, non-null values for the field.
  /// Throws an exception if the provided field is not supported.
  Future<List<String>> getAutoCompleteData(String? query, String field) async {
    final list = _getAutoCompleteList(query, field);

    Iterable<String?> resList = [];

    if (field == BasicDataModelProps.diagnosis.name) {
      resList = list.map((e) => e.diagnosis);
    } else if (field == BasicDataModelProps.surgery.name) {
      resList = list.map((e) => e.surgery);
    } else {
      throw Exception('Unknown field for autocomplete');
    }
    return resList.nonNulls.toList();
  }

  /// Retrieves a RealmResults object containing cases used for autocomplete
  /// suggestions.
  ///
  /// Takes an optional query string and the field name as parameters.
  /// If no query is provided, retrieves the first 50 distinct values for the
  /// field.
  /// Otherwise, performs a case-insensitive text search on the specified field.
  /// Returns a RealmResults object containing the matching cases.
  RealmResults<CaseModel> _getAutoCompleteList(String? query, String field) {
    return (query == null)
        ? realm.query<CaseModel>('$field CONTAINS ALL[*] LIMIT(50)')
        : realm.query<CaseModel>('$field CONTAINS[c] \$0', [query]);
  }

  /// Searches for cases containing a specific search term in various fields.
  ///
  /// Takes the search term as a parameter.
  /// Performs a case-insensitive text search on diagnosis, surgery, comments,
  /// and patient initials fields.
  /// Sorts the results by timestamp in descending order.
  /// Returns a RealmResults object containing the matching cases.
  RealmResults<CaseModel> search(String searchTerm) {
    return realm.query<CaseModel>(
      r'''
        diagnosis TEXT $0 OR 
        surgery TEXT $0 OR 
        comments TEXT $0 OR 
        patientModel.initials TEXT $0 OR 
        patientModel.name TEXT $0 AND removed == 0 SORT(timestamp DESC)''',
      ['$searchTerm*'],
    );
  }

  /// Retrieves cases that fall within a specific date range and optionally
  /// filtered by case IDs.
  ///
  /// Takes the start and end timestamps and an optional list of case IDs
  /// as parameters.
  /// Filters cases based on the removed flag being set to false and the
  /// surgery date falling within the provided timestamp range.
  /// If a list of case IDs is provided, further filters the results to include
  /// only cases with matching IDs.

  /// Get cases between two timestamps among caseIDs
  RealmResults<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    Iterable<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];
    final cases = realm.query<CaseModel>(
      r'''
        removed == $0 AND 
        surgeryDate BETWEEN{$1, $2}''',
      params,
    );
    return idList != null ? cases.query(r'caseID IN $0', [idList]) : cases;
  }

  /// Retrieves a list of CaseModel objects based on their case IDs.
  RealmResults<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    return realm.query<CaseModel>(r'caseID IN $0', [caseIDs]);
  }

  /// Retrieves the year of the first case in the database.
  int? firstCaseYear() {
    final cases = realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    return cases.isEmpty ? null : cases.first.surgeryDate;
  }

  /// Refreshes media backlinks for a given list of CaseModel objects
  /// or all cases if not provided.
  void refreshBacklinks() => refreshCasesBacklinks(realm, null);

  Future<void> updateCasesWithPatientIDFromRealm() async {
    try {
      final results =
          realm.all<CaseModel>(); // Replace PatientModel with your actual model
      final batch = firestore.batch();

      for (final caseModel in results) {
        if (caseModel.patientModel == null) continue;
        //final patientID = caseModel.patientModel!.patientID;
        final docRef =
            collectionRef.doc(caseModel.caseID); // Assuming caseId exists

        batch
            .update(docRef, {'patientModel': caseModel.patientModel!.toJson()});
      }

      await batch.commit();
    } catch (e) {
      // Handle errors, e.g.,
      debugPrint(e.toString());
    }
  }

  RealmResults<CaseModel> searchQuery(String query) {
    return realm.query<CaseModel>(query);
  }
}
