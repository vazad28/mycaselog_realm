part of 'providers.dart';

/// SharedPreferences provider
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

/// Secure storage provider
@riverpod
SecureStorage secureStorage(SecureStorageRef ref) {
  return const SecureStorage();
}

/// Persistent storage provider
@riverpod
PersistentStorage persistentStorage(PersistentStorageRef ref) {
  return PersistentStorage(
    sharedPreferences: ref.watch(sharedPrefsProvider),
  );
}

/// Riverpod provider to use the dialog service
@riverpod
LocalStorage localStorage(LocalStorageRef ref) {
  final persistentStorage = ref.watch(persistentStorageProvider);

  return LocalStorage(persistentStorage: persistentStorage);
}

/// Local storage class using the _persistentStorage
class LocalStorage {
  LocalStorage({required PersistentStorage persistentStorage})
      : _persistentStorage = persistentStorage;

  final PersistentStorage _persistentStorage;

  /// clear local storage
  void clear() => _persistentStorage.clear();

  /// getter for an instance of sharedpreferences directly
  PersistentStorage get persistentStorage => _persistentStorage;

  /// //////////////////////////////////////////////////////////
  /// Methods for direct use
  /// //////////////////////////////////////////////////////////
  /// Sets the number of times the app was opened.
  void setImportTemplateInfoReviewed() => _persistentStorage.writeBool(
        StorageKeys.importTemplateInfoReviewedStatus,
        true,
      );

  /// Fetches the number of times the app was opened value from Storage.
  bool getImportTemplateInfoReviewed() {
    return _persistentStorage.readBool(
      StorageKeys.importTemplateInfoReviewedStatus,
      false,
    );
  }

  ///db upgrade required
  void setDbUpgradeVersion(int version) =>
      _persistentStorage.writeInt(StorageKeys.dbUpgradeVersion, version);

  int getDbUpgradeVersion() =>
      _persistentStorage.readInt(StorageKeys.dbUpgradeVersion, 1);

  /// default surgery location
  String get getDefaultSurgeryLocation =>
      _persistentStorage.readString(StorageKeys.defaultSurgeryLocation, '');

  void setDefaultSurgeryLocation(String value) =>
      _persistentStorage.writeString(StorageKeys.defaultSurgeryLocation, value);

  /// Cases tile styles
  int getCaseListTileStyle() =>
      _persistentStorage.readInt(StorageKeys.caseListTileStyle, 0);
  void setCaseListTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.caseListTileStyle, value);

  /// Media Tile style
  int getMediaGridTileStyle() =>
      _persistentStorage.readInt(StorageKeys.mediaGridTileStyle, 0);

  void setMediaGridTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.mediaGridTileStyle, value);

  /// Notes title style
  int get noteListTileStyle =>
      _persistentStorage.readInt(StorageKeys.noteListTileStyle, 0);
  void setNoteListTileStyle(int value) =>
      _persistentStorage.writeInt(StorageKeys.noteListTileStyle, value);

  /// tile styles
  int get caseTileNavigate =>
      _persistentStorage.readInt(StorageKeys.caseTileNavigate, 0);

  void setCaseTileNavigate(int value) =>
      _persistentStorage.writeInt(StorageKeys.caseTileNavigate, value);

  /// app settings
  void setSettings(Map<String, dynamic> value) {
    _persistentStorage.writeString(StorageKeys.settings, json.encode(value));
  }

  Map<String, dynamic>? getSettings() {
    final settingsString =
        _persistentStorage.readJson(StorageKeys.settings, {});

    if (settingsString.isNotEmpty) return settingsString;

    return null;
  }

  List<String> getNotesRecentSearches() {
    return _persistentStorage
        .readStringList(StorageKeys.notesRecentSearches, <String>[]);
  }

  void setNotesRecentSearches(List<String> notesRecentSearches) {
    _persistentStorage.writeStringList(
      StorageKeys.notesRecentSearches,
      notesRecentSearches,
    );
  }

  List<String> getCaseMediaRecentSearches() {
    return _persistentStorage
        .readStringList(StorageKeys.caseMediaRecentSearches, <String>[]);
  }

  void setCaseMediaRecentSearches(List<String> caseMediaRecentSearches) {
    _persistentStorage.writeStringList(
      StorageKeys.caseMediaRecentSearches,
      caseMediaRecentSearches,
    );
  }

  void setRecentSearches<T>(List<String> searchHistory) {}
}
