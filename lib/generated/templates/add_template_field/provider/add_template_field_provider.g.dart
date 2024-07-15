// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/add_template_field/provider/add_template_field_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTemplateFieldFormGroupHash() =>
    r'76ee7d5cfb5b4ab753459fdfafd2aeed66ddfc49';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addTemplateFieldFormGroup].
@ProviderFor(addTemplateFieldFormGroup)
final addTemplateFieldFormGroupProvider =
    AutoDisposeProvider<FormGroup>.internal(
  addTemplateFieldFormGroup,
  name: r'addTemplateFieldFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFieldFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddTemplateFieldFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addTemplateFieldSeederHash() =>
    r'a2c42d43fa0d1d6892650e86b99dbb3e4f8450c5';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateFieldSeeder].
@ProviderFor(AddTemplateFieldSeeder)
final addTemplateFieldSeederProvider = AutoDisposeNotifierProvider<
    AddTemplateFieldSeeder, TemplateFieldModel?>.internal(
  AddTemplateFieldSeeder.new,
  name: r'addTemplateFieldSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFieldSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateFieldSeeder = AutoDisposeNotifier<TemplateFieldModel?>;
String _$templateFieldTypeHash() => r'1b126521bad3d79565986e4c7a69a54174b25715';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
/// field type provider
///
/// Copied from [TemplateFieldType].
@ProviderFor(TemplateFieldType)
final templateFieldTypeProvider =
    AutoDisposeNotifierProvider<TemplateFieldType, FieldType>.internal(
  TemplateFieldType.new,
  name: r'templateFieldTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templateFieldTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplateFieldType = AutoDisposeNotifier<FieldType>;
String _$fieldOptionsHash() => r'a226debffb0f73a8b04fa669e2de87c0c67dbce6';

/// Add field options provider
///
/// Copied from [FieldOptions].
@ProviderFor(FieldOptions)
final fieldOptionsProvider =
    AutoDisposeNotifierProvider<FieldOptions, List<String>?>.internal(
  FieldOptions.new,
  name: r'fieldOptionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fieldOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldOptions = AutoDisposeNotifier<List<String>?>;
String _$addTemplateFieldNotifierHash() =>
    r'a53be025926249436196b1abb1a9d812c54fd5ac';

/// See also [AddTemplateFieldNotifier].
@ProviderFor(AddTemplateFieldNotifier)
final addTemplateFieldNotifierProvider = AutoDisposeNotifierProvider<
    AddTemplateFieldNotifier, StateOf<TemplateFieldModel>>.internal(
  AddTemplateFieldNotifier.new,
  name: r'addTemplateFieldNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFieldNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateFieldNotifier
    = AutoDisposeNotifier<StateOf<TemplateFieldModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
