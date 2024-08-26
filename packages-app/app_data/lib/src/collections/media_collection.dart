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
  // Retrieves all items from Realm, optionally sorted by a specific field
  RealmResults<MediaModel> getAllMedia() {
    // Query Realm with sorting
    return realm.query<MediaModel>('removed == 0 SORT(timestamp DESC)');
  }

  /// Retrieves media items associated with a specific case ID from Realm.
  RealmResults<MediaModel> getCaseMedia(String caseID) {
    return realm
        .query<MediaModel>(r'caseID == $0 AND removed == $1', [caseID, 0]);
  }

  /// Retrieves a list of MediaModel objects based on their case IDs.
  RealmResults<MediaModel> getAllByMediaIDs(List<String> mediaIDs) {
    return realm.query<MediaModel>(r'mediaID IN $0', [mediaIDs]);
  }

  void refreshBacklinks() => refreshMediaBacklinks(realm, null);

  /// Adds a media item to Realm and updates the linked case object.
  @override
  Future<void> add(MediaModel mediaModel) async {
    logger.fine('Adding media');
    await realm.writeAsync(() {
      realm.add<MediaModel>(mediaModel, update: true);

      /// Update case object if needed
      final caseModel = realm.find<CaseModel>(mediaModel.caseID);
      if (caseModel != null && !caseModel.medias.contains(mediaModel)) {
        logger.fine('Media model added to caseModel in AddMedia');
        caseModel.medias.add(mediaModel);
      }

      addToFirestore(mediaModel);
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
