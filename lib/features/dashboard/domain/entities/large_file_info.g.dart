// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'large_file_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LargeFileInfoImpl _$$LargeFileInfoImplFromJson(Map<String, dynamic> json) =>
    _$LargeFileInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      dateModified: (json['dateModified'] as num).toInt(),
      uri: json['uri'] as String,
      path: json['path'] as String,
      mediaType: json['mediaType'] as String,
    );

Map<String, dynamic> _$$LargeFileInfoImplToJson(_$LargeFileInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'dateModified': instance.dateModified,
      'uri': instance.uri,
      'path': instance.path,
      'mediaType': instance.mediaType,
    };
