// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/add_template/provider/add_template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTemplateFormGroupHash() =>
    r'96f9ec9babb38b193c8b15e4ff17749a801d35a8';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addTemplateFormGroup].
@ProviderFor(addTemplateFormGroup)
final addTemplateFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  addTemplateFormGroup,
  name: r'addTemplateFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddTemplateFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addTemplateSeederHash() => r'619227ca9454cab983d2061b14482703d15f9157';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateSeeder].
@ProviderFor(AddTemplateSeeder)
final addTemplateSeederProvider =
    AutoDisposeNotifierProvider<AddTemplateSeeder, TemplateModel?>.internal(
  AddTemplateSeeder.new,
  name: r'addTemplateSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateSeeder = AutoDisposeNotifier<TemplateModel?>;
String _$addTemplateNotifierHash() =>
    r'efb019bfd1c8f4da16e2e3d68fbfa5ea96ef7764';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateNotifier].
@ProviderFor(AddTemplateNotifier)
final addTemplateNotifierProvider = AutoDisposeNotifierProvider<
    AddTemplateNotifier, StateOf<TemplateModel>>.internal(
  AddTemplateNotifier.new,
  name: r'addTemplateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateNotifier = AutoDisposeNotifier<StateOf<TemplateModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
