import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ads/ad_unit_ids.dart';
import '../../../../core/ads/widgets/native_template_ad_card.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/domain/entities/storage_info.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../../domain/entities/photo_model.dart';
import '../controllers/photos_controller.dart';

class PhotosScreen extends ConsumerWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          context.l10n.photosTitle,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(RouteConstants.settings),
          ),
          const Gap(8),
        ],
      ),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.media,
        builder: (context, ref) {
          final storageInfoAsync = ref.watch(dashboardControllerProvider);
          final photosAsync = ref.watch(photosControllerProvider);
          final hasStorageSummary = storageInfoAsync.valueOrNull != null;
          final loadedPhotos = photosAsync.valueOrNull;
          final photoCount = loadedPhotos?.length ?? 0;
          final totalPhotoSize =
              loadedPhotos == null || loadedPhotos.isEmpty
              ? null
              : loadedPhotos.fold<int>(0, (sum, photo) => sum + photo.size);

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      storageInfoAsync.when(
                        data: (info) {
                          if (info != null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.itemCount(info.photosCount),
                                  style: Theme.of(context).textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  FileUtils.formatSize(info.photosSize),
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: context.appTextSecondary),
                                ),
                              ],
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photoCount > 0
                                    ? context.l10n.itemCount(photoCount)
                                    : context.l10n.photosTitle,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              if (totalPhotoSize != null)
                                Text(
                                  FileUtils.formatSize(totalPhotoSize),
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: context.appTextSecondary),
                                ),
                            ],
                          );
                        },
                        loading: () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.photosTitle,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Gap(4),
                            Text(
                              context.l10n.loading,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: context.appTextSecondary),
                            ),
                          ],
                        ),
                        error: (_, __) => Text(
                          photoCount > 0
                              ? context.l10n.itemCount(photoCount)
                              : context.l10n.photosTitle,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(24),
                      if (hasStorageSummary) ...[
                        Text(
                          context.l10n.analyze,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Gap(12),
                        _buildAnalysisCards(context, ref, storageInfoAsync),
                      ],
                      const NativeTemplateAdCard(
                        placement: AppNativeAdPlacement.photos,
                        margin: EdgeInsets.only(top: 8),
                      ),
                      const Gap(12),
                      Text(
                        context.l10n.photosTitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              photosAsync.when(
                data: (photos) {
                  if (photos.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(context.l10n.noPhotosFound),
                        ),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index == photos.length - 5) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref
                                .read(photosControllerProvider.notifier)
                                .loadMore();
                          });
                        }
                        return _PhotoGridItem(photo: photos[index]);
                      }, childCount: photos.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                          ),
                    ),
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                error: (err, stack) => SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      context.l10n.errorLoadingPhotos(err.toString()),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Gap(80)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnalysisCards(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<StorageInfo?> storageInfoAsync,
  ) {
    return storageInfoAsync.when(
      data: (info) {
        if (info == null) return const SizedBox();
        final duplicateSize = info.duplicateSize;
        final similarSize = info.similarPhotoSize;

        return Row(
          children: [
            Expanded(
              child: _AnalysisCard(
                title: context.l10n.duplicates,
                subtitle: context.l10n.potentialSize(
                  FileUtils.formatSize(duplicateSize),
                ),
                icon: Icons.copy,
                color: context.customColors.orange,
                onTap: () => context.go('/photos/duplicates?type=duplicate'),
              ),
            ),
            const Gap(12),
            Expanded(
              child: _AnalysisCard(
                title: context.l10n.similar,
                subtitle: context.l10n.potentialSize(
                  FileUtils.formatSize(similarSize),
                ),
                icon: Icons.photo_library_outlined,
                color: context.customColors.purple,
                onTap: () => context.go('/photos/duplicates?type=similar'),
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox(
        height: 80,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox(),
    );
  }
}

class _AnalysisCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AnalysisCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const Gap(12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Gap(4),
          Text(
            subtitle,
            style: TextStyle(color: context.appTextSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _PhotoGridItem extends ConsumerStatefulWidget {
  final PhotoModel photo;

  const _PhotoGridItem({required this.photo});

  @override
  ConsumerState<_PhotoGridItem> createState() => _PhotoGridItemState();
}

class _PhotoGridItemState extends ConsumerState<_PhotoGridItem> {
  Uint8List? _bytes;
  bool _loading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final uri = widget.photo.uri;
    if (uri.isEmpty) {
      setState(() {
        _loading = false;
        _hasError = true;
      });
      return;
    }

    try {
      final scanner = ref.read(nativeStorageScannerProvider);
      final bytes = await scanner.getPhotoBytes(uri);
      if (mounted) {
        setState(() {
          _bytes = bytes;
          _loading = false;
          _hasError = bytes == null;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _loading = false;
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        color: context.imagePlaceholder,
        child: const Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (_hasError || _bytes == null) {
      return Container(
        color: context.imagePlaceholder,
        child: Center(
          child: Icon(
            Icons.broken_image,
            size: 20,
            color: context.appTextTertiary,
          ),
        ),
      );
    }

    return Container(
      color: context.imagePlaceholder,
      child: Image.memory(
        _bytes!,
        fit: BoxFit.cover,
        cacheWidth: 200,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(
              Icons.broken_image,
              size: 20,
              color: context.appTextTertiary,
            ),
          );
        },
      ),
    );
  }
}
