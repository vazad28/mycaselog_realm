// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../core/failures/app_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CredentialsExistFailureImplCopyWith<$Res> {
  factory _$$CredentialsExistFailureImplCopyWith(
          _$CredentialsExistFailureImpl value,
          $Res Function(_$CredentialsExistFailureImpl) then) =
      __$$CredentialsExistFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CredentialsExistFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$CredentialsExistFailureImpl>
    implements _$$CredentialsExistFailureImplCopyWith<$Res> {
  __$$CredentialsExistFailureImplCopyWithImpl(
      _$CredentialsExistFailureImpl _value,
      $Res Function(_$CredentialsExistFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CredentialsExistFailureImpl extends CredentialsExistFailure {
  const _$CredentialsExistFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.credentialsExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsExistFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (credentialsExist != null) {
      return credentialsExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return credentialsExist(this);
  }
}

abstract class CredentialsExistFailure extends AppFailure {
  const factory CredentialsExistFailure() = _$CredentialsExistFailureImpl;
  const CredentialsExistFailure._() : super._();
}

/// @nodoc
abstract class _$$CredentialsUserMismatchFailureImplCopyWith<$Res> {
  factory _$$CredentialsUserMismatchFailureImplCopyWith(
          _$CredentialsUserMismatchFailureImpl value,
          $Res Function(_$CredentialsUserMismatchFailureImpl) then) =
      __$$CredentialsUserMismatchFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CredentialsUserMismatchFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$CredentialsUserMismatchFailureImpl>
    implements _$$CredentialsUserMismatchFailureImplCopyWith<$Res> {
  __$$CredentialsUserMismatchFailureImplCopyWithImpl(
      _$CredentialsUserMismatchFailureImpl _value,
      $Res Function(_$CredentialsUserMismatchFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CredentialsUserMismatchFailureImpl
    extends CredentialsUserMismatchFailure {
  const _$CredentialsUserMismatchFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.credentialsUserMismatch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsUserMismatchFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (credentialsUserMismatch != null) {
      return credentialsUserMismatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return credentialsUserMismatch(this);
  }
}

abstract class CredentialsUserMismatchFailure extends AppFailure {
  const factory CredentialsUserMismatchFailure() =
      _$CredentialsUserMismatchFailureImpl;
  const CredentialsUserMismatchFailure._() : super._();
}

/// @nodoc
abstract class _$$CustomFailureImplCopyWith<$Res> {
  factory _$$CustomFailureImplCopyWith(
          _$CustomFailureImpl value, $Res Function(_$CustomFailureImpl) then) =
      __$$CustomFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? err});
}

/// @nodoc
class __$$CustomFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$CustomFailureImpl>
    implements _$$CustomFailureImplCopyWith<$Res> {
  __$$CustomFailureImplCopyWithImpl(
      _$CustomFailureImpl _value, $Res Function(_$CustomFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$CustomFailureImpl(
      freezed == err ? _value.err : err,
    ));
  }
}

/// @nodoc

class _$CustomFailureImpl extends CustomFailure {
  const _$CustomFailureImpl(this.err) : super._();

  @override
  final Object? err;

  @override
  String toString() {
    return 'AppFailure.generic(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFailureImpl &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFailureImplCopyWith<_$CustomFailureImpl> get copyWith =>
      __$$CustomFailureImplCopyWithImpl<_$CustomFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (generic != null) {
      return generic(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return generic(this);
  }
}

abstract class CustomFailure extends AppFailure {
  const factory CustomFailure(final Object? err) = _$CustomFailureImpl;
  const CustomFailure._() : super._();

  Object? get err;
  @JsonKey(ignore: true)
  _$$CustomFailureImplCopyWith<_$CustomFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppFailureFromFailureImplCopyWith<$Res> {
  factory _$$AppFailureFromFailureImplCopyWith(
          _$AppFailureFromFailureImpl value,
          $Res Function(_$AppFailureFromFailureImpl) then) =
      __$$AppFailureFromFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$AppFailureFromFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$AppFailureFromFailureImpl>
    implements _$$AppFailureFromFailureImplCopyWith<$Res> {
  __$$AppFailureFromFailureImplCopyWithImpl(_$AppFailureFromFailureImpl _value,
      $Res Function(_$AppFailureFromFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$AppFailureFromFailureImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$AppFailureFromFailureImpl extends AppFailureFromFailure {
  const _$AppFailureFromFailureImpl(this.exception) : super._();

  @override
  final Exception exception;

  @override
  String toString() {
    return 'AppFailure.fromException(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFailureFromFailureImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppFailureFromFailureImplCopyWith<_$AppFailureFromFailureImpl>
      get copyWith => __$$AppFailureFromFailureImplCopyWithImpl<
          _$AppFailureFromFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (fromException != null) {
      return fromException(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return fromException(this);
  }
}

abstract class AppFailureFromFailure extends AppFailure {
  const factory AppFailureFromFailure(final Exception exception) =
      _$AppFailureFromFailureImpl;
  const AppFailureFromFailure._() : super._();

  Exception get exception;
  @JsonKey(ignore: true)
  _$$AppFailureFromFailureImplCopyWith<_$AppFailureFromFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecryptionFailureImplCopyWith<$Res> {
  factory _$$DecryptionFailureImplCopyWith(_$DecryptionFailureImpl value,
          $Res Function(_$DecryptionFailureImpl) then) =
      __$$DecryptionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecryptionFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$DecryptionFailureImpl>
    implements _$$DecryptionFailureImplCopyWith<$Res> {
  __$$DecryptionFailureImplCopyWithImpl(_$DecryptionFailureImpl _value,
      $Res Function(_$DecryptionFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DecryptionFailureImpl extends DecryptionFailure {
  const _$DecryptionFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.decryption()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DecryptionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (decryption != null) {
      return decryption();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return decryption(this);
  }
}

abstract class DecryptionFailure extends AppFailure {
  const factory DecryptionFailure() = _$DecryptionFailureImpl;
  const DecryptionFailure._() : super._();
}

/// @nodoc
abstract class _$$DeviceHasAnotherAccountFailureImplCopyWith<$Res> {
  factory _$$DeviceHasAnotherAccountFailureImplCopyWith(
          _$DeviceHasAnotherAccountFailureImpl value,
          $Res Function(_$DeviceHasAnotherAccountFailureImpl) then) =
      __$$DeviceHasAnotherAccountFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceHasAnotherAccountFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$DeviceHasAnotherAccountFailureImpl>
    implements _$$DeviceHasAnotherAccountFailureImplCopyWith<$Res> {
  __$$DeviceHasAnotherAccountFailureImplCopyWithImpl(
      _$DeviceHasAnotherAccountFailureImpl _value,
      $Res Function(_$DeviceHasAnotherAccountFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceHasAnotherAccountFailureImpl
    extends DeviceHasAnotherAccountFailure {
  const _$DeviceHasAnotherAccountFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.deviceHasAnotherAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceHasAnotherAccountFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (deviceHasAnotherAccount != null) {
      return deviceHasAnotherAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return deviceHasAnotherAccount(this);
  }
}

abstract class DeviceHasAnotherAccountFailure extends AppFailure {
  const factory DeviceHasAnotherAccountFailure() =
      _$DeviceHasAnotherAccountFailureImpl;
  const DeviceHasAnotherAccountFailure._() : super._();
}

/// @nodoc
abstract class _$$EncryptionFailureImplCopyWith<$Res> {
  factory _$$EncryptionFailureImplCopyWith(_$EncryptionFailureImpl value,
          $Res Function(_$EncryptionFailureImpl) then) =
      __$$EncryptionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EncryptionFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$EncryptionFailureImpl>
    implements _$$EncryptionFailureImplCopyWith<$Res> {
  __$$EncryptionFailureImplCopyWithImpl(_$EncryptionFailureImpl _value,
      $Res Function(_$EncryptionFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EncryptionFailureImpl extends EncryptionFailure {
  const _$EncryptionFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.encryption()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EncryptionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (encryption != null) {
      return encryption();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return encryption(this);
  }
}

abstract class EncryptionFailure extends AppFailure {
  const factory EncryptionFailure() = _$EncryptionFailureImpl;
  const EncryptionFailure._() : super._();
}

/// @nodoc
abstract class _$$NoStatsDataImplCopyWith<$Res> {
  factory _$$NoStatsDataImplCopyWith(
          _$NoStatsDataImpl value, $Res Function(_$NoStatsDataImpl) then) =
      __$$NoStatsDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoStatsDataImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NoStatsDataImpl>
    implements _$$NoStatsDataImplCopyWith<$Res> {
  __$$NoStatsDataImplCopyWithImpl(
      _$NoStatsDataImpl _value, $Res Function(_$NoStatsDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoStatsDataImpl extends NoStatsData {
  const _$NoStatsDataImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.noStatsData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoStatsDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
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
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return noStatsData(this);
  }
}

abstract class NoStatsData extends AppFailure {
  const factory NoStatsData() = _$NoStatsDataImpl;
  const NoStatsData._() : super._();
}

/// @nodoc
abstract class _$$FileNotFoundFailureImplCopyWith<$Res> {
  factory _$$FileNotFoundFailureImplCopyWith(_$FileNotFoundFailureImpl value,
          $Res Function(_$FileNotFoundFailureImpl) then) =
      __$$FileNotFoundFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FileNotFoundFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$FileNotFoundFailureImpl>
    implements _$$FileNotFoundFailureImplCopyWith<$Res> {
  __$$FileNotFoundFailureImplCopyWithImpl(_$FileNotFoundFailureImpl _value,
      $Res Function(_$FileNotFoundFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FileNotFoundFailureImpl extends FileNotFoundFailure {
  const _$FileNotFoundFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.fileNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileNotFoundFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return fileNotFound(this);
  }
}

abstract class FileNotFoundFailure extends AppFailure {
  const factory FileNotFoundFailure() = _$FileNotFoundFailureImpl;
  const FileNotFoundFailure._() : super._();
}

/// @nodoc
abstract class _$$FirebaseFailureImplCopyWith<$Res> {
  factory _$$FirebaseFailureImplCopyWith(_$FirebaseFailureImpl value,
          $Res Function(_$FirebaseFailureImpl) then) =
      __$$FirebaseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseException err});
}

/// @nodoc
class __$$FirebaseFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$FirebaseFailureImpl>
    implements _$$FirebaseFailureImplCopyWith<$Res> {
  __$$FirebaseFailureImplCopyWithImpl(
      _$FirebaseFailureImpl _value, $Res Function(_$FirebaseFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$FirebaseFailureImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as FirebaseException,
    ));
  }
}

/// @nodoc

class _$FirebaseFailureImpl extends _FirebaseFailure {
  const _$FirebaseFailureImpl(this.err) : super._();

  @override
  final FirebaseException err;

  @override
  String toString() {
    return 'AppFailure.firebase(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseFailureImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseFailureImplCopyWith<_$FirebaseFailureImpl> get copyWith =>
      __$$FirebaseFailureImplCopyWithImpl<_$FirebaseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return firebase(this);
  }
}

abstract class _FirebaseFailure extends AppFailure {
  const factory _FirebaseFailure(final FirebaseException err) =
      _$FirebaseFailureImpl;
  const _FirebaseFailure._() : super._();

  FirebaseException get err;
  @JsonKey(ignore: true)
  _$$FirebaseFailureImplCopyWith<_$FirebaseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MissingCredsOnServerFailureImplCopyWith<$Res> {
  factory _$$MissingCredsOnServerFailureImplCopyWith(
          _$MissingCredsOnServerFailureImpl value,
          $Res Function(_$MissingCredsOnServerFailureImpl) then) =
      __$$MissingCredsOnServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MissingCredsOnServerFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$MissingCredsOnServerFailureImpl>
    implements _$$MissingCredsOnServerFailureImplCopyWith<$Res> {
  __$$MissingCredsOnServerFailureImplCopyWithImpl(
      _$MissingCredsOnServerFailureImpl _value,
      $Res Function(_$MissingCredsOnServerFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MissingCredsOnServerFailureImpl extends MissingCredsOnServerFailure {
  const _$MissingCredsOnServerFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.missingCredsOnServer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingCredsOnServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (missingCredsOnServer != null) {
      return missingCredsOnServer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return missingCredsOnServer(this);
  }
}

abstract class MissingCredsOnServerFailure extends AppFailure {
  const factory MissingCredsOnServerFailure() =
      _$MissingCredsOnServerFailureImpl;
  const MissingCredsOnServerFailure._() : super._();
}

/// @nodoc
abstract class _$$MissingFormDataFailureImplCopyWith<$Res> {
  factory _$$MissingFormDataFailureImplCopyWith(
          _$MissingFormDataFailureImpl value,
          $Res Function(_$MissingFormDataFailureImpl) then) =
      __$$MissingFormDataFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MissingFormDataFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$MissingFormDataFailureImpl>
    implements _$$MissingFormDataFailureImplCopyWith<$Res> {
  __$$MissingFormDataFailureImplCopyWithImpl(
      _$MissingFormDataFailureImpl _value,
      $Res Function(_$MissingFormDataFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MissingFormDataFailureImpl extends MissingFormDataFailure {
  const _$MissingFormDataFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.missingFormData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingFormDataFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (missingFormData != null) {
      return missingFormData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return missingFormData(this);
  }
}

abstract class MissingFormDataFailure extends AppFailure {
  const factory MissingFormDataFailure() = _$MissingFormDataFailureImpl;
  const MissingFormDataFailure._() : super._();
}

/// @nodoc
abstract class _$$FormHasErrorFailureImplCopyWith<$Res> {
  factory _$$FormHasErrorFailureImplCopyWith(_$FormHasErrorFailureImpl value,
          $Res Function(_$FormHasErrorFailureImpl) then) =
      __$$FormHasErrorFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormHasErrorFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$FormHasErrorFailureImpl>
    implements _$$FormHasErrorFailureImplCopyWith<$Res> {
  __$$FormHasErrorFailureImplCopyWithImpl(_$FormHasErrorFailureImpl _value,
      $Res Function(_$FormHasErrorFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormHasErrorFailureImpl extends FormHasErrorFailure {
  const _$FormHasErrorFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.formHasError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormHasErrorFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (formHasError != null) {
      return formHasError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return formHasError(this);
  }
}

abstract class FormHasErrorFailure extends AppFailure {
  const factory FormHasErrorFailure() = _$FormHasErrorFailureImpl;
  const FormHasErrorFailure._() : super._();
}

/// @nodoc
abstract class _$$MissingDataFailureImplCopyWith<$Res> {
  factory _$$MissingDataFailureImplCopyWith(_$MissingDataFailureImpl value,
          $Res Function(_$MissingDataFailureImpl) then) =
      __$$MissingDataFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MissingDataFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$MissingDataFailureImpl>
    implements _$$MissingDataFailureImplCopyWith<$Res> {
  __$$MissingDataFailureImplCopyWithImpl(_$MissingDataFailureImpl _value,
      $Res Function(_$MissingDataFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MissingDataFailureImpl extends MissingDataFailure {
  const _$MissingDataFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.missingData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MissingDataFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (missingData != null) {
      return missingData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return missingData(this);
  }
}

abstract class MissingDataFailure extends AppFailure {
  const factory MissingDataFailure() = _$MissingDataFailureImpl;
  const MissingDataFailure._() : super._();
}

/// @nodoc
abstract class _$$NoCollectionFailureImplCopyWith<$Res> {
  factory _$$NoCollectionFailureImplCopyWith(_$NoCollectionFailureImpl value,
          $Res Function(_$NoCollectionFailureImpl) then) =
      __$$NoCollectionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoCollectionFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NoCollectionFailureImpl>
    implements _$$NoCollectionFailureImplCopyWith<$Res> {
  __$$NoCollectionFailureImplCopyWithImpl(_$NoCollectionFailureImpl _value,
      $Res Function(_$NoCollectionFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoCollectionFailureImpl extends NoCollectionFailure {
  const _$NoCollectionFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoCollectionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
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
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return noConnection(this);
  }
}

abstract class NoCollectionFailure extends AppFailure {
  const factory NoCollectionFailure() = _$NoCollectionFailureImpl;
  const NoCollectionFailure._() : super._();
}

/// @nodoc
abstract class _$$PlatformFailureImplCopyWith<$Res> {
  factory _$$PlatformFailureImplCopyWith(_$PlatformFailureImpl value,
          $Res Function(_$PlatformFailureImpl) then) =
      __$$PlatformFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformException err});
}

/// @nodoc
class __$$PlatformFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$PlatformFailureImpl>
    implements _$$PlatformFailureImplCopyWith<$Res> {
  __$$PlatformFailureImplCopyWithImpl(
      _$PlatformFailureImpl _value, $Res Function(_$PlatformFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$PlatformFailureImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as PlatformException,
    ));
  }
}

/// @nodoc

class _$PlatformFailureImpl extends PlatformFailure {
  const _$PlatformFailureImpl(this.err) : super._();

  @override
  final PlatformException err;

  @override
  String toString() {
    return 'AppFailure.platform(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformFailureImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformFailureImplCopyWith<_$PlatformFailureImpl> get copyWith =>
      __$$PlatformFailureImplCopyWithImpl<_$PlatformFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (platform != null) {
      return platform(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return platform(this);
  }
}

abstract class PlatformFailure extends AppFailure {
  const factory PlatformFailure(final PlatformException err) =
      _$PlatformFailureImpl;
  const PlatformFailure._() : super._();

  PlatformException get err;
  @JsonKey(ignore: true)
  _$$PlatformFailureImplCopyWith<_$PlatformFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(_$UnknownFailureImpl value,
          $Res Function(_$UnknownFailureImpl) then) =
      __$$UnknownFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
      _$UnknownFailureImpl _value, $Res Function(_$UnknownFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownFailureImpl extends UnknownFailure {
  const _$UnknownFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return unknown(this);
  }
}

abstract class UnknownFailure extends AppFailure {
  const factory UnknownFailure() = _$UnknownFailureImpl;
  const UnknownFailure._() : super._();
}

/// @nodoc
abstract class _$$UserEmailNotVerifiedImplCopyWith<$Res> {
  factory _$$UserEmailNotVerifiedImplCopyWith(_$UserEmailNotVerifiedImpl value,
          $Res Function(_$UserEmailNotVerifiedImpl) then) =
      __$$UserEmailNotVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmailNotVerifiedImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UserEmailNotVerifiedImpl>
    implements _$$UserEmailNotVerifiedImplCopyWith<$Res> {
  __$$UserEmailNotVerifiedImplCopyWithImpl(_$UserEmailNotVerifiedImpl _value,
      $Res Function(_$UserEmailNotVerifiedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEmailNotVerifiedImpl extends UserEmailNotVerified {
  const _$UserEmailNotVerifiedImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.userEmailNotVerified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEmailNotVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (userEmailNotVerified != null) {
      return userEmailNotVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return userEmailNotVerified(this);
  }
}

abstract class UserEmailNotVerified extends AppFailure {
  const factory UserEmailNotVerified() = _$UserEmailNotVerifiedImpl;
  const UserEmailNotVerified._() : super._();
}

/// @nodoc
abstract class _$$UserNotAvailableImplCopyWith<$Res> {
  factory _$$UserNotAvailableImplCopyWith(_$UserNotAvailableImpl value,
          $Res Function(_$UserNotAvailableImpl) then) =
      __$$UserNotAvailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotAvailableImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UserNotAvailableImpl>
    implements _$$UserNotAvailableImplCopyWith<$Res> {
  __$$UserNotAvailableImplCopyWithImpl(_$UserNotAvailableImpl _value,
      $Res Function(_$UserNotAvailableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotAvailableImpl extends UserNotAvailable {
  const _$UserNotAvailableImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.userNotAvailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotAvailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (userNotAvailable != null) {
      return userNotAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return userNotAvailable(this);
  }
}

abstract class UserNotAvailable extends AppFailure {
  const factory UserNotAvailable() = _$UserNotAvailableImpl;
  const UserNotAvailable._() : super._();
}

/// @nodoc
abstract class _$$NullValueFailureImplCopyWith<$Res> {
  factory _$$NullValueFailureImplCopyWith(_$NullValueFailureImpl value,
          $Res Function(_$NullValueFailureImpl) then) =
      __$$NullValueFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NullValueFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NullValueFailureImpl>
    implements _$$NullValueFailureImplCopyWith<$Res> {
  __$$NullValueFailureImplCopyWithImpl(_$NullValueFailureImpl _value,
      $Res Function(_$NullValueFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NullValueFailureImpl extends NullValueFailure {
  const _$NullValueFailureImpl() : super._();

  @override
  String toString() {
    return 'AppFailure.nullValueAppFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NullValueFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? credentialsExist,
    TResult Function()? credentialsUserMismatch,
    TResult Function(Object? err)? generic,
    TResult Function(Exception exception)? fromException,
    TResult Function()? decryption,
    TResult Function()? deviceHasAnotherAccount,
    TResult Function()? encryption,
    TResult Function()? noStatsData,
    TResult Function()? fileNotFound,
    TResult Function(FirebaseException err)? firebase,
    TResult Function()? missingCredsOnServer,
    TResult Function()? missingFormData,
    TResult Function()? formHasError,
    TResult Function()? missingData,
    TResult Function()? noConnection,
    TResult Function(PlatformException err)? platform,
    TResult Function()? unknown,
    TResult Function()? userEmailNotVerified,
    TResult Function()? userNotAvailable,
    TResult Function()? nullValueAppFailure,
    required TResult orElse(),
  }) {
    if (nullValueAppFailure != null) {
      return nullValueAppFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialsExistFailure value) credentialsExist,
    required TResult Function(CredentialsUserMismatchFailure value)
        credentialsUserMismatch,
    required TResult Function(CustomFailure value) generic,
    required TResult Function(AppFailureFromFailure value) fromException,
    required TResult Function(DecryptionFailure value) decryption,
    required TResult Function(DeviceHasAnotherAccountFailure value)
        deviceHasAnotherAccount,
    required TResult Function(EncryptionFailure value) encryption,
    required TResult Function(NoStatsData value) noStatsData,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(_FirebaseFailure value) firebase,
    required TResult Function(MissingCredsOnServerFailure value)
        missingCredsOnServer,
    required TResult Function(MissingFormDataFailure value) missingFormData,
    required TResult Function(FormHasErrorFailure value) formHasError,
    required TResult Function(MissingDataFailure value) missingData,
    required TResult Function(NoCollectionFailure value) noConnection,
    required TResult Function(PlatformFailure value) platform,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(UserEmailNotVerified value) userEmailNotVerified,
    required TResult Function(UserNotAvailable value) userNotAvailable,
    required TResult Function(NullValueFailure value) nullValueAppFailure,
  }) {
    return nullValueAppFailure(this);
  }
}

abstract class NullValueFailure extends AppFailure {
  const factory NullValueFailure() = _$NullValueFailureImpl;
  const NullValueFailure._() : super._();
}
