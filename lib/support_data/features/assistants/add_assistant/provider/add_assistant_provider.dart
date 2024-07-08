import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../../../core/failures/app_failures.dart';
import '../../../../../router/providers/bottom_bar_visibility_provider.dart';
import '../../../../../router/providers/router_observers.dart';
import '../../../../support_data.dart';

part '../../../../../generated/support_data/features/assistants/add_assistant/provider/add_assistant_provider.freezed.dart';
part '../../../../../generated/support_data/features/assistants/add_assistant/provider/add_assistant_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Event and Mixin
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddAssistantEvent with _$AddAssistantEvent {
  const factory AddAssistantEvent.onSubmit() = _OnSubmitForm;
}

mixin AddAssistantEventMixin {
  void submit(WidgetRef ref) {
    ///unfocus inputs
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    ref
        .watch(addAssistantNotifierProvider.notifier)
        .on(const AddAssistantEvent.onSubmit());
  }
}

mixin AddAssistantStateMixin {
  FormGroup getFormGroup(WidgetRef ref) =>
      ref.watch(addAssistantFormGroupProvider);

  void seedFormProvider(WidgetRef ref, AssistantModel model) =>
      ref.watch(addAssistantSeederProvider.notifier).seed(model);

  bool isFormSeeded(WidgetRef ref) =>
      ref.watch(addAssistantSeederProvider) != null;

  StateOf<AssistantModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addAssistantNotifierProvider);

  bool canPop(WidgetRef ref) =>
      ref.watch(addAssistantNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddAssistantSeeder extends _$AddAssistantSeeder {
  @override
  AssistantModel? build() => null;

  /// called by view with passed param caseID to load case model
  Future<void> seed(AssistantModel model) async {
    originalModelJson = model.toJson();
    state = model;
  }

  late final Map<String, dynamic> originalModelJson;
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addAssistantFormGroup(AddAssistantFormGroupRef ref) {
  final assistantModel = ref.watch(addAssistantSeederProvider);

  if (assistantModel == null) return FormGroup({});

  return FormGroup({
    AssistantModelProps.name.name: FormControl<String>(
      value: assistantModel.name,
      validators: [Validators.required, Validators.minLength(4)],
    ),
    AssistantModelProps.phone.name: FormControl<String>(
      value: assistantModel.phone,
    ),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddAssistantNotifier extends _$AddAssistantNotifier with LoggerMixin {
  /// if form was attempted to be saved before or no
  bool _formSubmitAttempted = false;
  bool get formSubmitAttempted => _formSubmitAttempted;

  /// get the original caseModel
  AssistantModel? get assistantModel => ref.read(addAssistantSeederProvider);

  /// Form Group instance
  FormGroup get _formGroup => ref.read(addAssistantFormGroupProvider);

  /// Provider build method
  @override
  StateOf<AssistantModel> build() => const StateOf<AssistantModel>.init();

  //final AssistantModel _originalModel;
  Map<String, dynamic> get _originalModelJson =>
      ref.read(addAssistantSeederProvider.notifier).originalModelJson;

  /// Event  mapper
  void on(AddAssistantEvent e) {
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
      state = const StateOf<AssistantModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = _createModelToSave();

      if (modelToSubmit == null) {
        state = const StateOf<AssistantModel>.failure(AppFailure.missingData());
        return;
      }

      _doSubmit(modelToSubmit);
    } catch (err) {
      state = StateOf<AssistantModel>.failure(err.toAppFailure());
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
  AssistantModel? _createModelToSave() {
    /// update with basic data
    final assistantModelJson = {..._originalModelJson, ..._formGroup.value};
    return AssistantModel.fromJson(assistantModelJson);
  }

  /// ---- DO the form submit  ---
  void _doSubmit(AssistantModel modelToSubmit) {
    ref
        .watch(supportDataNotifierProvider.notifier)
        .on(SupportDataEvent.addAssistant(modelToSubmit))
        .then(
          (value) => state = StateOf<AssistantModel>.success(modelToSubmit),
        );
  }

  /// ----- can pop -----
  bool canPop() {
    if (_formSubmitAttempted) return true;

    // final originalValue = _originalModelJson;
    // final formValue = {..._originalModelJson, ..._formGroup.value};

    // final formsAreEqual = mapEquals(originalValue, formValue);
    /// Using model equatable property list to test equality
    return assistantModel == _createModelToSave();
  }
}
