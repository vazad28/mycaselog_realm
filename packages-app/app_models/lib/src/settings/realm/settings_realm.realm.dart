// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SettingsRealm extends _SettingsRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SettingsRealm(
    String userID, {
    bool biometricEnabled = false,
    int caseTileNavigate = 0,
    int caseTileStyle = 0,
    String? showByLocation,
    bool syncOnStart = true,
    bool localAuthEnabled = true,
    int timestamp = 0,
    bool uploadFullSizePhoto = false,
    int themeMode = 0,
    String language = 'en',
    String? fontFamily,
    String seedColorHex = '0xfff44336',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SettingsRealm>({
        'biometricEnabled': false,
        'caseTileNavigate': 0,
        'caseTileStyle': 0,
        'syncOnStart': true,
        'localAuthEnabled': true,
        'timestamp': 0,
        'uploadFullSizePhoto': false,
        'themeMode': 0,
        'language': 'en',
        'seedColorHex': '0xfff44336',
      });
    }
    RealmObjectBase.set(this, 'userID', userID);
    RealmObjectBase.set(this, 'biometricEnabled', biometricEnabled);
    RealmObjectBase.set(this, 'caseTileNavigate', caseTileNavigate);
    RealmObjectBase.set(this, 'caseTileStyle', caseTileStyle);
    RealmObjectBase.set(this, 'showByLocation', showByLocation);
    RealmObjectBase.set(this, 'syncOnStart', syncOnStart);
    RealmObjectBase.set(this, 'localAuthEnabled', localAuthEnabled);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'uploadFullSizePhoto', uploadFullSizePhoto);
    RealmObjectBase.set(this, 'themeMode', themeMode);
    RealmObjectBase.set(this, 'language', language);
    RealmObjectBase.set(this, 'fontFamily', fontFamily);
    RealmObjectBase.set(this, 'seedColorHex', seedColorHex);
  }

  SettingsRealm._();

  @override
  String get userID => RealmObjectBase.get<String>(this, 'userID') as String;
  @override
  set userID(String value) => RealmObjectBase.set(this, 'userID', value);

  @override
  bool get biometricEnabled =>
      RealmObjectBase.get<bool>(this, 'biometricEnabled') as bool;
  @override
  set biometricEnabled(bool value) =>
      RealmObjectBase.set(this, 'biometricEnabled', value);

  @override
  int get caseTileNavigate =>
      RealmObjectBase.get<int>(this, 'caseTileNavigate') as int;
  @override
  set caseTileNavigate(int value) =>
      RealmObjectBase.set(this, 'caseTileNavigate', value);

  @override
  int get caseTileStyle =>
      RealmObjectBase.get<int>(this, 'caseTileStyle') as int;
  @override
  set caseTileStyle(int value) =>
      RealmObjectBase.set(this, 'caseTileStyle', value);

  @override
  String? get showByLocation =>
      RealmObjectBase.get<String>(this, 'showByLocation') as String?;
  @override
  set showByLocation(String? value) =>
      RealmObjectBase.set(this, 'showByLocation', value);

  @override
  bool get syncOnStart =>
      RealmObjectBase.get<bool>(this, 'syncOnStart') as bool;
  @override
  set syncOnStart(bool value) =>
      RealmObjectBase.set(this, 'syncOnStart', value);

  @override
  bool get localAuthEnabled =>
      RealmObjectBase.get<bool>(this, 'localAuthEnabled') as bool;
  @override
  set localAuthEnabled(bool value) =>
      RealmObjectBase.set(this, 'localAuthEnabled', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  bool get uploadFullSizePhoto =>
      RealmObjectBase.get<bool>(this, 'uploadFullSizePhoto') as bool;
  @override
  set uploadFullSizePhoto(bool value) =>
      RealmObjectBase.set(this, 'uploadFullSizePhoto', value);

  @override
  int get themeMode => RealmObjectBase.get<int>(this, 'themeMode') as int;
  @override
  set themeMode(int value) => RealmObjectBase.set(this, 'themeMode', value);

  @override
  String get language =>
      RealmObjectBase.get<String>(this, 'language') as String;
  @override
  set language(String value) => RealmObjectBase.set(this, 'language', value);

  @override
  String? get fontFamily =>
      RealmObjectBase.get<String>(this, 'fontFamily') as String?;
  @override
  set fontFamily(String? value) =>
      RealmObjectBase.set(this, 'fontFamily', value);

  @override
  String get seedColorHex =>
      RealmObjectBase.get<String>(this, 'seedColorHex') as String;
  @override
  set seedColorHex(String value) =>
      RealmObjectBase.set(this, 'seedColorHex', value);

  @override
  Stream<RealmObjectChanges<SettingsRealm>> get changes =>
      RealmObjectBase.getChanges<SettingsRealm>(this);

  @override
  Stream<RealmObjectChanges<SettingsRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SettingsRealm>(this, keyPaths);

  @override
  SettingsRealm freeze() => RealmObjectBase.freezeObject<SettingsRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'userID': userID.toEJson(),
      'biometricEnabled': biometricEnabled.toEJson(),
      'caseTileNavigate': caseTileNavigate.toEJson(),
      'caseTileStyle': caseTileStyle.toEJson(),
      'showByLocation': showByLocation.toEJson(),
      'syncOnStart': syncOnStart.toEJson(),
      'localAuthEnabled': localAuthEnabled.toEJson(),
      'timestamp': timestamp.toEJson(),
      'uploadFullSizePhoto': uploadFullSizePhoto.toEJson(),
      'themeMode': themeMode.toEJson(),
      'language': language.toEJson(),
      'fontFamily': fontFamily.toEJson(),
      'seedColorHex': seedColorHex.toEJson(),
    };
  }

  static EJsonValue _toEJson(SettingsRealm value) => value.toEJson();
  static SettingsRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'userID': EJsonValue userID,
        'biometricEnabled': EJsonValue biometricEnabled,
        'caseTileNavigate': EJsonValue caseTileNavigate,
        'caseTileStyle': EJsonValue caseTileStyle,
        'showByLocation': EJsonValue showByLocation,
        'syncOnStart': EJsonValue syncOnStart,
        'localAuthEnabled': EJsonValue localAuthEnabled,
        'timestamp': EJsonValue timestamp,
        'uploadFullSizePhoto': EJsonValue uploadFullSizePhoto,
        'themeMode': EJsonValue themeMode,
        'language': EJsonValue language,
        'fontFamily': EJsonValue fontFamily,
        'seedColorHex': EJsonValue seedColorHex,
      } =>
        SettingsRealm(
          fromEJson(userID),
          biometricEnabled: fromEJson(biometricEnabled),
          caseTileNavigate: fromEJson(caseTileNavigate),
          caseTileStyle: fromEJson(caseTileStyle),
          showByLocation: fromEJson(showByLocation),
          syncOnStart: fromEJson(syncOnStart),
          localAuthEnabled: fromEJson(localAuthEnabled),
          timestamp: fromEJson(timestamp),
          uploadFullSizePhoto: fromEJson(uploadFullSizePhoto),
          themeMode: fromEJson(themeMode),
          language: fromEJson(language),
          fontFamily: fromEJson(fontFamily),
          seedColorHex: fromEJson(seedColorHex),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SettingsRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SettingsRealm, 'SettingsRealm', [
      SchemaProperty('userID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('biometricEnabled', RealmPropertyType.bool),
      SchemaProperty('caseTileNavigate', RealmPropertyType.int),
      SchemaProperty('caseTileStyle', RealmPropertyType.int),
      SchemaProperty('showByLocation', RealmPropertyType.string,
          optional: true),
      SchemaProperty('syncOnStart', RealmPropertyType.bool),
      SchemaProperty('localAuthEnabled', RealmPropertyType.bool),
      SchemaProperty('timestamp', RealmPropertyType.int),
      SchemaProperty('uploadFullSizePhoto', RealmPropertyType.bool),
      SchemaProperty('themeMode', RealmPropertyType.int),
      SchemaProperty('language', RealmPropertyType.string),
      SchemaProperty('fontFamily', RealmPropertyType.string, optional: true),
      SchemaProperty('seedColorHex', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
