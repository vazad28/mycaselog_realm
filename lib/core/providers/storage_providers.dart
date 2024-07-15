import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

part '../../generated/core/providers/storage_providers.g.dart';

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
