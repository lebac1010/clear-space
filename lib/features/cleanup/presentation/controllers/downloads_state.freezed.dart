// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadsState {
  List<DownloadItem> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int get totalSize => throw _privateConstructorUsedError;
  int get selectedCount => throw _privateConstructorUsedError;
  int get selectedSize => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadsStateCopyWith<DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateCopyWith<$Res> {
  factory $DownloadsStateCopyWith(
          DownloadsState value, $Res Function(DownloadsState) then) =
      _$DownloadsStateCopyWithImpl<$Res, DownloadsState>;
  @useResult
  $Res call(
      {List<DownloadItem> items,
      bool isLoading,
      String? errorMessage,
      int totalSize,
      int selectedCount,
      int selectedSize,
      bool isDeleting});
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res, $Val extends DownloadsState>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? totalSize = null,
    Object? selectedCount = null,
    Object? selectedSize = null,
    Object? isDeleting = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSize: null == selectedSize
          ? _value.selectedSize
          : selectedSize // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadsStateImplCopyWith<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  factory _$$DownloadsStateImplCopyWith(_$DownloadsStateImpl value,
          $Res Function(_$DownloadsStateImpl) then) =
      __$$DownloadsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DownloadItem> items,
      bool isLoading,
      String? errorMessage,
      int totalSize,
      int selectedCount,
      int selectedSize,
      bool isDeleting});
}

/// @nodoc
class __$$DownloadsStateImplCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$DownloadsStateImpl>
    implements _$$DownloadsStateImplCopyWith<$Res> {
  __$$DownloadsStateImplCopyWithImpl(
      _$DownloadsStateImpl _value, $Res Function(_$DownloadsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? totalSize = null,
    Object? selectedCount = null,
    Object? selectedSize = null,
    Object? isDeleting = null,
  }) {
    return _then(_$DownloadsStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DownloadItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSize: null == selectedSize
          ? _value.selectedSize
          : selectedSize // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DownloadsStateImpl implements _DownloadsState {
  const _$DownloadsStateImpl(
      {final List<DownloadItem> items = const [],
      this.isLoading = false,
      this.errorMessage,
      this.totalSize = 0,
      this.selectedCount = 0,
      this.selectedSize = 0,
      this.isDeleting = false})
      : _items = items;

  final List<DownloadItem> _items;
  @override
  @JsonKey()
  List<DownloadItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final int totalSize;
  @override
  @JsonKey()
  final int selectedCount;
  @override
  @JsonKey()
  final int selectedSize;
  @override
  @JsonKey()
  final bool isDeleting;

  @override
  String toString() {
    return 'DownloadsState(items: $items, isLoading: $isLoading, errorMessage: $errorMessage, totalSize: $totalSize, selectedCount: $selectedCount, selectedSize: $selectedSize, isDeleting: $isDeleting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadsStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.selectedCount, selectedCount) ||
                other.selectedCount == selectedCount) &&
            (identical(other.selectedSize, selectedSize) ||
                other.selectedSize == selectedSize) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      isLoading,
      errorMessage,
      totalSize,
      selectedCount,
      selectedSize,
      isDeleting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadsStateImplCopyWith<_$DownloadsStateImpl> get copyWith =>
      __$$DownloadsStateImplCopyWithImpl<_$DownloadsStateImpl>(
          this, _$identity);
}

abstract class _DownloadsState implements DownloadsState {
  const factory _DownloadsState(
      {final List<DownloadItem> items,
      final bool isLoading,
      final String? errorMessage,
      final int totalSize,
      final int selectedCount,
      final int selectedSize,
      final bool isDeleting}) = _$DownloadsStateImpl;

  @override
  List<DownloadItem> get items;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  int get totalSize;
  @override
  int get selectedCount;
  @override
  int get selectedSize;
  @override
  bool get isDeleting;
  @override
  @JsonKey(ignore: true)
  _$$DownloadsStateImplCopyWith<_$DownloadsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
