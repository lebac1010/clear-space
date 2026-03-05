import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/screenshot_item.dart';
import '../controllers/screenshots_controller.dart';
import '../controllers/screenshots_state.dart';

class ScreenshotsCleanerScreen extends ConsumerWidget {
  const ScreenshotsCleanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(screenshotsControllerProvider);
    final controller = ref.read(screenshotsControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Screenshots Cleaner'),
        actions: [
          if (state.items.isNotEmpty)
            TextButton(
              onPressed: () => controller.toggleAll(
                state.selectedCount < state.items.length,
              ),
              child: Text(
                state.selectedCount < state.items.length
                    ? 'Select All'
                    : 'Deselect All',
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null
          ? ErrorView(
              message: state.errorMessage!,
              onRetry: () => controller.loadScreenshots(),
            )
          : state.items.isEmpty
          ? const Center(
              child: Text(
                'No screenshots found',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          : Column(
              children: [
                _buildSummaryBar(state),
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
                        onToggle: () => controller.toggleSelection(item.id),
                      );
                    },
                  ),
                ),
                if (state.selectedCount > 0)
                  _buildBottomBar(context, ref, state, controller),
              ],
            ),
    );
  }

  Widget _buildSummaryBar(ScreenshotsState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.items.length} screenshots',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                FileUtils.formatSize(state.totalSize),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          if (state.selectedCount > 0)
            Text(
              'Selected: ${state.selectedCount} (${FileUtils.formatSize(state.selectedSize)})',
              style: const TextStyle(
                color: AppColors.primary,
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
        child: ElevatedButton(
          onPressed: state.isDeleting
              ? null
              : () => _confirmDelete(context, ref, state, controller),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: state.isDeleting
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Delete Selected (${FileUtils.formatSize(state.selectedSize)})',
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
        title: const Text('Confirmation'),
        content: Text('Delete ${state.selectedCount} screenshots permanently?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success = await controller.deleteSelected();
      if (context.mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Screenshots deleted successfully')),
          );
        } else {
          // [Bug #8 fix] Show error feedback on deletion failure
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to delete some screenshots. Please try again.',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

class _ScreenshotGridTile extends StatelessWidget {
  final ScreenshotItem item;
  final VoidCallback onToggle;

  const _ScreenshotGridTile({required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: item.isSelected
                    ? AppColors.primary
                    : Colors.grey.withValues(alpha: 0.2),
                width: item.isSelected ? 2 : 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              // [Bug #10 fix] Use Image.file for local paths instead of Image.network
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
                item.isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: item.isSelected ? AppColors.primary : Colors.grey,
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
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(6),
                ),
              ),
              child: Text(
                FileUtils.formatSize(item.size),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// [Bug #10 fix] Handles both local file paths and content URIs
  Widget _buildThumbnail() {
    // Try local file path first
    if (item.path.isNotEmpty) {
      final file = File(item.path);
      return Image.file(
        file,
        fit: BoxFit.cover,
        cacheWidth: 300,
        cacheHeight: 400,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[200],
          child: const Icon(Icons.image, color: Colors.grey),
        ),
      );
    }
    // Fallback placeholder
    return Container(
      color: Colors.grey[200],
      child: const Icon(Icons.image, color: Colors.grey),
    );
  }
}
