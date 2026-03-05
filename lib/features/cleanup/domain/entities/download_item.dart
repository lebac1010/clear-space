import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_item.freezed.dart';
part 'download_item.g.dart';

@freezed
class DownloadItem with _$DownloadItem {
  const factory DownloadItem({
    required String id,
    required String name,
    required int size,
    required String path,
    required String uri,
    required String mimeType,
    required int dateModified,
    @Default(false) bool isSelected,
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadItemFromJson(json);
}
