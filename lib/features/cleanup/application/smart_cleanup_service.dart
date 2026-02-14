import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dashboard/data/providers/storage_provider.dart';
import '../../dashboard/domain/entities/storage_info.dart';

part 'smart_cleanup_service.g.dart';

class SafeCleanupInfo {
  final int totalSize;
  final int junkSize;
  final int emptyFolderCount;
  final int safeApkCount;

  const SafeCleanupInfo({
    required this.totalSize,
    required this.junkSize,
    required this.emptyFolderCount,
    this.safeApkCount = 0,
  });
}

@riverpod
class SmartCleanupService extends _$SmartCleanupService {
  @override
  FutureOr<void> build() {
    // Service logic container
  }

  SafeCleanupInfo getSafeCleanupInfo(StorageInfo info) {
    // Logic: Calculate what is "Safe" to delete with one tap.
    // Currently: Logs/Temp + Empty Folders + Safe APKs (if we track size separate, but native handles it).
    // UI just shows Junk Size for now as a safe minimum.
    return SafeCleanupInfo(
      totalSize: info.junkSize,
      junkSize: info.junkSize,
      emptyFolderCount: info.emptyFolderCount,
      safeApkCount: 0, // Not tracked in StorageInfo
    );
  }

  Future<Map<String, dynamic>> cleanSafeItems() async {
    final repo = await ref.read(storageRepositoryProvider.future);
    // Types to clean: "junk", "empty_folders", "apks" (Safe ones)
    return repo.cleanJunk(['junk', 'empty_folders', 'apks']);
  }
}
