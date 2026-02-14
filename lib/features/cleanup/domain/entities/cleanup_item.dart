import 'package:freezed_annotation/freezed_annotation.dart';

part 'cleanup_item.freezed.dart';
part 'cleanup_item.g.dart';

@freezed
class CleanupItem with _$CleanupItem {
  const factory CleanupItem({
    required String id,
    required String path,
    required String uri,
    required String name,
    required int size,
    required DateTime dateModified,
    String? mediaType,
    String? thumbUrl,
    @Default(false) bool isSelected,
  }) = _CleanupItem;

  factory CleanupItem.fromJson(Map<String, dynamic> json) =>
      _$CleanupItemFromJson(json);
}
