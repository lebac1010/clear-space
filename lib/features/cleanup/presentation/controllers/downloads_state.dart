import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/download_item.dart';

part 'downloads_state.freezed.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    @Default([]) List<DownloadItem> items,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(0) int totalSize,
    @Default(0) int selectedCount,
    @Default(0) int selectedSize,
    @Default(false) bool isDeleting,
  }) = _DownloadsState;
}
