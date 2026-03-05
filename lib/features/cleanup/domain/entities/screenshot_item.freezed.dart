// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screenshot_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScreenshotItem _$ScreenshotItemFromJson(Map<String, dynamic> json) {
  return _ScreenshotItem.fromJson(json);
}

/// @nodoc
mixin _$ScreenshotItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  int get dateModified => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreenshotItemCopyWith<ScreenshotItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenshotItemCopyWith<$Res> {
  factory $ScreenshotItemCopyWith(
          ScreenshotItem value, $Res Function(ScreenshotItem) then) =
      _$ScreenshotItemCopyWithImpl<$Res, ScreenshotItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String path,
      String uri,
      int dateModified,
      bool isSelected});
}

/// @nodoc
class _$ScreenshotItemCopyWithImpl<$Res, $Val extends ScreenshotItem>
    implements $ScreenshotItemCopyWith<$Res> {
  _$ScreenshotItemCopyWithImpl(this._value, this._then);

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
abstract class _$$ScreenshotItemImplCopyWith<$Res>
    implements $ScreenshotItemCopyWith<$Res> {
  factory _$$ScreenshotItemImplCopyWith(_$ScreenshotItemImpl value,
          $Res Function(_$ScreenshotItemImpl) then) =
      __$$ScreenshotItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String path,
      String uri,
      int dateModified,
      bool isSelected});
}

/// @nodoc
class __$$ScreenshotItemImplCopyWithImpl<$Res>
    extends _$ScreenshotItemCopyWithImpl<$Res, _$ScreenshotItemImpl>
    implements _$$ScreenshotItemImplCopyWith<$Res> {
  __$$ScreenshotItemImplCopyWithImpl(
      _$ScreenshotItemImpl _value, $Res Function(_$ScreenshotItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? path = null,
    Object? uri = null,
    Object? dateModified = null,
    Object? isSelected = null,
  }) {
    return _then(_$ScreenshotItemImpl(
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
class _$ScreenshotItemImpl implements _ScreenshotItem {
  const _$ScreenshotItemImpl(
      {required this.id,
      required this.name,
      required this.size,
      required this.path,
      required this.uri,
      required this.dateModified,
      this.isSelected = false});

  factory _$ScreenshotItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreenshotItemImplFromJson(json);

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
  final int dateModified;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'ScreenshotItem(id: $id, name: $name, size: $size, path: $path, uri: $uri, dateModified: $dateModified, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenshotItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, size, path, uri, dateModified, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenshotItemImplCopyWith<_$ScreenshotItemImpl> get copyWith =>
      __$$ScreenshotItemImplCopyWithImpl<_$ScreenshotItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenshotItemImplToJson(
      this,
    );
  }
}

abstract class _ScreenshotItem implements ScreenshotItem {
  const factory _ScreenshotItem(
      {required final String id,
      required final String name,
      required final int size,
      required final String path,
      required final String uri,
      required final int dateModified,
      final bool isSelected}) = _$ScreenshotItemImpl;

  factory _ScreenshotItem.fromJson(Map<String, dynamic> json) =
      _$ScreenshotItemImpl.fromJson;

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
  int get dateModified;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$ScreenshotItemImplCopyWith<_$ScreenshotItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
