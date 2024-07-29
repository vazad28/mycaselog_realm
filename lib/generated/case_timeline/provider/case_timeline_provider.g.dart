// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_timeline/provider/case_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseTimelineNotifierHash() =>
    r'65131835dd7004b89350ca41b03f507a2fede61f';

/// See also [CaseTimelineNotifier].
@ProviderFor(CaseTimelineNotifier)
final caseTimelineNotifierProvider = AutoDisposeNotifierProvider<
    CaseTimelineNotifier, AsyncValue<List<TimelineItemModel>>>.internal(
  CaseTimelineNotifier.new,
  name: r'caseTimelineNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseTimelineNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseTimelineNotifier
    = AutoDisposeNotifier<AsyncValue<List<TimelineItemModel>>>;
String _$caseTimelineHash() => r'782398033f91fb7684af9fbda53f70e5e088395a';

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

abstract class _$CaseTimeline
    extends BuildlessAutoDisposeNotifier<List<TimelineItemModel>> {
  late final CaseModel caseModel;

  List<TimelineItemModel> build(
    CaseModel caseModel,
  );
}

/// See also [CaseTimeline].
@ProviderFor(CaseTimeline)
const caseTimelineProvider = CaseTimelineFamily();

/// See also [CaseTimeline].
class CaseTimelineFamily extends Family {
  /// See also [CaseTimeline].
  const CaseTimelineFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'caseTimelineProvider';

  /// See also [CaseTimeline].
  CaseTimelineProvider call(
    CaseModel caseModel,
  ) {
    return CaseTimelineProvider(
      caseModel,
    );
  }

  @visibleForOverriding
  @override
  CaseTimelineProvider getProviderOverride(
    covariant CaseTimelineProvider provider,
  ) {
    return call(
      provider.caseModel,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(CaseTimeline Function() create) {
    return _$CaseTimelineFamilyOverride(this, create);
  }
}

class _$CaseTimelineFamilyOverride implements FamilyOverride {
  _$CaseTimelineFamilyOverride(this.overriddenFamily, this.create);

  final CaseTimeline Function() create;

  @override
  final CaseTimelineFamily overriddenFamily;

  @override
  CaseTimelineProvider getProviderOverride(
    covariant CaseTimelineProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [CaseTimeline].
class CaseTimelineProvider extends AutoDisposeNotifierProviderImpl<CaseTimeline,
    List<TimelineItemModel>> {
  /// See also [CaseTimeline].
  CaseTimelineProvider(
    CaseModel caseModel,
  ) : this._internal(
          () => CaseTimeline()..caseModel = caseModel,
          from: caseTimelineProvider,
          name: r'caseTimelineProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$caseTimelineHash,
          dependencies: CaseTimelineFamily._dependencies,
          allTransitiveDependencies:
              CaseTimelineFamily._allTransitiveDependencies,
          caseModel: caseModel,
        );

  CaseTimelineProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseModel,
  }) : super.internal();

  final CaseModel caseModel;

  @override
  List<TimelineItemModel> runNotifierBuild(
    covariant CaseTimeline notifier,
  ) {
    return notifier.build(
      caseModel,
    );
  }

  @override
  Override overrideWith(CaseTimeline Function() create) {
    return ProviderOverride(
      origin: this,
      override: CaseTimelineProvider._internal(
        () => create()..caseModel = caseModel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseModel: caseModel,
      ),
    );
  }

  @override
  (CaseModel,) get argument {
    return (caseModel,);
  }

  @override
  AutoDisposeNotifierProviderElement<CaseTimeline, List<TimelineItemModel>>
      createElement() {
    return _CaseTimelineProviderElement(this);
  }

  CaseTimelineProvider _copyWith(
    CaseTimeline Function() create,
  ) {
    return CaseTimelineProvider._internal(
      () => create()..caseModel = caseModel,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      caseModel: caseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CaseTimelineProvider && other.caseModel == caseModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CaseTimelineRef
    on AutoDisposeNotifierProviderRef<List<TimelineItemModel>> {
  /// The parameter `caseModel` of this provider.
  CaseModel get caseModel;
}

class _CaseTimelineProviderElement extends AutoDisposeNotifierProviderElement<
    CaseTimeline, List<TimelineItemModel>> with CaseTimelineRef {
  _CaseTimelineProviderElement(super.provider);

  @override
  CaseModel get caseModel => (origin as CaseTimelineProvider).caseModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
