import 'package:app_data/app_data.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../realm/realm_config.dart';
import 'providers.dart';

part '../../generated/core/providers/repository_providers.g.dart';

@Riverpod(keepAlive: true)
AppData appData(AppDataRef ref) {
  final currentUser = ref.watch(authenticationUserProvider);

  return AppData(
    realm: ref.read(realmProvider),
    user: currentUser,
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
/// Cases repository provider
@riverpod
CasesRepository casesRepository(CasesRepositoryRef ref) {
  return CasesRepositoryImpl(
    appData: ref.watch(appDataProvider),
    //ftsSearch: ref.watch(ftsSearchRepositoryProvider),
  );
}

/// Authentication repository
// @riverpod
// AuthenticationRepository authenticationRepository(
//   AuthenticationRepositoryRef ref,
// ) {
//   return AuthenticationRepository(
//     authenticationClient: ref.watch(authenticationClientProvider),
//     authenticationUserStorage: AuthenticationUserStorage(
//       storage: ref.watch(persistentStorageProvider),
//     ),
//   );
// }

/// Passcode provider
/// the value is set from app startup provider on async
/// reading of the user clustom claims containing the passcode
final passcodeProvider = StateProvider<String>((ref) => '');
