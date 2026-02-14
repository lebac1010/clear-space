// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageInfoImpl _$$StorageInfoImplFromJson(Map<String, dynamic> json) =>
    _$StorageInfoImpl(
      totalSpace: (json['totalSpace'] as num).toInt(),
      freeSpace: (json['freeSpace'] as num).toInt(),
      usedSpace: (json['usedSpace'] as num).toInt(),
      photosCount: (json['photosCount'] as num).toInt(),
      photosSize: (json['photosSize'] as num).toInt(),
      videosCount: (json['videosCount'] as num).toInt(),
      videosSize: (json['videosSize'] as num).toInt(),
      audioCount: (json['audioCount'] as num).toInt(),
      audioSize: (json['audioSize'] as num).toInt(),
      documentsCount: (json['documentsCount'] as num).toInt(),
      documentsSize: (json['documentsSize'] as num).toInt(),
      filesCount: (json['filesCount'] as num).toInt(),
      filesSize: (json['filesSize'] as num).toInt(),
      systemSize: (json['systemSize'] as num).toInt(),
      appsCount: (json['appsCount'] as num).toInt(),
      duplicateCount: (json['duplicateCount'] as num).toInt(),
      duplicateSize: (json['duplicateSize'] as num).toInt(),
      potentialSavings: (json['potentialSavings'] as num).toInt(),
      similarPhotoCount: (json['similarPhotoCount'] as num).toInt(),
      similarPhotoSize: (json['similarPhotoSize'] as num).toInt(),
      largeFiles: (json['largeFiles'] as List<dynamic>)
          .map((e) => LargeFileInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      storageVolumes: (json['storageVolumes'] as List<dynamic>)
          .map((e) => StorageVolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      cloudOnlyCount: (json['cloudOnlyCount'] as num).toInt(),
      scanDurationMs: (json['scanDurationMs'] as num).toInt(),
      lastUpdated: (json['lastUpdated'] as num).toInt(),
      isEstimated: json['isEstimated'] as bool,
      junkCount: (json['junkCount'] as num).toInt(),
      junkSize: (json['junkSize'] as num).toInt(),
      emptyFolderCount: (json['emptyFolderCount'] as num).toInt(),
      apkCount: (json['apkCount'] as num).toInt(),
      apkSize: (json['apkSize'] as num).toInt(),
    );

Map<String, dynamic> _$$StorageInfoImplToJson(_$StorageInfoImpl instance) =>
    <String, dynamic>{
      'totalSpace': instance.totalSpace,
      'freeSpace': instance.freeSpace,
      'usedSpace': instance.usedSpace,
      'photosCount': instance.photosCount,
      'photosSize': instance.photosSize,
      'videosCount': instance.videosCount,
      'videosSize': instance.videosSize,
      'audioCount': instance.audioCount,
      'audioSize': instance.audioSize,
      'documentsCount': instance.documentsCount,
      'documentsSize': instance.documentsSize,
      'filesCount': instance.filesCount,
      'filesSize': instance.filesSize,
      'systemSize': instance.systemSize,
      'appsCount': instance.appsCount,
      'duplicateCount': instance.duplicateCount,
      'duplicateSize': instance.duplicateSize,
      'potentialSavings': instance.potentialSavings,
      'similarPhotoCount': instance.similarPhotoCount,
      'similarPhotoSize': instance.similarPhotoSize,
      'largeFiles': instance.largeFiles,
      'storageVolumes': instance.storageVolumes,
      'cloudOnlyCount': instance.cloudOnlyCount,
      'scanDurationMs': instance.scanDurationMs,
      'lastUpdated': instance.lastUpdated,
      'isEstimated': instance.isEstimated,
      'junkCount': instance.junkCount,
      'junkSize': instance.junkSize,
      'emptyFolderCount': instance.emptyFolderCount,
      'apkCount': instance.apkCount,
      'apkSize': instance.apkSize,
    };
