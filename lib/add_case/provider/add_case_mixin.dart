part of 'add_case_provider.dart';

/// Add case MIXINS
mixin AddCaseMixin {
  /// submit add case form
  void onSubmit(WidgetRef ref) =>
      ref.watch(addCaseNotifierProvider.notifier).submit();

  ///  on change of the case template on the screen
  void onCaseTemplateChange(WidgetRef ref, TemplateModel templateModel) => ref
      .watch(addCaseNotifierProvider.notifier)
      .onCaseTemplateChange(templateModel);

  // on change  of the patient data form
  void onPatientDataFormChange(WidgetRef ref, PatientModel patientModel) => ref
      .watch(patientDataFormGroupProvider.notifier)
      .updatePatientDataFormGroupFromOcr(patientModel);

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
