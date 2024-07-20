part of '../collections.dart';

class TemplatesCollection extends BaseCollection<TemplateModel> {
  TemplatesCollection(super.realmDatabase) : _realm = realmDatabase.realm;

  final Realm _realm;

  @override
  String get path => '$root/$userID/${DbCollection.templates.name}';

  @override
  CollectionReference<TemplateModel> get withConverter =>
      firestore.collection(path).withConverter<TemplateModel>(
            fromFirestore: (snapshot, _) =>
                TemplateModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          );

  @override
  Stream<List<TemplateModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = TemplateModelX.fromJson(change.doc.data()!);

            _realm.write(() => _realm.add<TemplateModel>(model, update: true));
            return model;
          })
          .whereType<TemplateModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
  RealmResults<SharedTemplateModel> getSharedTemplates(String speciality) {
    return _realm
        .all<SharedTemplateModel>()
        .query(r'speciality  ==  $0', [speciality]);
  }
}
