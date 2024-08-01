part of 'providers.dart';

mixin AddCaseMixin {
  /// watch the status of the add case form submit
  StateOf<CaseModel> formSubmitStatus(WidgetRef ref) {
    return ref.watch(addCaseFormSubmitProvider);
  }

  /// update the form group from OCR data
  void updatePatientDataForm(
    WidgetRef ref,
    PatientModel patientModel,
  ) {
    ref
        .watch(patientDataFormGroupProvider.notifier)
        .updatePatientDataForm(patientModel);
  }

  /// Page route observer for FormPages
  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;

  /// ----- can pop -----
  bool canPop(WidgetRef ref) {
    return ref.watch(addCaseFormSubmitProvider.notifier).canPop();
  }
}
