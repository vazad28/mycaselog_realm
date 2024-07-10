import 'package:storage/storage.dart';

import '../../authentication_client.dart';

import '../repository/authentication_repository.dart';

/// Storage keys for the [AuthenticationUserStorage].
abstract class AuthenticationUserStorageKeys {
  /// Number of times that a user opened the application.
  static const appOpenedCount = '__app_opened_count_key__';

  /// Is user onboarded
  static const onboardedStatus = '__user_has_onboarded__';
}

/// {@template user_storage}
/// Storage for the [AuthenticationRepository].
/// {@endtemplate}
class AuthenticationUserStorage {
  /// {@macro user_storage}
  const AuthenticationUserStorage({
    required PersistentStorage storage,
  }) : _storage = storage;

  final PersistentStorage _storage;

  /// Sets the number of times the app was opened.
  void setAppOpenedCount({required int count}) => _storage.writeInt(
        AuthenticationUserStorageKeys.appOpenedCount,
        count,
      );

  /// Fetches the number of times the app was opened value from Storage.
  int fetchAppOpenedCount() {
    return _storage.readInt(AuthenticationUserStorageKeys.appOpenedCount, 0);
  }

  /// Sets the number of times the app was opened.
  void setUserHasOnboarded() => _storage.writeBool(
        AuthenticationUserStorageKeys.onboardedStatus,
        true,
      );

  bool getUserHasOnboarded() =>
      _storage.readBool(AuthenticationUserStorageKeys.onboardedStatus, false);
}
