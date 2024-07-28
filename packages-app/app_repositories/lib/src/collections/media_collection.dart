part of '../collections.dart';

class MediaCollection extends BaseCollection<MediaModel> with LoggerMixin {
  MediaCollection(super.realmDatabase) : _realm = realmDatabase.realm {
    // print('creating instance of mediaCollection');
    // listenForChanges().listen((_) {}).cancelOnDisposeOf(this);
  }

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.media.name}';

  @override
  CollectionReference<MediaModel> get withConverter =>
      firestore.collection(path).withConverter<MediaModel>(
            fromFirestore: (snapshot, _) =>
                MediaModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  @override
  Stream<List<MediaModel>>? listenForChanges() {
    return stream?.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) async {
            final model = MediaModelX.fromJson(change.doc.data()!);
            await addMedia(model);
            return model;
          })
          .whereType<MediaModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  @override
  int count() => _realm.all<MediaModel>().query(r'removed == $0', [0]).length;

  /// ////////////////////////////////////////////////////////////////////
  /// custom methods
  /// ////////////////////////////////////////////////////////////////////

  RealmResults<MediaModel> getAllMedia({
    String? orderBy,
    bool isDecenting = true,
    int removed = 0,
  }) {
    final orderByField = orderBy ?? 'timestamp';
    final order = isDecenting ? 'DESCENDING' : 'ASCENDING';
    return _realm.query<MediaModel>(
      'removed == \$0 AND TRUEPREDICATE SORT($orderByField $order)',
      [removed],
    );
  }

  RealmResults<MediaModel> getCaseMedia(String caseID) {
    final results = _realm
        .query<MediaModel>(r'caseID == $0 AND removed == $1', [caseID, 0]);
    return results;
  }

  /// Refresh media backlinks to cases collection  as needed
  Future<void> refreshMediaBacklinks(List<MediaModel>? models) async {
    var groupedMedia = <String, List<MediaModel>>{};

    var mediaModels = models ?? _realm.all<MediaModel>();

    // Open a write transaction
    await _realm.writeAsync(() {
      groupedMedia = mediaModels.groupFoldBy<String, List<MediaModel>>(
        (e) => e.caseID,
        (prev, e) => (prev ?? [])..add(e),
      );
      // if (mediaModels?.isNotEmpty ?? true) {
      //   groupedMedia = mediaModels!.groupFoldBy<String, List<MediaModel>>(
      //     (e) => e.caseID,
      //     (prev, e) => (prev ?? [])..add(e),
      //   );
      // } else {
      //   // Query all Media objects
      //   final mediaResults = _realm.all<MediaModel>();

      //   // Group media by caseID
      //   groupedMedia = mediaResults.groupFoldBy<String, List<MediaModel>>(
      //     (e) => e.caseID,
      //     (prev, e) => (prev ?? [])..add(e),
      //   );
      // }

      // Iterate through each group
      for (final caseID in groupedMedia.keys) {
        final mediaList = groupedMedia[caseID]!;

        // Check if a Case object already exists for this caseID
        final existingCase = _realm.find<CaseModel>(caseID);

        if (existingCase == null) continue;

        // Check for media not already in the Cases object
        final mediaToAdd = mediaList
            .where((media) => !existingCase.medias.contains(media))
            .toList();

        // Update the existing Cases object
        existingCase.medias.addAll(mediaToAdd);
      }
    });
  }

  Future<void> addMedia(MediaModel model) async {
    logger.fine('addMedia reached');
    await _realm.writeAsync(() {
      _realm.add<MediaModel>(model, update: true);

      /// add media to cases collection if not exist
      final caseModel = _realm.find<CaseModel>(model.caseID);
      if (caseModel != null && !caseModel.medias.contains(model)) {
        logger.fine('media model added to caseModel in AddMedia');
        caseModel.medias.add(model);
      }
    });
  }

  RealmResults<MediaModel> search(Iterable<String> ids) {
    return _realm
        .query<MediaModel>(r'caseID IN $0 AND removed == $1', [ids, 0]);
  }
}
