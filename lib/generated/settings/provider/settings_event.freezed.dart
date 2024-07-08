// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../settings/provider/settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateThemeModeImpl implements _UpdateThemeMode {
  const _$UpdateThemeModeImpl(this.themeMode);

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'SettingsEvent.updateThemeMode(themeMode: $themeMode)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) {
    return updateThemeMode(this);
  }
}

abstract class _UpdateThemeMode implements SettingsEvent {
  const factory _UpdateThemeMode(final ThemeMode themeMode) =
      _$UpdateThemeModeImpl;

  ThemeMode get themeMode;
}

/// @nodoc

class _$UpdateThemeColorImpl implements _UpdateThemeColor {
  const _$UpdateThemeColorImpl(this.seedColor);

  @override
  final String seedColor;

  @override
  String toString() {
    return 'SettingsEvent.updateThemeColor(seedColor: $seedColor)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) {
    return updateThemeColor(this);
  }
}

abstract class _UpdateThemeColor implements SettingsEvent {
  const factory _UpdateThemeColor(final String seedColor) =
      _$UpdateThemeColorImpl;

  String get seedColor;
}

/// @nodoc

class _$UpdatesyncOnStartImpl implements _UpdatesyncOnStart {
  const _$UpdatesyncOnStartImpl(this.syncOnStart);

  @override
  final bool syncOnStart;

  @override
  String toString() {
    return 'SettingsEvent.updatesyncOnStart(syncOnStart: $syncOnStart)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) {
    return updatesyncOnStart(this);
  }
}

abstract class _UpdatesyncOnStart implements SettingsEvent {
  const factory _UpdatesyncOnStart(final bool syncOnStart) =
      _$UpdatesyncOnStartImpl;

  bool get syncOnStart;
}

/// @nodoc

class _$UpdateLocalAuthEnabledImpl implements _UpdateLocalAuthEnabled {
  const _$UpdateLocalAuthEnabledImpl(this.localAuthEnabled);

  @override
  final bool localAuthEnabled;

  @override
  String toString() {
    return 'SettingsEvent.updateLocalAuthEnabled(localAuthEnabled: $localAuthEnabled)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) {
    return updateLocalAuthEnabled(this);
  }
}

abstract class _UpdateLocalAuthEnabled implements SettingsEvent {
  const factory _UpdateLocalAuthEnabled(final bool localAuthEnabled) =
      _$UpdateLocalAuthEnabledImpl;

  bool get localAuthEnabled;
}

/// @nodoc

class _$UpdateCaseTileNavigateImpl implements _UpdateCaseTileNavigate {
  const _$UpdateCaseTileNavigateImpl(this.caseTileNavigateTo);

  @override
  final int caseTileNavigateTo;

  @override
  String toString() {
    return 'SettingsEvent.updateCaseTileNavigate(caseTileNavigateTo: $caseTileNavigateTo)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
    required TResult Function(_UpdateThemeColor value) updateThemeColor,
    required TResult Function(_UpdatesyncOnStart value) updatesyncOnStart,
    required TResult Function(_UpdateLocalAuthEnabled value)
        updateLocalAuthEnabled,
    required TResult Function(_UpdateCaseTileNavigate value)
        updateCaseTileNavigate,
  }) {
    return updateCaseTileNavigate(this);
  }
}

abstract class _UpdateCaseTileNavigate implements SettingsEvent {
  const factory _UpdateCaseTileNavigate(final int caseTileNavigateTo) =
      _$UpdateCaseTileNavigateImpl;

  int get caseTileNavigateTo;
}
