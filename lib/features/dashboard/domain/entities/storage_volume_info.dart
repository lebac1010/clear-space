import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_volume_info.freezed.dart';
part 'storage_volume_info.g.dart';

@freezed
class StorageVolumeInfo with _$StorageVolumeInfo {
  const factory StorageVolumeInfo({
    required String name,
    required String path,
    required int totalSpace,
    required int freeSpace,
    required bool isRemovable,
    required bool isPrimary,
  }) = _StorageVolumeInfo;

  factory StorageVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$StorageVolumeInfoFromJson(json);
}
