part of '../collections.dart';

class TemplatesCollection extends BaseCollection<TemplateModel> {
  TemplatesCollection(super.realmDatabase) : _realm = realmDatabase.realm {
    print('creating instance of TemplatesCollection');
    listenForChanges().listen((_) {}).cancelOnDisposeOf(this);
  }

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
      String templateID, String speciality) async {
    final sharedTemplatePath =
        'sharedTemplates/$speciality/templates/$templateID';

    final converter = firestore
        .collection(sharedTemplatePath)
        .withConverter<SharedTemplateModel>(
            fromFirestore: (snapshot, _) =>
                SharedTemplateModelX.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson());

    return (await converter.doc(templateID).get()).data();
  }
}
