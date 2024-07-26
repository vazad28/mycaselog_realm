// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_timeline/provider/case_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$casesDetailsMediaHash() => r'0bdeb10b6089c4c71599024b21260e1195b16bb9';

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

/// See also [casesDetailsMedia].
@ProviderFor(casesDetailsMedia)
const casesDetailsMediaProvider = CasesDetailsMediaFamily();

/// See also [casesDetailsMedia].
class CasesDetailsMediaFamily extends Family {
  /// See also [casesDetailsMedia].
  const CasesDetailsMediaFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'casesDetailsMediaProvider';

  /// See also [casesDetailsMedia].
  CasesDetailsMediaProvider call(
    String caseID,
  ) {
    return CasesDetailsMediaProvider(
      caseID,
    );
  }

  @visibleForOverriding
  @override
  CasesDetailsMediaProvider getProviderOverride(
    covariant CasesDetailsMediaProvider provider,
  ) {
    return call(
      provider.caseID,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<RealmResultsChanges<MediaModel>> Function(CasesDetailsMediaRef ref)
          create) {
    return _$CasesDetailsMediaFamilyOverride(this, create);
  }
}

class _$CasesDetailsMediaFamilyOverride implements FamilyOverride {
  _$CasesDetailsMediaFamilyOverride(this.overriddenFamily, this.create);

  final Stream<RealmResultsChanges<MediaModel>> Function(
      CasesDetailsMediaRef ref) create;

  @override
  final CasesDetailsMediaFamily overriddenFamily;

  @override
  CasesDetailsMediaProvider getProviderOverride(
    covariant CasesDetailsMediaProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [casesDetailsMedia].
class CasesDetailsMediaProvider
    extends AutoDisposeStreamProvider<RealmResultsChanges<MediaModel>> {
  /// See also [casesDetailsMedia].
  CasesDetailsMediaProvider(
    String caseID,
  ) : this._internal(
          (ref) => casesDetailsMedia(
            ref as CasesDetailsMediaRef,
            caseID,
          ),
          from: casesDetailsMediaProvider,
          name: r'casesDetailsMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$casesDetailsMediaHash,
          dependencies: CasesDetailsMediaFamily._dependencies,
          allTransitiveDependencies:
              CasesDetailsMediaFamily._allTransitiveDependencies,
          caseID: caseID,
        );

  CasesDetailsMediaProvider._internal(
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
  Override overrideWith(
    Stream<RealmResultsChanges<MediaModel>> Function(CasesDetailsMediaRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CasesDetailsMediaProvider._internal(
        (ref) => create(ref as CasesDetailsMediaRef),
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
  AutoDisposeStreamProviderElement<RealmResultsChanges<MediaModel>>
      createElement() {
    return _CasesDetailsMediaProviderElement(this);
  }

  CasesDetailsMediaProvider _copyWith(
    Stream<RealmResultsChanges<MediaModel>> Function(CasesDetailsMediaRef ref)
        create,
  ) {
    return CasesDetailsMediaProvider._internal(
      (ref) => create(ref as CasesDetailsMediaRef),
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
    return other is CasesDetailsMediaProvider && other.caseID == caseID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CasesDetailsMediaRef
    on AutoDisposeStreamProviderRef<RealmResultsChanges<MediaModel>> {
  /// The parameter `caseID` of this provider.
  String get caseID;
}

class _CasesDetailsMediaProviderElement
    extends AutoDisposeStreamProviderElement<RealmResultsChanges<MediaModel>>
    with CasesDetailsMediaRef {
  _CasesDetailsMediaProviderElement(super.provider);

  @override
  String get caseID => (origin as CasesDetailsMediaProvider).caseID;
}

String _$casesDetailsNotesHash() => r'f14e0c30bcb64940f4f1c60c164397c950b40c95';

/// See also [casesDetailsNotes].
@ProviderFor(casesDetailsNotes)
const casesDetailsNotesProvider = CasesDetailsNotesFamily();

/// See also [casesDetailsNotes].
class CasesDetailsNotesFamily extends Family {
  /// See also [casesDetailsNotes].
  const CasesDetailsNotesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'casesDetailsNotesProvider';

  /// See also [casesDetailsNotes].
  CasesDetailsNotesProvider call(
    String caseID,
  ) {
    return CasesDetailsNotesProvider(
      caseID,
    );
  }

  @visibleForOverriding
  @override
  CasesDetailsNotesProvider getProviderOverride(
    covariant CasesDetailsNotesProvider provider,
  ) {
    return call(
      provider.caseID,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<RealmResultsChanges<TimelineNoteModel>> Function(
              CasesDetailsNotesRef ref)
          create) {
    return _$CasesDetailsNotesFamilyOverride(this, create);
  }
}

class _$CasesDetailsNotesFamilyOverride implements FamilyOverride {
  _$CasesDetailsNotesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<RealmResultsChanges<TimelineNoteModel>> Function(
      CasesDetailsNotesRef ref) create;

  @override
  final CasesDetailsNotesFamily overriddenFamily;

  @override
  CasesDetailsNotesProvider getProviderOverride(
    covariant CasesDetailsNotesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [casesDetailsNotes].
class CasesDetailsNotesProvider
    extends AutoDisposeStreamProvider<RealmResultsChanges<TimelineNoteModel>> {
  /// See also [casesDetailsNotes].
  CasesDetailsNotesProvider(
    String caseID,
  ) : this._internal(
          (ref) => casesDetailsNotes(
            ref as CasesDetailsNotesRef,
            caseID,
          ),
          from: casesDetailsNotesProvider,
          name: r'casesDetailsNotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$casesDetailsNotesHash,
          dependencies: CasesDetailsNotesFamily._dependencies,
          allTransitiveDependencies:
              CasesDetailsNotesFamily._allTransitiveDependencies,
          caseID: caseID,
        );

  CasesDetailsNotesProvider._internal(
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
  Override overrideWith(
    Stream<RealmResultsChanges<TimelineNoteModel>> Function(
            CasesDetailsNotesRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CasesDetailsNotesProvider._internal(
        (ref) => create(ref as CasesDetailsNotesRef),
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
  AutoDisposeStreamProviderElement<RealmResultsChanges<TimelineNoteModel>>
      createElement() {
    return _CasesDetailsNotesProviderElement(this);
  }

  CasesDetailsNotesProvider _copyWith(
    Stream<RealmResultsChanges<TimelineNoteModel>> Function(
            CasesDetailsNotesRef ref)
        create,
  ) {
    return CasesDetailsNotesProvider._internal(
      (ref) => create(ref as CasesDetailsNotesRef),
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
    return other is CasesDetailsNotesProvider && other.caseID == caseID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CasesDetailsNotesRef
    on AutoDisposeStreamProviderRef<RealmResultsChanges<TimelineNoteModel>> {
  /// The parameter `caseID` of this provider.
  String get caseID;
}

class _CasesDetailsNotesProviderElement
    extends AutoDisposeStreamProviderElement<
        RealmResultsChanges<TimelineNoteModel>> with CasesDetailsNotesRef {
  _CasesDetailsNotesProviderElement(super.provider);

  @override
  String get caseID => (origin as CasesDetailsNotesProvider).caseID;
}

String _$caseTimelineNotifierHash() =>
    r'cc0b5bbdb42783d1c3327dac04f5e90b20425d34';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
