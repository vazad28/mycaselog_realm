// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/providers/startup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartUpHash() => r'16b340b1ac38ab625951f2c6c0bc0028c2d1c9fe';

/// See also [appStartUp].
@ProviderFor(appStartUp)
final appStartUpProvider = AutoDisposeFutureProvider<void>.internal(
  appStartUp,
  name: r'appStartUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appStartUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppStartUpRef = AutoDisposeFutureProviderRef<void>;
String _$currentThemeModeHash() => r'7e59fd4cc020fbea713ad3f8a130394c6e35f580';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
