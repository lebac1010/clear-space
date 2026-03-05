// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DownloadItem _$DownloadItemFromJson(Map<String, dynamic> json) {
  return _DownloadItem.fromJson(json);
}

/// @nodoc
mixin _$DownloadItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get dateModified => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadItemCopyWith<DownloadItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadItemCopyWith<$Res> {
  factory $DownloadItemCopyWith(
          DownloadItem value, $Res Function(DownloadItem) then) =
      _$DownloadItemCopyWithImpl<$Res, DownloadItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String path,
      String uri,
      String mimeType,
      int dateModified,
      bool isSelected});
}

/// @nodoc
class _$DownloadItemCopyWithImpl<$Res, $Val extends DownloadItem>
    implements $DownloadItemCopyWith<$Res> {
  _$DownloadItemCopyWithImpl(this._value, this._then);

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
    Object? path = null,
    Object? uri = null,
    Object? mimeType = null,
    Object? dateModified = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadItemImplCopyWith<$Res>
    implements $DownloadItemCopyWith<$Res> {
  factory _$$DownloadItemImplCopyWith(
          _$DownloadItemImpl value, $Res Function(_$DownloadItemImpl) then) =
      __$$DownloadItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String path,
      String uri,
      String mimeType,
      int dateModified,
      bool isSelected});
}

/// @nodoc
class __$$DownloadItemImplCopyWithImpl<$Res>
    extends _$DownloadItemCopyWithImpl<$Res, _$DownloadItemImpl>
    implements _$$DownloadItemImplCopyWith<$Res> {
  __$$DownloadItemImplCopyWithImpl(
      _$DownloadItemImpl _value, $Res Function(_$DownloadItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? path = null,
    Object? uri = null,
    Object? mimeType = null,
    Object? dateModified = null,
    Object? isSelected = null,
  }) {
    return _then(_$DownloadItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadItemImpl implements _DownloadItem {
  const _$DownloadItemImpl(
      {required this.id,
      required this.name,
      required this.size,
      required this.path,
      required this.uri,
      required this.mimeType,
      required this.dateModified,
      this.isSelected = false});

  factory _$DownloadItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int size;
  @override
  final String path;
  @override
  final String uri;
  @override
  final String mimeType;
  @override
  final int dateModified;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'DownloadItem(id: $id, name: $name, size: $size, path: $path, uri: $uri, mimeType: $mimeType, dateModified: $dateModified, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, size, path, uri,
      mimeType, dateModified, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadItemImplCopyWith<_$DownloadItemImpl> get copyWith =>
      __$$DownloadItemImplCopyWithImpl<_$DownloadItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadItemImplToJson(
      this,
    );
  }
}

abstract class _DownloadItem implements DownloadItem {
  const factory _DownloadItem(
      {required final String id,
      required final String name,
      required final int size,
      required final String path,
      required final String uri,
      required final String mimeType,
      required final int dateModified,
      final bool isSelected}) = _$DownloadItemImpl;

  factory _DownloadItem.fromJson(Map<String, dynamic> json) =
      _$DownloadItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get size;
  @override
  String get path;
  @override
  String get uri;
  @override
  String get mimeType;
  @override
  int get dateModified;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$DownloadItemImplCopyWith<_$DownloadItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
