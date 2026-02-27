// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaFileImpl _$$MediaFileImplFromJson(Map<String, dynamic> json) =>
    _$MediaFileImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      mimeType: json['mimeType'] as String,
      dateModified: (json['dateModified'] as num).toInt(),
      uri: json['uri'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$MediaFileImplToJson(_$MediaFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'path': instance.path,
      'mimeType': instance.mimeType,
      'dateModified': instance.dateModified,
      'uri': instance.uri,
      'isSelected': instance.isSelected,
    };
