// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_promotions_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyPromotionsVM {
  List<NearbyPromotionDM> get promotions;
  bool get isLoading;
  bool get isLoadingMore;
  bool get hasMore;
  int get currentPage;
  String? get error;

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyPromotionsVMCopyWith<NearbyPromotionsVM> get copyWith =>
      _$NearbyPromotionsVMCopyWithImpl<NearbyPromotionsVM>(
          this as NearbyPromotionsVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyPromotionsVM &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
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
      const DeepCollectionEquality().hash(promotions),
      isLoading,
      isLoadingMore,
      hasMore,
      currentPage,
      error);

  @override
  String toString() {
    return 'NearbyPromotionsVM(promotions: $promotions, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, error: $error)';
  }
}

/// @nodoc
abstract mixin class $NearbyPromotionsVMCopyWith<$Res> {
  factory $NearbyPromotionsVMCopyWith(
          NearbyPromotionsVM value, $Res Function(NearbyPromotionsVM) _then) =
      _$NearbyPromotionsVMCopyWithImpl;
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
class _$NearbyPromotionsVMCopyWithImpl<$Res>
    implements $NearbyPromotionsVMCopyWith<$Res> {
  _$NearbyPromotionsVMCopyWithImpl(this._self, this._then);

  final NearbyPromotionsVM _self;
  final $Res Function(NearbyPromotionsVM) _then;

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
    return _then(_self.copyWith(
      promotions: null == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NearbyPromotionsVM].
extension NearbyPromotionsVMPatterns on NearbyPromotionsVM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NearbyPromotionsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NearbyPromotionsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NearbyPromotionsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NearbyPromotionDM> promotions, bool isLoading,
            bool isLoadingMore, bool hasMore, int currentPage, String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM() when $default != null:
        return $default(_that.promotions, _that.isLoading, _that.isLoadingMore,
            _that.hasMore, _that.currentPage, _that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NearbyPromotionDM> promotions, bool isLoading,
            bool isLoadingMore, bool hasMore, int currentPage, String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM():
        return $default(_that.promotions, _that.isLoading, _that.isLoadingMore,
            _that.hasMore, _that.currentPage, _that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NearbyPromotionDM> promotions, bool isLoading,
            bool isLoadingMore, bool hasMore, int currentPage, String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyPromotionsVM() when $default != null:
        return $default(_that.promotions, _that.isLoading, _that.isLoadingMore,
            _that.hasMore, _that.currentPage, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NearbyPromotionsVM implements NearbyPromotionsVM {
  const _NearbyPromotionsVM(
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

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyPromotionsVMCopyWith<_NearbyPromotionsVM> get copyWith =>
      __$NearbyPromotionsVMCopyWithImpl<_NearbyPromotionsVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyPromotionsVM &&
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

  @override
  String toString() {
    return 'NearbyPromotionsVM(promotions: $promotions, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$NearbyPromotionsVMCopyWith<$Res>
    implements $NearbyPromotionsVMCopyWith<$Res> {
  factory _$NearbyPromotionsVMCopyWith(
          _NearbyPromotionsVM value, $Res Function(_NearbyPromotionsVM) _then) =
      __$NearbyPromotionsVMCopyWithImpl;
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
class __$NearbyPromotionsVMCopyWithImpl<$Res>
    implements _$NearbyPromotionsVMCopyWith<$Res> {
  __$NearbyPromotionsVMCopyWithImpl(this._self, this._then);

  final _NearbyPromotionsVM _self;
  final $Res Function(_NearbyPromotionsVM) _then;

  /// Create a copy of NearbyPromotionsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promotions = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? currentPage = null,
    Object? error = freezed,
  }) {
    return _then(_NearbyPromotionsVM(
      promotions: null == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<NearbyPromotionDM>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
