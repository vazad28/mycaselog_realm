import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';
import '../../core/services/services.dart';
import '../../router/router.dart';
import '../../support_data/support_data.dart';

part '../../generated/add_case/provider/add_case_provider.freezed.dart';
part '../../generated/add_case/provider/add_case_provider.g.dart';
part 'add_case_mixin.dart';
part 'form_group_provider.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddCaseEvent with _$AddCaseEvent {
  const factory AddCaseEvent.onSubmit() = _OnSubmitForm;
  const factory AddCaseEvent.onTemplateChange(TemplateModel templateModel) =
      _OnTemplateChange;
  const factory AddCaseEvent.onUpdatePatientDataFormGroup(
    PatientModel patientModel,
  ) = _OnUpdatePatientDataFormGroup;
}

/// ////////////////////////////////////////////////////////////////////
///  Anootations
/// ////////////////////////////////////////////////////////////////////

/// form validate failure basic data tab
class BasicTabFormValidationError implements Exception {}

/// form validate failure template data tab
class TemplateTabFormValidationError implements Exception {}

/// Addcase seed model
class AddCaseSeedModel {
  AddCaseSeedModel({
    required this.caseModel,
    required this.templateModel,
  });

  final CaseModel caseModel;
  final TemplateModel? templateModel;
}

