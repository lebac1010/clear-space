// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_volume_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageVolumeInfoImpl _$$StorageVolumeInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$StorageVolumeInfoImpl(
      name: json['name'] as String,
      path: json['path'] as String,
      totalSpace: (json['totalSpace'] as num).toInt(),
      freeSpace: (json['freeSpace'] as num).toInt(),
      isRemovable: json['isRemovable'] as bool,
      isPrimary: json['isPrimary'] as bool,
    );

Map<String, dynamic> _$$StorageVolumeInfoImplToJson(
        _$StorageVolumeInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'totalSpace': instance.totalSpace,
      'freeSpace': instance.freeSpace,
      'isRemovable': instance.isRemovable,
      'isPrimary': instance.isPrimary,
    };
