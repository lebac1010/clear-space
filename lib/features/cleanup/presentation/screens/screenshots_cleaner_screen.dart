import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';

import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../../domain/entities/screenshot_item.dart';
import '../controllers/screenshots_controller.dart';
import '../controllers/screenshots_state.dart';

class ScreenshotsCleanerScreen extends ConsumerWidget {
  const ScreenshotsCleanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: Text(context.l10n.screenshotsCleanerTitle),
      ),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        builder: (context, ref) {
          final state = ref.watch(screenshotsControllerProvider);
          final controller = ref.read(screenshotsControllerProvider.notifier);

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
                    ? ErrorView(
                        message: state.errorMessage!,
                        onRetry: () => controller.loadScreenshots(),
                      )
                    : state.items.isEmpty
                    ? Center(
                        child: Text(
                          context.l10n.noPhotosFound,
                          style: TextStyle(color: context.appTextSecondary),
                        ),
                      )
                    : Column(
                        children: [
                          _buildSummaryBar(context, state),
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(8),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 0.8,
                                  ),
                              itemCount: state.items.length,
                              itemBuilder: (context, index) {
                                final item = state.items[index];
                                return _ScreenshotGridTile(
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

  Widget _buildSummaryBar(BuildContext context, ScreenshotsState state) {
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
                context.l10n.screenshotsCount(state.items.length),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                FileUtils.formatSize(state.totalSize),
                style: TextStyle(
                  color: context.appTextSecondary,
                  fontSize: 12,
                ).copyWith(color: context.appTextSecondary),
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
    ScreenshotsState state,
    ScreenshotsController controller,
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
    ScreenshotsState state,
    ScreenshotsController controller,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirmation),
        content: Text(context.l10n.deleteCountScreenshots(state.selectedCount)),
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
            SnackBar(content: Text(context.l10n.screenshotsDeletedSuccess)),
          );
        } else {
          // [Bug #8 fix] Show error feedback on deletion failure
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

class _ScreenshotGridTile extends ConsumerStatefulWidget {
  final ScreenshotItem item;
  final VoidCallback onToggle;

  const _ScreenshotGridTile({required this.item, required this.onToggle});

  @override
  ConsumerState<_ScreenshotGridTile> createState() =>
      _ScreenshotGridTileState();
}

class _ScreenshotGridTileState extends ConsumerState<_ScreenshotGridTile> {
  Uint8List? _thumbBytes;
  bool _isLoadingThumb = true;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  @override
  void didUpdateWidget(covariant _ScreenshotGridTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.uri != widget.item.uri ||
        oldWidget.item.path != widget.item.path) {
      _thumbBytes = null;
      _isLoadingThumb = true;
      _loadThumbnail();
    }
  }

  Future<void> _loadThumbnail() async {
    // Prefer content URI thumbnail (scoped storage safe).
    if (widget.item.uri.isNotEmpty) {
      try {
        final scanner = ref.read(nativeStorageScannerProvider);
        final bytes = await scanner.getPhotoThumbnail(
          widget.item.uri,
          width: 300,
          height: 400,
        );
        if (!mounted) return;
        setState(() {
          _thumbBytes = bytes;
          _isLoadingThumb = false;
        });
        return;
      } catch (_) {
        // Fall through to path fallback.
      }
    }

    if (!mounted) return;
    setState(() {
      _isLoadingThumb = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onToggle,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.item.isSelected
                    ? context.colorScheme.primary
                    : context.appBorder.withValues(alpha: 0.5),
                width: widget.item.isSelected ? 2 : 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: _buildThumbnail(),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.item.isSelected
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: widget.item.isSelected
                    ? context.colorScheme.primary
                    : context.appTextTertiary,
                size: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: context.appOverlay.withValues(alpha: 0.7),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(6),
                ),
              ),
              child: Text(
                FileUtils.formatSize(widget.item.size),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail() {
    if (_thumbBytes != null) {
      return Image.memory(
        _thumbBytes!,
        fit: BoxFit.cover,
        cacheWidth: 300,
        cacheHeight: 400,
        errorBuilder: (context, error, stackTrace) => Container(
          color: context.imagePlaceholder,
          child: Icon(Icons.image, color: context.appTextTertiary),
        ),
      );
    }

    if (_isLoadingThumb) {
      return Container(
        color: context.imagePlaceholderMuted,
        child: const Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 1.8),
          ),
        ),
      );
    }

    // Fallback to legacy file path if URI thumbnail failed.
    if (widget.item.path.isNotEmpty) {
      final file = File(widget.item.path);
      return Image.file(
        file,
        fit: BoxFit.cover,
        cacheWidth: 300,
        cacheHeight: 400,
        errorBuilder: (context, error, stackTrace) => Container(
          color: context.imagePlaceholder,
          child: Icon(Icons.image, color: context.appTextTertiary),
        ),
      );
    }

    return Container(
      color: context.imagePlaceholder,
      child: Icon(Icons.image, color: context.appTextTertiary),
    );
  }
}
