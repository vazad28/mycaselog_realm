part of '../collections.dart';

class TemplatesCollection extends FirestoreCollection<TemplateModel>
    implements BaseCollection<TemplateModel> {
  TemplatesCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        super(
          realmDatabase.user.id,
          realmDatabase.sharedPrefs,
        );

  final Realm _realm;

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.templates.name}';

  @override
  CollectionReference<TemplateModel> get withConverter =>
      firestore.collection(path).withConverter<TemplateModel>(
            fromFirestore: (snapshot, _) =>
                TemplateModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
  ///
  @override
  Future<void> add(TemplateModel object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  int count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  RealmResults<TemplateModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  TemplateModel? getSingle(String primaryKey) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<TemplateModel> upsert(TemplateModel Function() updateCallback) {
    return _realm.writeAsync<TemplateModel>(updateCallback);
  }

  @override
  Future<int> syncByTimestamp(int timestamp) {
    // TODO: implement syncByTimestamp
    throw UnimplementedError();
  }

  @override
  Stream<List<TemplateModel>> listenForChanges() {
    // TODO: implement listenForChanges
    throw UnimplementedError();
  }
}
