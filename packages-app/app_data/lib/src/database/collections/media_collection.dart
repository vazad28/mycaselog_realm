part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [MediaCollection] collection
class MediaCollection extends DatabaseCollection<MediaModel> {
  MediaCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

  @override
  String get path => '$root/$userID/${DbCollection.media.name}';

  @override
  CollectionReference<MediaModel> get withConverter =>
      firestore.collection(path).withConverter<MediaModel>(
            fromFirestore: (snapshot, _) =>
                MediaModelX.fromJson(snapshot.data()!),
            toFirestore: (mediaModel, _) => mediaModel.toJson(),
          );

  @override
  Future<MediaModel> upsert(MediaModel model) async {
    final mediaModel = model..timestamp = ModelUtils.getTimestamp;
    await put(model.mediaID, mediaModel);
    return mediaModel;
  }

  @override
  Stream<List<MediaModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = MediaModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(() => _realm.add<MediaModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<MediaModel>(model));
                return null;
            }
          })
          .whereType<MediaModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  List<MediaModel> getCaseMedia(String caseID) {
    return _realm.all<MediaModel>().where((e) => e.caseID == caseID).toList();
  }

  List<MediaModel> getAll({String? location}) {
    return _realm.all<MediaModel>().where((e) => e.removed == 0).toList();
  }

  List<MediaModel> getMediaByStatus(MediaStatus status) {
    return _realm.query<MediaModel>("mediaStatus == '$status'").toList();
  }

  int getCaseMediaCount(String caseID) {
    return _realm
        .all<MediaModel>()
        .where((e) => e.caseID == caseID && e.removed == 0)
        .length;
  }

  int countAll() {
    return _realm.all<MediaModel>().where((e) => e.removed == 0).length;
  }

  List<MediaModel> getMediaModelsForCaseIds(List<String> caseIDs) {
    return _realm.query<MediaModel>('caseID IN \$0', [caseIDs]).toList();
  }
}