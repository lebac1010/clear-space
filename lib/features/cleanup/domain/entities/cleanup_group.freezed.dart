// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleanup_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CleanupGroup _$CleanupGroupFromJson(Map<String, dynamic> json) {
  return _CleanupGroup.fromJson(json);
}

/// @nodoc
mixin _$CleanupGroup {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<CleanupItem> get items => throw _privateConstructorUsedError;
  int get totalSize => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CleanupGroupCopyWith<CleanupGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanupGroupCopyWith<$Res> {
  factory $CleanupGroupCopyWith(
          CleanupGroup value, $Res Function(CleanupGroup) then) =
      _$CleanupGroupCopyWithImpl<$Res, CleanupGroup>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<CleanupItem> items,
      int totalSize,
      String? description});
}

/// @nodoc
class _$CleanupGroupCopyWithImpl<$Res, $Val extends CleanupGroup>
    implements $CleanupGroupCopyWith<$Res> {
  _$CleanupGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
    Object? totalSize = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CleanupItem>,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CleanupGroupImplCopyWith<$Res>
    implements $CleanupGroupCopyWith<$Res> {
  factory _$$CleanupGroupImplCopyWith(
          _$CleanupGroupImpl value, $Res Function(_$CleanupGroupImpl) then) =
      __$$CleanupGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<CleanupItem> items,
      int totalSize,
      String? description});
}

/// @nodoc
class __$$CleanupGroupImplCopyWithImpl<$Res>
    extends _$CleanupGroupCopyWithImpl<$Res, _$CleanupGroupImpl>
    implements _$$CleanupGroupImplCopyWith<$Res> {
  __$$CleanupGroupImplCopyWithImpl(
      _$CleanupGroupImpl _value, $Res Function(_$CleanupGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? items = null,
    Object? totalSize = null,
    Object? description = freezed,
  }) {
    return _then(_$CleanupGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CleanupItem>,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleanupGroupImpl implements _CleanupGroup {
  const _$CleanupGroupImpl(
      {required this.id,
      required this.title,
      required final List<CleanupItem> items,
      required this.totalSize,
      this.description})
      : _items = items;

  factory _$CleanupGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleanupGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<CleanupItem> _items;
  @override
  List<CleanupItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalSize;
  @override
  final String? description;

  @override
  String toString() {
    return 'CleanupGroup(id: $id, title: $title, items: $items, totalSize: $totalSize, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleanupGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_items), totalSize, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CleanupGroupImplCopyWith<_$CleanupGroupImpl> get copyWith =>
      __$$CleanupGroupImplCopyWithImpl<_$CleanupGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleanupGroupImplToJson(
      this,
    );
  }
}

abstract class _CleanupGroup implements CleanupGroup {
  const factory _CleanupGroup(
      {required final String id,
      required final String title,
      required final List<CleanupItem> items,
      required final int totalSize,
      final String? description}) = _$CleanupGroupImpl;

  factory _CleanupGroup.fromJson(Map<String, dynamic> json) =
      _$CleanupGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<CleanupItem> get items;
  @override
  int get totalSize;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CleanupGroupImplCopyWith<_$CleanupGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
