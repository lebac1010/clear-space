// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$downloadsControllerHash() =>
    r'14626214261a98653757e28a8f396c684ee69f71';

/// [Bug #1 fix] Rewrote from StateNotifier to @riverpod Notifier to avoid
/// force-unwrapping nullable repo on cold start. Now uses the same safe
/// async pattern as ScreenshotsController.
///
/// Copied from [DownloadsController].
@ProviderFor(DownloadsController)
final downloadsControllerProvider =
    AutoDisposeNotifierProvider<DownloadsController, DownloadsState>.internal(
  DownloadsController.new,
  name: r'downloadsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$downloadsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DownloadsController = AutoDisposeNotifier<DownloadsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
