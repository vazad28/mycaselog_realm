import 'package:app_data/app_data.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../realm/realm_config.dart';
import 'providers.dart';

part '../../generated/core/providers/repository_providers.g.dart';

@Riverpod(keepAlive: true)
DatabaseService databaseService(DatabaseServiceRef ref) {
  final currentUser = ref.watch(authenticationUserProvider);

  return DatabaseService(
    realm: ref.read(realmProvider),
    userID: currentUser.id,
    sharedPrefs: ref.watch(sharedPrefsProvider),
  );
}

/// Encryption repository
@riverpod
EncryptionRepository encryptionRepository(EncryptionRepositoryRef ref) {
  final authenticationUser = ref.watch(authenticationUserProvider);
  final passcode = ref.watch(passcodeProvider);
  return EncryptionRepository(
    userID: authenticationUser.id,
    passcode: passcode,
  );
}

/// ////////////////////////////////////////////////////////////////////
/// Repository support providers
/// ////////////////////////////////////////////////////////////////////
/// User Repository
@riverpod
UserStorage userStorage(UserStorageRef ref) {
  return UserStorage(storage: ref.watch(persistentStorageProvider));
}

@riverpod
UserRepository userRepository(
  UserRepositoryRef ref,
) {
  return UserRepositoryImpl(
    userStorage: ref.watch(userStorageProvider),
    databaseService: ref.watch(databaseServiceProvider),
  );
}

/// Cases repository provider
@riverpod
CasesRepository casesRepository(CasesRepositoryRef ref) {
  return CasesRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
  );
}

/// Media Repository provider
@riverpod
MediaRepository mediaRepository(MediaRepositoryRef ref) {
  return MediaRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
  );
}

@riverpod
TemplatesRepository templatesRepository(TemplatesRepositoryRef ref) {
  return TemplatesRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
  );
}

/// Full text search Repository provider
@riverpod
FtsSearchRepository ftsSearchRepository(FtsSearchRepositoryRef ref) {
  return FtsSearchRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
    persistentStorage: ref.watch(persistentStorageProvider),
    encryptionRepository: ref.watch(encryptionRepositoryProvider),
  );
}

/// Stats Repository provider
@riverpod
StatsRepository statsRepository(StatsRepositoryRef ref) {
  return StatsRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
    ftsSearch: ref.watch(ftsSearchRepositoryProvider),
  );
}

/// Settings repository provider
@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return SettingsRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
  );
}

/// Settings repository provider
@riverpod
SupportDataRepository supportDataRepository(SupportDataRepositoryRef ref) {
  return SupportDataRepositoryImpl(
    databaseService: ref.watch(databaseServiceProvider),
  );
}

/// Passcode provider
/// the value is set from app startup provider on async
/// reading of the user clustom claims containing the passcode
final passcodeProvider = StateProvider<String>((ref) => '');
