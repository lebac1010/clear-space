import 'package:freezed_annotation/freezed_annotation.dart';

import 'large_file_info.dart';
import 'storage_volume_info.dart';

part 'storage_info.freezed.dart';
part 'storage_info.g.dart'; // Added this back if missing, though it wasn't shown in previous view

@freezed
class StorageInfo with _$StorageInfo {
  // Removed @JsonSerializable on constructor
  const factory StorageInfo({
    required int totalSpace,
    required int freeSpace,
    required int usedSpace,
    required int photosCount,
    required int photosSize,
    required int videosCount,
    required int videosSize,
    required int audioCount, // NEW
    required int audioSize, // NEW
    required int documentsCount, // NEW
    required int documentsSize, // NEW
    required int filesCount,
    required int filesSize,
    required int systemSize,
    required int duplicateCount, // NEW
    required int duplicateSize, // NEW
    required int potentialSavings, // NEW
    required List<LargeFileInfo> largeFiles, // NEW
    required List<StorageVolumeInfo> storageVolumes, // NEW
    required int cloudOnlyCount, // NEW
    required int scanDurationMs, // NEW
    required int lastUpdated, // NEW: Timestamp
    required bool isEstimated, // NEW
  }) = _StorageInfo;

  const StorageInfo._();

  factory StorageInfo.fromJson(Map<String, dynamic> json) =>
      _$StorageInfoFromJson(json);

  double get usedPercentage => totalSpace == 0 ? 0 : usedSpace / totalSpace;
}
