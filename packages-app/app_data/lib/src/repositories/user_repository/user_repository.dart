part of 'user_repository_impl.dart';

abstract class UserRepository {
  /// get current user model
  Future<Result<UserModel, RepositoryFailure>> getCurrentUserModel(
    String userID,
  );

  /// Update the UserModel object
  Future<void> updateUserModel(UserModel userModel);

  /// Upload user avatar image
  Future<String> uploadUserAvatar(File file);

  /// Get stats for the user
  Future<Result<UserStatsModel, RepositoryFailure>> getUserStats();
}
