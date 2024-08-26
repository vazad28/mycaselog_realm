import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../core/failures/app_failures.dart';
import '../../../core/providers/providers.dart';
import '../../../router/router.dart';
import 'add_template_fields_provider.dart';

part '../../../generated/templates/add_template/provider/add_template_provider.freezed.dart';
part '../../../generated/templates/add_template/provider/add_template_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// MIXINS
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddTemplateEvent with _$AddTemplateEvent {
  const factory AddTemplateEvent.onSubmit() = _OnSubmitForm;
}

mixin AddTemplateEventMixin {
  void submit(WidgetRef ref) => ref
      .watch(addTemplateNotifierProvider.notifier)
      .on(const AddTemplateEvent.onSubmit());
}

mixin AddTemplateStateMixin {
  FormGroup getTemplateFieldFormGroup(WidgetRef ref) =>
      ref.watch(addTemplateFormGroupProvider);

  void seedFormProvider(
    WidgetRef ref,
    String templateID,
    String userSpeciality,
  ) =>
      ref
          .watch(addTemplateSeederProvider.notifier)
          .seed(templateID, userSpeciality);

  bool isFormSeeded(WidgetRef ref) =>
      ref.watch(addTemplateSeederProvider) != null;

  StateOf<TemplateModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addTemplateNotifierProvider);

  bool canPop(WidgetRef ref) =>
      ref.watch(addTemplateNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateSeeder extends _$AddTemplateSeeder {
  @override
  TemplateModel? build() => null;

  /// called by view with passed param caseID to load case model
  void seed(String templateID, String userSpeciality) {
    final templateModel =
        ref.watch(dbProvider).templatesCollection.getSingle(templateID);

    final model = templateModel ?? TemplateModelX.zero()
      ..speciality = userSpeciality;
    state = model;
    originalModelJson = model.toJson();
  }

  void seedWithImportedTemplate(TemplateModel templateModel) {
    state = templateModel;
    originalModelJson = templateModel.toJson();
  }

  Map<String, dynamic> originalModelJson = {};
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addTemplateFormGroup(AddTemplateFormGroupRef ref) {
  final templateModel = ref.watch(addTemplateSeederProvider);

  if (templateModel == null) return FormGroup({});

  return FormGroup({
    TemplateModelProps.title.name: FormControl<String>(
      value: templateModel.title,
      validators: [Validators.required, Validators.minLength(3)],
    ),
    TemplateModelProps.desc.name:
        FormControl<String>(value: templateModel.desc),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateNotifier extends _$AddTemplateNotifier with LoggerMixin {
  /// if form was attempted to be saved before or no
  bool _formSubmitAttempted = false;
  bool get formSubmitAttempted => _formSubmitAttempted;

  /// get the original caseModel
  TemplateModel? get originalModel => ref.read(addTemplateSeederProvider);

  //final TemplateModel _originalModel;
  Map<String, dynamic> get _originalModelJson =>
      ref.read(addTemplateSeederProvider.notifier).originalModelJson;

  /// Form Group instance
  FormGroup get _formGroup => ref.watch(addTemplateFormGroupProvider);

  /// Provider build method
  @override
  StateOf<TemplateModel> build() => const StateOf<TemplateModel>.init();

  /// Event  mapper
  void on(AddTemplateEvent e) {
    e.map(
      onSubmit: (_) {
        _formSubmitAttempted = true;
        _onSubmit();
      },
    );
  }

  /// Method to submit the form
  void _onSubmit() {
    try {
      _formSubmitAttempted = true;
      state = const StateOf<TemplateModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = _createModelToSave();

      if (modelToSubmit == null) {
        state = const StateOf<TemplateModel>.failure(AppFailure.missingData());
        return;
      }

      _doSubmit(modelToSubmit);
    } catch (err) {
      state = StateOf<TemplateModel>.failure(err.toAppFailure());
    }
  }

  /// Validate the form data
  bool _validateForms() {
    if (_formGroup.invalid) {
      _formGroup.markAllAsTouched();
      return false;
    }
    return true;
  }

  /// Update our model from formdata
  TemplateModel? _createModelToSave() {
    /// update with basic data
    final templateModelJson = {..._originalModelJson, ..._formGroup.value};

    final model = TemplateModelX.fromJson(templateModelJson);
    model.fields.clear();

    model.fields.addAll(
      ref.read(addTemplateFieldsNotifierProvider)?.toList() ?? [],
    );

    return model;
  }

  /// ---- DO the form submit  ---
  Future<void> _doSubmit(TemplateModel modelToSubmit) async {
    try {
      await ref.watch(dbProvider).templatesCollection.add(modelToSubmit);
      state = StateOf<TemplateModel>.success(modelToSubmit);
    } catch (err) {
      state = StateOf<TemplateModel>.failure(err.toAppFailure());
    }
  }

  /// ----- can pop -----
  bool canPop() {
    if (_formSubmitAttempted) return true;
    try {
      /// Create model instance with form data
      final formToModel = _createModelToSave();

      /// check equality using json
      final modelsAreEqual = const DeepCollectionEquality()
          .equals(formToModel?.toJson(), _originalModelJson);

      /// compare form fields data as bare bone json
      final fieldsAreEqual = const DeepCollectionEquality().equals(
        _originalModelJson['fields'] as List<Map<String, dynamic>>?,
        formToModel?.fields.map((e) => e.toJson()).toList(),
      );

      return modelsAreEqual && fieldsAreEqual;
    } catch (err) {
      return false;
    }
  }
}
