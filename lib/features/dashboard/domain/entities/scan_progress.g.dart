// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanProgressImpl _$$ScanProgressImplFromJson(Map<String, dynamic> json) =>
    _$ScanProgressImpl(
      phase: $enumDecode(_$ScanPhaseEnumMap, json['phase']),
      processedItems: (json['processedItems'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      currentBytes: (json['currentBytes'] as num).toInt(),
      currentVolume: json['currentVolume'] as String?,
      isPaused: json['isPaused'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScanProgressImplToJson(_$ScanProgressImpl instance) =>
    <String, dynamic>{
      'phase': _$ScanPhaseEnumMap[instance.phase]!,
      'processedItems': instance.processedItems,
      'totalItems': instance.totalItems,
      'currentBytes': instance.currentBytes,
      'currentVolume': instance.currentVolume,
      'isPaused': instance.isPaused,
    };

const _$ScanPhaseEnumMap = {
  ScanPhase.DISK_SPACE: 'DISK_SPACE',
  ScanPhase.PHOTOS: 'PHOTOS',
  ScanPhase.VIDEOS: 'VIDEOS',
  ScanPhase.AUDIO: 'AUDIO',
  ScanPhase.DOCUMENTS: 'DOCUMENTS',
  ScanPhase.CALCULATING: 'CALCULATING',
  ScanPhase.COMPLETE: 'COMPLETE',
  ScanPhase.PAUSED: 'PAUSED',
  ScanPhase.CANCELLED: 'CANCELLED',
  ScanPhase.ERROR: 'ERROR',
  ScanPhase.CACHE_INVALIDATED: 'CACHE_INVALIDATED',
};
