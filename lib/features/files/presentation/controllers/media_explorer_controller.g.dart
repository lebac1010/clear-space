// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_explorer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaExplorerControllerHash() =>
    r'964f6545857c3f95d128f9a460e35274946bba1d';

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

abstract class _$MediaExplorerController
    extends BuildlessAutoDisposeAsyncNotifier<List<MediaFile>> {
  late final String type;

  FutureOr<List<MediaFile>> build(
    String type,
  );
}

/// See also [MediaExplorerController].
@ProviderFor(MediaExplorerController)
const mediaExplorerControllerProvider = MediaExplorerControllerFamily();

/// See also [MediaExplorerController].
class MediaExplorerControllerFamily
    extends Family<AsyncValue<List<MediaFile>>> {
  /// See also [MediaExplorerController].
  const MediaExplorerControllerFamily();

  /// See also [MediaExplorerController].
  MediaExplorerControllerProvider call(
    String type,
  ) {
    return MediaExplorerControllerProvider(
      type,
    );
  }

  @override
  MediaExplorerControllerProvider getProviderOverride(
    covariant MediaExplorerControllerProvider provider,
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
  String? get name => r'mediaExplorerControllerProvider';
}

/// See also [MediaExplorerController].
class MediaExplorerControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MediaExplorerController,
        List<MediaFile>> {
  /// See also [MediaExplorerController].
  MediaExplorerControllerProvider(
    String type,
  ) : this._internal(
          () => MediaExplorerController()..type = type,
          from: mediaExplorerControllerProvider,
          name: r'mediaExplorerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mediaExplorerControllerHash,
          dependencies: MediaExplorerControllerFamily._dependencies,
          allTransitiveDependencies:
              MediaExplorerControllerFamily._allTransitiveDependencies,
          type: type,
        );

  MediaExplorerControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  FutureOr<List<MediaFile>> runNotifierBuild(
    covariant MediaExplorerController notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(MediaExplorerController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MediaExplorerControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MediaExplorerController,
      List<MediaFile>> createElement() {
    return _MediaExplorerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaExplorerControllerProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MediaExplorerControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<MediaFile>> {
  /// The parameter `type` of this provider.
  String get type;
}

class _MediaExplorerControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MediaExplorerController,
        List<MediaFile>> with MediaExplorerControllerRef {
  _MediaExplorerControllerProviderElement(super.provider);

  @override
  String get type => (origin as MediaExplorerControllerProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
