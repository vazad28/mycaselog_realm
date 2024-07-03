// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_of.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StateOf<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_init<T> extends _init<T> {
  const _$_init() : super._();

  @override
  String toString() {
    return 'StateOf<$T>.init()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
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
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return init(this);
  }
}

abstract class _init<T> extends StateOf<T> {
  const factory _init() = _$_init<T>;
  const _init._() : super._();
}

/// @nodoc

class _$_initialized<T> extends _initialized<T> {
  const _$_initialized([this.data]) : super._();

  @override
  final T? data;

  @override
  String toString() {
    return 'StateOf<$T>.initialized(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return initialized(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return initialized(this);
  }
}

abstract class _initialized<T> extends StateOf<T> {
  const factory _initialized([final T? data]) = _$_initialized<T>;
  const _initialized._() : super._();

  T? get data;
}

/// @nodoc

class _$_loading<T> extends _loading<T> {
  const _$_loading([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'StateOf<$T>.loading(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return loading(this);
  }
}

abstract class _loading<T> extends StateOf<T> {
  const factory _loading([final String? message]) = _$_loading<T>;
  const _loading._() : super._();

  String? get message;
}

/// @nodoc

class _$_success<T> extends _success<T> {
  const _$_success(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'StateOf<$T>.success(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
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
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return success(this);
  }
}

abstract class _success<T> extends StateOf<T> {
  const factory _success(final T data) = _$_success<T>;
  const _success._() : super._();

  T get data;
}

/// @nodoc

class _$_failure<T> extends _failure<T> {
  const _$_failure(this.e) : super._();

  @override
  final Exception e;

  @override
  String toString() {
    return 'StateOf<$T>.failure(e: $e)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return failure(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
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
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return failure(this);
  }
}

abstract class _failure<T> extends StateOf<T> {
  const factory _failure(final Exception e) = _$_failure<T>;
  const _failure._() : super._();

  Exception get e;
}

/// @nodoc

class _$_cancelled<T> extends _cancelled<T> {
  const _$_cancelled() : super._();

  @override
  String toString() {
    return 'StateOf<$T>.cancelled()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(T? data) initialized,
    required TResult Function(String? message) loading,
    required TResult Function(T data) success,
    required TResult Function(Exception e) failure,
    required TResult Function() cancelled,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(T? data)? initialized,
    TResult Function(String? message)? loading,
    TResult Function(T data)? success,
    TResult Function(Exception e)? failure,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_initialized<T> value) initialized,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_failure<T> value) failure,
    required TResult Function(_cancelled<T> value) cancelled,
  }) {
    return cancelled(this);
  }
}

abstract class _cancelled<T> extends StateOf<T> {
  const factory _cancelled() = _$_cancelled<T>;
  const _cancelled._() : super._();
}
