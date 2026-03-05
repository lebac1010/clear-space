// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleanup_history_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CleanupHistoryRecordImpl _$$CleanupHistoryRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$CleanupHistoryRecordImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      cleanupType: json['cleanupType'] as String,
      itemsCount: (json['itemsCount'] as num).toInt(),
      totalSizeInBytes: (json['totalSizeInBytes'] as num).toInt(),
      fileNames: (json['fileNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mimeTypeBreakdown:
          (json['mimeTypeBreakdown'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const {},
    );

Map<String, dynamic> _$$CleanupHistoryRecordImplToJson(
        _$CleanupHistoryRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'cleanupType': instance.cleanupType,
      'itemsCount': instance.itemsCount,
      'totalSizeInBytes': instance.totalSizeInBytes,
      'fileNames': instance.fileNames,
      'mimeTypeBreakdown': instance.mimeTypeBreakdown,
    };
