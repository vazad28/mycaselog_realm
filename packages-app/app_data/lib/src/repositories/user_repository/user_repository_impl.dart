import 'dart:io' show File;

import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:storage/storage.dart';

import '../../../../app_data.dart';

part 'user_repository.dart';
part 'user_storage.dart';

/// {@template user_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
class UserRepositoryImpl extends UserRepository {
  /// {@macro user_repository}
  UserRepositoryImpl({
    required DatabaseService databaseService,
    required UserStorage userStorage,
  })  : _databaseService = databaseService,
        _userStorage = userStorage;

  final DatabaseService _databaseService;
  final UserStorage _userStorage;

  /// Proxy method for UI to update userModel instance
  @override
  Future<void> updateUserModel(UserModel userModel) =>
      createUserModel(userModel);

  /// Add new user model to databse
  Future<void> createUserModel(UserModel userModel) async {
    try {
      // if (userModel.userID == null) {
      //   throw const RepositoryFailure.generic(
      //     'UserModel has no userID',
      //   );
      // }

      await _databaseService.usersCollection
          .upsertUserModel(userModel..timestamp = ModelUtils.getTimestamp)
          .then((_) => _userStorage.setUserModel(userModel));
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        const RepositoryFailure.createUserModelFailure(),
        stackTrace,
      );
    }
  }

  /// Load use model
  @override
  Future<Result<UserModel, RepositoryFailure>> getCurrentUserModel(
      String userID) async {
    try {
      final userModel = _userStorage.getUserModel(userID) ??
          await _databaseService.usersCollection.getSingle(userID) ??
          UserModelX.zero(userID: userID);

      // if (userModel == null) {
      //   return Result.failure(
      //     const RepositoryFailure.userModelNotExistFailure(),
      //   );
      // }

      _userStorage.setUserModel(userModel);

      /// user should be created by now.
      return Result.success(userModel);
    } catch (error) {
      return Result.failure(
        const RepositoryFailure.createUserModelFailure(),
      );
    }
  }

  /// upload user avatar to firebase storage
  @override
  Future<String> uploadUserAvatar(File file) async {
    try {
      final fileUrl =
          await _databaseService.storageCollection.uploadAvatar(file);
      return fileUrl;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RepositoryFailure.generic(error.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<Result<UserStatsModel, RepositoryFailure>> getUserStats() async {
    try {
      final casesCount = _databaseService.casesCollection.countAll();
      final mediaCount = _databaseService.mediaCollection.countAll();
      final notesCount = _databaseService.timelineNotesCollection.countAll();

      return Result.success(
        UserStatsModel(cases: casesCount, media: mediaCount, notes: notesCount),
      );
    } catch (err) {
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }
}
