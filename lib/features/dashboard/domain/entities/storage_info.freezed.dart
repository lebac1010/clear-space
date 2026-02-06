// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageInfo _$StorageInfoFromJson(Map<String, dynamic> json) {
  return _StorageInfo.fromJson(json);
}

/// @nodoc
mixin _$StorageInfo {
  int get totalSpace => throw _privateConstructorUsedError;
  int get freeSpace => throw _privateConstructorUsedError;
  int get usedSpace => throw _privateConstructorUsedError;
  int get photosCount => throw _privateConstructorUsedError;
  int get photosSize => throw _privateConstructorUsedError;
  int get videosCount => throw _privateConstructorUsedError;
  int get videosSize => throw _privateConstructorUsedError;
  int get audioCount => throw _privateConstructorUsedError; // NEW
  int get audioSize => throw _privateConstructorUsedError; // NEW
  int get documentsCount => throw _privateConstructorUsedError; // NEW
  int get documentsSize => throw _privateConstructorUsedError; // NEW
  int get filesCount => throw _privateConstructorUsedError;
  int get filesSize => throw _privateConstructorUsedError;
  int get systemSize => throw _privateConstructorUsedError;
  int get duplicateCount => throw _privateConstructorUsedError; // NEW
  int get duplicateSize => throw _privateConstructorUsedError; // NEW
  int get potentialSavings => throw _privateConstructorUsedError; // NEW
  List<LargeFileInfo> get largeFiles =>
      throw _privateConstructorUsedError; // NEW
  List<StorageVolumeInfo> get storageVolumes =>
      throw _privateConstructorUsedError; // NEW
  int get cloudOnlyCount => throw _privateConstructorUsedError; // NEW
  int get scanDurationMs => throw _privateConstructorUsedError; // NEW
  int get lastUpdated => throw _privateConstructorUsedError; // NEW: Timestamp
  bool get isEstimated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageInfoCopyWith<StorageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageInfoCopyWith<$Res> {
  factory $StorageInfoCopyWith(
          StorageInfo value, $Res Function(StorageInfo) then) =
      _$StorageInfoCopyWithImpl<$Res, StorageInfo>;
  @useResult
  $Res call(
      {int totalSpace,
      int freeSpace,
      int usedSpace,
      int photosCount,
      int photosSize,
      int videosCount,
      int videosSize,
      int audioCount,
      int audioSize,
      int documentsCount,
      int documentsSize,
      int filesCount,
      int filesSize,
      int systemSize,
      int duplicateCount,
      int duplicateSize,
      int potentialSavings,
      List<LargeFileInfo> largeFiles,
      List<StorageVolumeInfo> storageVolumes,
      int cloudOnlyCount,
      int scanDurationMs,
      int lastUpdated,
      bool isEstimated});
}

/// @nodoc
class _$StorageInfoCopyWithImpl<$Res, $Val extends StorageInfo>
    implements $StorageInfoCopyWith<$Res> {
  _$StorageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSpace = null,
    Object? freeSpace = null,
    Object? usedSpace = null,
    Object? photosCount = null,
    Object? photosSize = null,
    Object? videosCount = null,
    Object? videosSize = null,
    Object? audioCount = null,
    Object? audioSize = null,
    Object? documentsCount = null,
    Object? documentsSize = null,
    Object? filesCount = null,
    Object? filesSize = null,
    Object? systemSize = null,
    Object? duplicateCount = null,
    Object? duplicateSize = null,
    Object? potentialSavings = null,
    Object? largeFiles = null,
    Object? storageVolumes = null,
    Object? cloudOnlyCount = null,
    Object? scanDurationMs = null,
    Object? lastUpdated = null,
    Object? isEstimated = null,
  }) {
    return _then(_value.copyWith(
      totalSpace: null == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int,
      freeSpace: null == freeSpace
          ? _value.freeSpace
          : freeSpace // ignore: cast_nullable_to_non_nullable
              as int,
      usedSpace: null == usedSpace
          ? _value.usedSpace
          : usedSpace // ignore: cast_nullable_to_non_nullable
              as int,
      photosCount: null == photosCount
          ? _value.photosCount
          : photosCount // ignore: cast_nullable_to_non_nullable
              as int,
      photosSize: null == photosSize
          ? _value.photosSize
          : photosSize // ignore: cast_nullable_to_non_nullable
              as int,
      videosCount: null == videosCount
          ? _value.videosCount
          : videosCount // ignore: cast_nullable_to_non_nullable
              as int,
      videosSize: null == videosSize
          ? _value.videosSize
          : videosSize // ignore: cast_nullable_to_non_nullable
              as int,
      audioCount: null == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int,
      audioSize: null == audioSize
          ? _value.audioSize
          : audioSize // ignore: cast_nullable_to_non_nullable
              as int,
      documentsCount: null == documentsCount
          ? _value.documentsCount
          : documentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      documentsSize: null == documentsSize
          ? _value.documentsSize
          : documentsSize // ignore: cast_nullable_to_non_nullable
              as int,
      filesCount: null == filesCount
          ? _value.filesCount
          : filesCount // ignore: cast_nullable_to_non_nullable
              as int,
      filesSize: null == filesSize
          ? _value.filesSize
          : filesSize // ignore: cast_nullable_to_non_nullable
              as int,
      systemSize: null == systemSize
          ? _value.systemSize
          : systemSize // ignore: cast_nullable_to_non_nullable
              as int,
      duplicateCount: null == duplicateCount
          ? _value.duplicateCount
          : duplicateCount // ignore: cast_nullable_to_non_nullable
              as int,
      duplicateSize: null == duplicateSize
          ? _value.duplicateSize
          : duplicateSize // ignore: cast_nullable_to_non_nullable
              as int,
      potentialSavings: null == potentialSavings
          ? _value.potentialSavings
          : potentialSavings // ignore: cast_nullable_to_non_nullable
              as int,
      largeFiles: null == largeFiles
          ? _value.largeFiles
          : largeFiles // ignore: cast_nullable_to_non_nullable
              as List<LargeFileInfo>,
      storageVolumes: null == storageVolumes
          ? _value.storageVolumes
          : storageVolumes // ignore: cast_nullable_to_non_nullable
              as List<StorageVolumeInfo>,
      cloudOnlyCount: null == cloudOnlyCount
          ? _value.cloudOnlyCount
          : cloudOnlyCount // ignore: cast_nullable_to_non_nullable
              as int,
      scanDurationMs: null == scanDurationMs
          ? _value.scanDurationMs
          : scanDurationMs // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      isEstimated: null == isEstimated
          ? _value.isEstimated
          : isEstimated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageInfoImplCopyWith<$Res>
    implements $StorageInfoCopyWith<$Res> {
  factory _$$StorageInfoImplCopyWith(
          _$StorageInfoImpl value, $Res Function(_$StorageInfoImpl) then) =
      __$$StorageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSpace,
      int freeSpace,
      int usedSpace,
      int photosCount,
      int photosSize,
      int videosCount,
      int videosSize,
      int audioCount,
      int audioSize,
      int documentsCount,
      int documentsSize,
      int filesCount,
      int filesSize,
      int systemSize,
      int duplicateCount,
      int duplicateSize,
      int potentialSavings,
      List<LargeFileInfo> largeFiles,
      List<StorageVolumeInfo> storageVolumes,
      int cloudOnlyCount,
      int scanDurationMs,
      int lastUpdated,
      bool isEstimated});
}

/// @nodoc
class __$$StorageInfoImplCopyWithImpl<$Res>
    extends _$StorageInfoCopyWithImpl<$Res, _$StorageInfoImpl>
    implements _$$StorageInfoImplCopyWith<$Res> {
  __$$StorageInfoImplCopyWithImpl(
      _$StorageInfoImpl _value, $Res Function(_$StorageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSpace = null,
    Object? freeSpace = null,
    Object? usedSpace = null,
    Object? photosCount = null,
    Object? photosSize = null,
    Object? videosCount = null,
    Object? videosSize = null,
    Object? audioCount = null,
    Object? audioSize = null,
    Object? documentsCount = null,
    Object? documentsSize = null,
    Object? filesCount = null,
    Object? filesSize = null,
    Object? systemSize = null,
    Object? duplicateCount = null,
    Object? duplicateSize = null,
    Object? potentialSavings = null,
    Object? largeFiles = null,
    Object? storageVolumes = null,
    Object? cloudOnlyCount = null,
    Object? scanDurationMs = null,
    Object? lastUpdated = null,
    Object? isEstimated = null,
  }) {
    return _then(_$StorageInfoImpl(
      totalSpace: null == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int,
      freeSpace: null == freeSpace
          ? _value.freeSpace
          : freeSpace // ignore: cast_nullable_to_non_nullable
              as int,
      usedSpace: null == usedSpace
          ? _value.usedSpace
          : usedSpace // ignore: cast_nullable_to_non_nullable
              as int,
      photosCount: null == photosCount
          ? _value.photosCount
          : photosCount // ignore: cast_nullable_to_non_nullable
              as int,
      photosSize: null == photosSize
          ? _value.photosSize
          : photosSize // ignore: cast_nullable_to_non_nullable
              as int,
      videosCount: null == videosCount
          ? _value.videosCount
          : videosCount // ignore: cast_nullable_to_non_nullable
              as int,
      videosSize: null == videosSize
          ? _value.videosSize
          : videosSize // ignore: cast_nullable_to_non_nullable
              as int,
      audioCount: null == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int,
      audioSize: null == audioSize
          ? _value.audioSize
          : audioSize // ignore: cast_nullable_to_non_nullable
              as int,
      documentsCount: null == documentsCount
          ? _value.documentsCount
          : documentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      documentsSize: null == documentsSize
          ? _value.documentsSize
          : documentsSize // ignore: cast_nullable_to_non_nullable
              as int,
      filesCount: null == filesCount
          ? _value.filesCount
          : filesCount // ignore: cast_nullable_to_non_nullable
              as int,
      filesSize: null == filesSize
          ? _value.filesSize
          : filesSize // ignore: cast_nullable_to_non_nullable
              as int,
      systemSize: null == systemSize
          ? _value.systemSize
          : systemSize // ignore: cast_nullable_to_non_nullable
              as int,
      duplicateCount: null == duplicateCount
          ? _value.duplicateCount
          : duplicateCount // ignore: cast_nullable_to_non_nullable
              as int,
      duplicateSize: null == duplicateSize
          ? _value.duplicateSize
          : duplicateSize // ignore: cast_nullable_to_non_nullable
              as int,
      potentialSavings: null == potentialSavings
          ? _value.potentialSavings
          : potentialSavings // ignore: cast_nullable_to_non_nullable
              as int,
      largeFiles: null == largeFiles
          ? _value._largeFiles
          : largeFiles // ignore: cast_nullable_to_non_nullable
              as List<LargeFileInfo>,
      storageVolumes: null == storageVolumes
          ? _value._storageVolumes
          : storageVolumes // ignore: cast_nullable_to_non_nullable
              as List<StorageVolumeInfo>,
      cloudOnlyCount: null == cloudOnlyCount
          ? _value.cloudOnlyCount
          : cloudOnlyCount // ignore: cast_nullable_to_non_nullable
              as int,
      scanDurationMs: null == scanDurationMs
          ? _value.scanDurationMs
          : scanDurationMs // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      isEstimated: null == isEstimated
          ? _value.isEstimated
          : isEstimated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageInfoImpl extends _StorageInfo {
  const _$StorageInfoImpl(
      {required this.totalSpace,
      required this.freeSpace,
      required this.usedSpace,
      required this.photosCount,
      required this.photosSize,
      required this.videosCount,
      required this.videosSize,
      required this.audioCount,
      required this.audioSize,
      required this.documentsCount,
      required this.documentsSize,
      required this.filesCount,
      required this.filesSize,
      required this.systemSize,
      required this.duplicateCount,
      required this.duplicateSize,
      required this.potentialSavings,
      required final List<LargeFileInfo> largeFiles,
      required final List<StorageVolumeInfo> storageVolumes,
      required this.cloudOnlyCount,
      required this.scanDurationMs,
      required this.lastUpdated,
      required this.isEstimated})
      : _largeFiles = largeFiles,
        _storageVolumes = storageVolumes,
        super._();

  factory _$StorageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageInfoImplFromJson(json);

  @override
  final int totalSpace;
  @override
  final int freeSpace;
  @override
  final int usedSpace;
  @override
  final int photosCount;
  @override
  final int photosSize;
  @override
  final int videosCount;
  @override
  final int videosSize;
  @override
  final int audioCount;
// NEW
  @override
  final int audioSize;
// NEW
  @override
  final int documentsCount;
// NEW
  @override
  final int documentsSize;
// NEW
  @override
  final int filesCount;
  @override
  final int filesSize;
  @override
  final int systemSize;
  @override
  final int duplicateCount;
// NEW
  @override
  final int duplicateSize;
// NEW
  @override
  final int potentialSavings;
// NEW
  final List<LargeFileInfo> _largeFiles;
// NEW
  @override
  List<LargeFileInfo> get largeFiles {
    if (_largeFiles is EqualUnmodifiableListView) return _largeFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_largeFiles);
  }

// NEW
  final List<StorageVolumeInfo> _storageVolumes;
// NEW
  @override
  List<StorageVolumeInfo> get storageVolumes {
    if (_storageVolumes is EqualUnmodifiableListView) return _storageVolumes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storageVolumes);
  }

// NEW
  @override
  final int cloudOnlyCount;
// NEW
  @override
  final int scanDurationMs;
// NEW
  @override
  final int lastUpdated;
// NEW: Timestamp
  @override
  final bool isEstimated;

  @override
  String toString() {
    return 'StorageInfo(totalSpace: $totalSpace, freeSpace: $freeSpace, usedSpace: $usedSpace, photosCount: $photosCount, photosSize: $photosSize, videosCount: $videosCount, videosSize: $videosSize, audioCount: $audioCount, audioSize: $audioSize, documentsCount: $documentsCount, documentsSize: $documentsSize, filesCount: $filesCount, filesSize: $filesSize, systemSize: $systemSize, duplicateCount: $duplicateCount, duplicateSize: $duplicateSize, potentialSavings: $potentialSavings, largeFiles: $largeFiles, storageVolumes: $storageVolumes, cloudOnlyCount: $cloudOnlyCount, scanDurationMs: $scanDurationMs, lastUpdated: $lastUpdated, isEstimated: $isEstimated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageInfoImpl &&
            (identical(other.totalSpace, totalSpace) ||
                other.totalSpace == totalSpace) &&
            (identical(other.freeSpace, freeSpace) ||
                other.freeSpace == freeSpace) &&
            (identical(other.usedSpace, usedSpace) ||
                other.usedSpace == usedSpace) &&
            (identical(other.photosCount, photosCount) ||
                other.photosCount == photosCount) &&
            (identical(other.photosSize, photosSize) ||
                other.photosSize == photosSize) &&
            (identical(other.videosCount, videosCount) ||
                other.videosCount == videosCount) &&
            (identical(other.videosSize, videosSize) ||
                other.videosSize == videosSize) &&
            (identical(other.audioCount, audioCount) ||
                other.audioCount == audioCount) &&
            (identical(other.audioSize, audioSize) ||
                other.audioSize == audioSize) &&
            (identical(other.documentsCount, documentsCount) ||
                other.documentsCount == documentsCount) &&
            (identical(other.documentsSize, documentsSize) ||
                other.documentsSize == documentsSize) &&
            (identical(other.filesCount, filesCount) ||
                other.filesCount == filesCount) &&
            (identical(other.filesSize, filesSize) ||
                other.filesSize == filesSize) &&
            (identical(other.systemSize, systemSize) ||
                other.systemSize == systemSize) &&
            (identical(other.duplicateCount, duplicateCount) ||
                other.duplicateCount == duplicateCount) &&
            (identical(other.duplicateSize, duplicateSize) ||
                other.duplicateSize == duplicateSize) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            const DeepCollectionEquality()
                .equals(other._largeFiles, _largeFiles) &&
            const DeepCollectionEquality()
                .equals(other._storageVolumes, _storageVolumes) &&
            (identical(other.cloudOnlyCount, cloudOnlyCount) ||
                other.cloudOnlyCount == cloudOnlyCount) &&
            (identical(other.scanDurationMs, scanDurationMs) ||
                other.scanDurationMs == scanDurationMs) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isEstimated, isEstimated) ||
                other.isEstimated == isEstimated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalSpace,
        freeSpace,
        usedSpace,
        photosCount,
        photosSize,
        videosCount,
        videosSize,
        audioCount,
        audioSize,
        documentsCount,
        documentsSize,
        filesCount,
        filesSize,
        systemSize,
        duplicateCount,
        duplicateSize,
        potentialSavings,
        const DeepCollectionEquality().hash(_largeFiles),
        const DeepCollectionEquality().hash(_storageVolumes),
        cloudOnlyCount,
        scanDurationMs,
        lastUpdated,
        isEstimated
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageInfoImplCopyWith<_$StorageInfoImpl> get copyWith =>
      __$$StorageInfoImplCopyWithImpl<_$StorageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageInfoImplToJson(
      this,
    );
  }
}

abstract class _StorageInfo extends StorageInfo {
  const factory _StorageInfo(
      {required final int totalSpace,
      required final int freeSpace,
      required final int usedSpace,
      required final int photosCount,
      required final int photosSize,
      required final int videosCount,
      required final int videosSize,
      required final int audioCount,
      required final int audioSize,
      required final int documentsCount,
      required final int documentsSize,
      required final int filesCount,
      required final int filesSize,
      required final int systemSize,
      required final int duplicateCount,
      required final int duplicateSize,
      required final int potentialSavings,
      required final List<LargeFileInfo> largeFiles,
      required final List<StorageVolumeInfo> storageVolumes,
      required final int cloudOnlyCount,
      required final int scanDurationMs,
      required final int lastUpdated,
      required final bool isEstimated}) = _$StorageInfoImpl;
  const _StorageInfo._() : super._();

  factory _StorageInfo.fromJson(Map<String, dynamic> json) =
      _$StorageInfoImpl.fromJson;

  @override
  int get totalSpace;
  @override
  int get freeSpace;
  @override
  int get usedSpace;
  @override
  int get photosCount;
  @override
  int get photosSize;
  @override
  int get videosCount;
  @override
  int get videosSize;
  @override
  int get audioCount;
  @override // NEW
  int get audioSize;
  @override // NEW
  int get documentsCount;
  @override // NEW
  int get documentsSize;
  @override // NEW
  int get filesCount;
  @override
  int get filesSize;
  @override
  int get systemSize;
  @override
  int get duplicateCount;
  @override // NEW
  int get duplicateSize;
  @override // NEW
  int get potentialSavings;
  @override // NEW
  List<LargeFileInfo> get largeFiles;
  @override // NEW
  List<StorageVolumeInfo> get storageVolumes;
  @override // NEW
  int get cloudOnlyCount;
  @override // NEW
  int get scanDurationMs;
  @override // NEW
  int get lastUpdated;
  @override // NEW: Timestamp
  bool get isEstimated;
  @override
  @JsonKey(ignore: true)
  _$$StorageInfoImplCopyWith<_$StorageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
