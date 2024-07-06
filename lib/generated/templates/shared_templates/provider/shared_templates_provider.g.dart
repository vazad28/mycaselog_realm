// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/shared_templates/provider/shared_templates_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedTemplatesNotifierHash() =>
    r'325b00c3117c90216949994ae19c98f49813d6cb';

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

abstract class _$SharedTemplatesNotifier
    extends BuildlessAutoDisposeNotifier<StateOf<List<SharedTemplateModel>>> {
  late final String? speciality;

  StateOf<List<SharedTemplateModel>> build(
    String? speciality,
  );
}

/// See also [SharedTemplatesNotifier].
@ProviderFor(SharedTemplatesNotifier)
const sharedTemplatesNotifierProvider = SharedTemplatesNotifierFamily();

/// See also [SharedTemplatesNotifier].
class SharedTemplatesNotifierFamily extends Family {
  /// See also [SharedTemplatesNotifier].
  const SharedTemplatesNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sharedTemplatesNotifierProvider';

  /// See also [SharedTemplatesNotifier].
  SharedTemplatesNotifierProvider call(
    String? speciality,
  ) {
    return SharedTemplatesNotifierProvider(
      speciality,
    );
  }

  @visibleForOverriding
  @override
  SharedTemplatesNotifierProvider getProviderOverride(
    covariant SharedTemplatesNotifierProvider provider,
  ) {
    return call(
      provider.speciality,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SharedTemplatesNotifier Function() create) {
    return _$SharedTemplatesNotifierFamilyOverride(this, create);
  }
}

class _$SharedTemplatesNotifierFamilyOverride implements FamilyOverride {
  _$SharedTemplatesNotifierFamilyOverride(this.overriddenFamily, this.create);

  final SharedTemplatesNotifier Function() create;

  @override
  final SharedTemplatesNotifierFamily overriddenFamily;

  @override
  SharedTemplatesNotifierProvider getProviderOverride(
    covariant SharedTemplatesNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SharedTemplatesNotifier].
class SharedTemplatesNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SharedTemplatesNotifier, StateOf<List<SharedTemplateModel>>> {
  /// See also [SharedTemplatesNotifier].
  SharedTemplatesNotifierProvider(
    String? speciality,
  ) : this._internal(
          () => SharedTemplatesNotifier()..speciality = speciality,
          from: sharedTemplatesNotifierProvider,
          name: r'sharedTemplatesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sharedTemplatesNotifierHash,
          dependencies: SharedTemplatesNotifierFamily._dependencies,
          allTransitiveDependencies:
              SharedTemplatesNotifierFamily._allTransitiveDependencies,
          speciality: speciality,
        );

  SharedTemplatesNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.speciality,
  }) : super.internal();

  final String? speciality;

  @override
  StateOf<List<SharedTemplateModel>> runNotifierBuild(
    covariant SharedTemplatesNotifier notifier,
  ) {
    return notifier.build(
      speciality,
    );
  }

  @override
  Override overrideWith(SharedTemplatesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SharedTemplatesNotifierProvider._internal(
        () => create()..speciality = speciality,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        speciality: speciality,
      ),
    );
  }

  @override
  (String?,) get argument {
    return (speciality,);
  }

  @override
  AutoDisposeNotifierProviderElement<SharedTemplatesNotifier,
      StateOf<List<SharedTemplateModel>>> createElement() {
    return _SharedTemplatesNotifierProviderElement(this);
  }

  SharedTemplatesNotifierProvider _copyWith(
    SharedTemplatesNotifier Function() create,
  ) {
    return SharedTemplatesNotifierProvider._internal(
      () => create()..speciality = speciality,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      speciality: speciality,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SharedTemplatesNotifierProvider &&
        other.speciality == speciality;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, speciality.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SharedTemplatesNotifierRef
    on AutoDisposeNotifierProviderRef<StateOf<List<SharedTemplateModel>>> {
  /// The parameter `speciality` of this provider.
  String? get speciality;
}

class _SharedTemplatesNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SharedTemplatesNotifier,
        StateOf<List<SharedTemplateModel>>> with SharedTemplatesNotifierRef {
  _SharedTemplatesNotifierProviderElement(super.provider);

  @override
  String? get speciality =>
      (origin as SharedTemplatesNotifierProvider).speciality;
}

String _$sharedTemplateNotifierHash() =>
    r'd67d55770ecdd7b5847ee5a33ec143ce8d3c1af5';

/// See also [SharedTemplateNotifier].
@ProviderFor(SharedTemplateNotifier)
final sharedTemplateNotifierProvider = AutoDisposeNotifierProvider<
    SharedTemplateNotifier, StateOf<String>>.internal(
  SharedTemplateNotifier.new,
  name: r'sharedTemplateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedTemplateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedTemplateNotifier = AutoDisposeNotifier<StateOf<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
