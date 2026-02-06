// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScanProgress _$ScanProgressFromJson(Map<String, dynamic> json) {
  return _ScanProgress.fromJson(json);
}

/// @nodoc
mixin _$ScanProgress {
  ScanPhase get phase => throw _privateConstructorUsedError;
  int get processedItems => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get currentBytes => throw _privateConstructorUsedError;
  String? get currentVolume => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanProgressCopyWith<ScanProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanProgressCopyWith<$Res> {
  factory $ScanProgressCopyWith(
          ScanProgress value, $Res Function(ScanProgress) then) =
      _$ScanProgressCopyWithImpl<$Res, ScanProgress>;
  @useResult
  $Res call(
      {ScanPhase phase,
      int processedItems,
      int totalItems,
      int currentBytes,
      String? currentVolume,
      bool isPaused});
}

/// @nodoc
class _$ScanProgressCopyWithImpl<$Res, $Val extends ScanProgress>
    implements $ScanProgressCopyWith<$Res> {
  _$ScanProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? processedItems = null,
    Object? totalItems = null,
    Object? currentBytes = null,
    Object? currentVolume = freezed,
    Object? isPaused = null,
  }) {
    return _then(_value.copyWith(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as ScanPhase,
      processedItems: null == processedItems
          ? _value.processedItems
          : processedItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      currentBytes: null == currentBytes
          ? _value.currentBytes
          : currentBytes // ignore: cast_nullable_to_non_nullable
              as int,
      currentVolume: freezed == currentVolume
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanProgressImplCopyWith<$Res>
    implements $ScanProgressCopyWith<$Res> {
  factory _$$ScanProgressImplCopyWith(
          _$ScanProgressImpl value, $Res Function(_$ScanProgressImpl) then) =
      __$$ScanProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScanPhase phase,
      int processedItems,
      int totalItems,
      int currentBytes,
      String? currentVolume,
      bool isPaused});
}

/// @nodoc
class __$$ScanProgressImplCopyWithImpl<$Res>
    extends _$ScanProgressCopyWithImpl<$Res, _$ScanProgressImpl>
    implements _$$ScanProgressImplCopyWith<$Res> {
  __$$ScanProgressImplCopyWithImpl(
      _$ScanProgressImpl _value, $Res Function(_$ScanProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? processedItems = null,
    Object? totalItems = null,
    Object? currentBytes = null,
    Object? currentVolume = freezed,
    Object? isPaused = null,
  }) {
    return _then(_$ScanProgressImpl(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as ScanPhase,
      processedItems: null == processedItems
          ? _value.processedItems
          : processedItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      currentBytes: null == currentBytes
          ? _value.currentBytes
          : currentBytes // ignore: cast_nullable_to_non_nullable
              as int,
      currentVolume: freezed == currentVolume
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanProgressImpl implements _ScanProgress {
  const _$ScanProgressImpl(
      {required this.phase,
      required this.processedItems,
      required this.totalItems,
      required this.currentBytes,
      this.currentVolume,
      this.isPaused = false});

  factory _$ScanProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanProgressImplFromJson(json);

  @override
  final ScanPhase phase;
  @override
  final int processedItems;
  @override
  final int totalItems;
  @override
  final int currentBytes;
  @override
  final String? currentVolume;
  @override
  @JsonKey()
  final bool isPaused;

  @override
  String toString() {
    return 'ScanProgress(phase: $phase, processedItems: $processedItems, totalItems: $totalItems, currentBytes: $currentBytes, currentVolume: $currentVolume, isPaused: $isPaused)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanProgressImpl &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.processedItems, processedItems) ||
                other.processedItems == processedItems) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.currentBytes, currentBytes) ||
                other.currentBytes == currentBytes) &&
            (identical(other.currentVolume, currentVolume) ||
                other.currentVolume == currentVolume) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phase, processedItems,
      totalItems, currentBytes, currentVolume, isPaused);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanProgressImplCopyWith<_$ScanProgressImpl> get copyWith =>
      __$$ScanProgressImplCopyWithImpl<_$ScanProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanProgressImplToJson(
      this,
    );
  }
}

abstract class _ScanProgress implements ScanProgress {
  const factory _ScanProgress(
      {required final ScanPhase phase,
      required final int processedItems,
      required final int totalItems,
      required final int currentBytes,
      final String? currentVolume,
      final bool isPaused}) = _$ScanProgressImpl;

  factory _ScanProgress.fromJson(Map<String, dynamic> json) =
      _$ScanProgressImpl.fromJson;

  @override
  ScanPhase get phase;
  @override
  int get processedItems;
  @override
  int get totalItems;
  @override
  int get currentBytes;
  @override
  String? get currentVolume;
  @override
  bool get isPaused;
  @override
  @JsonKey(ignore: true)
  _$$ScanProgressImplCopyWith<_$ScanProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
