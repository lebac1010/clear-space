// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleanup_history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CleanupHistoryRecord _$CleanupHistoryRecordFromJson(Map<String, dynamic> json) {
  return _CleanupHistoryRecord.fromJson(json);
}

/// @nodoc
mixin _$CleanupHistoryRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get cleanupType =>
      throw _privateConstructorUsedError; // 'junk', 'screenshots', 'downloads', 'large_files'
  int get itemsCount => throw _privateConstructorUsedError;
  int get totalSizeInBytes => throw _privateConstructorUsedError;
  List<String> get fileNames => throw _privateConstructorUsedError;
  Map<String, int> get mimeTypeBreakdown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CleanupHistoryRecordCopyWith<CleanupHistoryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanupHistoryRecordCopyWith<$Res> {
  factory $CleanupHistoryRecordCopyWith(CleanupHistoryRecord value,
          $Res Function(CleanupHistoryRecord) then) =
      _$CleanupHistoryRecordCopyWithImpl<$Res, CleanupHistoryRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      String cleanupType,
      int itemsCount,
      int totalSizeInBytes,
      List<String> fileNames,
      Map<String, int> mimeTypeBreakdown});
}

/// @nodoc
class _$CleanupHistoryRecordCopyWithImpl<$Res,
        $Val extends CleanupHistoryRecord>
    implements $CleanupHistoryRecordCopyWith<$Res> {
  _$CleanupHistoryRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? cleanupType = null,
    Object? itemsCount = null,
    Object? totalSizeInBytes = null,
    Object? fileNames = null,
    Object? mimeTypeBreakdown = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cleanupType: null == cleanupType
          ? _value.cleanupType
          : cleanupType // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSizeInBytes: null == totalSizeInBytes
          ? _value.totalSizeInBytes
          : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
              as int,
      fileNames: null == fileNames
          ? _value.fileNames
          : fileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mimeTypeBreakdown: null == mimeTypeBreakdown
          ? _value.mimeTypeBreakdown
          : mimeTypeBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CleanupHistoryRecordImplCopyWith<$Res>
    implements $CleanupHistoryRecordCopyWith<$Res> {
  factory _$$CleanupHistoryRecordImplCopyWith(_$CleanupHistoryRecordImpl value,
          $Res Function(_$CleanupHistoryRecordImpl) then) =
      __$$CleanupHistoryRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      String cleanupType,
      int itemsCount,
      int totalSizeInBytes,
      List<String> fileNames,
      Map<String, int> mimeTypeBreakdown});
}

/// @nodoc
class __$$CleanupHistoryRecordImplCopyWithImpl<$Res>
    extends _$CleanupHistoryRecordCopyWithImpl<$Res, _$CleanupHistoryRecordImpl>
    implements _$$CleanupHistoryRecordImplCopyWith<$Res> {
  __$$CleanupHistoryRecordImplCopyWithImpl(_$CleanupHistoryRecordImpl _value,
      $Res Function(_$CleanupHistoryRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? cleanupType = null,
    Object? itemsCount = null,
    Object? totalSizeInBytes = null,
    Object? fileNames = null,
    Object? mimeTypeBreakdown = null,
  }) {
    return _then(_$CleanupHistoryRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cleanupType: null == cleanupType
          ? _value.cleanupType
          : cleanupType // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSizeInBytes: null == totalSizeInBytes
          ? _value.totalSizeInBytes
          : totalSizeInBytes // ignore: cast_nullable_to_non_nullable
              as int,
      fileNames: null == fileNames
          ? _value._fileNames
          : fileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mimeTypeBreakdown: null == mimeTypeBreakdown
          ? _value._mimeTypeBreakdown
          : mimeTypeBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CleanupHistoryRecordImpl implements _CleanupHistoryRecord {
  const _$CleanupHistoryRecordImpl(
      {required this.id,
      required this.timestamp,
      required this.cleanupType,
      required this.itemsCount,
      required this.totalSizeInBytes,
      final List<String> fileNames = const [],
      final Map<String, int> mimeTypeBreakdown = const {}})
      : _fileNames = fileNames,
        _mimeTypeBreakdown = mimeTypeBreakdown;

  factory _$CleanupHistoryRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleanupHistoryRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final String cleanupType;
// 'junk', 'screenshots', 'downloads', 'large_files'
  @override
  final int itemsCount;
  @override
  final int totalSizeInBytes;
  final List<String> _fileNames;
  @override
  @JsonKey()
  List<String> get fileNames {
    if (_fileNames is EqualUnmodifiableListView) return _fileNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileNames);
  }

  final Map<String, int> _mimeTypeBreakdown;
  @override
  @JsonKey()
  Map<String, int> get mimeTypeBreakdown {
    if (_mimeTypeBreakdown is EqualUnmodifiableMapView)
      return _mimeTypeBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mimeTypeBreakdown);
  }

  @override
  String toString() {
    return 'CleanupHistoryRecord(id: $id, timestamp: $timestamp, cleanupType: $cleanupType, itemsCount: $itemsCount, totalSizeInBytes: $totalSizeInBytes, fileNames: $fileNames, mimeTypeBreakdown: $mimeTypeBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleanupHistoryRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cleanupType, cleanupType) ||
                other.cleanupType == cleanupType) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.totalSizeInBytes, totalSizeInBytes) ||
                other.totalSizeInBytes == totalSizeInBytes) &&
            const DeepCollectionEquality()
                .equals(other._fileNames, _fileNames) &&
            const DeepCollectionEquality()
                .equals(other._mimeTypeBreakdown, _mimeTypeBreakdown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      cleanupType,
      itemsCount,
      totalSizeInBytes,
      const DeepCollectionEquality().hash(_fileNames),
      const DeepCollectionEquality().hash(_mimeTypeBreakdown));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CleanupHistoryRecordImplCopyWith<_$CleanupHistoryRecordImpl>
      get copyWith =>
          __$$CleanupHistoryRecordImplCopyWithImpl<_$CleanupHistoryRecordImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleanupHistoryRecordImplToJson(
      this,
    );
  }
}

abstract class _CleanupHistoryRecord implements CleanupHistoryRecord {
  const factory _CleanupHistoryRecord(
      {required final String id,
      required final DateTime timestamp,
      required final String cleanupType,
      required final int itemsCount,
      required final int totalSizeInBytes,
      final List<String> fileNames,
      final Map<String, int> mimeTypeBreakdown}) = _$CleanupHistoryRecordImpl;

  factory _CleanupHistoryRecord.fromJson(Map<String, dynamic> json) =
      _$CleanupHistoryRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  String get cleanupType;
  @override // 'junk', 'screenshots', 'downloads', 'large_files'
  int get itemsCount;
  @override
  int get totalSizeInBytes;
  @override
  List<String> get fileNames;
  @override
  Map<String, int> get mimeTypeBreakdown;
  @override
  @JsonKey(ignore: true)
  _$$CleanupHistoryRecordImplCopyWith<_$CleanupHistoryRecordImpl>
      get copyWith => throw _privateConstructorUsedError;
}
