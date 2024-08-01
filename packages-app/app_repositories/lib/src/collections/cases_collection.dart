part of '../collections.dart';

class CasesCollection extends BaseCollection<CaseModel> {
  CasesCollection(super.realmDatabase) : _realm = realmDatabase.realm;

  final Realm _realm;

  /// Firestore Methods
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
  Stream<List<CaseModel>>? listenForChanges() {
    return stream?.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = CaseModelX.fromJson(change.doc.data()!);
            //print('CasesCollection ${model.caseID} ${change.type}');
            return _realm.write(
              () => _realm.add<CaseModel>(model, update: true),
            );
          })
          .whereType<CaseModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  @override
  int count() => _realm.all<CaseModel>().query(r'removed == $0', [0]).length;

  Future<void> addCase(CaseModel caseModel) {
    return add(
        caseModel.caseID, caseModel..timestamp = ModelUtils.getTimestamp);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Autocomplete Data
  /// ////////////////////////////////////////////////////////////////////

  /// Diagnosis autocomplete data
  Future<List<String>> getAutoCompleteDiagnosis(
    String? query,
  ) async {
    final diagnosisList = (query == null)
        ? _realm.all<CaseModel>().take(50)
        : _realm.query<CaseModel>(r'diagnosis TEXT $0', ['$query*']);
    return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();
  }

  /// surgery autocomplete data
  Future<List<String>> getAutoCompleteSurgery(
    String? query,
  ) async {
    final surgeryList = (query == null)
        ? _realm.all<CaseModel>().take(50)
        : _realm.query<CaseModel>(r'surgery TEXT $0', ['$query*']);
    return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Custom methods for the cases class
  /// ////////////////////////////////////////////////////////////////////
  RealmResults<CaseModel> search(String searchTerm) {
    return _realm.query<CaseModel>(
      r'''
        diagnosis TEXT $0 OR 
        surgery TEXT $0 OR 
        comments TEXT $0 OR 
        patientModel[*].initials TEXT $0''',
      ['$searchTerm*'],
    );
  }

  /// get cases between two timestamps among caseIDs
  RealmResults<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    Iterable<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];

    final cases = _realm.query<CaseModel>(
      r'''
        removed == $0 AND 
        surgeryDate BETWEEN{$1, $2}''',
      params,
    );

    if (idList != null) {
      return cases.query(r'caseID IN $0', [idList]);
    }

    return cases;
  }

  List<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    return _realm.query<CaseModel>(r'caseID IN $0', [caseIDs]).toList();
  }

  int? firstCaseYear() {
    final cases =
        _realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    if (cases.isEmpty) return null;
    return cases.first.surgeryDate;
  }

  /// Refresh media backlinks to cases collection  as needed
  Future<void> refreshCasesBacklinks(List<CaseModel>? models) async {
    // Open a write transaction
    await _realm.writeAsync(() {
      // Query all All CaseModel objects
      final caseModels = models ?? _realm.all<CaseModel>();

      // Iterate through each group
      for (final caseModel in caseModels) {
        final mediaList =
            _realm.query<MediaModel>(r'caseID == $0', [caseModel.caseID]);

        // Check for media not already in the Cases object
        final mediaToAdd = mediaList
            .where((media) => !caseModel.medias.contains(media))
            .toList();

        // Update the existing Cases object
        caseModel.medias.addAll(mediaToAdd);

        /// Timeline notes
        final timelineNotesList = _realm
            .query<TimelineNoteModel>(r'caseID == $0', [caseModel.caseID]);

        // Check for media not already in the Cases object
        final timelineNotesToAdd = timelineNotesList
            .where((note) => !caseModel.notes.contains(note))
            .toList();

        // Update the existing Cases object
        caseModel.notes.addAll(timelineNotesToAdd);
      }
    });
  }
}
