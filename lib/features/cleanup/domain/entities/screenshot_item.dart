import 'package:freezed_annotation/freezed_annotation.dart';

part 'screenshot_item.freezed.dart';
part 'screenshot_item.g.dart';

@freezed
class ScreenshotItem with _$ScreenshotItem {
  const factory ScreenshotItem({
    required String id,
    required String name,
    required int size,
    required String path,
    required String uri,
    required int dateModified,
    @Default(false) bool isSelected,
  }) = _ScreenshotItem;

  factory ScreenshotItem.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotItemFromJson(json);
}
