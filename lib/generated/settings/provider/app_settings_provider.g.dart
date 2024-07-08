// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../settings/provider/app_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentThemeModeHash() => r'c6acab42ff584ebacbd44357bd057ef0db857cb5';

/// See also [CurrentThemeMode].
@ProviderFor(CurrentThemeMode)
final currentThemeModeProvider =
    AutoDisposeNotifierProvider<CurrentThemeMode, int>.internal(
  CurrentThemeMode.new,
  name: r'currentThemeModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentThemeMode = AutoDisposeNotifier<int>;
String _$appSettingsHash() => r'6e03e2b0c4cb45e1fb2ee3ca6a9676d127482eff';

/// See also [AppSettings].
@ProviderFor(AppSettings)
final appSettingsProvider =
    NotifierProvider<AppSettings, SettingsModel>.internal(
  AppSettings.new,
  name: r'appSettingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSettings = Notifier<SettingsModel>;
String _$templatesCountHash() => r'171fb468c1f715c41a567cf36149409a05951296';

/// See also [TemplatesCount].
@ProviderFor(TemplatesCount)
final templatesCountProvider = NotifierProvider<TemplatesCount, int>.internal(
  TemplatesCount.new,
  name: r'templatesCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templatesCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplatesCount = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
