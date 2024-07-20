part of '../collections.dart';

class MediaCollection extends BaseCollection<MediaModel> {
  MediaCollection(super.realmDatabase) : _realm = realmDatabase.realm;

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
          .map((change) {
            final model = MediaModelX.fromJson(change.doc.data()!);
            _realm.write(() => _realm.add<MediaModel>(model, update: true));
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
}
