part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [MediaCollection] collection
class MediaCollection extends DatabaseCollection<MediaModel> {
  MediaCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

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
  Stream<List<MediaModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = MediaModelX.fromJson(change.doc.data()!);
            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm.write(() => realm.add<MediaModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<MediaModel>(model));
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
}
