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
    required int appsCount, // NEW
    required int duplicateCount, // NEW
    required int duplicateSize, // NEW
    required int potentialSavings, // NEW
    required int similarPhotoCount, // NEW
    required int similarPhotoSize, // NEW
    required List<LargeFileInfo> largeFiles, // NEW
    required List<StorageVolumeInfo> storageVolumes, // NEW
    required int cloudOnlyCount, // NEW
    required int scanDurationMs, // NEW
    required int lastUpdated, // NEW: Timestamp
    required bool isEstimated, // NEW
    required int junkCount, // NEW
    required int junkSize, // NEW
    required int emptyFolderCount, // NEW
    required int apkCount, // NEW
    required int apkSize, // NEW
  }) = _StorageInfo;

  const StorageInfo._();

  /// Empty shell for progressive loading — dashboard shows immediately
  factory StorageInfo.empty() => const StorageInfo(
    totalSpace: 0,
    freeSpace: 0,
    usedSpace: 0,
    photosCount: 0,
    photosSize: 0,
    videosCount: 0,
    videosSize: 0,
    audioCount: 0,
    audioSize: 0,
    documentsCount: 0,
    documentsSize: 0,
    filesCount: 0,
    filesSize: 0,
    systemSize: 0,
    appsCount: 0,
    duplicateCount: 0,
    duplicateSize: 0,
    potentialSavings: 0,
    similarPhotoCount: 0,
    similarPhotoSize: 0,
    largeFiles: [],
    storageVolumes: [],
    cloudOnlyCount: 0,
    scanDurationMs: 0,
    lastUpdated: 0,
    isEstimated: true,
    junkCount: 0,
    junkSize: 0,
    emptyFolderCount: 0,
    apkCount: 0,
    apkSize: 0,
  );

  factory StorageInfo.fromJson(Map<String, dynamic> json) =>
      _$StorageInfoFromJson(json);

  double get usedPercentage => totalSpace == 0 ? 0 : usedSpace / totalSpace;

  int get largeFilesTotalSize => largeFiles.fold(
    0,
    (previousValue, element) => previousValue + element.size,
  );
}
