import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_progress.freezed.dart';
part 'scan_progress.g.dart';

enum ScanPhase {
  DISK_SPACE,
  PHOTOS,
  VIDEOS,
  AUDIO,
  DOCUMENTS,
  CALCULATING,
  COMPLETE,
  PAUSED,
  CANCELLED,
  ERROR,
  CACHE_INVALIDATED,
}

@freezed
class ScanProgress with _$ScanProgress {
  const factory ScanProgress({
    required ScanPhase phase,
    required int processedItems,
    required int totalItems,
    required int currentBytes,
    String? currentVolume,
    @Default(false) bool isPaused,
  }) = _ScanProgress;

  factory ScanProgress.fromJson(Map<String, dynamic> json) =>
      _$ScanProgressFromJson(json);
}
