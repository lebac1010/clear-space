import 'package:freezed_annotation/freezed_annotation.dart';

part 'cleanup_history_record.freezed.dart';
part 'cleanup_history_record.g.dart';

@freezed
class CleanupHistoryRecord with _$CleanupHistoryRecord {
  const factory CleanupHistoryRecord({
    required String id,
    required DateTime timestamp,
    required String
    cleanupType, // 'junk', 'screenshots', 'downloads', 'large_files'
    required int itemsCount,
    required int totalSizeInBytes,
    @Default([]) List<String> fileNames,
    @Default({})
    Map<String, int>
    mimeTypeBreakdown, // e.g., {'image/png': 5, 'application/pdf': 2}
  }) = _CleanupHistoryRecord;

  factory CleanupHistoryRecord.fromJson(Map<String, dynamic> json) =>
      _$CleanupHistoryRecordFromJson(json);
}
