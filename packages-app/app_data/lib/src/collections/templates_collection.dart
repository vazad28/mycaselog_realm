part of '../collections.dart';

class TemplatesCollection extends SyncCollection<TemplateModel> {
  TemplatesCollection(super.realmDatabase);

  @override
  String get path => '$root/$userID/${DbCollection.templates.name}';

  @override
  String getPrimaryKey(TemplateModel object) => object.templateID;

  /// ////////////////////////////////////////////////////////////////////
  /// Realm Methods
  /// ////////////////////////////////////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////
  /// Custom methods
  /// ////////////////////////////////////////////////////////////////////
  Future<List<SharedTemplateModel>> getSharedTemplates(String category) async {
    final collectionPath = 'sharedTemplates/$category/templates';
    //print(collectionPath);

    final collectionRef =
        firestore.collection(collectionPath).withConverter<SharedTemplateModel>(
              fromFirestore: (snapshot, _) =>
                  SharedTemplateModelX.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson(),
            );

    final docsSnapshot = await collectionRef.get();

    return {
      for (final QueryDocumentSnapshot<SharedTemplateModel> doc
          in docsSnapshot.docs)
        doc.data(),
    }.toList();
  }

  Future<void> putSharedTemplate(SharedTemplateModel sharedTemplateModel) {
    final category = sharedTemplateModel.speciality;
    final templateID = sharedTemplateModel.templateID;

    final sharedTemplatePath =
        'sharedTemplates/$category/templates/$templateID';

    if (sharedTemplateModel.shared) {
      return firestore
          .doc(sharedTemplatePath)
          .set(sharedTemplateModel.toJson());
    } else {
      return firestore.doc(sharedTemplatePath).delete();
    }
  }

  /// Update shared user templates
  Future<void> updateSharedTemplateCount(
    SharedTemplateModel sharedTemplateModel,
    int count,
  ) {
    final category = sharedTemplateModel.speciality;
    final templateID = sharedTemplateModel.templateID;
    final sharedTemplatePath =
        'sharedTemplates/$category/templates/$templateID';

    return firestore.doc(sharedTemplatePath).update({'usedCount': count});
  }

  Future<SharedTemplateModel?> getSharedTemplate(
    String templateID,
    String speciality,
  ) async {
    final sharedTemplatePath =
        'sharedTemplates/$speciality/templates/$templateID';

    final converter = firestore
        .collection(sharedTemplatePath)
        .withConverter<SharedTemplateModel>(
          fromFirestore: (snapshot, _) =>
              SharedTemplateModelX.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );

    return (await converter.doc(templateID).get()).data();
  }

  @override
  TemplateModel mapToModel(Map<String, dynamic> data) =>
      TemplateModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(TemplateModel object) => object.toJson();

  @override
  Future<void> add(TemplateModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<TemplateModel>(model, update: true);

      /// add to firestore
      addToFirestore(model);
    });
  }
}
