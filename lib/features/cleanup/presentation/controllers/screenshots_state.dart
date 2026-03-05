import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/screenshot_item.dart';

part 'screenshots_state.freezed.dart';

@freezed
class ScreenshotsState with _$ScreenshotsState {
  const factory ScreenshotsState({
    @Default([]) List<ScreenshotItem> items,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(0) int totalSize,
    @Default(0) int selectedCount,
    @Default(0) int selectedSize,
    @Default(false) bool isDeleting,
  }) = _ScreenshotsState;
}
