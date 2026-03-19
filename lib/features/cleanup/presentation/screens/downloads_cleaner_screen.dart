import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../../domain/entities/download_item.dart';
import '../controllers/downloads_controller.dart';
import '../controllers/downloads_state.dart';

class DownloadsCleanerScreen extends ConsumerWidget {
  const DownloadsCleanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: Text(context.l10n.downloads),
      ),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        builder: (context, ref) {
          final state = ref.watch(downloadsControllerProvider);
          final controller = ref.read(downloadsControllerProvider.notifier);

          return Column(
            children: [
              if (state.items.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextButton(
                      onPressed: () => controller.toggleAll(
                        state.selectedCount < state.items.length,
                      ),
                      child: Text(
                        state.selectedCount < state.items.length
                            ? context.l10n.selectAll
                            : context.l10n.deselectAll,
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.errorMessage != null
                    ? ErrorView(message: state.errorMessage!)
                    : state.items.isEmpty
                    ? Center(
                        child: Text(
                          context.l10n.noItemsFound,
                          style: TextStyle(color: context.appTextSecondary),
                        ),
                      )
                    : Column(
                        children: [
                          _buildSummaryBar(context, state),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: state.items.length,
                              separatorBuilder: (context, index) =>
                                  Divider(height: 1, color: context.appBorder),
                              itemBuilder: (context, index) {
                                final item = state.items[index];
                                return _DownloadListTile(
                                  item: item,
                                  onToggle: () =>
                                      controller.toggleSelection(item.id),
                                );
                              },
                            ),
                          ),
                          if (state.selectedCount > 0)
                            _buildBottomBar(context, ref, state, controller),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSummaryBar(BuildContext context, DownloadsState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.appSurface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.itemCount(state.items.length),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                FileUtils.formatSize(state.totalSize),
                style: TextStyle(
                  color: context.appTextSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          if (state.selectedCount > 0)
            Text(
              context.l10n.selectedCountSize(
                state.selectedCount,
                FileUtils.formatSize(state.selectedSize),
              ),
              style: TextStyle(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    DownloadsState state,
    DownloadsController controller,
  ) {
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
        child: ElevatedButton(
          onPressed: state.isDeleting
              ? null
              : () => _confirmDelete(context, ref, state, controller),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.error,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: state.isDeleting
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  context.l10n.deleteSelectedSize(
                    FileUtils.formatSize(state.selectedSize),
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    DownloadsState state,
    DownloadsController controller,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirmation),
        content: Text(context.l10n.deleteConfirmMsg(state.selectedCount)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.error,
            ),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await controller.deleteSelected();
      if (context.mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.deletedCountMsg(
                  state.selectedCount,
                  FileUtils.formatSize(state.selectedSize),
                ),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.deleteFailedGeneral),
              backgroundColor: context.colorScheme.error,
            ),
          );
        }
      }
    }
  }
}

class _DownloadListTile extends StatelessWidget {
  final DownloadItem item;
  final VoidCallback onToggle;

  const _DownloadListTile({required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: item.isSelected,
      onChanged: (_) => onToggle(),
      title: Text(
        item.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '${FileUtils.formatSize(item.size)} • ${item.mimeType}',
        style: TextStyle(fontSize: 12, color: context.appTextSecondary),
      ),
      secondary: _buildFileIcon(context, item),
      activeColor: context.colorScheme.primary,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildFileIcon(BuildContext context, DownloadItem item) {
    final isImage = item.mimeType.startsWith('image/');

    if (isImage && item.path.isNotEmpty) {
      return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.imagePlaceholder,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(item.path),
            fit: BoxFit.cover,
            cacheWidth: 150,
            cacheHeight: 150,
            errorBuilder: (_, __, ___) =>
                _getPlaceholderIcon(context, item.mimeType),
          ),
        ),
      );
    }

    return _getPlaceholderIcon(context, item.mimeType);
  }

  Widget _getPlaceholderIcon(BuildContext context, String mime) {
    IconData icon = Icons.insert_drive_file_outlined;
    Color color = context.appTextTertiary;

    if (mime.contains('pdf')) {
      icon = Icons.picture_as_pdf_outlined;
      color = context.colorScheme.error;
    } else if (mime.contains('image')) {
      icon = Icons.image_outlined;
      color = context.colorScheme.primary;
    } else if (mime.contains('video')) {
      icon = Icons.video_library_outlined;
      color = context.customColors.secondary;
    } else if (mime.contains('audio')) {
      icon = Icons.audiotrack_outlined;
      color = context.customColors.success;
    } else if (mime.contains('zip') || mime.contains('rar')) {
      icon = Icons.archive_outlined;
      color = context.customColors.orange;
    } else if (mime.contains('android.package-archive')) {
      icon = Icons.android_outlined;
      color = context.customColors.success;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
