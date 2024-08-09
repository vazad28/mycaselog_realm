import 'dart:convert';
import 'dart:typed_data';

import 'package:async_result/async_result.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' as foundation;
//import 'package:memoized/memoized.dart';

part 'encryption_failures.dart';

class EncryptionClient {
  EncryptionClient({
    required String? userID,
    required String? passcode,
  }) : _encrypter = passcode == null
            ? throw const EncryptionClientNotAvaliableException()
            : Encrypter(AES(createEncryptionKey(userID, passcode)));

  final Encrypter _encrypter;
  Encrypter get encrypter => _encrypter;

  static Key createEncryptionKey(String? userID, String? password) {
    if (password == null || userID == null) {
      foundation.debugPrint('Password or salt is empty');
      throw Exception('Password and salt can not be empty');
    } else {
      final passwordSalt = '$userID-$password';
      return Key.fromUtf8(md5.convert(utf8.encode(passwordSalt)).toString());
    }
  }

  Result<Map<String, dynamic>, EncryptionClientException> decrypt(String data) {
    try {
      // ignore: omit_local_variable_types
      final Uint8List dataUint8 = TypeHelper.base64ToBytes(data);

      final ivUint8 = Uint8List.fromList(dataUint8.getRange(0, 16).toList());

      final encryptedTextUnit8 =
          Uint8List.fromList(dataUint8.sublist(16).toList());

      final encryptedText = Encrypted(encryptedTextUnit8);

      final iv = IV(ivUint8);

      final dcipherText = _encrypter.decrypt(encryptedText, iv: iv);

      // ignore: omit_local_variable_types
      final Map<String, dynamic> decryptedJson =
          jsonDecode(dcipherText) as Map<String, dynamic>;

      return Result.success(decryptedJson);
    } catch (err) {
      foundation.debugPrint(err.toString());
      return Result.failure(DecryptionFailureException(err));
    }
  }

  Result<String, EncryptionClientException> encrypt(
    Map<String, dynamic> modelJson,
  ) {
    try {
      //if (_encrypter == null) throw const EncrypterNotAvailableException();

      // ignore: omit_local_variable_types
      final String jsonString = json.encode(modelJson);

      final iv = IV.fromSecureRandom(16);
      final encryptedText = _encrypter.encrypt(jsonString, iv: iv);

      final bb = BytesBuilder(copy: false);

      // ignore: cascade_invocations
      bb
        ..add(iv.bytes)
        ..add(encryptedText.bytes);

      //return TypeHelper.bytesToBase64(bb.toBytes());
      return Result.success(TypeHelper.bytesToBase64(bb.toBytes()));
    } catch (err) {
      foundation.debugPrint(err.toString());
      return Result.failure(EncryptionFailureException(err));
    }
  }
}

// ignore: public_member_api_docs
class TypeHelper {
  /// Returns bytes [Uint8List] from a [String].
  static Uint8List stringToBytes(String source) {
    final list = source.runes.toList();
    final bytes = Uint8List.fromList(list);
    return bytes;
  }

  /// Returns a [String] from bytes [Uint8List].
  static String bytesToString(Uint8List bytes) {
    final string = String.fromCharCodes(bytes);
    return string;
  }

  /// Returns a `base64` [String] from bytes [Uint8List].
  static String bytesToBase64(Uint8List bytes) {
    return base64.encode(bytes);
  }

  /// Returns a [Uint8List] from a `base64` [String].
  static Uint8List base64ToBytes(String encoded) {
    return base64.decode(encoded);
  }
}
