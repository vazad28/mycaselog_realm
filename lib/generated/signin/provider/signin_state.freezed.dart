// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../signin/provider/signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SigninAppleSubmitted value) signinAppleSubmitted,
    required TResult Function(_SigninGoogleSubmitted value)
        signinGoogleSubmitted,
    required TResult Function(_SigninFacebookSubmitted value)
        signinFacebookSubmitted,
    required TResult Function(_SigninWithEmailSubmitted value)
        signinWithEmailSubmitted,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$SigninAppleSubmittedImpl implements _SigninAppleSubmitted {
  const _$SigninAppleSubmittedImpl();

  @override
  String toString() {
    return 'SigninEvent.signinAppleSubmitted()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SigninAppleSubmitted value) signinAppleSubmitted,
    required TResult Function(_SigninGoogleSubmitted value)
        signinGoogleSubmitted,
    required TResult Function(_SigninFacebookSubmitted value)
        signinFacebookSubmitted,
    required TResult Function(_SigninWithEmailSubmitted value)
        signinWithEmailSubmitted,
  }) {
    return signinAppleSubmitted(this);
  }
}

abstract class _SigninAppleSubmitted implements SigninEvent {
  const factory _SigninAppleSubmitted() = _$SigninAppleSubmittedImpl;
}

/// @nodoc

class _$SigninGoogleSubmittedImpl implements _SigninGoogleSubmitted {
  const _$SigninGoogleSubmittedImpl();

  @override
  String toString() {
    return 'SigninEvent.signinGoogleSubmitted()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SigninAppleSubmitted value) signinAppleSubmitted,
    required TResult Function(_SigninGoogleSubmitted value)
        signinGoogleSubmitted,
    required TResult Function(_SigninFacebookSubmitted value)
        signinFacebookSubmitted,
    required TResult Function(_SigninWithEmailSubmitted value)
        signinWithEmailSubmitted,
  }) {
    return signinGoogleSubmitted(this);
  }
}

abstract class _SigninGoogleSubmitted implements SigninEvent {
  const factory _SigninGoogleSubmitted() = _$SigninGoogleSubmittedImpl;
}

/// @nodoc

class _$SigninFacebookSubmittedImpl implements _SigninFacebookSubmitted {
  const _$SigninFacebookSubmittedImpl();

  @override
  String toString() {
    return 'SigninEvent.signinFacebookSubmitted()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SigninAppleSubmitted value) signinAppleSubmitted,
    required TResult Function(_SigninGoogleSubmitted value)
        signinGoogleSubmitted,
    required TResult Function(_SigninFacebookSubmitted value)
        signinFacebookSubmitted,
    required TResult Function(_SigninWithEmailSubmitted value)
        signinWithEmailSubmitted,
  }) {
    return signinFacebookSubmitted(this);
  }
}

abstract class _SigninFacebookSubmitted implements SigninEvent {
  const factory _SigninFacebookSubmitted() = _$SigninFacebookSubmittedImpl;
}

/// @nodoc

class _$SigninWithEmailSubmittedImpl implements _SigninWithEmailSubmitted {
  const _$SigninWithEmailSubmittedImpl();

  @override
  String toString() {
    return 'SigninEvent.signinWithEmailSubmitted()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SigninAppleSubmitted value) signinAppleSubmitted,
    required TResult Function(_SigninGoogleSubmitted value)
        signinGoogleSubmitted,
    required TResult Function(_SigninFacebookSubmitted value)
        signinFacebookSubmitted,
    required TResult Function(_SigninWithEmailSubmitted value)
        signinWithEmailSubmitted,
  }) {
    return signinWithEmailSubmitted(this);
  }
}

abstract class _SigninWithEmailSubmitted implements SigninEvent {
  const factory _SigninWithEmailSubmitted() = _$SigninWithEmailSubmittedImpl;
}

/// @nodoc
mixin _$SigninState {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SigninState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }
}

abstract class _Initial implements SigninState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SigninState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }
}

abstract class _Loading implements SigninState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'SigninState.success()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }
}

abstract class _Success implements SigninState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc

class _$CancelledImpl implements _Cancelled {
  const _$CancelledImpl();

  @override
  String toString() {
    return 'SigninState.cancelled()';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) {
    return cancelled(this);
  }
}

abstract class _Cancelled implements SigninState {
  const factory _Cancelled() = _$CancelledImpl;
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final Exception error;

  @override
  String toString() {
    return 'SigninState.failure(error: $error)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Cancelled value) cancelled,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }
}

abstract class _Failure implements SigninState {
  const factory _Failure(final Exception error) = _$FailureImpl;

  Exception get error;
}
