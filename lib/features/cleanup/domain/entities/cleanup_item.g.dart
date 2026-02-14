// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleanup_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CleanupItemImpl _$$CleanupItemImplFromJson(Map<String, dynamic> json) =>
    _$CleanupItemImpl(
      id: json['id'] as String,
      path: json['path'] as String,
      uri: json['uri'] as String,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      dateModified: DateTime.parse(json['dateModified'] as String),
      mediaType: json['mediaType'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$CleanupItemImplToJson(_$CleanupItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'uri': instance.uri,
      'name': instance.name,
      'size': instance.size,
      'dateModified': instance.dateModified.toIso8601String(),
      'mediaType': instance.mediaType,
      'thumbUrl': instance.thumbUrl,
      'isSelected': instance.isSelected,
    };
