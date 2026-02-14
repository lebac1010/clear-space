// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleanup_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CleanupItem _$CleanupItemFromJson(Map<String, dynamic> json) {
  return _CleanupItem.fromJson(json);
}

/// @nodoc
mixin _$CleanupItem {
  String get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  DateTime get dateModified => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String? get thumbUrl => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CleanupItemCopyWith<CleanupItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanupItemCopyWith<$Res> {
  factory $CleanupItemCopyWith(
          CleanupItem value, $Res Function(CleanupItem) then) =
      _$CleanupItemCopyWithImpl<$Res, CleanupItem>;
  @useResult
  $Res call(
      {String id,
      String path,
      String uri,
      String name,
      int size,
      DateTime dateModified,
      String? mediaType,
      String? thumbUrl,
      bool isSelected});
}

/// @nodoc
class _$CleanupItemCopyWithImpl<$Res, $Val extends CleanupItem>
    implements $CleanupItemCopyWith<$Res> {
  _$CleanupItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? uri = null,
    Object? name = null,
    Object? size = null,
    Object? dateModified = null,
    Object? mediaType = freezed,
    Object? thumbUrl = freezed,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: freezed == thumbUrl
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CleanupItemImplCopyWith<$Res>
    implements $CleanupItemCopyWith<$Res> {
  factory _$$CleanupItemImplCopyWith(
          _$CleanupItemImpl value, $Res Function(_$CleanupItemImpl) then) =
      __$$CleanupItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String path,
      String uri,
      String name,
      int size,
      DateTime dateModified,
      String? mediaType,
      String? thumbUrl,
      bool isSelected});
}

/// @nodoc
class __$$CleanupItemImplCopyWithImpl<$Res>
    extends _$CleanupItemCopyWithImpl<$Res, _$CleanupItemImpl>
    implements _$$CleanupItemImplCopyWith<$Res> {
  __$$CleanupItemImplCopyWithImpl(
      _$CleanupItemImpl _value, $Res Function(_$CleanupItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? uri = null,
    Object? name = null,
    Object? size = null,
    Object? dateModified = null,
    Object? mediaType = freezed,
    Object? thumbUrl = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$CleanupItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: freezed == thumbUrl
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleanupItemImpl implements _CleanupItem {
  const _$CleanupItemImpl(
      {required this.id,
      required this.path,
      required this.uri,
      required this.name,
      required this.size,
      required this.dateModified,
      this.mediaType,
      this.thumbUrl,
      this.isSelected = false});

  factory _$CleanupItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleanupItemImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
  @override
  final String uri;
  @override
  final String name;
  @override
  final int size;
  @override
  final DateTime dateModified;
  @override
  final String? mediaType;
  @override
  final String? thumbUrl;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'CleanupItem(id: $id, path: $path, uri: $uri, name: $name, size: $size, dateModified: $dateModified, mediaType: $mediaType, thumbUrl: $thumbUrl, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleanupItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, path, uri, name, size,
      dateModified, mediaType, thumbUrl, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CleanupItemImplCopyWith<_$CleanupItemImpl> get copyWith =>
      __$$CleanupItemImplCopyWithImpl<_$CleanupItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleanupItemImplToJson(
      this,
    );
  }
}

abstract class _CleanupItem implements CleanupItem {
  const factory _CleanupItem(
      {required final String id,
      required final String path,
      required final String uri,
      required final String name,
      required final int size,
      required final DateTime dateModified,
      final String? mediaType,
      final String? thumbUrl,
      final bool isSelected}) = _$CleanupItemImpl;

  factory _CleanupItem.fromJson(Map<String, dynamic> json) =
      _$CleanupItemImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override
  String get uri;
  @override
  String get name;
  @override
  int get size;
  @override
  DateTime get dateModified;
  @override
  String? get mediaType;
  @override
  String? get thumbUrl;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$CleanupItemImplCopyWith<_$CleanupItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
