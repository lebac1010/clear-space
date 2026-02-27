import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_file.freezed.dart';
part 'media_file.g.dart';

@freezed
class MediaFile with _$MediaFile {
  const factory MediaFile({
    required int id,
    required String name,
    required int size,
    required String path,
    required String mimeType,
    required int dateModified,
    required String uri,
    @Default(false) bool isSelected,
  }) = _MediaFile;

  factory MediaFile.fromJson(Map<String, dynamic> json) =>
      _$MediaFileFromJson(json);
}
