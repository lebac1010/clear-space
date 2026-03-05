import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';
import '../../domain/entities/cleanup_item.dart';
import '../providers/cleanup_provider.dart';

part 'large_file_controller.g.dart';

enum LargeFileFilter { all, image, video, audio, document, other }

@riverpod
class LargeFileFilterNotifier extends _$LargeFileFilterNotifier {
  @override
  LargeFileFilter build() => LargeFileFilter.all;

  void setFilter(LargeFileFilter filter) => state = filter;
}

@riverpod
class LargeFileController extends _$LargeFileController {
  @override
  FutureOr<List<CleanupItem>> build() async {
    // Get large files from Dashboard Controller (Source of Truth)
    final storageInfo = await ref.watch(
      dashboardControllerProvider.selectAsync((data) => data),
    );

    if (storageInfo == null) return [];

    // Map LargeFileInfo to CleanupItem for UI consistency
    return storageInfo.largeFiles.map((file) {
      return CleanupItem(
        id: file.id.toString(),
        path: file.path,
        uri: file.uri,
        name: file.name,
        size: file.size,
        dateModified: DateTime.fromMillisecondsSinceEpoch(
          file.dateModified * 1000,
        ),
        mediaType: file.mediaType,
        thumbUrl: null,
        isSelected: false,
      );
    }).toList();
  }

  void toggleSelection(String id) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelected: !item.isSelected);
        }
        return item;
      }).toList(),
    );
  }

  void selectAll() {
    final currentState = state.value;
    if (currentState == null) return;

    final allSelected = currentState.every((item) => item.isSelected);

    state = AsyncData(
      currentState
          .map((item) => item.copyWith(isSelected: !allSelected))
          .toList(),
    );
  }

  Future<bool> deleteSelected() async {
    final currentState = state.value;
    if (currentState == null) return false;

    final selectedItems = currentState
        .where((item) => item.isSelected)
        .toList();
    final selectedUris = selectedItems.map((item) => item.uri).toList();
    final totalSize = selectedItems.fold(0, (sum, item) => sum + item.size);

    if (selectedUris.isEmpty) return false; // [Bug #4 fix] Consistent: false

    // Save previous state for rollback
    final previousData = currentState;

    // Optimistic: remove from current view
    state = AsyncData(currentState.where((item) => !item.isSelected).toList());

    try {
      final repository = await ref.read(cleanupRepositoryProvider.future);
      final success = await repository.deleteItems(
        selectedUris,
        permanent: false,
      );

      if (success) {
        // [Bug #9 fix] Isolate logHistory so failure doesn't trigger rollback
        try {
          final breakdown = <String, int>{};
          for (var item in selectedItems) {
            final mime = _getMimeFromType(item.mediaType);
            breakdown[mime] = (breakdown[mime] ?? 0) + 1;
          }

          final storageRepo = await ref.read(storageRepositoryProvider.future);
          await storageRepo.logHistory(
            type: 'large_files',
            count: selectedItems.length,
            size: totalSize,
            details: selectedItems.take(3).map((e) => e.name).toList(),
            mimeBreakdown: breakdown,
          );
        } catch (e) {
          debugPrint('Failed to log large file cleanup history: $e');
        }

        // Trigger background re-scan
        ref.read(dashboardControllerProvider.notifier).startScan();
        return true;
      } else {
        // Rollback
        state = AsyncData(previousData);
        return false;
      }
    } catch (e) {
      state = AsyncData(previousData); // Rollback on error too
      return false;
    }
  }

  /// [Bug #6 fix] More accurate MIME mapping using file extension fallback
  String _getMimeFromType(String? type) {
    if (type == null) return 'application/octet-stream';
    switch (type.toLowerCase()) {
      case 'video':
        return 'video/*';
      case 'image':
        return 'image/*';
      case 'audio':
        return 'audio/*';
      case 'document':
        return 'application/document'; // Generic document, not hardcoded PDF
      case 'archive':
        return 'application/archive'; // Generic archive, not hardcoded ZIP
      case 'apk':
        return 'application/vnd.android.package-archive';
      default:
        return 'application/octet-stream';
    }
  }
}
