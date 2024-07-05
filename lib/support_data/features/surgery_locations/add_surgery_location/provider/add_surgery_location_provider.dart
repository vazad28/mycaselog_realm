import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../../../core/failures/app_failures.dart';
import '../../../../../router/router.dart';

part '../../../../../generated/support_data/features/surgery_locations/add_surgery_location/provider/add_surgery_location_provider.freezed.dart';
part '../../../../../generated/support_data/features/surgery_locations/add_surgery_location/provider/add_surgery_location_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// MIXINS
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddSurgeryLocationEvent with _$AddSurgeryLocationEvent {
  const factory AddSurgeryLocationEvent.onSubmit() = _OnSubmitForm;
}

mixin AddSurgeryLocationEventMixin {
  void submit(WidgetRef ref) => ref
      .watch(addSurgeryLocationNotifierProvider.notifier)
      .on(const AddSurgeryLocationEvent.onSubmit());
}

mixin AddSurgeryLocationStateMixin {
  FormGroup getFormGroup(WidgetRef ref) =>
      ref.watch(addSurgeryLocationFormGroupProvider);

  void seedFormProvider(WidgetRef ref, SurgeryLocationModel model) =>
      ref.watch(addSurgeryLocationSeederProvider.notifier).seed(model);

  bool isFormSeeded(WidgetRef ref) =>
      ref.watch(addSurgeryLocationSeederProvider) != null;

  StateOf<SurgeryLocationModel> formSubmitStatus(WidgetRef ref) =>
      ref.watch(addSurgeryLocationNotifierProvider);

  bool canPop(WidgetRef ref) =>
      ref.watch(addSurgeryLocationNotifierProvider.notifier).canPop();

  void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

  RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
      ref.read(shellRoutesObserversProvider).settingsRouteObserver;
}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddSurgeryLocationSeeder extends _$AddSurgeryLocationSeeder {
  @override
  SurgeryLocationModel? build() => null;

  /// called by view with passed param caseID to load case model
  Future<void> seed(SurgeryLocationModel model) async {
    originalModelJson = model.toJson();
    state = model;
  }

  late final Map<String, dynamic> originalModelJson;
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addSurgeryLocationFormGroup(AddSurgeryLocationFormGroupRef ref) {
  final surgeryLocationModel = ref.watch(addSurgeryLocationSeederProvider);

  if (surgeryLocationModel == null) return FormGroup({});

  return FormGroup({
    SurgeryLocationProps.name.name: FormControl<String>(
      value: surgeryLocationModel.name,
      validators: [Validators.required, Validators.minLength(3)],
    ),
    SurgeryLocationProps.phone.name: FormControl<String>(
      value: surgeryLocationModel.phone,
      validators: [],
    ),
    SurgeryLocationProps.address.name: FormControl<String>(
      value: surgeryLocationModel.address,
      validators: [],
    ),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddSurgeryLocationNotifier extends _$AddSurgeryLocationNotifier
    with LoggerMixin {
  /// if form was attempted to be saved before or no
  bool _formSubmitAttempted = false;
  bool get formSubmitAttempted => _formSubmitAttempted;

  /// get the original caseModel
  SurgeryLocationModel? get surgeryLocaltionModel =>
      ref.read(addSurgeryLocationSeederProvider);

  /// Form Group instance
  FormGroup get _formGroup => ref.read(addSurgeryLocationFormGroupProvider);

  /// Provider build method
  @override
  StateOf<SurgeryLocationModel> build() =>
      const StateOf<SurgeryLocationModel>.init();

  //final SurgeryLocationModel _originalModel;
  Map<String, dynamic> get _originalModelJson =>
      ref.read(addSurgeryLocationSeederProvider.notifier).originalModelJson;

  /// Event  mapper
  void on(AddSurgeryLocationEvent e) {
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
      state = const StateOf<SurgeryLocationModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = _createModelToSave();

      if (modelToSubmit == null) {
        state = const StateOf<SurgeryLocationModel>.failure(
          AppFailure.missingData(),
        );
        return;
      }

      _doSubmit(modelToSubmit);
    } catch (err) {
      state = StateOf<SurgeryLocationModel>.failure(err.toAppFailure());
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
  SurgeryLocationModel? _createModelToSave() {
    /// update with basic data
    final surgeryLocaltionModelJson = {
      ..._originalModelJson,
      ..._formGroup.value,
    };
    return SurgeryLocationModelX.fromJson(surgeryLocaltionModelJson);
  }

  /// ---- DO the form submit  ---
  void _doSubmit(SurgeryLocationModel modelToSubmit) {
    //_addSurgeryLocation(modelToSubmit);
    state = StateOf<SurgeryLocationModel>.success(modelToSubmit);
  }

  /// ----- can pop -----
  bool canPop() {
    if (_formSubmitAttempted) return true;

    final originalValue = _originalModelJson;
    final formValue = {..._originalModelJson, ..._formGroup.value};

    final formsAreEqual = mapEquals(originalValue, formValue);

    return formsAreEqual;
  }
}
