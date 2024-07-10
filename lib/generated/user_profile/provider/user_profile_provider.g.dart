// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../user_profile/provider/user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userMiniStatsHash() => r'53ec4f8db593f1620c5507e67fcca81015470cea';

/// ////////////////////////////////////////////////////////////////////
/// Main Providers
/// ////////////////////////////////////////////////////////////////////
/// provider for user mini stats
///
/// Copied from [userMiniStats].
@ProviderFor(userMiniStats)
final userMiniStatsProvider = AutoDisposeProvider<UserStatsModel>.internal(
  userMiniStats,
  name: r'userMiniStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userMiniStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserMiniStatsRef = AutoDisposeProviderRef<UserStatsModel>;
String _$userProfileNotifierHash() =>
    r'bb42e6fd8fbfd348bdf3de30cdd8d9f30ccba62f';

/// See also [UserProfileNotifier].
@ProviderFor(UserProfileNotifier)
final userProfileNotifierProvider =
    AutoDisposeNotifierProvider<UserProfileNotifier, UserModel>.internal(
  UserProfileNotifier.new,
  name: r'userProfileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserProfileNotifier = AutoDisposeNotifier<UserModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
