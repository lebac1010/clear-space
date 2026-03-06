import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/cleanup_item.dart';
import '../controllers/large_file_controller.dart';
import '../widgets/cleanup_item_tile.dart';

class LargeFileListScreen extends ConsumerWidget {
  const LargeFileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largeFilesAsync = ref.watch(largeFileControllerProvider);
    final filter = ref.watch(largeFileFilterNotifierProvider);

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Large Files'),
        backgroundColor: context.appBackground,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(largeFileControllerProvider.notifier).selectAll();
            },
            child: const Text('Select All'),
          ),
        ],
      ),
      body: largeFilesAsync.when(
        data: (files) {
          if (files.isEmpty) {
            return const Center(child: Text('No large files found!'));
          }

          // Apply Filter
          var filteredFiles = files;
          if (filter != LargeFileFilter.all) {
            filteredFiles = files.where((f) {
              final type = f.mediaType?.toUpperCase();
              switch (filter) {
                case LargeFileFilter.image:
                  return type == 'IMAGE';
                case LargeFileFilter.video:
                  return type == 'VIDEO';
                case LargeFileFilter.audio:
                  return type == 'AUDIO';
                case LargeFileFilter.document:
                  return type == 'DOCUMENT';
                case LargeFileFilter.other:
                  return type == 'OTHER' || type == null;
                default:
                  return true;
              }
            }).toList();
          }

          // Sort by size descending
          final sortedFiles = List<CleanupItem>.from(filteredFiles)
            ..sort((a, b) => b.size.compareTo(a.size));

          return Column(
            children: [
              _FilterBar(currentFilter: filter),
              Expanded(
                child: sortedFiles.isEmpty
                    ? const Center(child: Text('No files match this filter'))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        itemCount: sortedFiles.length,
                        itemBuilder: (context, index) {
                          final item = sortedFiles[index];
                          return AppCard(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.zero,
                            child: CleanupItemTile(
                              item: item,
                              onTap: () {
                                ref
                                    .read(largeFileControllerProvider.notifier)
                                    .toggleSelection(item.id);
                              },
                            ),
                          );
                        },
                      ),
              ),
              _BottomActionPanel(files: sortedFiles),
            ],
          );
        },
        error: (err, st) => ErrorView(message: err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _FilterBar extends ConsumerWidget {
  final LargeFileFilter currentFilter;

  const _FilterBar({required this.currentFilter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: LargeFileFilter.values.map((filter) {
          final isSelected = currentFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(_getFilterName(filter)),
              selected: isSelected,
              onSelected: (selected) {
                ref
                    .read(largeFileFilterNotifierProvider.notifier)
                    .setFilter(filter);
              },
              backgroundColor: context.appSurfaceContainer,
              selectedColor: AppColors.primary.withValues(alpha: 0.1),
              checkmarkColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.primary : context.appTextSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : context.appBorder,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getFilterName(LargeFileFilter filter) {
    switch (filter) {
      case LargeFileFilter.all:
        return 'All';
      case LargeFileFilter.image:
        return 'Images';
      case LargeFileFilter.video:
        return 'Videos';
      case LargeFileFilter.audio:
        return 'Audio';
      case LargeFileFilter.document:
        return 'Docs';
      case LargeFileFilter.other:
        return 'Others';
    }
  }
}

class _BottomActionPanel extends ConsumerWidget {
  final List<CleanupItem> files;

  const _BottomActionPanel({required this.files});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedCount = 0;
    int selectedSize = 0;

    for (final item in files) {
      if (item.isSelected) {
        selectedCount++;
        selectedSize += item.size;
      }
    }

    if (selectedCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.appSurface,
        boxShadow: [
          BoxShadow(
            color: context.appShadow.withValues(alpha: 0.35),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$selectedCount items selected',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ).copyWith(color: context.appTextPrimary),
                ),
                Text(
                  FileUtils.formatSize(selectedSize),
                  style: TextStyle(
                    color: context.appTextSecondary,
                    fontSize: 12,
                  ).copyWith(color: context.appTextSecondary),
                ),
              ],
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: () {
                _showDeleteConfirmation(context, ref, selectedCount);
              },
              icon: const Icon(Icons.delete_outline_rounded),
              label: const Text('Delete'),
              style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, int count) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete files?'),
        content: Text(
          'Are you sure you want to delete $count selected files?\n\n'
          'Items will be moved to Trash if supported, or permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref
                  .read(largeFileControllerProvider.notifier)
                  .deleteSelected();
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
