part of '../collections.dart';

class MediaCollection extends FirestoreCollection<MediaModel>
    implements BaseCollection<MediaModel> {
  MediaCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

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

  /// ////////////////////////////////////////////////////////////////////
  ///
  /// ////////////////////////////////////////////////////////////////////

  @override
  Future<void> add(MediaModel object) {
    return _realm.writeAsync(() => _realm.add<MediaModel>(object));
  }

  @override
  Future<MediaModel> upsert(MediaModel Function() updateCallback) {
    return _realm.writeAsync<MediaModel>(updateCallback);
  }

  @override
  RealmResults<MediaModel> getAll() {
    return _realm.query<MediaModel>('TRUEPREDICATE SORT(timestamp DESCENDING)');
  }

  @override
  MediaModel? getSingle(String primaryKey) {
    return _realm.find<MediaModel>(primaryKey);
  }

  @override
  int count() => _realm.all<MediaModel>().query(r'removed == $0', [0]).length;

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<MediaModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
