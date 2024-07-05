import 'package:async_result/async_result.dart';

import '../encryption_client.dart';

class EncryptionRepository {
  EncryptionRepository({
    required String userID,
    required String passcode,
  }) : _encryptionClient = EncryptionClient(userID: userID, passcode: passcode);

  final EncryptionClient _encryptionClient;

  Result<Map<String, dynamic>, EncryptionClientException> decrypt(String data) {
    // if (_encryptionClient.encrypter == null) {
    //   throw const EncrypterNotAvailableException('encrypter is null');
    // }

    return _encryptionClient.decrypt(data);
  }

  Result<String, EncryptionClientException> encrypt(
    Map<String, dynamic> modelJson,
  ) {
    // if (_encryptionClient.encrypter == null) {
    //   throw const EncrypterNotAvailableException('encrypter is null');
    // }

    return _encryptionClient.encrypt(modelJson);
  }
}
