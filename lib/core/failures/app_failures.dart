import 'package:app_l10n/app_l10n.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/core/failures/app_failures.freezed.dart';

part 'localized_failures.dart';

@Freezed(
  copyWith: true,
  equal: true,
  when: FreezedWhenOptions(when: false, maybeWhen: true, whenOrNull: false),
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class AppFailure with _$AppFailure implements Exception {
  const AppFailure._();

  const factory AppFailure.credentialsExist() = CredentialsExistFailure;
  const factory AppFailure.credentialsUserMismatch() =
      CredentialsUserMismatchFailure;
  const factory AppFailure.generic(Object? err) = CustomFailure;
  const factory AppFailure.fromException(Exception exception) =
      AppFailureFromFailure;
  const factory AppFailure.decryption() = DecryptionFailure;
  const factory AppFailure.deviceHasAnotherAccount() =
      DeviceHasAnotherAccountFailure;
  const factory AppFailure.encryption() = EncryptionFailure;
  const factory AppFailure.noStatsData() = NoStatsData;
  const factory AppFailure.fileNotFound() = FileNotFoundFailure;
  const factory AppFailure.firebase(FirebaseException err) = _FirebaseFailure;
  const factory AppFailure.missingCredsOnServer() = MissingCredsOnServerFailure;
  const factory AppFailure.missingFormData() = MissingFormDataFailure;
  const factory AppFailure.formHasError() = FormHasErrorFailure;
  const factory AppFailure.missingData() = MissingDataFailure;
  const factory AppFailure.noConnection() = NoCollectionFailure;
  const factory AppFailure.platform(PlatformException err) = PlatformFailure;
  const factory AppFailure.unknown() = UnknownFailure;
  const factory AppFailure.userEmailNotVerified() = UserEmailNotVerified;
  const factory AppFailure.userNotAvailable() = UserNotAvailable;
  const factory AppFailure.nullValueAppFailure() = NullValueFailure;
}

extension AppFailureMapperExt on AppFailure {
  String toLocalizedString() {
    return map(
      credentialsExist: (value) => S.current.credentialsExist,
      credentialsUserMismatch: (value) => S.current.credentialsUserMismatch,
      decryption: (value) => S.current.decryptionFailure,
      deviceHasAnotherAccount: (value) => S.current.deviceHasAnotherAccount,
      encryption: (value) => S.current.encryptionFailure,
      fileNotFound: (value) => S.current.fileNotFound,
      firebase: (value) => value.err.toString(),
      formHasError: (value) => S.current.formHasError,
      fromException: (value) => value.toString(),
      generic: (value) => value.err.toString(),
      missingCredsOnServer: (value) => S.current.encryptionKeyIsMissingOnServer,
      missingData: (value) => value.toLocalizedString(),
      missingFormData: (value) => S.current.missingFormData,
      noConnection: (_) => S.current.noInternetConnection,
      noStatsData: (value) => S.current.noStatsData,
      nullValueAppFailure: (value) => S.current.dataIsNull,
      platform: (value) => value.err.toString(),
      unknown: (_) => S.current.unknownError,
      userEmailNotVerified: (value) => S.current.userEmailNotVerified,
      userNotAvailable: (value) => S.current.userNotAvailable,
    );
  }
}

extension ErrorToAppExeptionMapperX on Object? {
  AppFailure toAppFailure() {
    final err = this;
    if (err is FirebaseException) {
      //logger.severe(err.message, err, err.stackTrace);
      return AppFailure.firebase(err);
    } else if (err is PlatformException) {
      //logger.severe(err.details);
      return AppFailure.platform(err);
    } else {
      if (err is AppFailure) {
        //logger.info(err.toLocalizedString());
        return err;
      } else {
        //logger.severe(err.toString());
        return AppFailure.generic(err.toString());
      }
    }
  }
}
