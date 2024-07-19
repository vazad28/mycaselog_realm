import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../router/router.dart';
import 'providers.dart';

part '../../generated/core/providers/auth_providers.g.dart';

/// Firebase Auth Instance for use all through the app
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuthInstance(FirebaseAuthInstanceRef ref) {
  return throw UnimplementedError();
}

/// Authentication Client
@Riverpod(keepAlive: true)
AuthenticationClient authenticationClient(AuthenticationClientRef ref) {
  return FirebaseAuthenticationClient(
    firebaseAuth: ref.watch(firebaseAuthInstanceProvider),
    tokenStorage: InMemoryTokenStorage(),
  );
}

/// Authentication repository
@riverpod
AuthenticationRepository authenticationRepository(
  AuthenticationRepositoryRef ref,
) {
  return AuthenticationRepository(
    authenticationClient: ref.watch(authenticationClientProvider),
    authenticationUserStorage: AuthenticationUserStorage(
      storage: ref.watch(persistentStorageProvider),
    ),
  );
}

/// Local stream listener provider of the auth state
@Riverpod(keepAlive: true)
Stream<AuthenticationUser> authenticationUserStream(
  AuthenticationUserStreamRef ref,
) {
  return ref.watch(authenticationClientProvider).user;
}

/// Authenticated user provider
///
/// Exposes User in a non async manner as regular provider
@Riverpod(keepAlive: true)
AuthenticationUser authenticationUser(AuthenticationUserRef ref) {
  final asyncValue = ref.watch(authenticationUserStreamProvider);

  return asyncValue.maybeWhen(
    data: (value) => value,
    orElse: () => AuthenticationUser.anonymous,
  );
}

@riverpod
String userID(UserIDRef ref) {
  return ref.watch(authenticationUserProvider).id;
}

@riverpod
Future<void> logout(LogoutRef ref) async {
  await Future<void>.delayed(const Duration(milliseconds: 1000));
  try {
    await ref.read(authenticationClientProvider).logOut();
    ref.invalidate(mycaselogRouterProvider);
  } catch (error, stackTrace) {
    Error.throwWithStackTrace(
      Exception('Logout failure'),
      stackTrace,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Passocde provider
/// ////////////////////////////////////////////////////////////////////

/// set to value of the user clustom claims containing the passcode
final passcodeProvider = StateProvider<String>((ref) => '');
