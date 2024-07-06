import 'package:app_models/app_models.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../core/failures/app_failures.dart';
import '../../../router/router.dart';

part '../../../generated/templates/add_template_field/provider/add_template_field_provider.freezed.dart';
part '../../../generated/templates/add_template_field/provider/add_template_field_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// MIXINS
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddTemplateFieldEvent with _$AddTemplateFieldEvent {
  const factory AddTemplateFieldEvent.onSubmit() = _OnSubmitForm;
}

mixin AddTemplateFieldEventMixin {
  void submit(WidgetRef ref) => ref
      .watch(addTemplateFieldNotifierProvider.notifier)
      .on(const AddTemplateFieldEvent.onSubmit());

  void setTemplateFieldType(WidgetRef ref, FieldType fieldType) =>
      ref.watch(templateFieldTypeProvider.notifier).update(fieldType);
}

mixin AddTemplateFieldStateMixin {
  FormGroup getTemplateFieldFormGroup(WidgetRef ref) =>
      ref.watch(addTemplateFieldFormGroupProvider);

  FieldType templateFieldType(WidgetRef ref) =>
      ref.watch(templateFieldTypeProvider);

  void seedFormProvider(WidgetRef ref, TemplateFieldModel model) =>
      ref.watch(addTemplateFieldSeederProvider.notifier).seed(model);

  bool isFormSeeded(WidgetRef ref) =>
      ref.watch(addTemplateFieldSeederProvider) != null;

  StateOf<TemplateFieldModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addTemplateFieldNotifierProvider);

  bool canPop(WidgetRef ref) =>
      ref.watch(addTemplateFieldNotifierProvider.notifier).canPop();

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateFieldSeeder extends _$AddTemplateFieldSeeder {
  @override
  TemplateFieldModel? build() => null;

  /// called by view with passed param caseID to load case model
  Future<void> seed(TemplateFieldModel model) async {
    originalModelJson = model.toJson();
    state = model;
  }

  late final Map<String, dynamic> originalModelJson;
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addTemplateFieldFormGroup(AddTemplateFieldFormGroupRef ref) {
  final templateFieldModel = ref.watch(addTemplateFieldSeederProvider);

  if (templateFieldModel == null) return FormGroup({});

  return FormGroup({
    TemplateFieldModelProps.title.name: FormControl<String>(
      value: templateFieldModel.title,
      validators: [Validators.required, Validators.minLength(3)],
    ),
    TemplateFieldModelProps.fieldType.name: FormControl<String>(
      value: templateFieldModel.fieldType.name,
      validators: [Validators.required],
    ),
    TemplateFieldModelProps.fieldDataType.name: FormControl<String>(
      value: templateFieldModel.fieldDataType.name,
    ),
    TemplateFieldModelProps.options.name: FormControl<List<String>>(
      value: templateFieldModel.options,
    ),
    TemplateFieldModelProps.defaultValue.name: FormControl<String>(
      value: templateFieldModel.defaultValue,
    ),
    TemplateFieldModelProps.suffixText.name: FormControl<String>(
      value: templateFieldModel.suffixText,
    ),
    TemplateFieldModelProps.isRequired.name: FormControl<bool>(
      value: templateFieldModel.isRequired,
    ),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////

/// field type provider
@riverpod
class TemplateFieldType extends _$TemplateFieldType {
  @override
  FieldType build() {
    final templateFieldModel = ref.watch(addTemplateFieldSeederProvider);
    return templateFieldModel?.fieldType ?? FieldType.text;
  }

  // ignore: use_setters_to_change_properties
  void update(FieldType newType) => state = newType;
}

/// Add field options provider
@riverpod
class FieldOptions extends _$FieldOptions {
  @override
  List<String>? build() {
    final templateFieldModel = ref.watch(addTemplateFieldSeederProvider);
    return templateFieldModel?.options;
  }

  /// method to update field options
  void updateFieldOption(String option) {
    final fieldOptions = List<String>.from(state ?? <String>[]);

    final index = fieldOptions.indexOf(option);
    if (index == -1) {
      fieldOptions.add(option);
    } else {
      fieldOptions[index] = option;
    }

    state = fieldOptions;
  }

  void removeFieldOption(String value) {
    if (state?.isEmpty ?? true) return;
    state = List<String>.from(state!)
      ..removeWhere((element) => element.toLowerCase() == value.toLowerCase());
  }
}

@riverpod
class AddTemplateFieldNotifier extends _$AddTemplateFieldNotifier
    with LoggerMixin {
  /// if form was attempted to be saved before or no
  bool _formSubmitAttempted = false;
  bool get formSubmitAttempted => _formSubmitAttempted;

  /// get the original caseModel
  TemplateFieldModel? get originalModel =>
      ref.read(addTemplateFieldSeederProvider);

  /// Form Group instance
  FormGroup get _formGroup => ref.read(addTemplateFieldFormGroupProvider);

  //final TemplateFieldModel _originalModel;
  Map<String, dynamic> get _originalModelJson =>
      ref.read(addTemplateFieldSeederProvider.notifier).originalModelJson;

  /// Provider build method
  @override
  StateOf<TemplateFieldModel> build() =>
      const StateOf<TemplateFieldModel>.init();

  /// Event  mapper
  void on(AddTemplateFieldEvent e) {
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
      state = const StateOf<TemplateFieldModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = _createModelToSave();

      if (modelToSubmit == null) {
        state =
            const StateOf<TemplateFieldModel>.failure(AppFailure.missingData());
        return;
      }

      _doSubmit(modelToSubmit);
    } catch (err) {
      state = StateOf<TemplateFieldModel>.failure(err.toAppFailure());
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
  TemplateFieldModel? _createModelToSave() {
    /// update with basic data
    final templateFieldModelJson = {..._originalModelJson, ..._formGroup.value};

    final options =
        RealmList<String>(ref.read(fieldOptionsProvider)?.toList() ?? []);

    return TemplateFieldModelX.fromJson(templateFieldModelJson)
      ..fieldType = ref.read(templateFieldTypeProvider)
      ..options = options;
  }

  /// ---- DO the form submit  ---
  void _doSubmit(TemplateFieldModel modelToSubmit) {
    //print(modelToSubmit.toJson());
    state = StateOf<TemplateFieldModel>.success(modelToSubmit);
  }

  /// ----- can pop -----
  bool canPop() {
    if (_formSubmitAttempted) return true;

    /// Create model instance with form data
    final formToModel = _createModelToSave();

    /// check equality using props defined in Model using equatable
    return formToModel == originalModel;
  }
}
