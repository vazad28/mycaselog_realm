import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/settings/provider/settings_event.freezed.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.updateThemeMode(ThemeMode themeMode) =
      _UpdateThemeMode;

  const factory SettingsEvent.updateThemeColor(String seedColor) =
      _UpdateThemeColor;

  // ignore: avoid_positional_boolean_parameters
  const factory SettingsEvent.updatesyncOnStart(bool syncOnStart) =
      _UpdatesyncOnStart;

  // ignore: avoid_positional_boolean_parameters
  const factory SettingsEvent.updateLocalAuthEnabled(bool localAuthEnabled) =
      _UpdateLocalAuthEnabled;

  const factory SettingsEvent.updateCaseTileNavigate(int caseTileNavigateTo) =
      _UpdateCaseTileNavigate;
}
