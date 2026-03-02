import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/junk_item.dart';
import '../controllers/junk_detail_controller.dart';

class JunkDetailScreen extends ConsumerWidget {
  final String type;

  const JunkDetailScreen({super.key, required this.type});

  String get _title {
    switch (type) {
      case 'junk':
        return 'Temporary & Log Files';
      case 'empty_folders':
        return 'Empty Folders';
      case 'apks':
        return 'Safe APK Installers';
      default:
        return 'Junk Files';
    }
  }

  IconData get _icon {
    switch (type) {
      case 'junk':
        return Icons.delete_sweep_outlined;
      case 'empty_folders':
        return Icons.folder_off_outlined;
      case 'apks':
        return Icons.android_outlined;
      default:
        return Icons.delete_outline;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(junkDetailControllerProvider(type));
    final controller = ref.read(junkDetailControllerProvider(type).notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          if (state.items.hasValue && state.items.value!.isNotEmpty)
            TextButton(
              onPressed: () {
                if (state.allSelected) {
                  controller.deselectAll();
                } else {
                  controller.selectAll();
                }
              },
              child: Text(state.allSelected ? 'Deselect All' : 'Select All'),
            ),
        ],
      ),
      body: state.items.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, _) => ErrorView(
          message: err.toString(),
          onRetry: () => controller.refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _icon,
                    size: 64,
                    color: AppColors.textTertiary.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No items found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'All clean!',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Summary bar
              _buildSummaryBar(state, items),
              // List
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isSelected = state.selectedPaths.contains(
                        item.path,
                      );
                      return _JunkItemTile(
                        item: item,
                        type: type,
                        isSelected: isSelected,
                        onTap: () => controller.toggleItem(item.path),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // Bottom action bar
      bottomNavigationBar: state.items.hasValue && state.items.value!.isNotEmpty
          ? _buildBottomBar(context, ref, state, controller)
          : null,
    );
  }

  Widget _buildSummaryBar(JunkDetailState state, List<JunkItem> items) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Text(
            '${state.selectedCount} / ${items.length} selected',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          if (state.selectedCount > 0)
            Text(
              FileUtils.formatSize(state.selectedSize),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    JunkDetailState state,
    JunkDetailController controller,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.95),
        border: const Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        child: FilledButton.icon(
          onPressed: state.selectedCount == 0 || state.isDeleting
              ? null
              : () => _confirmDelete(context, ref, state, controller),
          icon: state.isDeleting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.delete_outline_rounded),
          label: Text(
            state.isDeleting
                ? 'Deleting...'
                : 'Delete ${state.selectedCount} items'
                      ' (${FileUtils.formatSize(state.selectedSize)})',
          ),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.error,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    JunkDetailState state,
    JunkDetailController controller,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Files'),
        content: Text(
          'Are you sure you want to delete ${state.selectedCount} items'
          ' (${FileUtils.formatSize(state.selectedSize)})?\n\n'
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              try {
                final result = await controller.deleteSelected();
                final deletedCount =
                    (result['deletedCount'] as num?)?.toInt() ?? 0;
                final deletedBytes =
                    (result['deletedBytes'] as num?)?.toInt() ?? 0;

                // Invalidate dashboard to refresh StorageInfo (Issue #6)
                ref.invalidate(dashboardControllerProvider);

                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          'Deleted $deletedCount items'
                          ' (${FileUtils.formatSize(deletedBytes)})',
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(content: Text('Delete failed: $e')),
                    );
                }
              }
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _JunkItemTile extends StatelessWidget {
  final JunkItem item;
  final String type;
  final bool isSelected;
  final VoidCallback onTap;

  const _JunkItemTile({
    required this.item,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.error.withValues(alpha: 0.06)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.error.withValues(alpha: 0.3)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: isSelected,
              onChanged: (_) => onTap(),
              activeColor: AppColors.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              visualDensity: VisualDensity.compact,
            ),
            const SizedBox(width: 8),
            // Icon
            Icon(
              _getIcon(),
              size: 24,
              color: isSelected ? AppColors.error : AppColors.textTertiary,
            ),
            const SizedBox(width: 12),
            // Name + path
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.error
                          : AppColors.textPrimary,
                    ),
                  ),
                  if (item.path != item.name) ...[
                    const SizedBox(height: 2),
                    Text(
                      _shortenPath(item.path),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Size
            if (item.size > 0)
              Text(
                FileUtils.formatSize(item.size),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.error : AppColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (type) {
      case 'empty_folders':
        return Icons.folder_off_outlined;
      case 'apks':
        return Icons.android_outlined;
      default:
        return Icons.description_outlined;
    }
  }

  /// Shorten path for display (remove /storage/emulated/0/ prefix)
  String _shortenPath(String path) {
    return path
        .replaceFirst('/storage/emulated/0/', '/')
        .replaceFirst(RegExp(r'/[^/]+$'), ''); // Remove filename
  }
}
