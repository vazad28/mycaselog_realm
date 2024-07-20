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
            //print('CasesCollection ${model.caseID} ${change.type}');
            return realm.write(() => realm.add<CaseModel>(model, update: true));
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
    final diagnosisList = (query == null)
        ? realm.all<CaseModel>().take(50)
        : realm.query<CaseModel>(r'diagnosis TEXT $0', ['$query*']);
    return diagnosisList.map((e) => e.diagnosis).nonNulls.toSet().toList();
  }

  /// surgery autocomplete data
  Future<List<String>> getAutoCompleteSurgery(
    String? query,
  ) async {
    final surgeryList = (query == null)
        ? realm.all<CaseModel>().take(50)
        : realm.query<CaseModel>(r'surgery TEXT $0', ['$query*']);
    return surgeryList.map((e) => e.surgery).nonNulls.toSet().toList();
  }

  List<CaseModel> getAllByCaseIDs(List<String> caseIDs) {
    return realm.query<CaseModel>(r'caseID IN $0', [caseIDs]).toList();
  }

  List<CaseModel> search(String searchTerm) {
    final casesList = realm.query<CaseModel>(
      r'''
        diagnosis TEXT $0 OR 
        surgery TEXT $0 OR 
        comments TEXT $0 OR 
        patientModel[*].initials TEXT $0''',
      ['$searchTerm*'],
    );
    return casesList.toList();
  }

  /// get cases between two timestamps among caseIDs
  List<CaseModel> casesBetweenTimestamp({
    required int fromTimestamp,
    required int toTimestamp,
    List<String>? idList,
  }) {
    final params = [0, fromTimestamp, toTimestamp];

    final cases = realm.query<CaseModel>(
      r'''
        removed == $0 AND 
        surgeryDate >= $1 AND 
        surgeryDate <= $2''',
      params,
    );

    if (idList != null) {
      return cases.query(r'caseID IN $0', [idList]).toList();
    }

    return cases.toList();
  }

  int? firstCaseYear() {
    final cases = realm.query<CaseModel>('TRUEPREDICATE SORT(surgeryDate ASC)');
    if (cases.isEmpty) return null;
    return cases.first.surgeryDate;
  }

  Future<void> putMedia(MediaModel mediaModel, {bool delete = false}) async {
    try {
      final caseModel = realm.find<CaseModel>(mediaModel.caseID);
      if (caseModel == null) return;

      await realm.writeAsync(() {
        if (delete) {
          caseModel.medias.removeWhere((e) => e.mediaID == mediaModel.mediaID);

          /// delete media from storage too
        } else {
          // caseModel.medias.replaceOrAddComplex(
          //   mediaModel,
          //   (mediaModel) => mediaModel.mediaID,
          // );
        }
      });
    } catch (err) {
      logger.severe(err);
    }
  }

  Future<void> putNote(
    TimelineNoteModel timelineNoteModel, {
    bool delete = false,
  }) async {
    final caseModel = realm.find<CaseModel>(timelineNoteModel.caseID);
    if (caseModel == null) return;

    await realm.writeAsync(() {
      if (delete) {
        caseModel.notes
            .removeWhere((e) => e.noteID == timelineNoteModel.noteID);
      } else {
        // caseModel.notes.replaceOrAddComplex(
        //   timelineNoteModel,
        //   (timelineNoteModel) => timelineNoteModel.noteID,
        // );
      }
      // update(caseModel.caseID, {
      //   'notes': caseModel.notes.map((e) => e.toJson()).toList(),
      //   'timestamp': ModelUtils.getTimestamp
      // });
    });
    await put(caseModel.caseID, caseModel);
  }

  Future<void> updateTimelineData(
    String caseID,
    List<MediaModel> mediaList,
    List<TimelineNoteModel> noteList,
    int timestamp,
  ) async {
    final caseModel = realm.find<CaseModel>(caseID);
    if (caseModel == null) return;
    await realm.writeAsync(() {
      final updatedMediaList = mediaList.map((e) => e..createdAt = timestamp);
      final updatedNotesList = noteList.map((e) => e..createdAt = timestamp);

      for (final media in updatedMediaList) {
        //caseModel.medias.replaceOrAddComplex(media, (media) => media.mediaID);
      }

      for (final note in updatedNotesList) {
        //caseModel.notes.replaceOrAddComplex(note, (note) => note.noteID);
      }
    });

    await put(caseID, caseModel);
  }

  Map<DbCollection, int>? caseMediaNoteCount() {
    final allCases = getAll();
    try {
      return {
        DbCollection.cases: allCases.length,
        DbCollection.media: allCases.fold(0, (a, b) => b.medias.length),
        DbCollection.notes: allCases.fold(0, (a, b) => b.notes.length),
      };
    } catch (err) {
      logger.severe(err.toString());
      return null;
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// media
  /// ////////////////////////////////////////////////////////////////////
  List<MediaModel> getAllMedia() {
    // Alternatively, you can filter posts based on criteria
    final realmResultsCaseModel = realm.all<CaseModel>();
    // Create an empty list to store all media models
    final allMedia = <MediaModel>[];

    // Loop through each case and add its media to the list
    for (final caseModel in realmResultsCaseModel) {
      allMedia.addAll(caseModel.medias);
    }

    return allMedia;
  }
  // RealmResults<MediaModel> getAllMedia() {
  //   // Alternatively, you can filter posts based on criteria
  //   final realmResultsCaseModel = realm.all<CaseModel>();

  //   // Use fold to accumulate media from all posts
  //   return realmResultsCaseModel
  //       .query('medias.@size > 0').
  // .fold(RealmList<MediaModel>([]), (media, caseModel) => caseModel.medias)
  // .asResults();
  //   final list = caseModel.medias.expand(
  //     (e) => media
  //       ..add(HybridMediaModel(
  //         caseModel: caseModel,
  //         mediaModel: e,
  //       )),
  //   );

  //   return list;
  //}).asResults();
  // .fold<RealmResults<MediaModel>>(
  //     <MediaModel>[], (media, post) => media..addAll(post.mediaModel));

  // Use flatMap to get a Stream of Media objects from each Post's media list
  //Stream<MediaModel> allMediaStream = realmResultsCaseModel.flatMap((post) => post.media);

  // Use a flatMap to iterate through all posts and extract their media lists
  // return realmResultsCaseModel.fold(()) flatMap((post) => post.media);
  //   return realm.query<CaseModel>('medias.@size > 0').expand((e) => e.medias);
  // }
  //}
}
