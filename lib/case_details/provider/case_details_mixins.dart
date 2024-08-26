part of 'case_details_provider.dart';

mixin CaseDetailsMixin {
  AsyncValue<CaseModel> watchCaseDetailsModel(WidgetRef ref) =>
      ref.watch(caseDetailsNotifierProvider);

  AsyncValue<TemplateModel?> watchCaseDetailsTemplateModel(WidgetRef ref) =>
      ref.watch(caseDetailsTemplateModelProvider);

  /// delete case media
  Future<void> deleteCase(
    WidgetRef ref,
    CaseModel caseModel,
  ) async {
    try {
      /// delete media from storage
      for (final mediaModel in caseModel.medias) {
        await ref.watch(dbProvider).storageCollection.deleteMedia(mediaModel);
      }
    } on FirebaseException catch (error) {
      debugPrint(error.toString());
    } finally {
      /// delete from firestore because we need to make sure the error deleting
      /// files does not compromise this part and also we can  not reference a file
      /// if the ref object is removed from tree if we delete caseModel itself first
      await ref.watch(dbProvider).casesCollection.upsert(
            () => caseModel
              ..removed = 1
              ..timestamp = ModelUtils.getTimestamp,
          );
    }
  }

  /// delete case media
  Future<String> duplicateCase(
    WidgetRef ref,
    CaseModel caseModel,
  ) async {
    try {
      final caseModelJson = caseModel.toJson();
      final newCaseID = ModelUtils.uniqueID;
      final newTimestamp = ModelUtils.getTimestamp;

      caseModelJson['caseID'] = newCaseID;
      caseModelJson['createdAt'] = newTimestamp;
      caseModelJson['timestamp'] = newTimestamp;

      await ref
          .watch(dbProvider)
          .casesCollection
          .add(CaseModelX.fromJson(caseModelJson));

      return newCaseID;
    } catch (err) {
      throw Exception('Failure to duplicate case');
    }
  }
}
