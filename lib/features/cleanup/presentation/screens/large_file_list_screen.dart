import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/extensions/build_context_x.dart';

import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../../domain/entities/cleanup_item.dart';
import '../controllers/large_file_controller.dart';
import '../widgets/cleanup_item_tile.dart';

class LargeFileListScreen extends ConsumerWidget {
  const LargeFileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: Text(context.l10n.largeFilesTitle),
        backgroundColor: context.appBackground,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(largeFileControllerProvider.notifier).selectAll();
            },
            child: Text(context.l10n.selectAll),
          ),
        ],
      ),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        builder: (context, ref) {
          final largeFilesAsync = ref.watch(largeFileControllerProvider);
          final filter = ref.watch(largeFileFilterNotifierProvider);

          return largeFilesAsync.when(
            data: (files) {
              if (files.isEmpty) {
                return Center(child: Text(context.l10n.noLargeFilesFound));
              }

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

              final sortedFiles = List<CleanupItem>.from(filteredFiles)
                ..sort((a, b) => b.size.compareTo(a.size));

              return Column(
                children: [
                  _FilterBar(currentFilter: filter),
                  Expanded(
                    child: sortedFiles.isEmpty
                        ? Center(child: Text(context.l10n.noFilesMatchFilter))
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
                                        .read(
                                          largeFileControllerProvider.notifier,
                                        )
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
          );
        },
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
              label: Text(_getFilterName(context, filter)),
              selected: isSelected,
              onSelected: (selected) {
                ref
                    .read(largeFileFilterNotifierProvider.notifier)
                    .setFilter(filter);
              },
              backgroundColor: context.appSurfaceContainer,
              selectedColor: context.colorScheme.primary.withValues(alpha: 0.1),
              checkmarkColor: context.colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.appTextSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.appBorder,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getFilterName(BuildContext context, LargeFileFilter filter) {
    switch (filter) {
      case LargeFileFilter.all:
        return context.l10n.all;
      case LargeFileFilter.image:
        return context.l10n.images;
      case LargeFileFilter.video:
        return context.l10n.videos;
      case LargeFileFilter.audio:
        return context.l10n.audio;
      case LargeFileFilter.document:
        return context.l10n.docs;
      case LargeFileFilter.other:
        return context.l10n.others;
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
                  context.l10n.itemsSelected(selectedCount),
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
              label: Text(context.l10n.delete),
              style: FilledButton.styleFrom(
                backgroundColor: context.colorScheme.error,
              ),
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
        title: Text(context.l10n.deleteFilesQuestion),
        content: Text(context.l10n.deleteConfirmMsg(count)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref
                  .read(largeFileControllerProvider.notifier)
                  .deleteSelected();
            },
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.error,
            ),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    );
  }
}
