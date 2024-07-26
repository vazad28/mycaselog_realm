part of '../collections.dart';

class MediaCollection extends BaseCollection<MediaModel> {
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
  Stream<List<MediaModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) async {
            final model = MediaModelX.fromJson(change.doc.data()!);
            await _realm.writeAsync(() {
              _realm.add<MediaModel>(model, update: true);

              /// add media to cases collection if not exist
              final caseModel = _realm.find<CaseModel>(model.caseID);
              if (caseModel != null && !caseModel.medias.contains(model)) {
                caseModel.medias.add(model);
              }
            });
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

  RealmResults<MediaModel> getCaseMedia(String caseID) {
    final results = _realm
        .query<MediaModel>(r'caseID == $0 AND removed == $1', [caseID, 0]);
    return results;
  }

  /// Refresh media backlinks to cases collection  as needed
  Future<void> refreshMediaBacklinks() async {
    // Open a write transaction
    await _realm.writeAsync(() {
      // Query all Media objects
      final mediaResults = _realm.all<MediaModel>();

      // Group media by caseID
      final groupedMedia = mediaResults.groupFoldBy<String, List<MediaModel>>(
        (e) => e.caseID,
        (prev, e) => (prev ?? [])..add(e),
      );

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
}
