import 'package:realm/realm.dart';

import '../../../app_models.dart';

part 'settings_realm.realm.dart';

@RealmModel()
class _SettingsRealm {
  @PrimaryKey()
  late String userID;
  late bool biometricEnabled = false;
  late int caseTileNavigate = 0;
  late int caseTileStyle = 0;
  late String? showByLocation;
  late bool syncOnStart = true;
  late bool localAuthEnabled = true;
  late int timestamp = 0;
  late bool uploadFullSizePhoto = false;
  late int themeMode = 0;
  late String language = 'en';
  late String? fontFamily;
  late String seedColorHex = '0xfff44336';

  SettingsModel toModel() {
    return SettingsModel(
      userID: userID,
      biometricEnabled: biometricEnabled,
      caseTileNavigate: caseTileNavigate,
      caseTileStyle: caseTileStyle,
      showByLocation: showByLocation,
      syncOnStart: syncOnStart,
      localAuthEnabled: localAuthEnabled,
      timestamp: timestamp,
      uploadFullSizePhoto: uploadFullSizePhoto,
      themeMode: themeMode,
      language: language,
      fontFamily: fontFamily,
      seedColorHex: seedColorHex,
    );
  }
}

extension SettingsRealmX on SettingsRealm {
  static SettingsRealm zero(String userID) {
    final timestamp = ModelUtils.getTimestamp;

    final settingsRealm = SettingsRealm(
      userID,
      timestamp: timestamp,
    );

    return settingsRealm;
  }

  static SettingsRealm fromModel(SettingsModel model) {
    return SettingsRealm(
      model.userID,
      biometricEnabled: model.biometricEnabled,
      caseTileNavigate: model.caseTileNavigate,
      caseTileStyle: model.caseTileStyle,
      showByLocation: model.showByLocation,
      syncOnStart: model.syncOnStart,
      localAuthEnabled: model.localAuthEnabled,
      timestamp: model.timestamp,
      uploadFullSizePhoto: model.uploadFullSizePhoto,
      themeMode: model.themeMode,
      language: model.language,
      fontFamily: model.fontFamily,
      seedColorHex: model.seedColorHex,
    );
  }
}
