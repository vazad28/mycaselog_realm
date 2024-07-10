// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../notes/provider/notes_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotesPagedState {
  List<NoteModel> get values => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of NotesPagedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotesPagedStateCopyWith<NotesPagedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesPagedStateCopyWith<$Res> {
  factory $NotesPagedStateCopyWith(
          NotesPagedState value, $Res Function(NotesPagedState) then) =
      _$NotesPagedStateCopyWithImpl<$Res, NotesPagedState>;
  @useResult
  $Res call(
      {List<NoteModel> values,
      Object? error,
      bool hasReachedMax,
      bool isLoading});
}

/// @nodoc
class _$NotesPagedStateCopyWithImpl<$Res, $Val extends NotesPagedState>
    implements $NotesPagedStateCopyWith<$Res> {
  _$NotesPagedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesPagedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? error = freezed,
    Object? hasReachedMax = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      error: freezed == error ? _value.error : error,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotesPagedStateImplCopyWith<$Res>
    implements $NotesPagedStateCopyWith<$Res> {
  factory _$$NotesPagedStateImplCopyWith(_$NotesPagedStateImpl value,
          $Res Function(_$NotesPagedStateImpl) then) =
      __$$NotesPagedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NoteModel> values,
      Object? error,
      bool hasReachedMax,
      bool isLoading});
}

/// @nodoc
class __$$NotesPagedStateImplCopyWithImpl<$Res>
    extends _$NotesPagedStateCopyWithImpl<$Res, _$NotesPagedStateImpl>
    implements _$$NotesPagedStateImplCopyWith<$Res> {
  __$$NotesPagedStateImplCopyWithImpl(
      _$NotesPagedStateImpl _value, $Res Function(_$NotesPagedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesPagedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? error = freezed,
    Object? hasReachedMax = null,
    Object? isLoading = null,
  }) {
    return _then(_$NotesPagedStateImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      error: freezed == error ? _value.error : error,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotesPagedStateImpl
    with DiagnosticableTreeMixin
    implements _NotesPagedState {
  const _$NotesPagedStateImpl(
      {required final List<NoteModel> values,
      this.error,
      this.hasReachedMax = false,
      this.isLoading = false})
      : _values = values;

  final List<NoteModel> _values;
  @override
  List<NoteModel> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final Object? error;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotesPagedState(values: $values, error: $error, hasReachedMax: $hasReachedMax, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotesPagedState'))
      ..add(DiagnosticsProperty('values', values))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('hasReachedMax', hasReachedMax))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  /// Create a copy of NotesPagedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesPagedStateImplCopyWith<_$NotesPagedStateImpl> get copyWith =>
      __$$NotesPagedStateImplCopyWithImpl<_$NotesPagedStateImpl>(
          this, _$identity);
}

abstract class _NotesPagedState implements NotesPagedState {
  const factory _NotesPagedState(
      {required final List<NoteModel> values,
      final Object? error,
      final bool hasReachedMax,
      final bool isLoading}) = _$NotesPagedStateImpl;

  @override
  List<NoteModel> get values;
  @override
  Object? get error;
  @override
  bool get hasReachedMax;
  @override
  bool get isLoading;

  /// Create a copy of NotesPagedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotesPagedStateImplCopyWith<_$NotesPagedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
