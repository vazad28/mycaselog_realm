// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../../support_data/features/assistants/assistants/provider/assistants_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssistantsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnFilter value) filterAssistants,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$OnFilterImpl implements _OnFilter {
  const _$OnFilterImpl();

  @override
  String toString() {
    return 'AssistantsEvent.filterAssistants()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnFilter value) filterAssistants,
  }) {
    return filterAssistants(this);
  }
}

abstract class _OnFilter implements AssistantsEvent {
  const factory _OnFilter() = _$OnFilterImpl;
}
