// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadItemImpl _$$DownloadItemImplFromJson(Map<String, dynamic> json) =>
    _$DownloadItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      uri: json['uri'] as String,
      mimeType: json['mimeType'] as String,
      dateModified: (json['dateModified'] as num).toInt(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$DownloadItemImplToJson(_$DownloadItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'path': instance.path,
      'uri': instance.uri,
      'mimeType': instance.mimeType,
      'dateModified': instance.dateModified,
      'isSelected': instance.isSelected,
    };
