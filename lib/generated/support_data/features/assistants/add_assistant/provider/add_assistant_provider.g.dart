// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../support_data/features/assistants/add_assistant/provider/add_assistant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addAssistantFormGroupHash() =>
    r'bfdedd1ed4b783bc0258af6c016132217982c08d';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addAssistantFormGroup].
@ProviderFor(addAssistantFormGroup)
final addAssistantFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  addAssistantFormGroup,
  name: r'addAssistantFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addAssistantFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddAssistantFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addAssistantSeederHash() =>
    r'7829e90d475e07f37716194948476bfe00a32712';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddAssistantSeeder].
@ProviderFor(AddAssistantSeeder)
final addAssistantSeederProvider =
    AutoDisposeNotifierProvider<AddAssistantSeeder, AssistantModel?>.internal(
  AddAssistantSeeder.new,
  name: r'addAssistantSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addAssistantSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddAssistantSeeder = AutoDisposeNotifier<AssistantModel?>;
String _$addAssistantNotifierHash() =>
    r'cd492f3662ca29d40380b9d24409eee9919c5370';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddAssistantNotifier].
@ProviderFor(AddAssistantNotifier)
final addAssistantNotifierProvider = AutoDisposeNotifierProvider<
    AddAssistantNotifier, StateOf<AssistantModel>>.internal(
  AddAssistantNotifier.new,
  name: r'addAssistantNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addAssistantNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddAssistantNotifier = AutoDisposeNotifier<StateOf<AssistantModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
