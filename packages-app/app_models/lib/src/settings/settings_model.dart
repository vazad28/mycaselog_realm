import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../../app_models.dart';

part 'settings_model.g.dart';
part 'settings_model.realm.dart';

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _SettingsModel {
  @PrimaryKey()
  late String userID;
  late bool biometricEnabled = false;
  late int caseTileNavigate = 0;
  late int caseTileStyle = 0;
  late String? showByLocation;
  late bool syncOnStart = false; //<- must be default false. read below *
  late bool localAuthEnabled = true;
  late int timestamp = 0;
  late bool uploadFullSizePhoto = false;
  late int themeMode = 0;
  late String language = 'en';
  late String? fontFamily;
  late String seedColorHex = '0xfff44336';

  SettingsModel toRealmObject() {
    return SettingsModel(
      userID,
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

extension SettingsModelX on SettingsModel {
  static SettingsModel fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  static SettingsModel zero(String userID) {
    final timestamp = ModelUtils.getTimestamp;

    final settingsRealm = SettingsModel(
      userID,
      timestamp: timestamp,
    );

    return settingsRealm;
  }

  // static SettingsModel fromModel(SettingsModel model) {
  //   return SettingsModel(
  //     model.userID,
  //     biometricEnabled: model.biometricEnabled,
  //     caseTileNavigate: model.caseTileNavigate,
  //     caseTileStyle: model.caseTileStyle,
  //     showByLocation: model.showByLocation,
  //     syncOnStart: model.syncOnStart,
  //     localAuthEnabled: model.localAuthEnabled,
  //     timestamp: model.timestamp,
  //     uploadFullSizePhoto: model.uploadFullSizePhoto,
  //     themeMode: model.themeMode,
  //     language: model.language,
  //     fontFamily: model.fontFamily,
  //     seedColorHex: model.seedColorHex,
  //   );
  // }
}


/// We keep sync on start false because the settings providers loads first with
/// .zero object. The sync provider is watching the settings provider and will trigger
/// sync based on this value.
/// 
/// When the realm listener fires in the settings provider to get the correct obhect
/// we will either start the sync if the value is on