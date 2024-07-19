// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_details/provider/case_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseDetailsTemplateModelHash() =>
    r'5952d6f00af484cac8417378f968f47b4b7fdb38';

/// See also [caseDetailsTemplateModel].
@ProviderFor(caseDetailsTemplateModel)
final caseDetailsTemplateModelProvider =
    AutoDisposeProvider<AsyncValue<TemplateModel?>>.internal(
  caseDetailsTemplateModel,
  name: r'caseDetailsTemplateModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseDetailsTemplateModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CaseDetailsTemplateModelRef
    = AutoDisposeProviderRef<AsyncValue<TemplateModel?>>;
String _$caseModelSeederHash() => r'3a6a19352246e8cc5f73796f647426df0b4dba4b';

/// See also [CaseModelSeeder].
@ProviderFor(CaseModelSeeder)
final caseModelSeederProvider =
    AutoDisposeNotifierProvider<CaseModelSeeder, CaseModel?>.internal(
  CaseModelSeeder.new,
  name: r'caseModelSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseModelSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseModelSeeder = AutoDisposeNotifier<CaseModel?>;
String _$caseDetailsNotifierHash() =>
    r'd3fca0c1e274fdb3651990104da2e85063facd84';

/// See also [CaseDetailsNotifier].
@ProviderFor(CaseDetailsNotifier)
final caseDetailsNotifierProvider = AutoDisposeNotifierProvider<
    CaseDetailsNotifier, AsyncValue<CaseModel>>.internal(
  CaseDetailsNotifier.new,
  name: r'caseDetailsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseDetailsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseDetailsNotifier = AutoDisposeNotifier<AsyncValue<CaseModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
