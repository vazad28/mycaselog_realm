import 'package:authentication_client/authentication_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
Stream<AuthenticationUser> _authenticationUserStream(
  _AuthenticationUserStreamRef ref,
) {
  return ref.watch(authenticationClientProvider).user;
}

/// Authenticated user provider
///
/// Exposes User in a non aasync manner as regular provider
@Riverpod(keepAlive: true)
AuthenticationUser authenticationUser(AuthenticationUserRef ref) {
  final asyncValue = ref.watch(_authenticationUserStreamProvider);

  return asyncValue.maybeWhen(
    data: (value) => value,
    orElse: () => AuthenticationUser.anonymous,
  );
}
