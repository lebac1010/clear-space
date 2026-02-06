// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_volume_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageVolumeInfo _$StorageVolumeInfoFromJson(Map<String, dynamic> json) {
  return _StorageVolumeInfo.fromJson(json);
}

/// @nodoc
mixin _$StorageVolumeInfo {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get totalSpace => throw _privateConstructorUsedError;
  int get freeSpace => throw _privateConstructorUsedError;
  bool get isRemovable => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageVolumeInfoCopyWith<StorageVolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageVolumeInfoCopyWith<$Res> {
  factory $StorageVolumeInfoCopyWith(
          StorageVolumeInfo value, $Res Function(StorageVolumeInfo) then) =
      _$StorageVolumeInfoCopyWithImpl<$Res, StorageVolumeInfo>;
  @useResult
  $Res call(
      {String name,
      String path,
      int totalSpace,
      int freeSpace,
      bool isRemovable,
      bool isPrimary});
}

/// @nodoc
class _$StorageVolumeInfoCopyWithImpl<$Res, $Val extends StorageVolumeInfo>
    implements $StorageVolumeInfoCopyWith<$Res> {
  _$StorageVolumeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? totalSpace = null,
    Object? freeSpace = null,
    Object? isRemovable = null,
    Object? isPrimary = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpace: null == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int,
      freeSpace: null == freeSpace
          ? _value.freeSpace
          : freeSpace // ignore: cast_nullable_to_non_nullable
              as int,
      isRemovable: null == isRemovable
          ? _value.isRemovable
          : isRemovable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageVolumeInfoImplCopyWith<$Res>
    implements $StorageVolumeInfoCopyWith<$Res> {
  factory _$$StorageVolumeInfoImplCopyWith(_$StorageVolumeInfoImpl value,
          $Res Function(_$StorageVolumeInfoImpl) then) =
      __$$StorageVolumeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String path,
      int totalSpace,
      int freeSpace,
      bool isRemovable,
      bool isPrimary});
}

/// @nodoc
class __$$StorageVolumeInfoImplCopyWithImpl<$Res>
    extends _$StorageVolumeInfoCopyWithImpl<$Res, _$StorageVolumeInfoImpl>
    implements _$$StorageVolumeInfoImplCopyWith<$Res> {
  __$$StorageVolumeInfoImplCopyWithImpl(_$StorageVolumeInfoImpl _value,
      $Res Function(_$StorageVolumeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? totalSpace = null,
    Object? freeSpace = null,
    Object? isRemovable = null,
    Object? isPrimary = null,
  }) {
    return _then(_$StorageVolumeInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpace: null == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int,
      freeSpace: null == freeSpace
          ? _value.freeSpace
          : freeSpace // ignore: cast_nullable_to_non_nullable
              as int,
      isRemovable: null == isRemovable
          ? _value.isRemovable
          : isRemovable // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageVolumeInfoImpl implements _StorageVolumeInfo {
  const _$StorageVolumeInfoImpl(
      {required this.name,
      required this.path,
      required this.totalSpace,
      required this.freeSpace,
      required this.isRemovable,
      required this.isPrimary});

  factory _$StorageVolumeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageVolumeInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String path;
  @override
  final int totalSpace;
  @override
  final int freeSpace;
  @override
  final bool isRemovable;
  @override
  final bool isPrimary;

  @override
  String toString() {
    return 'StorageVolumeInfo(name: $name, path: $path, totalSpace: $totalSpace, freeSpace: $freeSpace, isRemovable: $isRemovable, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageVolumeInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.totalSpace, totalSpace) ||
                other.totalSpace == totalSpace) &&
            (identical(other.freeSpace, freeSpace) ||
                other.freeSpace == freeSpace) &&
            (identical(other.isRemovable, isRemovable) ||
                other.isRemovable == isRemovable) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, path, totalSpace, freeSpace, isRemovable, isPrimary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageVolumeInfoImplCopyWith<_$StorageVolumeInfoImpl> get copyWith =>
      __$$StorageVolumeInfoImplCopyWithImpl<_$StorageVolumeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageVolumeInfoImplToJson(
      this,
    );
  }
}

abstract class _StorageVolumeInfo implements StorageVolumeInfo {
  const factory _StorageVolumeInfo(
      {required final String name,
      required final String path,
      required final int totalSpace,
      required final int freeSpace,
      required final bool isRemovable,
      required final bool isPrimary}) = _$StorageVolumeInfoImpl;

  factory _StorageVolumeInfo.fromJson(Map<String, dynamic> json) =
      _$StorageVolumeInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  int get totalSpace;
  @override
  int get freeSpace;
  @override
  bool get isRemovable;
  @override
  bool get isPrimary;
  @override
  @JsonKey(ignore: true)
  _$$StorageVolumeInfoImplCopyWith<_$StorageVolumeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
