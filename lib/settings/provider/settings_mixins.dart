
part of 'settings_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.addSettings() = _AddSettings;
}

mixin SettingsEventMixin {}

mixin SettingsStateMixin {}