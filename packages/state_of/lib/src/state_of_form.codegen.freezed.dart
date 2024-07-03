// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_of_form.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StateOfForm<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_failure<T> extends _failure<T> {
  const _$_failure(this.e) : super._();

  @override
  final Exception e;

  @override
  String toString() {
    return 'StateOfForm<$T>.failure(e: $e)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return failure(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return failure(this);
  }
}

abstract class _failure<T> extends StateOfForm<T> {
  const factory _failure(final Exception e) = _$_failure<T>;
  const _failure._() : super._();

  Exception get e;
}

/// @nodoc

class _$_init<T> extends _init<T> {
  const _$_init() : super._();

  @override
  String toString() {
    return 'StateOfForm<$T>.init()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return init(this);
  }
}

abstract class _init<T> extends StateOfForm<T> {
  const factory _init() = _$_init<T>;
  const _init._() : super._();
}

/// @nodoc

class _$_initialized<T> extends _initialized<T> {
  const _$_initialized() : super._();

  @override
  String toString() {
    return 'StateOfForm<$T>.initialized()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return initialized(this);
  }
}

abstract class _initialized<T> extends StateOfForm<T> {
  const factory _initialized() = _$_initialized<T>;
  const _initialized._() : super._();
}

/// @nodoc

class _$_validationError<T> extends _validationError<T> {
  const _$_validationError() : super._();

  @override
  String toString() {
    return 'StateOfForm<$T>.validationError()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return validationError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return validationError(this);
  }
}

abstract class _validationError<T> extends StateOfForm<T> {
  const factory _validationError() = _$_validationError<T>;
  const _validationError._() : super._();
}

/// @nodoc

class _$_submitting<T> extends _submitting<T> {
  const _$_submitting([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'StateOfForm<$T>.submitting(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return submitting(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return submitting(this);
  }
}

abstract class _submitting<T> extends StateOfForm<T> {
  const factory _submitting([final String? message]) = _$_submitting<T>;
  const _submitting._() : super._();

  String? get message;
}

/// @nodoc

class _$_success<T> extends _success<T> {
  const _$_success(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'StateOfForm<$T>.success(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) failure,
    required TResult Function() init,
    required TResult Function() initialized,
    required TResult Function() validationError,
    required TResult Function(String? message) submitting,
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? failure,
    TResult Function()? init,
    TResult Function()? initialized,
    TResult Function()? validationError,
    TResult Function(String? message)? submitting,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_validationError<T> value) validationError,
    required TResult Function(_submitting<T> value) submitting,
    required TResult Function(_success<T> value) success,
  }) {
    return success(this);
  }
}

abstract class _success<T> extends StateOfForm<T> {
  const factory _success(final T data) = _$_success<T>;
  const _success._() : super._();

  T get data;
}
