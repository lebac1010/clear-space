import 'package:freezed_annotation/freezed_annotation.dart';
import 'cleanup_item.dart';

part 'cleanup_group.freezed.dart';
part 'cleanup_group.g.dart';

@freezed
class CleanupGroup with _$CleanupGroup {
  const factory CleanupGroup({
    required String id,
    required String title,
    required List<CleanupItem> items,
    required int totalSize,
    String? description,
  }) = _CleanupGroup;

  factory CleanupGroup.fromJson(Map<String, dynamic> json) =>
      _$CleanupGroupFromJson(json);
}
