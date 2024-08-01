part of 'providers.dart';

@riverpod
class AddCaseSeeder extends _$AddCaseSeeder {
  @override
  AsyncValue<CaseModel> build() {
    return const AsyncValue.loading();
  }

  void seed(String caseID) {
    if (caseID == 'new') {
      state = AsyncValue.data(CaseModelX.zero());
      return;
    }
    final caseModel = ref.watch(dbProvider).casesCollection.getSingle(caseID);

    if (caseModel == null) {
      state = AsyncValue.error('No case', StackTrace.current);
    } else {
      state = AsyncValue.data(caseModel);
    }
  }
}

@riverpod
class CurrentCaseTemplate extends _$CurrentCaseTemplate {
  @override
  TemplateModel? build() {
    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    if (caseModel.templateID == null) return null;

    return ref
        .watch(dbProvider)
        .templatesCollection
        .getSingle(caseModel.templateID!);
  }

  void onTemplateChange(TemplateModel templateModel) {
    state = templateModel;
  }
}
