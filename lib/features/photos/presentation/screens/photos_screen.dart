import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../../dashboard/domain/entities/storage_info.dart';
import '../controllers/photos_controller.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../domain/entities/photo_model.dart';
import 'dart:typed_data';

class PhotosScreen extends ConsumerWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageInfoAsync = ref.watch(dashboardControllerProvider);
    final photosAsync = ref.watch(photosControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Photos'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          // Header & Analysis Cards
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary Header
                  storageInfoAsync.when(
                    data: (info) {
                      if (info == null) return const SizedBox();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${info.photosCount} photos',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            FileUtils.formatSize(info.photosSize),
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      );
                    },
                    loading: () => const SizedBox(height: 50),
                    error: (_, __) => const SizedBox(),
                  ),
                  const Gap(24),

                  // Analysis Section
                  Text(
                    'Analysis',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  _buildAnalysisCards(context, ref, storageInfoAsync),
                  const Gap(24),

                  // Gallery Header
                  Text(
                    'All Photos',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Photo Grid
          photosAsync.when(
            data: (photos) {
              if (photos.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('No photos found'),
                    ),
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    // Trigger load more when reaching near end
                    if (index == photos.length - 5) {
                      // Use addPostFrameCallback to avoid calling during build
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref.read(photosControllerProvider.notifier).loadMore();
                      });
                    }
                    return _PhotoGridItem(photo: photos[index]);
                  }, childCount: photos.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              child: Center(child: Text('Error loading photos: $err')),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: Gap(80)),
        ],
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
            // Duplicates Card
            Expanded(
              child: _AnalysisCard(
                title: 'Duplicates',
                subtitle: '${FileUtils.formatSize(duplicateSize)} potential',
                icon: Icons.copy,
                color: AppColors.orange,
                onTap: () {
                  // Navigate to Cleanup tab's duplicates sub-route
                  context.go('/cleanup/duplicates?type=duplicate');
                },
              ),
            ),
            const Gap(12),
            // Similar Photos Card
            Expanded(
              child: _AnalysisCard(
                title: 'Similar',
                subtitle: '${FileUtils.formatSize(similarSize)} potential',
                icon: Icons.photo_library_outlined,
                color: AppColors.purple,
                onTap: () {
                  context.go('/cleanup/duplicates?type=similar');
                },
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
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
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
    } catch (e) {
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
        color: Colors.grey[200],
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
        color: Colors.grey[200],
        child: const Center(
          child: Icon(Icons.broken_image, size: 20, color: Colors.grey),
        ),
      );
    }

    return Container(
      color: Colors.grey[200],
      child: Image.memory(
        _bytes!,
        fit: BoxFit.cover,
        cacheWidth: 200,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.broken_image, size: 20, color: Colors.grey),
          );
        },
      ),
    );
  }
}
