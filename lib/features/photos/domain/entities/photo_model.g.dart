// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoModelImpl _$$PhotoModelImplFromJson(Map<String, dynamic> json) =>
    _$PhotoModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      uri: json['uri'] as String,
      size: (json['size'] as num).toInt(),
      dateModified: DateTime.parse(json['dateModified'] as String),
    );

Map<String, dynamic> _$$PhotoModelImplToJson(_$PhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'uri': instance.uri,
      'size': instance.size,
      'dateModified': instance.dateModified.toIso8601String(),
    };
