// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../support_data/features/activable_fields/provider/activable_fields_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivableFieldsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActiveField value) updateActivableField,
    required TResult Function(_ResetActivableFields value) resetActivableFields,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateActiveFieldImpl implements _UpdateActiveField {
  const _$UpdateActiveFieldImpl(this.field);

  @override
  final ActivableAddCaseField field;

  @override
  String toString() {
    return 'ActivableFieldsEvent.updateActivableField(field: $field)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActiveField value) updateActivableField,
    required TResult Function(_ResetActivableFields value) resetActivableFields,
  }) {
    return updateActivableField(this);
  }
}

abstract class _UpdateActiveField implements ActivableFieldsEvent {
  const factory _UpdateActiveField(final ActivableAddCaseField field) =
      _$UpdateActiveFieldImpl;

  ActivableAddCaseField get field;
}

/// @nodoc

class _$ResetActivableFieldsImpl implements _ResetActivableFields {
  const _$ResetActivableFieldsImpl();

  @override
  String toString() {
    return 'ActivableFieldsEvent.resetActivableFields()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActiveField value) updateActivableField,
    required TResult Function(_ResetActivableFields value) resetActivableFields,
  }) {
    return resetActivableFields(this);
  }
}

abstract class _ResetActivableFields implements ActivableFieldsEvent {
  const factory _ResetActivableFields() = _$ResetActivableFieldsImpl;
}
