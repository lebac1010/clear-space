import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/utils/file_utils.dart';
import '../controllers/duplicate_controller.dart';
import '../widgets/cleanup_item_tile.dart';
import '../../domain/entities/cleanup_group.dart';

class DuplicateListScreen extends ConsumerWidget {
  final CleanupType type;

  const DuplicateListScreen({super.key, this.type = CleanupType.duplicate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duplicatesAsync = ref.watch(duplicateControllerProvider(type));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          type == CleanupType.similar ? 'Similar Photos' : 'Duplicate Files',
        ),
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              ref
                  .read(duplicateControllerProvider(type).notifier)
                  .smartSelect();
            },
            child: const Text('Smart Select'),
          ),
        ],
      ),
      body: duplicatesAsync.when(
        data: (groups) {
          if (groups.isEmpty) {
            return const Center(child: Text('No duplicates found!'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    return AppCard(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    group.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  FileUtils.formatSize(group.totalSize),
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          ...group.items.map((item) {
                            final isBest =
                                group.items.every(
                                  (other) =>
                                      other.id == item.id || !other.isSelected,
                                ) &&
                                !item.isSelected;

                            return Stack(
                              children: [
                                CleanupItemTile(
                                  item: item,
                                  onTap: () {
                                    ref
                                        .read(
                                          duplicateControllerProvider(
                                            type,
                                          ).notifier,
                                        )
                                        .toggleSelection(group.id, item.id);
                                  },
                                ),
                                if (isBest)
                                  Positioned(
                                    top: 8,
                                    right: 12,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'KEEP',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.primary,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
              _BottomActionPanel(groups: groups, type: type),
            ],
          );
        },
        error: (err, st) => ErrorView(message: err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _BottomActionPanel extends ConsumerWidget {
  final List<CleanupGroup> groups;
  final CleanupType type;

  const _BottomActionPanel({required this.groups, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedCount = 0;
    int selectedSize = 0;

    for (final group in groups) {
      for (final item in group.items) {
        if (item.isSelected) {
          selectedCount++;
          selectedSize += item.size;
        }
      }
    }

    if (selectedCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  FileUtils.formatSize(selectedSize),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
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
                  .read(duplicateControllerProvider(type).notifier)
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
