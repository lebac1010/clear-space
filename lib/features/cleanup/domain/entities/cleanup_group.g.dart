// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleanup_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CleanupGroupImpl _$$CleanupGroupImplFromJson(Map<String, dynamic> json) =>
    _$CleanupGroupImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CleanupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSize: (json['totalSize'] as num).toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CleanupGroupImplToJson(_$CleanupGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items,
      'totalSize': instance.totalSize,
      'description': instance.description,
    };
