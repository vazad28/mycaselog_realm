// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_timeline/provider/case_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseTimelineNotifierHash() =>
    r'c2da83e2311040ee78a4d268aab123e96a803ec5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CaseTimelineNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<TimelineItemModel>>> {
  late final String caseID;

  AsyncValue<List<TimelineItemModel>> build(
    String caseID,
  );
}

/// See also [CaseTimelineNotifier].
@ProviderFor(CaseTimelineNotifier)
const caseTimelineNotifierProvider = CaseTimelineNotifierFamily();

/// See also [CaseTimelineNotifier].
class CaseTimelineNotifierFamily extends Family {
  /// See also [CaseTimelineNotifier].
  const CaseTimelineNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'caseTimelineNotifierProvider';

  /// See also [CaseTimelineNotifier].
  CaseTimelineNotifierProvider call(
    String caseID,
  ) {
    return CaseTimelineNotifierProvider(
      caseID,
    );
  }

  @visibleForOverriding
  @override
  CaseTimelineNotifierProvider getProviderOverride(
    covariant CaseTimelineNotifierProvider provider,
  ) {
    return call(
      provider.caseID,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(CaseTimelineNotifier Function() create) {
    return _$CaseTimelineNotifierFamilyOverride(this, create);
  }
}

class _$CaseTimelineNotifierFamilyOverride implements FamilyOverride {
  _$CaseTimelineNotifierFamilyOverride(this.overriddenFamily, this.create);

  final CaseTimelineNotifier Function() create;

  @override
  final CaseTimelineNotifierFamily overriddenFamily;

  @override
  CaseTimelineNotifierProvider getProviderOverride(
    covariant CaseTimelineNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [CaseTimelineNotifier].
class CaseTimelineNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CaseTimelineNotifier, AsyncValue<List<TimelineItemModel>>> {
  /// See also [CaseTimelineNotifier].
  CaseTimelineNotifierProvider(
    String caseID,
  ) : this._internal(
          () => CaseTimelineNotifier()..caseID = caseID,
          from: caseTimelineNotifierProvider,
          name: r'caseTimelineNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$caseTimelineNotifierHash,
          dependencies: CaseTimelineNotifierFamily._dependencies,
          allTransitiveDependencies:
              CaseTimelineNotifierFamily._allTransitiveDependencies,
          caseID: caseID,
        );

  CaseTimelineNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseID,
  }) : super.internal();

  final String caseID;

  @override
  AsyncValue<List<TimelineItemModel>> runNotifierBuild(
    covariant CaseTimelineNotifier notifier,
  ) {
    return notifier.build(
      caseID,
    );
  }

  @override
  Override overrideWith(CaseTimelineNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CaseTimelineNotifierProvider._internal(
        () => create()..caseID = caseID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseID: caseID,
      ),
    );
  }

  @override
  (String,) get argument {
    return (caseID,);
  }

  @override
  AutoDisposeNotifierProviderElement<CaseTimelineNotifier,
      AsyncValue<List<TimelineItemModel>>> createElement() {
    return _CaseTimelineNotifierProviderElement(this);
  }

  CaseTimelineNotifierProvider _copyWith(
    CaseTimelineNotifier Function() create,
  ) {
    return CaseTimelineNotifierProvider._internal(
      () => create()..caseID = caseID,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      caseID: caseID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CaseTimelineNotifierProvider && other.caseID == caseID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CaseTimelineNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<List<TimelineItemModel>>> {
  /// The parameter `caseID` of this provider.
  String get caseID;
}

class _CaseTimelineNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CaseTimelineNotifier,
        AsyncValue<List<TimelineItemModel>>> with CaseTimelineNotifierRef {
  _CaseTimelineNotifierProviderElement(super.provider);

  @override
  String get caseID => (origin as CaseTimelineNotifierProvider).caseID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
