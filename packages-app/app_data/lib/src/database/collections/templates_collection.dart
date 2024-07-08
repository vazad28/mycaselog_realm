part of '../database_service.dart';

/// Implementation of [DatabaseCollection] with [TemplatesCollection] collection
class TemplatesCollection extends DatabaseCollection<TemplateModel> {
  TemplatesCollection(
    super.user,
    Realm realm,
    super.sharedPrefs,
  ) : _realm = realm {
    createCollectionStream();
  }

  final Realm _realm;

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
  Future<TemplateModel> upsert(TemplateModel model) async {
    final templateModel = model..timestamp = ModelUtils.getTimestamp;
    await put(model.templateID, templateModel);
    return templateModel;
  }

  @override
  Stream<List<TemplateModel>> listenForChanges() {
    return stream.map((querySnapshot) {
      final documents = querySnapshot.docChanges
          .map((change) {
            final model = TemplateModelX.fromJson(change.doc.data()!);

            switch (change.type) {
              case DocumentChangeType.added:
              case DocumentChangeType.modified:
                _realm.write(
                    () => _realm.add<TemplateModel>(model, update: true));
                return model;

              case DocumentChangeType.removed:
                _realm.write(() => _realm.delete<TemplateModel>(model));
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

  TemplateModel? getTemplate(String templateID) {
    return _realm.find<TemplateModel>(templateID);
  }

  List<TemplateModel> getAllTemplates() {
    return _realm.all<TemplateModel>().toList();
  }

  Stream<RealmResultsChanges<TemplateModel>> templateCount() {
    return _realm.all<TemplateModel>().changes;
  }
}
