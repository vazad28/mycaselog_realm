// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepositoryFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryFailureCopyWith<$Res> {
  factory $RepositoryFailureCopyWith(
          RepositoryFailure value, $Res Function(RepositoryFailure) then) =
      _$RepositoryFailureCopyWithImpl<$Res, RepositoryFailure>;
}

/// @nodoc
class _$RepositoryFailureCopyWithImpl<$Res, $Val extends RepositoryFailure>
    implements $RepositoryFailureCopyWith<$Res> {
  _$RepositoryFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RepositoryFailureGenericImplCopyWith<$Res> {
  factory _$$RepositoryFailureGenericImplCopyWith(
          _$RepositoryFailureGenericImpl value,
          $Res Function(_$RepositoryFailureGenericImpl) then) =
      __$$RepositoryFailureGenericImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RepositoryFailureGenericImplCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res,
        _$RepositoryFailureGenericImpl>
    implements _$$RepositoryFailureGenericImplCopyWith<$Res> {
  __$$RepositoryFailureGenericImplCopyWithImpl(
      _$RepositoryFailureGenericImpl _value,
      $Res Function(_$RepositoryFailureGenericImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RepositoryFailureGenericImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RepositoryFailureGenericImpl implements RepositoryFailureGeneric {
  const _$RepositoryFailureGenericImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RepositoryFailure.generic(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryFailureGenericImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryFailureGenericImplCopyWith<_$RepositoryFailureGenericImpl>
      get copyWith => __$$RepositoryFailureGenericImplCopyWithImpl<
          _$RepositoryFailureGenericImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) {
    return generic(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) {
    return generic?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) {
    return generic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) {
    return generic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(this);
    }
    return orElse();
  }
}

abstract class RepositoryFailureGeneric implements RepositoryFailure {
  const factory RepositoryFailureGeneric(final String message) =
      _$RepositoryFailureGenericImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RepositoryFailureGenericImplCopyWith<_$RepositoryFailureGenericImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RepositoryFailureFromErrorImplCopyWith<$Res> {
  factory _$$RepositoryFailureFromErrorImplCopyWith(
          _$RepositoryFailureFromErrorImpl value,
          $Res Function(_$RepositoryFailureFromErrorImpl) then) =
      __$$RepositoryFailureFromErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object err});
}

/// @nodoc
class __$$RepositoryFailureFromErrorImplCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res,
        _$RepositoryFailureFromErrorImpl>
    implements _$$RepositoryFailureFromErrorImplCopyWith<$Res> {
  __$$RepositoryFailureFromErrorImplCopyWithImpl(
      _$RepositoryFailureFromErrorImpl _value,
      $Res Function(_$RepositoryFailureFromErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$RepositoryFailureFromErrorImpl(
      null == err ? _value.err : err,
    ));
  }
}

/// @nodoc

class _$RepositoryFailureFromErrorImpl implements RepositoryFailureFromError {
  const _$RepositoryFailureFromErrorImpl(this.err);

  @override
  final Object err;

  @override
  String toString() {
    return 'RepositoryFailure.fromError(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryFailureFromErrorImpl &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryFailureFromErrorImplCopyWith<_$RepositoryFailureFromErrorImpl>
      get copyWith => __$$RepositoryFailureFromErrorImplCopyWithImpl<
          _$RepositoryFailureFromErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) {
    return fromError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) {
    return fromError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) {
    if (fromError != null) {
      return fromError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) {
    return fromError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) {
    return fromError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) {
    if (fromError != null) {
      return fromError(this);
    }
    return orElse();
  }
}

abstract class RepositoryFailureFromError implements RepositoryFailure {
  const factory RepositoryFailureFromError(final Object err) =
      _$RepositoryFailureFromErrorImpl;

  Object get err;
  @JsonKey(ignore: true)
  _$$RepositoryFailureFromErrorImplCopyWith<_$RepositoryFailureFromErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RepositoryFailureNoConnectionImplCopyWith<$Res> {
  factory _$$RepositoryFailureNoConnectionImplCopyWith(
          _$RepositoryFailureNoConnectionImpl value,
          $Res Function(_$RepositoryFailureNoConnectionImpl) then) =
      __$$RepositoryFailureNoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RepositoryFailureNoConnectionImplCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res,
        _$RepositoryFailureNoConnectionImpl>
    implements _$$RepositoryFailureNoConnectionImplCopyWith<$Res> {
  __$$RepositoryFailureNoConnectionImplCopyWithImpl(
      _$RepositoryFailureNoConnectionImpl _value,
      $Res Function(_$RepositoryFailureNoConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RepositoryFailureNoConnectionImpl
    implements RepositoryFailureNoConnection {
  const _$RepositoryFailureNoConnectionImpl();

  @override
  String toString() {
    return 'RepositoryFailure.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryFailureNoConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class RepositoryFailureNoConnection implements RepositoryFailure {
  const factory RepositoryFailureNoConnection() =
      _$RepositoryFailureNoConnectionImpl;
}

/// @nodoc
abstract class _$$RepositoryFailureNoStatsDataImplCopyWith<$Res> {
  factory _$$RepositoryFailureNoStatsDataImplCopyWith(
          _$RepositoryFailureNoStatsDataImpl value,
          $Res Function(_$RepositoryFailureNoStatsDataImpl) then) =
      __$$RepositoryFailureNoStatsDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RepositoryFailureNoStatsDataImplCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res,
        _$RepositoryFailureNoStatsDataImpl>
    implements _$$RepositoryFailureNoStatsDataImplCopyWith<$Res> {
  __$$RepositoryFailureNoStatsDataImplCopyWithImpl(
      _$RepositoryFailureNoStatsDataImpl _value,
      $Res Function(_$RepositoryFailureNoStatsDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RepositoryFailureNoStatsDataImpl
    implements RepositoryFailureNoStatsData {
  const _$RepositoryFailureNoStatsDataImpl();

  @override
  String toString() {
    return 'RepositoryFailure.noStatsData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryFailureNoStatsDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) {
    return noStatsData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) {
    return noStatsData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noStatsData != null) {
      return noStatsData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) {
    return noStatsData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) {
    return noStatsData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noStatsData != null) {
      return noStatsData(this);
    }
    return orElse();
  }
}

abstract class RepositoryFailureNoStatsData implements RepositoryFailure {
  const factory RepositoryFailureNoStatsData() =
      _$RepositoryFailureNoStatsDataImpl;
}

/// @nodoc
abstract class _$$RepositoryFailureNoUserTemplatesImplCopyWith<$Res> {
  factory _$$RepositoryFailureNoUserTemplatesImplCopyWith(
          _$RepositoryFailureNoUserTemplatesImpl value,
          $Res Function(_$RepositoryFailureNoUserTemplatesImpl) then) =
      __$$RepositoryFailureNoUserTemplatesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RepositoryFailureNoUserTemplatesImplCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res,
        _$RepositoryFailureNoUserTemplatesImpl>
    implements _$$RepositoryFailureNoUserTemplatesImplCopyWith<$Res> {
  __$$RepositoryFailureNoUserTemplatesImplCopyWithImpl(
      _$RepositoryFailureNoUserTemplatesImpl _value,
      $Res Function(_$RepositoryFailureNoUserTemplatesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RepositoryFailureNoUserTemplatesImpl
    implements RepositoryFailureNoUserTemplates {
  const _$RepositoryFailureNoUserTemplatesImpl();

  @override
  String toString() {
    return 'RepositoryFailure.noUserTemplates()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryFailureNoUserTemplatesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) generic,
    required TResult Function(Object err) fromError,
    required TResult Function() noConnection,
    required TResult Function() noStatsData,
    required TResult Function() noUserTemplates,
  }) {
    return noUserTemplates();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? generic,
    TResult? Function(Object err)? fromError,
    TResult? Function()? noConnection,
    TResult? Function()? noStatsData,
    TResult? Function()? noUserTemplates,
  }) {
    return noUserTemplates?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? generic,
    TResult Function(Object err)? fromError,
    TResult Function()? noConnection,
    TResult Function()? noStatsData,
    TResult Function()? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noUserTemplates != null) {
      return noUserTemplates();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RepositoryFailureGeneric value) generic,
    required TResult Function(RepositoryFailureFromError value) fromError,
    required TResult Function(RepositoryFailureNoConnection value) noConnection,
    required TResult Function(RepositoryFailureNoStatsData value) noStatsData,
    required TResult Function(RepositoryFailureNoUserTemplates value)
        noUserTemplates,
  }) {
    return noUserTemplates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RepositoryFailureGeneric value)? generic,
    TResult? Function(RepositoryFailureFromError value)? fromError,
    TResult? Function(RepositoryFailureNoConnection value)? noConnection,
    TResult? Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult? Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
  }) {
    return noUserTemplates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RepositoryFailureGeneric value)? generic,
    TResult Function(RepositoryFailureFromError value)? fromError,
    TResult Function(RepositoryFailureNoConnection value)? noConnection,
    TResult Function(RepositoryFailureNoStatsData value)? noStatsData,
    TResult Function(RepositoryFailureNoUserTemplates value)? noUserTemplates,
    required TResult orElse(),
  }) {
    if (noUserTemplates != null) {
      return noUserTemplates(this);
    }
    return orElse();
  }
}

abstract class RepositoryFailureNoUserTemplates implements RepositoryFailure {
  const factory RepositoryFailureNoUserTemplates() =
      _$RepositoryFailureNoUserTemplatesImpl;
}
