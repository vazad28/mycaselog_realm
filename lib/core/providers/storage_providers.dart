part of '../app_providers.dart';

/// SharedPreferences provider
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

/// Secure storage provider
@riverpod
SecureStorage secureStorage(SecureStorageRef ref) {
  return const SecureStorage();
}

/// Persistent storage provider
@riverpod
PersistentStorage persistentStorage(PersistentStorageRef ref) {
  return PersistentStorage(
    sharedPreferences: ref.watch(sharedPrefsProvider),
  );
}

/// app dir path
@Riverpod(keepAlive: true)
String appDirPath(AppDirPathRef ref) {
  throw UnimplementedError();
}
