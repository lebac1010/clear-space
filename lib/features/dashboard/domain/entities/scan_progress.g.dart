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
  ScanPhase.diskSpace: 'DISK_SPACE',
  ScanPhase.photos: 'PHOTOS',
  ScanPhase.videos: 'VIDEOS',
  ScanPhase.audio: 'AUDIO',
  ScanPhase.documents: 'DOCUMENTS',
  ScanPhase.junk: 'JUNK',
  ScanPhase.emptyFolders: 'EMPTY_FOLDERS',
  ScanPhase.apks: 'APKS',
  ScanPhase.similarPhotos: 'SIMILAR_PHOTOS',
  ScanPhase.calculating: 'CALCULATING',
  ScanPhase.complete: 'COMPLETE',
  ScanPhase.paused: 'PAUSED',
  ScanPhase.cancelled: 'CANCELLED',
  ScanPhase.error: 'ERROR',
  ScanPhase.cacheInvalidated: 'CACHE_INVALIDATED',
};
