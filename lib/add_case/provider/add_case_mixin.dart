part of 'add_case_provider.dart';

/// ////////////////////////////////////////////////////////////////////
/// Evenst and MIXINS
/// ////////////////////////////////////////////////////////////////////
mixin AddCaseEventMixin {
  void submit(WidgetRef ref) => ref
      .watch(addCaseNotifierProvider.notifier)
      .on(const AddCaseEvent.onSubmit());

  void onTemplateChange(WidgetRef ref, TemplateModel templateModel) => ref
      .watch(addCaseNotifierProvider.notifier)
      .on(AddCaseEvent.onTemplateChange(templateModel));

  void updatePatientDataFormGroup(WidgetRef ref, PatientModel patientModel) =>
      ref
          .watch(addCaseNotifierProvider.notifier)
          .on(AddCaseEvent.onUpdatePatientDataFormGroup(patientModel));
}

mixin AddCaseStateMixin {
  // TemplateModel? watchCurrentSelectedTemplate(WidgetRef ref) =>
  //     ref.watch(currentCaseTemplateProvider);

  FormGroup watchTemplatedDataFormGroup(WidgetRef ref) =>
      ref.watch(templatedDataFormGroupProvider);

  List<SurgeryLocationModel> watchSurgeryLocations(WidgetRef ref) =>
      ref.watch(
        supportDataNotifierProvider.select((value) => value.surgeryLocations),
      ) ??
      <SurgeryLocationModel>[];

  List<String> watchAnesthesiaBlocks(WidgetRef ref) =>
      ref.watch(
        supportDataNotifierProvider.select((value) => value.anesthesiaBlocks),
      ) ??
      <String>[];

  /// assistants
  List<AssistantModel> watchAssistantModels(WidgetRef ref) =>
      ref.watch(
        supportDataNotifierProvider.select((value) => value.assistants),
      ) ??
      <AssistantModel>[];

  /// active fields list
  List<ActivableAddCaseField> watchActiveFields(WidgetRef ref) {
    final activeFields = ref
        .watch(
          supportDataNotifierProvider
              .select((value) => value.activeBasicFields),
        )
        .map((name) => ActivableAddCaseField.values.byName(name))
        .toList();
    if (activeFields.isEmpty) return ActivableAddCaseField.values;
    return activeFields;
  }

  /// Encrypt patient Model
  String encryptDecryptedPatientModel(
    WidgetRef ref,
    DecryptedPatientModel decryptedPatientModel,
  ) =>
      ref
          .watch(encryptPatientModelProvider(decryptedPatientModel))
          .when(success: (success) => success, failure: (f) => throw f);

  DecryptedPatientModel decryptPatientModel(WidgetRef ref, String crypt) => ref
      .watch(decryptPatientModelProvider(crypt))
      .when(success: (success) => success, failure: (f) => throw f);

  /// Form states
  bool isFormSeeded(WidgetRef ref) => ref.watch(addCaseSeederProvider) != null;

  StateOf<CaseModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider);

  bool canPop(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}
