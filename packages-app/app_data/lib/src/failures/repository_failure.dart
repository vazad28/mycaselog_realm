import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_failure.freezed.dart';

@freezed
class RepositoryFailure with _$RepositoryFailure implements Exception {
  /// Generic error with string message
  const factory RepositoryFailure.generic(String message) =
      RepositoryFailureGeneric;

  /// Create repo exception from a try and catch error block
  const factory RepositoryFailure.fromError(Object err) =
      RepositoryFailureFromError;

  /// Create repo exception from a try and catch error block
  const factory RepositoryFailure.noConnection() =
      RepositoryFailureNoConnection;

  /// No stats data
  const factory RepositoryFailure.noStatsData() = RepositoryFailureNoStatsData;

  const factory RepositoryFailure.noUserTemplates() =
      RepositoryFailureNoUserTemplates;

  const factory RepositoryFailure.createUserModelFailure() =
      RepositoryFailureCreateUserModel;

  const factory RepositoryFailure.userModelNotExistFailure() =
      RepositoryFailureUserModelNotExist;
}
