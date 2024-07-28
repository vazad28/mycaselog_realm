// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../stats/provider/stats_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chartTabsControllerHash() =>
    r'388fda79091dfd6a408921c52cc6698a7e168566';

/// Page controller provider
///
/// Copied from [chartTabsController].
@ProviderFor(chartTabsController)
final chartTabsControllerProvider =
    AutoDisposeProvider<PageController>.internal(
  chartTabsController,
  name: r'chartTabsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chartTabsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChartTabsControllerRef = AutoDisposeProviderRef<PageController>;
String _$touchedIndexHash() => r'c31bebe74756143799c4b36d906c57d15c82d25c';

/// Provider holding current touched chart items index
///
/// Copied from [TouchedIndex].
@ProviderFor(TouchedIndex)
final touchedIndexProvider =
    AutoDisposeNotifierProvider<TouchedIndex, int?>.internal(
  TouchedIndex.new,
  name: r'touchedIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$touchedIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TouchedIndex = AutoDisposeNotifier<int?>;
String _$statsDataHash() => r'056c1d6f966309af19d901e05d82bec4134b9d72';

/// See also [StatsData].
@ProviderFor(StatsData)
final statsDataProvider =
    AutoDisposeNotifierProvider<StatsData, StateOf<ChartDataModel>>.internal(
  StatsData.new,
  name: r'statsDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$statsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StatsData = AutoDisposeNotifier<StateOf<ChartDataModel>>;
String _$statsNotifierHash() => r'8dcfd29b168c1bdfd826170e5325ba1f10a51229';

/// See also [StatsNotifier].
@ProviderFor(StatsNotifier)
final statsNotifierProvider =
    AutoDisposeNotifierProvider<StatsNotifier, ChartReqModel>.internal(
  StatsNotifier.new,
  name: r'statsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$statsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StatsNotifier = AutoDisposeNotifier<ChartReqModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
