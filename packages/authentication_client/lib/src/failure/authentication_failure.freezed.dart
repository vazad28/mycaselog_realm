// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationFailure {
  Object? get error => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationFailureCopyWith<AuthenticationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationFailureCopyWith<$Res> {
  factory $AuthenticationFailureCopyWith(AuthenticationFailure value,
          $Res Function(AuthenticationFailure) then) =
      _$AuthenticationFailureCopyWithImpl<$Res, AuthenticationFailure>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class _$AuthenticationFailureCopyWithImpl<$Res,
        $Val extends AuthenticationFailure>
    implements $AuthenticationFailureCopyWith<$Res> {
  _$AuthenticationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendLoginEmailLinkFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$SendLoginEmailLinkFailureImplCopyWith(
          _$SendLoginEmailLinkFailureImpl value,
          $Res Function(_$SendLoginEmailLinkFailureImpl) then) =
      __$$SendLoginEmailLinkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SendLoginEmailLinkFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$SendLoginEmailLinkFailureImpl>
    implements _$$SendLoginEmailLinkFailureImplCopyWith<$Res> {
  __$$SendLoginEmailLinkFailureImplCopyWithImpl(
      _$SendLoginEmailLinkFailureImpl _value,
      $Res Function(_$SendLoginEmailLinkFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SendLoginEmailLinkFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SendLoginEmailLinkFailureImpl extends SendLoginEmailLinkFailure {
  const _$SendLoginEmailLinkFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.sendLoginEmailLinkFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendLoginEmailLinkFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendLoginEmailLinkFailureImplCopyWith<_$SendLoginEmailLinkFailureImpl>
      get copyWith => __$$SendLoginEmailLinkFailureImplCopyWithImpl<
          _$SendLoginEmailLinkFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (sendLoginEmailLinkFailure != null) {
      return sendLoginEmailLinkFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return sendLoginEmailLinkFailure(this);
  }
}

abstract class SendLoginEmailLinkFailure extends AuthenticationFailure {
  const factory SendLoginEmailLinkFailure(final Object? error) =
      _$SendLoginEmailLinkFailureImpl;
  const SendLoginEmailLinkFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$SendLoginEmailLinkFailureImplCopyWith<_$SendLoginEmailLinkFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogInWithEmailLinkFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$LogInWithEmailLinkFailureImplCopyWith(
          _$LogInWithEmailLinkFailureImpl value,
          $Res Function(_$LogInWithEmailLinkFailureImpl) then) =
      __$$LogInWithEmailLinkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$LogInWithEmailLinkFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$LogInWithEmailLinkFailureImpl>
    implements _$$LogInWithEmailLinkFailureImplCopyWith<$Res> {
  __$$LogInWithEmailLinkFailureImplCopyWithImpl(
      _$LogInWithEmailLinkFailureImpl _value,
      $Res Function(_$LogInWithEmailLinkFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$LogInWithEmailLinkFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$LogInWithEmailLinkFailureImpl extends LogInWithEmailLinkFailure {
  const _$LogInWithEmailLinkFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.signInInWithEmailLinkFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInWithEmailLinkFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInWithEmailLinkFailureImplCopyWith<_$LogInWithEmailLinkFailureImpl>
      get copyWith => __$$LogInWithEmailLinkFailureImplCopyWithImpl<
          _$LogInWithEmailLinkFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (signInInWithEmailLinkFailure != null) {
      return signInInWithEmailLinkFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return signInInWithEmailLinkFailure(this);
  }
}

abstract class LogInWithEmailLinkFailure extends AuthenticationFailure {
  const factory LogInWithEmailLinkFailure(final Object? error) =
      _$LogInWithEmailLinkFailureImpl;
  const LogInWithEmailLinkFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$LogInWithEmailLinkFailureImplCopyWith<_$LogInWithEmailLinkFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailPasswordSignInFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$EmailPasswordSignInFailureImplCopyWith(
          _$EmailPasswordSignInFailureImpl value,
          $Res Function(_$EmailPasswordSignInFailureImpl) then) =
      __$$EmailPasswordSignInFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$EmailPasswordSignInFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$EmailPasswordSignInFailureImpl>
    implements _$$EmailPasswordSignInFailureImplCopyWith<$Res> {
  __$$EmailPasswordSignInFailureImplCopyWithImpl(
      _$EmailPasswordSignInFailureImpl _value,
      $Res Function(_$EmailPasswordSignInFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$EmailPasswordSignInFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$EmailPasswordSignInFailureImpl extends EmailPasswordSignInFailure {
  const _$EmailPasswordSignInFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.emailPasswordSignInFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPasswordSignInFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailPasswordSignInFailureImplCopyWith<_$EmailPasswordSignInFailureImpl>
      get copyWith => __$$EmailPasswordSignInFailureImplCopyWithImpl<
          _$EmailPasswordSignInFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (emailPasswordSignInFailure != null) {
      return emailPasswordSignInFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return emailPasswordSignInFailure(this);
  }
}

abstract class EmailPasswordSignInFailure extends AuthenticationFailure {
  const factory EmailPasswordSignInFailure(final Object? error) =
      _$EmailPasswordSignInFailureImpl;
  const EmailPasswordSignInFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$EmailPasswordSignInFailureImplCopyWith<_$EmailPasswordSignInFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppleSignInFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$AppleSignInFailureImplCopyWith(_$AppleSignInFailureImpl value,
          $Res Function(_$AppleSignInFailureImpl) then) =
      __$$AppleSignInFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$AppleSignInFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res, _$AppleSignInFailureImpl>
    implements _$$AppleSignInFailureImplCopyWith<$Res> {
  __$$AppleSignInFailureImplCopyWithImpl(_$AppleSignInFailureImpl _value,
      $Res Function(_$AppleSignInFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AppleSignInFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$AppleSignInFailureImpl extends AppleSignInFailure {
  const _$AppleSignInFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.appleSignInFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleSignInFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleSignInFailureImplCopyWith<_$AppleSignInFailureImpl> get copyWith =>
      __$$AppleSignInFailureImplCopyWithImpl<_$AppleSignInFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (appleSignInFailure != null) {
      return appleSignInFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return appleSignInFailure(this);
  }
}

abstract class AppleSignInFailure extends AuthenticationFailure {
  const factory AppleSignInFailure(final Object? error) =
      _$AppleSignInFailureImpl;
  const AppleSignInFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$AppleSignInFailureImplCopyWith<_$AppleSignInFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleSignInFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$GoogleSignInFailureImplCopyWith(_$GoogleSignInFailureImpl value,
          $Res Function(_$GoogleSignInFailureImpl) then) =
      __$$GoogleSignInFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$GoogleSignInFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res, _$GoogleSignInFailureImpl>
    implements _$$GoogleSignInFailureImplCopyWith<$Res> {
  __$$GoogleSignInFailureImplCopyWithImpl(_$GoogleSignInFailureImpl _value,
      $Res Function(_$GoogleSignInFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$GoogleSignInFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$GoogleSignInFailureImpl extends GoogleSignInFailure {
  const _$GoogleSignInFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.googleSignInFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInFailureImplCopyWith<_$GoogleSignInFailureImpl> get copyWith =>
      __$$GoogleSignInFailureImplCopyWithImpl<_$GoogleSignInFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (googleSignInFailure != null) {
      return googleSignInFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return googleSignInFailure(this);
  }
}

abstract class GoogleSignInFailure extends AuthenticationFailure {
  const factory GoogleSignInFailure(final Object? error) =
      _$GoogleSignInFailureImpl;
  const GoogleSignInFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$GoogleSignInFailureImplCopyWith<_$GoogleSignInFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FacebookSignInFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$FacebookSignInFailureImplCopyWith(
          _$FacebookSignInFailureImpl value,
          $Res Function(_$FacebookSignInFailureImpl) then) =
      __$$FacebookSignInFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$FacebookSignInFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$FacebookSignInFailureImpl>
    implements _$$FacebookSignInFailureImplCopyWith<$Res> {
  __$$FacebookSignInFailureImplCopyWithImpl(_$FacebookSignInFailureImpl _value,
      $Res Function(_$FacebookSignInFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FacebookSignInFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$FacebookSignInFailureImpl extends FacebookSignInFailure {
  const _$FacebookSignInFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.facebookSignInFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookSignInFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacebookSignInFailureImplCopyWith<_$FacebookSignInFailureImpl>
      get copyWith => __$$FacebookSignInFailureImplCopyWithImpl<
          _$FacebookSignInFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (facebookSignInFailure != null) {
      return facebookSignInFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return facebookSignInFailure(this);
  }
}

abstract class FacebookSignInFailure extends AuthenticationFailure {
  const factory FacebookSignInFailure(final Object? error) =
      _$FacebookSignInFailureImpl;
  const FacebookSignInFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$FacebookSignInFailureImplCopyWith<_$FacebookSignInFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TwitterSignInFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$TwitterSignInFailureImplCopyWith(_$TwitterSignInFailureImpl value,
          $Res Function(_$TwitterSignInFailureImpl) then) =
      __$$TwitterSignInFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$TwitterSignInFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$TwitterSignInFailureImpl>
    implements _$$TwitterSignInFailureImplCopyWith<$Res> {
  __$$TwitterSignInFailureImplCopyWithImpl(_$TwitterSignInFailureImpl _value,
      $Res Function(_$TwitterSignInFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$TwitterSignInFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$TwitterSignInFailureImpl extends TwitterSignInFailure {
  const _$TwitterSignInFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.twitterSignInFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwitterSignInFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TwitterSignInFailureImplCopyWith<_$TwitterSignInFailureImpl>
      get copyWith =>
          __$$TwitterSignInFailureImplCopyWithImpl<_$TwitterSignInFailureImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (twitterSignInFailure != null) {
      return twitterSignInFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return twitterSignInFailure(this);
  }
}

abstract class TwitterSignInFailure extends AuthenticationFailure {
  const factory TwitterSignInFailure(final Object? error) =
      _$TwitterSignInFailureImpl;
  const TwitterSignInFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$TwitterSignInFailureImplCopyWith<_$TwitterSignInFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInCancelledImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$SignInCancelledImplCopyWith(_$SignInCancelledImpl value,
          $Res Function(_$SignInCancelledImpl) then) =
      __$$SignInCancelledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SignInCancelledImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res, _$SignInCancelledImpl>
    implements _$$SignInCancelledImplCopyWith<$Res> {
  __$$SignInCancelledImplCopyWithImpl(
      _$SignInCancelledImpl _value, $Res Function(_$SignInCancelledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SignInCancelledImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SignInCancelledImpl extends SignInCancelled {
  const _$SignInCancelledImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.signInCancelled(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInCancelledImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInCancelledImplCopyWith<_$SignInCancelledImpl> get copyWith =>
      __$$SignInCancelledImplCopyWithImpl<_$SignInCancelledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (signInCancelled != null) {
      return signInCancelled(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return signInCancelled(this);
  }
}

abstract class SignInCancelled extends AuthenticationFailure {
  const factory SignInCancelled(final Object? error) = _$SignInCancelledImpl;
  const SignInCancelled._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$SignInCancelledImplCopyWith<_$SignInCancelledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$SignOutFailureImplCopyWith(_$SignOutFailureImpl value,
          $Res Function(_$SignOutFailureImpl) then) =
      __$$SignOutFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$SignOutFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res, _$SignOutFailureImpl>
    implements _$$SignOutFailureImplCopyWith<$Res> {
  __$$SignOutFailureImplCopyWithImpl(
      _$SignOutFailureImpl _value, $Res Function(_$SignOutFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SignOutFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SignOutFailureImpl extends SignOutFailure {
  const _$SignOutFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.signOutFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutFailureImplCopyWith<_$SignOutFailureImpl> get copyWith =>
      __$$SignOutFailureImplCopyWithImpl<_$SignOutFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (signOutFailure != null) {
      return signOutFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return signOutFailure(this);
  }
}

abstract class SignOutFailure extends AuthenticationFailure {
  const factory SignOutFailure(final Object? error) = _$SignOutFailureImpl;
  const SignOutFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$SignOutFailureImplCopyWith<_$SignOutFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasscodeUpdateFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$PasscodeUpdateFailureImplCopyWith(
          _$PasscodeUpdateFailureImpl value,
          $Res Function(_$PasscodeUpdateFailureImpl) then) =
      __$$PasscodeUpdateFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$PasscodeUpdateFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$PasscodeUpdateFailureImpl>
    implements _$$PasscodeUpdateFailureImplCopyWith<$Res> {
  __$$PasscodeUpdateFailureImplCopyWithImpl(_$PasscodeUpdateFailureImpl _value,
      $Res Function(_$PasscodeUpdateFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PasscodeUpdateFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$PasscodeUpdateFailureImpl extends PasscodeUpdateFailure {
  const _$PasscodeUpdateFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.passcodeUpdateFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeUpdateFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasscodeUpdateFailureImplCopyWith<_$PasscodeUpdateFailureImpl>
      get copyWith => __$$PasscodeUpdateFailureImplCopyWithImpl<
          _$PasscodeUpdateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (passcodeUpdateFailure != null) {
      return passcodeUpdateFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return passcodeUpdateFailure(this);
  }
}

abstract class PasscodeUpdateFailure extends AuthenticationFailure {
  const factory PasscodeUpdateFailure(final Object? error) =
      _$PasscodeUpdateFailureImpl;
  const PasscodeUpdateFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$PasscodeUpdateFailureImplCopyWith<_$PasscodeUpdateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAppOpenedCountFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$FetchAppOpenedCountFailureImplCopyWith(
          _$FetchAppOpenedCountFailureImpl value,
          $Res Function(_$FetchAppOpenedCountFailureImpl) then) =
      __$$FetchAppOpenedCountFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$FetchAppOpenedCountFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$FetchAppOpenedCountFailureImpl>
    implements _$$FetchAppOpenedCountFailureImplCopyWith<$Res> {
  __$$FetchAppOpenedCountFailureImplCopyWithImpl(
      _$FetchAppOpenedCountFailureImpl _value,
      $Res Function(_$FetchAppOpenedCountFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FetchAppOpenedCountFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$FetchAppOpenedCountFailureImpl extends FetchAppOpenedCountFailure {
  const _$FetchAppOpenedCountFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.fetchAppOpenedCountFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAppOpenedCountFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAppOpenedCountFailureImplCopyWith<_$FetchAppOpenedCountFailureImpl>
      get copyWith => __$$FetchAppOpenedCountFailureImplCopyWithImpl<
          _$FetchAppOpenedCountFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (fetchAppOpenedCountFailure != null) {
      return fetchAppOpenedCountFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return fetchAppOpenedCountFailure(this);
  }
}

abstract class FetchAppOpenedCountFailure extends AuthenticationFailure {
  const factory FetchAppOpenedCountFailure(final Object? error) =
      _$FetchAppOpenedCountFailureImpl;
  const FetchAppOpenedCountFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$FetchAppOpenedCountFailureImplCopyWith<_$FetchAppOpenedCountFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementAppOpenedCountFailureImplCopyWith<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  factory _$$IncrementAppOpenedCountFailureImplCopyWith(
          _$IncrementAppOpenedCountFailureImpl value,
          $Res Function(_$IncrementAppOpenedCountFailureImpl) then) =
      __$$IncrementAppOpenedCountFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$IncrementAppOpenedCountFailureImplCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res,
        _$IncrementAppOpenedCountFailureImpl>
    implements _$$IncrementAppOpenedCountFailureImplCopyWith<$Res> {
  __$$IncrementAppOpenedCountFailureImplCopyWithImpl(
      _$IncrementAppOpenedCountFailureImpl _value,
      $Res Function(_$IncrementAppOpenedCountFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$IncrementAppOpenedCountFailureImpl(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$IncrementAppOpenedCountFailureImpl
    extends IncrementAppOpenedCountFailure {
  const _$IncrementAppOpenedCountFailureImpl(this.error) : super._();

  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthenticationFailure.incrementAppOpenedCountFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementAppOpenedCountFailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementAppOpenedCountFailureImplCopyWith<
          _$IncrementAppOpenedCountFailureImpl>
      get copyWith => __$$IncrementAppOpenedCountFailureImplCopyWithImpl<
          _$IncrementAppOpenedCountFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error)? sendLoginEmailLinkFailure,
    TResult Function(Object? error)? signInInWithEmailLinkFailure,
    TResult Function(Object? error)? emailPasswordSignInFailure,
    TResult Function(Object? error)? appleSignInFailure,
    TResult Function(Object? error)? googleSignInFailure,
    TResult Function(Object? error)? facebookSignInFailure,
    TResult Function(Object? error)? twitterSignInFailure,
    TResult Function(Object? error)? signInCancelled,
    TResult Function(Object? error)? signOutFailure,
    TResult Function(Object? error)? passcodeUpdateFailure,
    TResult Function(Object? error)? fetchAppOpenedCountFailure,
    TResult Function(Object? error)? incrementAppOpenedCountFailure,
    required TResult orElse(),
  }) {
    if (incrementAppOpenedCountFailure != null) {
      return incrementAppOpenedCountFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendLoginEmailLinkFailure value)
        sendLoginEmailLinkFailure,
    required TResult Function(LogInWithEmailLinkFailure value)
        signInInWithEmailLinkFailure,
    required TResult Function(EmailPasswordSignInFailure value)
        emailPasswordSignInFailure,
    required TResult Function(AppleSignInFailure value) appleSignInFailure,
    required TResult Function(GoogleSignInFailure value) googleSignInFailure,
    required TResult Function(FacebookSignInFailure value)
        facebookSignInFailure,
    required TResult Function(TwitterSignInFailure value) twitterSignInFailure,
    required TResult Function(SignInCancelled value) signInCancelled,
    required TResult Function(SignOutFailure value) signOutFailure,
    required TResult Function(PasscodeUpdateFailure value)
        passcodeUpdateFailure,
    required TResult Function(FetchAppOpenedCountFailure value)
        fetchAppOpenedCountFailure,
    required TResult Function(IncrementAppOpenedCountFailure value)
        incrementAppOpenedCountFailure,
  }) {
    return incrementAppOpenedCountFailure(this);
  }
}

abstract class IncrementAppOpenedCountFailure extends AuthenticationFailure {
  const factory IncrementAppOpenedCountFailure(final Object? error) =
      _$IncrementAppOpenedCountFailureImpl;
  const IncrementAppOpenedCountFailure._() : super._();

  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$IncrementAppOpenedCountFailureImplCopyWith<
          _$IncrementAppOpenedCountFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
