import 'package:freezed_annotation/freezed_annotation.dart';

part 'large_file_info.freezed.dart';
part 'large_file_info.g.dart';

@freezed
class LargeFileInfo with _$LargeFileInfo {
  const factory LargeFileInfo({
    required int id,
    required String name,
    required int size,
    required String mimeType,
    required int dateModified,
    required String uri,
    required String mediaType, // IMAGE, VIDEO, AUDIO, DOCUMENT, OTHER
  }) = _LargeFileInfo;

  factory LargeFileInfo.fromJson(Map<String, dynamic> json) =>
      _$LargeFileInfoFromJson(json);
}
