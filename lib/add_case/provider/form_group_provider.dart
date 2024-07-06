part of 'add_case_provider.dart';

@riverpod
class PatientDataFormGroup extends _$PatientDataFormGroup {
  @override
  FormGroup build() {
    final caseModel = ref.watch(addCaseSeederProvider)?.caseModel;

    if (caseModel == null) return FormGroup({});
    return _createFormGroup(
      caseModel.patientModel ?? PatientModelX.zero(),
    );
  }

  void updatePatientDataFormGroupFromOcr(PatientModel? patientModel) {
    //print(patientModel?.toJson());

    /// this patient model does not have crypt created from new data from OCR
    /// we need to create crypt data for storage and patient data form to
    /// reflect all the data
    if (patientModel == null) throw const NullValueFailure();

    /// create crypt data using Encryption Provider
    final encryptedEither = ref.read(
      encryptPatientModelProvider(
        DecryptedPatientModel(
          name: patientModel.name,
          mrn: patientModel.mrn,
          address: patientModel.address,
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

  FormGroup _createFormGroup(PatientModel patientModel) {
    final controls = <String, AbstractControl<Object?>>{
      // Patient  model id (required for realm to create model from json)
      // PatientDataModelProps.patientID.name:
      //     FormControl<String>(value: patientModel.patientID),
      // ----- Crypt -----
      PatientDataModelProps.crypt.name:
          FormControl<String>(value: patientModel.crypt),
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
}

@riverpod
FormGroup basicDataFormGroup(BasicDataFormGroupRef ref) {
  final caseModel = ref.watch(addCaseSeederProvider)?.caseModel;

  if (caseModel == null) return FormGroup({});

  final controls = <String, AbstractControl<Object?>>{
    BasicDataModelProps.surgeryDate.name: FormControl<int>(
      value: caseModel.surgeryDate,
      validators: [Validators.required],
    ),
    BasicDataModelProps.diagnosis.name: FormControl<String>(
      value: caseModel.diagnosis,
      validators: [Validators.required],
    ),
    BasicDataModelProps.surgery.name: FormControl<String>(
      value: caseModel.surgery,
      validators: [Validators.required],
    ),
    BasicDataModelProps.anesthesia.name: FormControl<String>(
      value: caseModel.anesthesia,
      validators: [Validators.required],
    ),
    BasicDataModelProps.anesthesiaBlock.name: FormControl<String>(
      value: caseModel.anesthesiaBlock,
      validators: [],
    ),
    BasicDataModelProps.asa.name: FormControl<int>(
      value: caseModel.asa,
      validators: [Validators.required],
    ),
    BasicDataModelProps.side.name: FormControl<String>(
      value: caseModel.side,
      validators: [Validators.required],
    ),
    BasicDataModelProps.ebl.name: FormControl<int>(
      value: caseModel.ebl,
      validators: [],
    ),
    BasicDataModelProps.assistant.name: FormControl<List<String>>(
      value: caseModel.assistant,
      validators: [],
    ),
    BasicDataModelProps.location.name: FormControl<String>(
      value: caseModel.location,
      validators: [Validators.required],
    ),
    BasicDataModelProps.comments.name: FormControl<String>(
      value: caseModel.comments,
      validators: [],
    ),
    BasicDataModelProps.icd.name: FormControl<String>(
      value: caseModel.icd,
      validators: [],
    ),
    BasicDataModelProps.cpt.name: FormControl<String>(
      value: caseModel.cpt,
      validators: [],
    ),
  };

  return FormGroup(controls);
}

class TemplatedDataForm {
  TemplatedDataForm({
    required this.formData,
    required this.templateModel,
  });

  final Map<String, String?> formData;
  final TemplateModel? templateModel;
}

@riverpod
FormGroup templatedDataFormGroup(TemplatedDataFormGroupRef ref) {
  final templatedDataFormValue = ref.watch(templatedDataFormValueProvider);

  /// empty map for controls
  final controls = <String, AbstractControl<Object?>>{};

  /// current template model
  final templateModel = templatedDataFormValue.templateModel;

  if (templateModel?.fields.isEmpty ?? true) {
    return FormGroup(controls);
  }

  final currentFormData = templatedDataFormValue.formData;

  /// iterate over the template fields and use the fields data to populate
  for (final templateField in templateModel!.fields) {
    final slug = templateField.slug;

    controls.putIfAbsent(slug, () {
      if (templateField.fieldType == FieldType.text) {
        return FormControl<String>(
          value: currentFormData[slug] ?? templateField.defaultValue,
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      } else if (templateField.fieldType == FieldType.number) {
        return FormControl<String>(
          value:
              currentFormData[slug]?.toString() ?? templateField.defaultValue,
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      } else if (templateField.fieldType == FieldType.bool) {
        return FormControl<String>(
          value: (currentFormData[slug] ?? templateField.defaultValue)
              ?.toString()
              .toLowerCase(),
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      } else if (templateField.fieldType == FieldType.radio) {
        return FormControl<String>(
          value: currentFormData[slug] ?? templateField.defaultValue,
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      } else if (templateField.fieldType == FieldType.select) {
        return FormControl<String>(
          value: currentFormData[slug] ?? templateField.defaultValue,
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      } else {
        return FormControl<String>(
          value: currentFormData[slug] ?? templateField.defaultValue,
          validators: templateField.isRequired ? [Validators.required] : [],
        );
      }
    });
  }

  return FormGroup(controls);
}

@riverpod
class TemplatedDataFormValue extends _$TemplatedDataFormValue with LoggerMixin {
  @override
  TemplatedDataForm build() {
    final addCaseSeed = ref.watch(addCaseSeederProvider);

    if (addCaseSeed != null) return _seedProvider(addCaseSeed);

    return TemplatedDataForm(formData: {}, templateModel: null);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local metnods
  /// ////////////////////////////////////////////////////////////////////

  TemplatedDataForm _seedProvider(AddCaseSeedModel addCaseSeedModel) {
    logger.info('_seedProvider called');

    // /// set the current template for the view
    final formData = addCaseSeedModel.caseModel.fieldsData.isEmpty
        ? <String, String?>{}
        : {
            for (final field in addCaseSeedModel.caseModel.fieldsData)
              field.slug: field.value,
          };

    return TemplatedDataForm(
      formData: formData,
      templateModel: addCaseSeedModel.templateModel,
    );
  }

  void updateFormData(
    TemplateModel templateModel,
    Map<String, Object?> currentTemplateDataFormValue,
  ) {
    logger.info('updateFormData called');
    ref
        .watch(currentCaseTemplateProvider.notifier)
        .setCaseTemplateModel(templateModel);

    state = TemplatedDataForm(
      formData: state.formData
        ..addAll(currentTemplateDataFormValue.cast<String, String?>()),
      templateModel: templateModel,
    );
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
