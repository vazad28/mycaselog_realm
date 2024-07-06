part of 'user_repository_impl.dart';

/// Storage keys for the [UserStorage].
abstract class UserStorageKeys {
  // ignore: public_member_api_docs
  static const userModel = '__user_model__';
}

/// {@template user_storage}
/// Storage for the [UserRepository].
/// {@endtemplate}
class UserStorage {
  /// {@macro user_storage}
  const UserStorage({
    required PersistentStorage storage,
  }) : _storage = storage;

  final PersistentStorage _storage;

  /// User model get set
  void setUserModel(UserModel userModel) {
    return _storage.writeJson(
      UserStorageKeys.userModel,
      userModel.toJson(),
    );
  }

  /// We return null instead of UserModel()
  /// as we need this null check in AuthFlow
  UserModel? getUserModel(String userID) {
    final userModelString = _storage.readJson(userID, {});

    if (userModelString.isEmpty) return null;

    return UserModelX.fromJson(userModelString);
  }
}
