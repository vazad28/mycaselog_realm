/// {@template storage_exception}
/// Exception thrown if a storage operation fails.
/// {@endtemplate}
class StorageException implements Exception {
  /// {@macro storage_exception}
  const StorageException(this.error);

  /// Error thrown during the storage operation.
  final Object error;
}

abstract class Storage {}

abstract class StorageAbs implements Storage {
  ///
  /// common write method
  ///
  void writeString(String key, String value);

  void writeInt(String key, int value);

  // ignore: avoid_positional_boolean_parameters
  void writeBool(String key, bool value);

  void writeJson(
    String key,
    Map<String, dynamic> value,
  );

  void writeStringList(String key, List<String> value);

  ///
  /// Common read method
  ///
  String readString(String key, String defaultValue);

  int readInt(String key, int defaultValue);

  // ignore: avoid_positional_boolean_parameters
  bool readBool(String key, bool defaultValue);

  Map<String, dynamic> readJson(
    String key,
    Map<String, dynamic> defaultValue,
  );

  List<String> readStringList(String key, List<String> defaultValue);

  /// Removes the value for the provided [key] asynchronously.
  /// * Throws a [StorageException] if the delete fails.
  Future<void> delete({required String key});

  /// Removes all key, value pairs asynchronously.
  /// * Throws a [StorageException] if the delete fails.
  Future<void> clear();
}

/// A Dart Storage Client Interface
// abstract class Storage {
//   /// Returns value for the provided [key].
//   /// Read returns `null` if no value is found for the given [key].
//   /// * Throws a [StorageException] if the read fails.
//   Future<String?> read({required String key});

//   /// Writes the provided [key], [value] pair asynchronously.
//   /// * Throws a [StorageException] if the write fails.
//   Future<void> write({required String key, required String value});

//   /// Removes the value for the provided [key] asynchronously.
//   /// * Throws a [StorageException] if the delete fails.
//   Future<void> delete({required String key});

//   /// Removes all key, value pairs asynchronously.
//   /// * Throws a [StorageException] if the delete fails.
//   Future<void> clear();
// }
