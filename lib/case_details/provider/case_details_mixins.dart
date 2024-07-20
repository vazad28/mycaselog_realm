part of 'case_details_provider.dart';

mixin CaseDetailsMixin {
  AsyncValue<CaseModel> watchCaseDetailsModel(WidgetRef ref) =>
      ref.watch(caseDetailsNotifierProvider);

  AsyncValue<TemplateModel?> watchCaseDetailsTemplateModel(WidgetRef ref) =>
      ref.watch(caseDetailsTemplateModelProvider);
}
