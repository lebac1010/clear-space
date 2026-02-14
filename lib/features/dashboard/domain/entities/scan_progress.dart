import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_progress.freezed.dart';
part 'scan_progress.g.dart';

enum ScanPhase {
  @JsonValue('DISK_SPACE')
  diskSpace,
  @JsonValue('PHOTOS')
  photos,
  @JsonValue('VIDEOS')
  videos,
  @JsonValue('AUDIO')
  audio,
  @JsonValue('DOCUMENTS')
  documents,
  @JsonValue('CALCULATING')
  calculating,
  @JsonValue('COMPLETE')
  complete,
  @JsonValue('PAUSED')
  paused,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('ERROR')
  error,
  @JsonValue('CACHE_INVALIDATED')
  cacheInvalidated,
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
