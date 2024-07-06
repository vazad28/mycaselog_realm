// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../templates/templates/provider/templates_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplatesEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$DeactivateTemplateImpl implements _DeactivateTemplate {
  const _$DeactivateTemplateImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'TemplatesEvent.deactivateTemplate(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return deactivateTemplate(this);
  }
}

abstract class _DeactivateTemplate implements TemplatesEvent {
  const factory _DeactivateTemplate(final TemplateModel templateModel) =
      _$DeactivateTemplateImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$DeleteTemplateImpl implements _DeleteTemplate {
  const _$DeleteTemplateImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'TemplatesEvent.deleteTemplate(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return deleteTemplate(this);
  }
}

abstract class _DeleteTemplate implements TemplatesEvent {
  const factory _DeleteTemplate(final TemplateModel templateModel) =
      _$DeleteTemplateImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$ReactivateTemplateImpl implements _ReactivateTemplate {
  const _$ReactivateTemplateImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'TemplatesEvent.reactivateTemplate(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return reactivateTemplate(this);
  }
}

abstract class _ReactivateTemplate implements TemplatesEvent {
  const factory _ReactivateTemplate(final TemplateModel templateModel) =
      _$ReactivateTemplateImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$RefreshTemplatesImpl implements _RefreshTemplates {
  const _$RefreshTemplatesImpl();

  @override
  String toString() {
    return 'TemplatesEvent.refreshTemplates()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return refreshTemplates(this);
  }
}

abstract class _RefreshTemplates implements TemplatesEvent {
  const factory _RefreshTemplates() = _$RefreshTemplatesImpl;
}

/// @nodoc

class _$ShareTemplateImpl implements _ShareTemplate {
  const _$ShareTemplateImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'TemplatesEvent.shareTemplate(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return shareTemplate(this);
  }
}

abstract class _ShareTemplate implements TemplatesEvent {
  const factory _ShareTemplate(final TemplateModel templateModel) =
      _$ShareTemplateImpl;

  TemplateModel get templateModel;
}

/// @nodoc

class _$UnShareTemplateImpl implements _UnShareTemplate {
  const _$UnShareTemplateImpl(this.templateModel);

  @override
  final TemplateModel templateModel;

  @override
  String toString() {
    return 'TemplatesEvent.unShareTemplate(templateModel: $templateModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeactivateTemplate value) deactivateTemplate,
    required TResult Function(_DeleteTemplate value) deleteTemplate,
    required TResult Function(_ReactivateTemplate value) reactivateTemplate,
    required TResult Function(_RefreshTemplates value) refreshTemplates,
    required TResult Function(_ShareTemplate value) shareTemplate,
    required TResult Function(_UnShareTemplate value) unShareTemplate,
  }) {
    return unShareTemplate(this);
  }
}

abstract class _UnShareTemplate implements TemplatesEvent {
  const factory _UnShareTemplate(final TemplateModel templateModel) =
      _$UnShareTemplateImpl;

  TemplateModel get templateModel;
}
