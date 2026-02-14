// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duplicate_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$duplicateControllerHash() =>
    r'be7cc961eda3f2451849a8fe14ab0e8c0706c991';

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

abstract class _$DuplicateController
    extends BuildlessAutoDisposeAsyncNotifier<List<CleanupGroup>> {
  late final CleanupType type;

  FutureOr<List<CleanupGroup>> build(
    CleanupType type,
  );
}

/// See also [DuplicateController].
@ProviderFor(DuplicateController)
const duplicateControllerProvider = DuplicateControllerFamily();

/// See also [DuplicateController].
class DuplicateControllerFamily extends Family<AsyncValue<List<CleanupGroup>>> {
  /// See also [DuplicateController].
  const DuplicateControllerFamily();

  /// See also [DuplicateController].
  DuplicateControllerProvider call(
    CleanupType type,
  ) {
    return DuplicateControllerProvider(
      type,
    );
  }

  @override
  DuplicateControllerProvider getProviderOverride(
    covariant DuplicateControllerProvider provider,
  ) {
    return call(
      provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'duplicateControllerProvider';
}

/// See also [DuplicateController].
class DuplicateControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DuplicateController, List<CleanupGroup>> {
  /// See also [DuplicateController].
  DuplicateControllerProvider(
    CleanupType type,
  ) : this._internal(
          () => DuplicateController()..type = type,
          from: duplicateControllerProvider,
          name: r'duplicateControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$duplicateControllerHash,
          dependencies: DuplicateControllerFamily._dependencies,
          allTransitiveDependencies:
              DuplicateControllerFamily._allTransitiveDependencies,
          type: type,
        );

  DuplicateControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final CleanupType type;

  @override
  FutureOr<List<CleanupGroup>> runNotifierBuild(
    covariant DuplicateController notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(DuplicateController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DuplicateControllerProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DuplicateController,
      List<CleanupGroup>> createElement() {
    return _DuplicateControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DuplicateControllerProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DuplicateControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<CleanupGroup>> {
  /// The parameter `type` of this provider.
  CleanupType get type;
}

class _DuplicateControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DuplicateController,
        List<CleanupGroup>> with DuplicateControllerRef {
  _DuplicateControllerProviderElement(super.provider);

  @override
  CleanupType get type => (origin as DuplicateControllerProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
