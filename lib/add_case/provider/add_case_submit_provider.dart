part of 'providers.dart';

/// form validate failure basic data tab
class BasicTabFormValidationError implements Exception {}

/// form validate failure template data tab
class TemplateTabFormValidationError implements Exception {}

@riverpod
class AddCaseFormSubmit extends _$AddCaseFormSubmit with LoggerMixin {
  bool _formSubmitAttempted = false;

  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  /// Form Group instance
  FormGroup get _patientDataForm => ref.read(patientDataFormGroupProvider);
  FormGroup get _basicDataForm => ref.read(basicDataFormGroupProvider);
  FormGroup get _templatedDataForm => ref.read(templatedDataFormGroupProvider);

  Map<String, dynamic> get _originalModelJson =>
      ref.watch(addCaseSeederProvider).requireValue.toJson();

  void submit() {
    try {
      _formSubmitAttempted = true;

      //  just return for ui to show form not valid
      if (!_validateForms()) return;

      /// everything checks out so create caseModel from form data
      final modelToSubmit = _createModelFromForm();

      if (modelToSubmit == null) {
        state = const StateOf<CaseModel>.failure(AppFailure.missingData());
        return;
      }

      _doSubmit(modelToSubmit);
    } catch (err) {
      state = StateOf<CaseModel>.failure(err.toAppFailure());
    }
  }

  /// Validate the form data
  bool _validateForms() {
    if (_patientDataForm.invalid || _basicDataForm.invalid) {
      _patientDataForm.markAllAsTouched();
      _basicDataForm.markAllAsTouched();
      state = StateOf<CaseModel>.failure(BasicTabFormValidationError());
      return false;
    }

    if (_templatedDataForm.invalid) {
      _templatedDataForm.markAllAsTouched();
      state = StateOf<CaseModel>.failure(TemplateTabFormValidationError());
      return false;
    }

    return true;
  }

  /// user data from providers containing form groups and create the model
  CaseModel? _createModelFromForm() {
    /// update with basic data
    final caseModelJson = {..._originalModelJson, ..._basicDataForm.value};

    final currTemplateModel = ref.read(currentCaseTemplateProvider);

    //print(_patientDataForm.value);

    final createdModel = CaseModelX.fromJson(caseModelJson)
      ..patientModel = PatientModelX.fromJson(_patientDataForm.value)
      ..templateID = currTemplateModel?.templateID;

    createdModel.fieldsData.clear();
    createdModel.fieldsData.addAll(_createFieldsData(currTemplateModel) ?? []);

    return createdModel;
  }

  /// get the fields of the current template and to each fields update its values
  /// with  the current forms data
  List<TemplateFieldModel>? _createFieldsData(
    TemplateModel? currTemplateModel,
  ) {
    return currTemplateModel?.fields.map((templateField) {
      return templateField.toUnmanaged()
        ..value = _templatedDataForm.value[templateField.slug] as String?;
    }).toList();
  }

  Future<void> _doSubmit(CaseModel modelToSubmit) async {
    try {
      await ref.watch(dbProvider).casesCollection.addCase(modelToSubmit);

      /// set last used location as default location to use next time
      if (modelToSubmit.location != null) {
        ref
            .read(localStorageProvider)
            .setDefaultSurgeryLocation(modelToSubmit.location!);
      }

      state = StateOf<CaseModel>.success(modelToSubmit);
    } catch (err) {
      logger.severe(err);
      state = StateOf<CaseModel>.failure(AppFailure.generic(err));
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Can Pop method
  /// ////////////////////////////////////////////////////////////////////
  bool canPop() {
    //print('canPop called');
    if (_formSubmitAttempted) return true;

    /// Create model instance with form data
    final formToModel = _createModelFromForm();
    if (formToModel == null) return true;

    final formModelEquatable =
        CaseModelEquatable.fromJson(formToModel.toJson());

    final originalModelEquatable =
        CaseModelEquatable.fromJson(_originalModelJson);

    // for (final kv in _originalModelJson.entries) {
    //   print('${kv.key} = ${kv.value}');
    // }

    // print('____________________________________________________');
    // for (final kv in formToModel.toJson().entries) {
    //   print('${kv.key} = ${kv.value}');
    // }

    // checking everything sans fields data
    // then check for fields data separate because the template data may not be
    // in the model if the tab wa not active in  edit - we check if this is a new or
    // edit situation by comparing createdAt == timestamp (means new case)
    return formModelEquatable == originalModelEquatable;
  }
}
