import 'package:authentication_client/authentication_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

//part '../../generated/core/providers/repository_providers.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Repository support providers
/// ////////////////////////////////////////////////////////////////////

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
