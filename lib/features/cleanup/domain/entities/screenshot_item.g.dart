// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshot_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreenshotItemImpl _$$ScreenshotItemImplFromJson(Map<String, dynamic> json) =>
    _$ScreenshotItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      path: json['path'] as String,
      uri: json['uri'] as String,
      dateModified: (json['dateModified'] as num).toInt(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScreenshotItemImplToJson(
        _$ScreenshotItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'path': instance.path,
      'uri': instance.uri,
      'dateModified': instance.dateModified,
      'isSelected': instance.isSelected,
    };
