// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../cases/provider/cases_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalCasesCountHash() => r'2ce8226b34ec28df3e7388973e92d3d49d11953c';

/// Total case count provider
///
/// Copied from [TotalCasesCount].
@ProviderFor(TotalCasesCount)
final totalCasesCountProvider =
    AutoDisposeAsyncNotifierProvider<TotalCasesCount, int>.internal(
  TotalCasesCount.new,
  name: r'totalCasesCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalCasesCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalCasesCount = AutoDisposeAsyncNotifier<int>;
String _$caseTileStyleHash() => r'd137223612d5115f0cf2dce39356eb824b8e614f';

/// case tile style provider
///
/// Copied from [CaseTileStyle].
@ProviderFor(CaseTileStyle)
final caseTileStyleProvider =
    AutoDisposeNotifierProvider<CaseTileStyle, int>.internal(
  CaseTileStyle.new,
  name: r'caseTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseTileStyle = AutoDisposeNotifier<int>;
String _$casesNotifierHash() => r'e68b801ac002509a396df1e1b9c3aa6f550f235e';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [CasesNotifier].
@ProviderFor(CasesNotifier)
final casesNotifierProvider =
    NotifierProvider<CasesNotifier, RealmResults<CaseModel>>.internal(
  CasesNotifier.new,
  name: r'casesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$casesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CasesNotifier = Notifier<RealmResults<CaseModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
