// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'large_file_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LargeFileInfo _$LargeFileInfoFromJson(Map<String, dynamic> json) {
  return _LargeFileInfo.fromJson(json);
}

/// @nodoc
mixin _$LargeFileInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get dateModified => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LargeFileInfoCopyWith<LargeFileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LargeFileInfoCopyWith<$Res> {
  factory $LargeFileInfoCopyWith(
          LargeFileInfo value, $Res Function(LargeFileInfo) then) =
      _$LargeFileInfoCopyWithImpl<$Res, LargeFileInfo>;
  @useResult
  $Res call(
      {int id,
      String name,
      int size,
      String mimeType,
      int dateModified,
      String uri,
      String path,
      String mediaType});
}

/// @nodoc
class _$LargeFileInfoCopyWithImpl<$Res, $Val extends LargeFileInfo>
    implements $LargeFileInfoCopyWith<$Res> {
  _$LargeFileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? dateModified = null,
    Object? uri = null,
    Object? path = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LargeFileInfoImplCopyWith<$Res>
    implements $LargeFileInfoCopyWith<$Res> {
  factory _$$LargeFileInfoImplCopyWith(
          _$LargeFileInfoImpl value, $Res Function(_$LargeFileInfoImpl) then) =
      __$$LargeFileInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int size,
      String mimeType,
      int dateModified,
      String uri,
      String path,
      String mediaType});
}

/// @nodoc
class __$$LargeFileInfoImplCopyWithImpl<$Res>
    extends _$LargeFileInfoCopyWithImpl<$Res, _$LargeFileInfoImpl>
    implements _$$LargeFileInfoImplCopyWith<$Res> {
  __$$LargeFileInfoImplCopyWithImpl(
      _$LargeFileInfoImpl _value, $Res Function(_$LargeFileInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? dateModified = null,
    Object? uri = null,
    Object? path = null,
    Object? mediaType = null,
  }) {
    return _then(_$LargeFileInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LargeFileInfoImpl implements _LargeFileInfo {
  const _$LargeFileInfoImpl(
      {required this.id,
      required this.name,
      required this.size,
      required this.mimeType,
      required this.dateModified,
      required this.uri,
      required this.path,
      required this.mediaType});

  factory _$LargeFileInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LargeFileInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int size;
  @override
  final String mimeType;
  @override
  final int dateModified;
  @override
  final String uri;
  @override
  final String path;
  @override
  final String mediaType;

  @override
  String toString() {
    return 'LargeFileInfo(id: $id, name: $name, size: $size, mimeType: $mimeType, dateModified: $dateModified, uri: $uri, path: $path, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LargeFileInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, size, mimeType,
      dateModified, uri, path, mediaType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LargeFileInfoImplCopyWith<_$LargeFileInfoImpl> get copyWith =>
      __$$LargeFileInfoImplCopyWithImpl<_$LargeFileInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LargeFileInfoImplToJson(
      this,
    );
  }
}

abstract class _LargeFileInfo implements LargeFileInfo {
  const factory _LargeFileInfo(
      {required final int id,
      required final String name,
      required final int size,
      required final String mimeType,
      required final int dateModified,
      required final String uri,
      required final String path,
      required final String mediaType}) = _$LargeFileInfoImpl;

  factory _LargeFileInfo.fromJson(Map<String, dynamic> json) =
      _$LargeFileInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get size;
  @override
  String get mimeType;
  @override
  int get dateModified;
  @override
  String get uri;
  @override
  String get path;
  @override
  String get mediaType;
  @override
  @JsonKey(ignore: true)
  _$$LargeFileInfoImplCopyWith<_$LargeFileInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
