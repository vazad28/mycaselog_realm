// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../templates/add_template/provider/add_template_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTemplateEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$OnSubmitFormImpl with DiagnosticableTreeMixin implements _OnSubmitForm {
  const _$OnSubmitFormImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddTemplateEvent.onSubmit()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AddTemplateEvent.onSubmit'));
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnSubmitForm value) onSubmit,
  }) {
    return onSubmit(this);
  }
}

abstract class _OnSubmitForm implements AddTemplateEvent {
  const factory _OnSubmitForm() = _$OnSubmitFormImpl;
}
