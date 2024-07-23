import 'package:async_result/async_result.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/providers.dart';

part '../../generated/core/services/encryption_service.g.dart';

/// Encryption service provider
@riverpod
EncryptionService encryptionService(EncryptionServiceRef ref) {
  final userID = ref.watch(authenticationUserProvider).id;
  final passcode = ref.watch(passcodeProvider); //watch it

  return EncryptionService(
    userID: userID,
    passcode: passcode,
  );
}

class EncryptionService {
  EncryptionService({
    required String userID,
    required String passcode,
  }) : _encryptionClient = EncryptionClient(userID: userID, passcode: passcode);

  final EncryptionClient _encryptionClient;

  Result<Map<String, dynamic>, EncryptionClientException> decrypt(String data) {
    return _encryptionClient.decrypt(data);
  }

  Result<String, EncryptionClientException> encrypt(
    Map<String, dynamic> modelJson,
  ) {
    return _encryptionClient.encrypt(modelJson);
  }
}
