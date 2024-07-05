// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../add_case/provider/add_case_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCaseEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
    required TResult Function(_OnTemplateChange value) onTemplateChange,
    required TResult Function(_OnUpdatePatientDataFormGroup value)
        onUpdatePatientDataFormGroup,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$OnSubmitFormImpl implements _OnSubmitForm {
  const _$OnSubmitFormImpl();

  @override
  String toString() {
    return 'AddCaseEvent.onSubmit()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
    required TResult Function(_OnTemplateChange value) onTemplateChange,
    required TResult Function(_OnUpdatePatientDataFormGroup value)
        onUpdatePatientDataFormGroup,
  }) {
    return onSubmit(this);
  }
}

abstract class _OnSubmitForm implements AddCaseEvent {
  const factory _OnSubmitForm() = _$OnSubmitFormImpl;
}

/// @nodoc

class _$OnTemplateChangeImpl implements _OnTemplateChange {
  const _$OnTemplateChangeImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'AddCaseEvent.onTemplateChange(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
    required TResult Function(_OnTemplateChange value) onTemplateChange,
    required TResult Function(_OnUpdatePatientDataFormGroup value)
        onUpdatePatientDataFormGroup,
  }) {
    return onTemplateChange(this);
  }
}

abstract class _OnTemplateChange implements AddCaseEvent {
  const factory _OnTemplateChange(final TemplateModel templateModel) =
      _$OnTemplateChangeImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$OnUpdatePatientDataFormGroupImpl
    implements _OnUpdatePatientDataFormGroup {
  const _$OnUpdatePatientDataFormGroupImpl(this.patientModel);

  @override
  final PatientModel patientModel;

  @override
  String toString() {
    return 'AddCaseEvent.onUpdatePatientDataFormGroup(patientModel: $patientModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
    required TResult Function(_OnTemplateChange value) onTemplateChange,
    required TResult Function(_OnUpdatePatientDataFormGroup value)
        onUpdatePatientDataFormGroup,
  }) {
    return onUpdatePatientDataFormGroup(this);
  }
}

abstract class _OnUpdatePatientDataFormGroup implements AddCaseEvent {
  const factory _OnUpdatePatientDataFormGroup(final PatientModel patientModel) =
      _$OnUpdatePatientDataFormGroupImpl;

  PatientModel get patientModel;
}
