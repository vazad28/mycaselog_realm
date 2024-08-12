part of '../forms.dart';

@riverpod
class PatientDataFormGroup extends _$PatientDataFormGroup {
  @override
  FormGroup build() {
    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    return _createFormGroup(
      caseModel.patientModel ?? PatientModelX.zero(),
    );
  }

  FormGroup _createFormGroup(PatientModel patientModel) {
    final controls = <String, AbstractControl<Object?>>{
      // Patient  model id (required for realm to create model from json)
      PatientDataModelProps.patientID.name:
          FormControl<String>(value: patientModel.patientID),
      // ----- Crypt -----
      PatientDataModelProps.crypt.name:
          FormControl<String>(value: patientModel.crypt),
      // ---- Name ---
      PatientDataModelProps.name.name: FormControl<String>(
        value: patientModel.name,
      ),
      // ----- Name initials -----
      PatientDataModelProps.initials.name: FormControl<String>(
        value: patientModel.initials,
        validators: [Validators.required],
      ),
      // ----- YOB -----
      PatientDataModelProps.yob.name: FormControl<String>(
        value: patientModel.yob,
        validators: [Validators.required, const BirthYearValidator()],
      ),
      // ----- Bmi -----
      PatientDataModelProps.bmi.name:
          FormControl<double>(value: patientModel.bmi),
      // ----- Gender -----
      PatientDataModelProps.gender.name: FormControl<String>(
        value: patientModel.gender,
        validators: [Validators.required],
      ),
    };
    return FormGroup(controls);
  }

  void updatePatientDataForm(PatientModel? patientModel) {
    /// this patient model does not have crypt created from new data from OCR
    /// we need to create crypt data for storage and patient data form to
    /// reflect all the data
    if (patientModel == null) throw const NullValueFailure();

    /// create crypt data using Encryption Provider from patientModel
    /// returned from the Modal form
    final encryptedEither = ref.read(
      encryptPatientModelProvider(
        DecryptedPatientModel(
          //patientID: patientModel.patientID!,
          name: patientModel.name,
          mrn: patientModel.mrn,
          phone: patientModel.phone,
        ),
      ),
    );

    if (encryptedEither.isError()) {
      ref
          .read(dialogServiceProvider)
          .showSnackBar('Failed to create encrypted data');
    }

    final crypt = encryptedEither.getOrNull();

    final cryptedPatientModel = patientModel..crypt = crypt;

    state = _createFormGroup(cryptedPatientModel);
  }
}

/// Validator that validates the control's value must be `true`.
class BirthYearValidator extends Validator<String> {
  const BirthYearValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    if (control.value == null) return {'required': true};

    final yobNumber = int.tryParse(control.value!);

    if (yobNumber == null) return {'parse error': true};

    final maxYob = int.parse(DateFormat('y').format(DateTime.now()));

    if (yobNumber < (maxYob - 100) || yobNumber > maxYob) {
      return {'${maxYob - 100} < year < $maxYob': true};
    }

    return null;
  }
}
