import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';

import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/junk_item.dart';
import '../controllers/junk_detail_controller.dart';

class JunkDetailScreen extends ConsumerWidget {
  final String type;

  const JunkDetailScreen({super.key, required this.type});

  String _title(BuildContext context) {
    switch (type) {
      case 'junk':
        return context.l10n.tempAndLogFiles;
      case 'empty_folders':
        return context.l10n.emptyFolders;
      case 'apks':
        return context.l10n.safeApkInstallers;
      default:
        return context.l10n.junkFiles;
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
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _title(context),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ).copyWith(color: context.appTextPrimary),
        ),
      ),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        builder: (context, ref) {
          final state = ref.watch(junkDetailControllerProvider(type));
          final controller = ref.read(junkDetailControllerProvider(type).notifier);

          return state.items.when(
            loading: () => Center(
              child: CircularProgressIndicator(color: context.colorScheme.primary),
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
                        color: context.appTextTertiary.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.l10n.noItemsFound,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: context.appTextSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.allClean,
                        style: TextStyle(
                          fontSize: 14,
                          color: context.appTextTertiary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, bottom: 8),
                      child: TextButton(
                        onPressed: () {
                          if (state.allSelected) {
                            controller.deselectAll();
                          } else {
                            controller.selectAll();
                          }
                        },
                        child: Text(
                          state.allSelected
                              ? context.l10n.deselectAll
                              : context.l10n.selectAll,
                        ),
                      ),
                    ),
                  ),
                  _buildSummaryBar(context, state, items),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final isSelected = state.selectedPaths.contains(item.path);
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
          );
        },
      ),
      bottomNavigationBar: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        loadingChild: const SizedBox.shrink(),
        blockedChild: const SizedBox.shrink(),
        builder: (context, ref) {
          final state = ref.watch(junkDetailControllerProvider(type));
          final controller = ref.read(junkDetailControllerProvider(type).notifier);

          if (!(state.items.hasValue && state.items.value!.isNotEmpty)) {
            return const SizedBox.shrink();
          }

          return _buildBottomBar(context, ref, state, controller);
        },
      ),
    );
  }

  Widget _buildSummaryBar(
    BuildContext context,
    JunkDetailState state,
    List<JunkItem> items,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Text(
            context.l10n.appsShowingCount(state.selectedCount, items.length),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ).copyWith(color: context.appTextSecondary),
          ),
          const Spacer(),
          if (state.selectedCount > 0)
            Text(
              FileUtils.formatSize(state.selectedSize),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.error,
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
        color: context.appBackground.withValues(alpha: 0.95),
        border: Border(top: BorderSide(color: context.appBorder)),
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
                ? context.l10n.deleting
                : context.l10n.deleteItemsCount(
                    state.selectedCount,
                    FileUtils.formatSize(state.selectedSize),
                  ),
          ),
          style: FilledButton.styleFrom(
            backgroundColor: context.colorScheme.error,
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
        title: Text(context.l10n.deleteFilesTitle),
        content: Text(
          '${context.l10n.deleteConfirmMsg(state.selectedCount)} (${FileUtils.formatSize(state.selectedSize)})\n\n'
          '${context.l10n.actionCannotBeUndone}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(context.l10n.cancel),
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
                          context.l10n.deletedCountMsg(
                            deletedCount,
                            FileUtils.formatSize(deletedBytes),
                          ),
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
                      SnackBar(
                        content: Text(context.l10n.cleanupFailed(e.toString())),
                      ),
                    );
                }
              }
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
              ? context.colorScheme.error.withValues(alpha: 0.06)
              : context.appSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.error.withValues(alpha: 0.3)
                : context.appBorder,
          ),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: isSelected,
              onChanged: (_) => onTap(),
              activeColor: context.colorScheme.error,
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
              color: isSelected
                  ? context.colorScheme.error
                  : context.appTextTertiary,
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
                          ? context.colorScheme.error
                          : context.appTextPrimary,
                    ),
                  ),
                  if (item.path != item.name) ...[
                    const SizedBox(height: 2),
                    Text(
                      _shortenPath(item.path),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: context.appTextTertiary,
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
                  color: isSelected
                      ? context.colorScheme.error
                      : context.colorScheme.primary,
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
