part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [TemplatesCollection] collection
class TemplatesCollection extends DatabaseCollection<TemplateModel> {
  TemplatesCollection(
    super.user,
    super.realm,
    super.sharedPrefs,
  ) {
    createCollectionStream();
  }

  @override
  String get path => '$root/$userID/${DbCollection.templates.name}';

  @override
  CollectionReference<TemplateModel> get withConverter =>
      firestore.collection(path).withConverter<TemplateModel>(
            fromFirestore: (snapshot, _) =>
                TemplateModelX.fromJson(snapshot.data()!),
            toFirestore: (caseModel, _) => caseModel.toJson(),
          );

  @override
  Stream<List<TemplateModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = TemplateModelX.fromJson(change.doc.data()!);

            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                realm
                    .write(() => realm.add<TemplateModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                realm.write(() => realm.delete<TemplateModel>(model));
                return null;
            }
          })
          .whereType<TemplateModel>()
          .toList();

      // set last update time
      setLastSyncTimestamp();
      return documents;
    });
  }

  RealmResults<SharedTemplateModel> getSharedTemplates(String speciality) {
    return realm
        .all<SharedTemplateModel>()
        .query(r'speciality  ==  $0', [speciality]);
  }
}
