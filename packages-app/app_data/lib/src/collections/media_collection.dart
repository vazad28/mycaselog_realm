part of '../collections.dart';

class MediaCollection extends SyncCollection<MediaModel> with LoggerMixin {
  MediaCollection(super.realmDatabase);

  // --- Firestore methods (inherited from SyncCollection) ---

  /// The path to the cases collection in the Firestore database.
  @override
  String get path => '$root/$userID/${DbCollection.media.name}';

  @override
  String getPrimaryKey(MediaModel object) => object.mediaID;

  @override
  MediaModel mapToModel(Map<String, dynamic> data) =>
      MediaModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(MediaModel object) => object.toJson();

  // --- Custom methods ---

  /// Retrieves media items associated with a specific case ID from Realm.
  RealmResults<MediaModel> getCaseMedia(String caseID) {
    return realm
        .query<MediaModel>(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  /// Retrieves a list of MediaModel objects based on their case IDs.
  RealmResults<MediaModel> getAllByMediaIDs(List<String> mediaIDs) {
    return realm.query<MediaModel>(r'mediaID IN $0', [mediaIDs]);
  }

  Future<void> refreshBacklinks(List<String>? ids) async {
    ignoreRealmChanges = true;
    return realm.writeAsync(() {
      // Query all MediaModel objects
      final mediaModels = ids == null
          ? realm.all<MediaModel>()
          : realm.query<MediaModel>(r'mediaID IN $0', [ids]);

      // Group media by caseID
      final groupedMedia = mediaModels.groupFoldBy<String, List<MediaModel>>(
        (e) => e.caseID,
        (prev, e) => (prev ?? [])..add(e),
      );

      // Iterate through each caseID
      for (final caseID in groupedMedia.keys) {
        final mediaList = groupedMedia[caseID]!;
        final caseModel = realm.find<CaseModel>(caseID);

        if (caseModel == null) continue;

        // Add missing media to the case model
        caseModel.medias.addAll(mediaList.where(
          (media) => !caseModel.medias.any((m) => m.mediaID == media.mediaID),
        ));
      }
    }).whenComplete(() => ignoreRealmChanges = false);
  }

  /// Adds a media item to Realm and updates the linked case object.
  Future<void> addMedia(MediaModel model) async {
    logger.fine('Adding media');
    await realm.writeAsync(() {
      realm.add<MediaModel>(model, update: true);

      /// Update case object if needed
      final caseModel = realm.find<CaseModel>(model.caseID);
      if (caseModel != null && !caseModel.medias.contains(model)) {
        logger.fine('Media model added to caseModel in AddMedia');
        caseModel.medias.add(model);
      }
    });
  }

  /// Searches for media items based on a list of IDs in Realm.
  RealmResults<MediaModel> search(Iterable<String> ids) {
    return realm.query<MediaModel>(r'caseID IN $0 AND removed == $1', [ids, 0]);
  }

  /// Updates the timestamp for a list of media items in Realm and Firestore.
  Future<void> changeTimelineMediaTimestamp(
    List<MediaModel> mediaList,
    int timestamp,
  ) async {
    return realm.writeAsync(() {
      final updatedMediaList = mediaList
        ..map((e) => e.timestamp = timestamp).toList();

      realm.addAll<MediaModel>(updatedMediaList, update: true);
    });
  }
}
