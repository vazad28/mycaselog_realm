// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../case_details/provider/case_details_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CaseDetailsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCaseDetails value) addCaseDetails,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$AddCaseDetailsImpl implements _AddCaseDetails {
  const _$AddCaseDetailsImpl();

  @override
  String toString() {
    return 'CaseDetailsEvent.addCaseDetails()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCaseDetails value) addCaseDetails,
  }) {
    return addCaseDetails(this);
  }
}

abstract class _AddCaseDetails implements CaseDetailsEvent {
  const factory _AddCaseDetails() = _$AddCaseDetailsImpl;
}