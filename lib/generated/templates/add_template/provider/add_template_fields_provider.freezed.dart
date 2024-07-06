// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../templates/add_template/provider/add_template_fields_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTemplateFieldsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnAddUpdateField value) onAddUpdateField,
    required TResult Function(_OnImportFields value) onImportFields,
    required TResult Function(_ReOrderFields value) reOrderFields,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$OnAddUpdateFieldImpl implements _OnAddUpdateField {
  const _$OnAddUpdateFieldImpl(this.data);

  @override
  final TemplateFieldModel? data;

  @override
  String toString() {
    return 'AddTemplateFieldsEvent.onAddUpdateField(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnAddUpdateField value) onAddUpdateField,
    required TResult Function(_OnImportFields value) onImportFields,
    required TResult Function(_ReOrderFields value) reOrderFields,
  }) {
    return onAddUpdateField(this);
  }
}

abstract class _OnAddUpdateField implements AddTemplateFieldsEvent {
  const factory _OnAddUpdateField(final TemplateFieldModel? data) =
      _$OnAddUpdateFieldImpl;

  TemplateFieldModel? get data;
}

/// @nodoc

class _$OnImportFieldsImpl implements _OnImportFields {
  const _$OnImportFieldsImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'AddTemplateFieldsEvent.onImportFields(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnAddUpdateField value) onAddUpdateField,
    required TResult Function(_OnImportFields value) onImportFields,
    required TResult Function(_ReOrderFields value) reOrderFields,
  }) {
    return onImportFields(this);
  }
}

abstract class _OnImportFields implements AddTemplateFieldsEvent {
  const factory _OnImportFields(final TemplateModel templateModel) =
      _$OnImportFieldsImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$ReOrderFieldsImpl implements _ReOrderFields {
  const _$ReOrderFieldsImpl({required final List<TemplateFieldModel> list})
      : _list = list;

  final List<TemplateFieldModel> _list;
  @override
  List<TemplateFieldModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AddTemplateFieldsEvent.reOrderFields(list: $list)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnAddUpdateField value) onAddUpdateField,
    required TResult Function(_OnImportFields value) onImportFields,
    required TResult Function(_ReOrderFields value) reOrderFields,
  }) {
    return reOrderFields(this);
  }
}

abstract class _ReOrderFields implements AddTemplateFieldsEvent {
  const factory _ReOrderFields({required final List<TemplateFieldModel> list}) =
      _$ReOrderFieldsImpl;

  List<TemplateFieldModel> get list;
}
