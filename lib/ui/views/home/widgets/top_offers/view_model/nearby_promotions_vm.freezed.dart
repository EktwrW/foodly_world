// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_promotions_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NearbyPromotionsVM {
  List<NearbyPromotionDM> get promotions => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyPromotionsVMCopyWith<NearbyPromotionsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyPromotionsVMCopyWith<$Res> {
  factory $NearbyPromotionsVMCopyWith(
          NearbyPromotionsVM value, $Res Function(NearbyPromotionsVM) then) =
      _$NearbyPromotionsVMCopyWithImpl<$Res, NearbyPromotionsVM>;
  @useResult
  $Res call(
      {List<NearbyPromotionDM> promotions,
      bool isLoading,
      bool isLoadingMore,
      bool hasMore,
      int currentPage,
      String? error});
}

/// @nodoc
class _$NearbyPromotionsVMCopyWithImpl<$Res, $Val extends NearbyPromotionsVM>
    implements $NearbyPromotionsVMCopyWith<$Res> {
  _$NearbyPromotionsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? currentPage = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyPromotionsVMImplCopyWith<$Res>
    implements $NearbyPromotionsVMCopyWith<$Res> {
  factory _$$NearbyPromotionsVMImplCopyWith(_$NearbyPromotionsVMImpl value,
          $Res Function(_$NearbyPromotionsVMImpl) then) =
      __$$NearbyPromotionsVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NearbyPromotionDM> promotions,
      bool isLoading,
      bool isLoadingMore,
      bool hasMore,
      int currentPage,
      String? error});
}

/// @nodoc
class __$$NearbyPromotionsVMImplCopyWithImpl<$Res>
    extends _$NearbyPromotionsVMCopyWithImpl<$Res, _$NearbyPromotionsVMImpl>
    implements _$$NearbyPromotionsVMImplCopyWith<$Res> {
  __$$NearbyPromotionsVMImplCopyWithImpl(_$NearbyPromotionsVMImpl _value,
      $Res Function(_$NearbyPromotionsVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? currentPage = null,
    Object? error = freezed,
  }) {
    return _then(_$NearbyPromotionsVMImpl(
      promotions: null == promotions
          ? _value._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NearbyPromotionsVMImpl implements _NearbyPromotionsVM {
  const _$NearbyPromotionsVMImpl(
      {final List<NearbyPromotionDM> promotions = const [],
      this.isLoading = false,
      this.isLoadingMore = false,
      this.hasMore = false,
      this.currentPage = 1,
      this.error})
      : _promotions = promotions;

  final List<NearbyPromotionDM> _promotions;
  @override
  @JsonKey()
  List<NearbyPromotionDM> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final String? error;

  @override
  String toString() {
    return 'NearbyPromotionsVM(promotions: $promotions, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyPromotionsVMImpl &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_promotions),
      isLoading,
      isLoadingMore,
      hasMore,
      currentPage,
      error);

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyPromotionsVMImplCopyWith<_$NearbyPromotionsVMImpl> get copyWith =>
      __$$NearbyPromotionsVMImplCopyWithImpl<_$NearbyPromotionsVMImpl>(
          this, _$identity);
}

abstract class _NearbyPromotionsVM implements NearbyPromotionsVM {
  const factory _NearbyPromotionsVM(
      {final List<NearbyPromotionDM> promotions,
      final bool isLoading,
      final bool isLoadingMore,
      final bool hasMore,
      final int currentPage,
      final String? error}) = _$NearbyPromotionsVMImpl;

  @override
  List<NearbyPromotionDM> get promotions;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get hasMore;
  @override
  int get currentPage;
  @override
  String? get error;

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyPromotionsVMImplCopyWith<_$NearbyPromotionsVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
