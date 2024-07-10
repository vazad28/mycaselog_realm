// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    _SettingsModel()
      ..userID = json['userID'] as String
      ..biometricEnabled = json['biometricEnabled'] as bool
      ..caseTileNavigate = (json['caseTileNavigate'] as num).toInt()
      ..caseTileStyle = (json['caseTileStyle'] as num).toInt()
      ..showByLocation = json['showByLocation'] as String?
      ..syncOnStart = json['syncOnStart'] as bool
      ..localAuthEnabled = json['localAuthEnabled'] as bool
      ..timestamp = (json['timestamp'] as num).toInt()
      ..uploadFullSizePhoto = json['uploadFullSizePhoto'] as bool
      ..themeMode = (json['themeMode'] as num).toInt()
      ..language = json['language'] as String
      ..fontFamily = json['fontFamily'] as String?
      ..seedColorHex = json['seedColorHex'] as String;

Map<String, dynamic> _$SettingsModelToJson(_SettingsModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'biometricEnabled': instance.biometricEnabled,
      'caseTileNavigate': instance.caseTileNavigate,
      'caseTileStyle': instance.caseTileStyle,
      'showByLocation': instance.showByLocation,
      'syncOnStart': instance.syncOnStart,
      'localAuthEnabled': instance.localAuthEnabled,
      'timestamp': instance.timestamp,
      'uploadFullSizePhoto': instance.uploadFullSizePhoto,
      'themeMode': instance.themeMode,
      'language': instance.language,
      'fontFamily': instance.fontFamily,
      'seedColorHex': instance.seedColorHex,
    };
