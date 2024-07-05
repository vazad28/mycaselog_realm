part of 'encryption_client.dart';

/// A base failure for the encryption client failures.
abstract class EncryptionClientException implements Exception {
  /// {@macro user_failure}
  const EncryptionClientException([this.error]);

  /// The error which was caught.
  final Object? error;
}

class EncrypterNotAvailableException extends EncryptionClientException {
  const EncrypterNotAvailableException([super.error]);
}

class EncryptionFailureException extends EncryptionClientException {
  const EncryptionFailureException([super.error]);
}

class DecryptionFailureException extends EncryptionClientException {
  const DecryptionFailureException([super.error]);
}

class EncryptionClientNotAvaliableException extends EncryptionClientException {
  const EncryptionClientNotAvaliableException([super.error]);
}
