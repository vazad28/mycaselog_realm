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

/// decrypted patient data provider
@riverpod
Result<DecryptedPatientModel, EncryptionClientException> decryptPatientModel(
  DecryptPatientModelRef ref,
  String crypt,
) {
  final jsonDataResult = ref.watch(encryptionClientProvider).decrypt(crypt);

  return jsonDataResult.when(
    success: (jsonData) {
      //print(jsonData);
      return Result.success(DecryptedPatientModel.fromJson(jsonData));
    },
    failure: Result.failure,
  );
}

/// Encrypted patient data provider
@riverpod
Result<String, EncryptionClientException> encryptPatientModel(
  EncryptPatientModelRef ref,
  DecryptedPatientModel decryptedPatientModel,
) {
  return ref
      .watch(encryptionClientProvider)
      .encrypt(decryptedPatientModel.toJson())
      .when(
        success: Result.success,
        failure: Result.failure,
      );
}
