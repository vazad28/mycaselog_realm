// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../settings/provider/settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsNotifierHash() => r'98c1accc941c89366bf0bbca6478c4a7010642c0';

/// Use a Notifier provider so we can have access to the settings without async
///
/// Copied from [SettingsNotifier].
@ProviderFor(SettingsNotifier)
final settingsNotifierProvider =
    NotifierProvider<SettingsNotifier, SettingsModel>.internal(
  SettingsNotifier.new,
  name: r'settingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsNotifier = Notifier<SettingsModel>;
String _$templatesCountHash() => r'4349cac1048a2a91b8a6b87ba8ec97f04b98ed1f';

/// Template count provider
///
/// Copied from [TemplatesCount].
@ProviderFor(TemplatesCount)
final templatesCountProvider =
    AutoDisposeNotifierProvider<TemplatesCount, int>.internal(
  TemplatesCount.new,
  name: r'templatesCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templatesCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplatesCount = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
