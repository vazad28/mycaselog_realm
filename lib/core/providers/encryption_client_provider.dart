part of 'providers.dart';

/// Encryption service provider
@riverpod
EncryptionClient encryptionClient(EncryptionClientRef ref) {
  final userID = ref.watch(authenticationUserProvider).id;
  final passcode = ref.watch(passcodeProvider); //watch it

  return EncryptionClient(
    userID: userID,
    passcode: passcode,
  );
}