/// ////////////////////////////////////////////////////////////////////
/// Seeder provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddCaseSeeder extends _$AddCaseSeeder {
  @override
  AddCaseSeedModel? build() => null;

  late final Map<String, dynamic> originalModelJson;

  /// called by view with passed param caseID to load case model
  Future<void> seed(CaseModel caseModel, {bool newRecord = false}) async {
    final templateModel = caseModel.templateID == null
        ? null
        : ref
            .watch(collectionsProvider)
            .templatesCollection
            .getSingle(caseModel.templateID!);

    originalModelJson = caseModel.toJson();

    /// add default surgery location here in the object so that our method
    /// to check for any change in form works
    final defaultSurgeryLocation =
        ref.read(localStorageProvider).getDefaultSurgeryLocation;

    if (newRecord) {
      caseModel.location =
          defaultSurgeryLocation.isEmpty ? null : defaultSurgeryLocation;
    }

    /// let the loading spinner show and allow screen animation finish
    await Future<void>.delayed(const Duration(milliseconds: 200));

    state = AddCaseSeedModel(
      caseModel: caseModel,
      templateModel: templateModel,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddCaseNotifier extends _$AddCaseNotifier with LoggerMixin {
  /// if form was attempted to be saved before or no
  bool _formSubmitAttempted = false;
  bool get formSubmitAttempted => _formSubmitAttempted;

  /// get the original caseModel
  CaseModel? get originalModel => ref.read(addCaseSeederProvider)?.caseModel;

  //final TemplateModel _originalModel;
  Map<String, dynamic> get _originalModelJson =>
      ref.read(addCaseSeederProvider.notifier).originalModelJson;

  /// Form Group instance
  FormGroup get _patientDataForm => ref.read(patientDataFormGroupProvider);
  FormGroup get _basicDataForm => ref.read(basicDataFormGroupProvider);
  FormGroup get _templatedDataForm => ref.read(templatedDataFormGroupProvider);

  /// Provider build method
  @override
  StateOf<CaseModel> build() => const StateOf<CaseModel>.init();

  /// Event  mapper
  void on(AddCaseEvent e) {
    e.map(
      onSubmit: (_) {
        _formSubmitAttempted = true;
        _onSubmit();
      },
      onTemplateChange: (value) => _onCaseTemplateChange(value.templateModel),
      onUpdatePatientDataFormGroup: (value) => ref
          .watch(patientDataFormGroupProvider.notifier)
          .updatePatientDataFormGroupFromOcr(value.patientModel),
    );
  }

  /// On chnage in the template in view update form
  void _onCaseTemplateChange(TemplateModel templateModel) {
    /// Get current form data from the FormGroup
    final currentTemplateDataFormValue =
        ref.read(templatedDataFormGroupProvider).value;

    /// call update from data in other provider which will appends this data
    /// and call the formGroup reflected in the view
    ref
        .watch(templatedDataFormValueProvider.notifier)
        .updateFormData(templateModel, currentTemplateDataFormValue);
  }

  /// Method to submit the form
  void _onSubmit() {
    try {
      _formSubmitAttempted = true;
      state = const StateOf<CaseModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = _createModelToSave();

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

  ///get the fields of the current template and to each fields update its values
  ///with  the current forms data
  List<TemplateFieldModel>? _createFieldsData(
    TemplateModel? currTemplateModel,
  ) {
    return currTemplateModel?.fields.map((templateField) {
      templateField.value =
          _templatedDataForm.value[templateField.slug] as String?;
      return templateField;
    }).toList();
  }

  /// Update our model from formdata
  CaseModel? _createModelToSave() {
    /// update with basic data
    final caseModelJson = {..._originalModelJson, ..._basicDataForm.value};

    final currTemplateModel = ref.read(currentCaseTemplateProvider);

    final createdModel = CaseModelX.fromJson(caseModelJson)
      ..patientModel = PatientModelX.fromJson(_patientDataForm.value)
      ..templateID = currTemplateModel?.templateID;

    createdModel.fieldsData.clear();
    createdModel.fieldsData.addAll(_createFieldsData(currTemplateModel) ?? []);

    return createdModel;
  }

  /// ---- DO the form submit  ---
  Future<void> _doSubmit(CaseModel modelToSubmit) async {
    try {
      await ref.read(collectionsProvider).casesCollection.add(
            modelToSubmit.caseID,
            modelToSubmit..timestamp = ModelUtils.getTimestamp,
          );

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

  /// ----- can pop -----
  bool canPop() {
    if (_formSubmitAttempted) return true;

    /// Create model instance with form data
    final formToModel = _createModelToSave();

    /// check equality using props defined in Model using equatable
    final modelsAreEqual = const DeepCollectionEquality()
        .equals(formToModel?.toJson(), _originalModelJson);

    /// compare form fields data as bare bone json
    final fieldsAreEqual = const DeepCollectionEquality().equals(
      _originalModelJson['fieldsData'] as List<Map<String, dynamic>>?,
      formToModel?.fieldsData.map((e) => e.toJson()).toList(),
    );

    return modelsAreEqual && fieldsAreEqual;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Helper providers
/// ////////////////////////////////////////////////////////////////////
/// List of templates of user
///
/// Add case template provider
///
@riverpod
class CurrentCaseTemplate extends _$CurrentCaseTemplate with LoggerMixin {
  @override
  TemplateModel? build() {
    final addCaseSeed = ref.watch(addCaseSeederProvider);

    return addCaseSeed?.templateModel;
  }

  // ignore: use_setters_to_change_properties
  void setCaseTemplateModel(TemplateModel? templateModel) {
    logger
        .info('setCaseTemplateModel called with ${templateModel?.templateID}');
    state = templateModel;
  }
}

/// decrypted patient data provider
@riverpod
Result<DecryptedPatientModel, EncryptionClientException> decryptPatientModel(
  DecryptPatientModelRef ref,
  String crypt,
) {
  final encryptionService = ref.read(encryptionServiceProvider);

  final jsonDataResult = encryptionService.decrypt(crypt);

  return jsonDataResult.when(
    success: (jsonData) {
      return Result.success(DecryptedPatientModel.fromJson(jsonData));
    },
    failure: Result.failure,
  );
}

/// Encrypted patient data provider
@riverpod
Result<String, EncryptionClientException> encryptPatientModel(
  EncryptPatientModelRef ref,
  DecryptedPatientModel decryptedPatientModel,
) {
  final encryptionClient = ref.read(encryptionServiceProvider);

  return encryptionClient.encrypt(decryptedPatientModel.toJson()).when(
        success: Result.success,
        failure: Result.failure,
      );
}
