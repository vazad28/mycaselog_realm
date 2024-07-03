import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage.dart';

class PersistentStorage extends StorageAbs implements Storage {
  PersistentStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  /// ////////////////////////////////////////////////////////////////////
  /// Read methods for local storage
  /// ////////////////////////////////////////////////////////////////////

  @override
  bool readBool(String key, bool defaultValue) {
    try {
      return _sharedPreferences.getBool(key) ?? defaultValue;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  int readInt(String key, int defaultValue) {
    try {
      return _sharedPreferences.getInt(key) ?? defaultValue;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  String readString(String key, String defaultValue) {
    try {
      return _sharedPreferences.getString(key) ?? defaultValue;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  Map<String, dynamic> readJson(String key, Map<String, dynamic> defaultValue) {
    try {
      final str = _sharedPreferences.getString(key);
      if (str == null) return defaultValue;
      return json.decode(str) as Map<String, dynamic>;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  List<String> readStringList(String key, List<String> defaultValue) {
    try {
      return _sharedPreferences.getStringList(key) ?? defaultValue;
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Write methods for local  storage
  /// ////////////////////////////////////////////////////////////////////

  @override
  void writeString(String key, String value) {
    try {
      _sharedPreferences.setString(key, value);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  void writeBool(String key, bool value) {
    try {
      _sharedPreferences.setBool(key, value);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  void writeInt(String key, int value) {
    try {
      _sharedPreferences.setInt(key, value);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  void writeJson(String key, Map<String, dynamic> value) {
    try {
      final str = json.encode(value);
      _sharedPreferences.setString(key, str);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  @override
  void writeStringList(String key, List<String> value) {
    try {
      _sharedPreferences.setStringList(key, value);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  /// Removes the value for the provided [key] from storage.
  ///
  /// Throws a [StorageException] if the delete fails.
  @override
  Future<void> delete({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }

  /// Removes all key, value pairs from storage.
  ///
  /// Throws a [StorageException] if the clear fails.
  @override
  Future<void> clear() async {
    try {
      await _sharedPreferences.clear();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(StorageException(error), stackTrace);
    }
  }
}
