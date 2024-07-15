part of 'case_details_provider.dart';

mixin CaseDetailsMixin {
  AsyncValue<CaseModel> watchCaseDetailsModel(WidgetRef ref) =>
      ref.watch(caseDetailsNotifierProvider);

  AsyncValue<TemplateModel?> watchCaseDetailsTemplateModel(WidgetRef ref) =>
      ref.watch(caseDetailsTemplateModelProvider);

  // CaseModel getDuplicateCase(WidgetRef ref) =>
  //     ref.watch(caseDetailsNotifierProvider.notifier).duplicateCase();

  List<ActivableAddCaseField> watchActivableFields(WidgetRef ref) => ref
      .watch(
        supportDataNotifierProvider.select((value) => value.activeBasicFields),
      )
      .map((name) => ActivableAddCaseField.values.byName(name))
      .toList();
}
