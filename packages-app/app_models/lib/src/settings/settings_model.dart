import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.g.dart';

@CopyWith()
@JsonSerializable()
class SettingsModel {
  SettingsModel({
    required this.userID,
    this.biometricEnabled = false,
    this.syncOnStart = false,
    this.localAuthEnabled = false,
    this.uploadFullSizePhoto = false,
    this.caseTileNavigate = 0,
    this.caseTileStyle = 0,
    this.showByLocation,
    this.themeMode = 0,
    this.language = 'en',
    this.fontFamily,
    this.seedColorHex = '0xfff44336',
    this.timestamp = 0,
  });

  factory SettingsModel.zero(String? userID) {
    return SettingsModel(userID: userID ?? 'annonymous');
  }

  final bool biometricEnabled;
  final int caseTileNavigate;
  final int caseTileStyle;
  final String? showByLocation;
  final bool syncOnStart;
  final bool localAuthEnabled;
  final int timestamp;
  final bool uploadFullSizePhoto;
  final int themeMode;
  final String language;
  final String? fontFamily;
  final String seedColorHex;
  final String userID;

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  // ignore: sort_constructors_first
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return _$SettingsModelFromJson(json);
  }
}
