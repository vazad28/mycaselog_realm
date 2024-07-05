// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../support_data/features/assistants/assistants/provider/assistants_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assistantsListHash() => r'b306036996baafa02697ffb00f64bc74f1a5e53b';

/// Provider to keep the state of Assistants
///
/// Copied from [assistantsList].
@ProviderFor(assistantsList)
final assistantsListProvider =
    AutoDisposeProvider<List<AssistantModel>>.internal(
  assistantsList,
  name: r'assistantsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$assistantsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AssistantsListRef = AutoDisposeProviderRef<List<AssistantModel>>;
String _$filteredAssistantsListHash() =>
    r'ab7b7b4da3f6942b17af5df034b2eb0770344da4';

/// Provider to filter assistants
///
/// Copied from [filteredAssistantsList].
@ProviderFor(filteredAssistantsList)
final filteredAssistantsListProvider =
    AutoDisposeProvider<List<AssistantModel>>.internal(
  filteredAssistantsList,
  name: r'filteredAssistantsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredAssistantsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredAssistantsListRef
    = AutoDisposeProviderRef<List<AssistantModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
