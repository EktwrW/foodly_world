// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_reservations_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyReservationsVM {
  List<ReservationDM> get reservations;
  ReservationsMetaDM? get meta;
  ReservationStatus? get statusFilter;
  BookingType? get bookingTypeFilter;
  bool get isLoadingMore;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyReservationsVMCopyWith<MyReservationsVM> get copyWith =>
      _$MyReservationsVMCopyWithImpl<MyReservationsVM>(
          this as MyReservationsVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyReservationsVM &&
            const DeepCollectionEquality()
                .equals(other.reservations, reservations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.bookingTypeFilter, bookingTypeFilter) ||
                other.bookingTypeFilter == bookingTypeFilter) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reservations),
      meta,
      statusFilter,
      bookingTypeFilter,
      isLoadingMore);

  @override
  String toString() {
    return 'MyReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, bookingTypeFilter: $bookingTypeFilter, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class $MyReservationsVMCopyWith<$Res> {
  factory $MyReservationsVMCopyWith(
          MyReservationsVM value, $Res Function(MyReservationsVM) _then) =
      _$MyReservationsVMCopyWithImpl;
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      BookingType? bookingTypeFilter,
      bool isLoadingMore});

  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$MyReservationsVMCopyWithImpl<$Res>
    implements $MyReservationsVMCopyWith<$Res> {
  _$MyReservationsVMCopyWithImpl(this._self, this._then);

  final MyReservationsVM _self;
  final $Res Function(MyReservationsVM) _then;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? bookingTypeFilter = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(_self.copyWith(
      reservations: null == reservations
          ? _self.reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
      statusFilter: freezed == statusFilter
          ? _self.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as ReservationStatus?,
      bookingTypeFilter: freezed == bookingTypeFilter
          ? _self.bookingTypeFilter
          : bookingTypeFilter // ignore: cast_nullable_to_non_nullable
              as BookingType?,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReservationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MyReservationsVM].
extension MyReservationsVMPatterns on MyReservationsVM {
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
    TResult Function(_MyReservationsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM() when $default != null:
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
    TResult Function(_MyReservationsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM():
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
    TResult? Function(_MyReservationsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM() when $default != null:
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
    TResult Function(
            List<ReservationDM> reservations,
            ReservationsMetaDM? meta,
            ReservationStatus? statusFilter,
            BookingType? bookingTypeFilter,
            bool isLoadingMore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM() when $default != null:
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore);
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
    TResult Function(
            List<ReservationDM> reservations,
            ReservationsMetaDM? meta,
            ReservationStatus? statusFilter,
            BookingType? bookingTypeFilter,
            bool isLoadingMore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM():
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore);
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
    TResult? Function(
            List<ReservationDM> reservations,
            ReservationsMetaDM? meta,
            ReservationStatus? statusFilter,
            BookingType? bookingTypeFilter,
            bool isLoadingMore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyReservationsVM() when $default != null:
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MyReservationsVM implements MyReservationsVM {
  const _MyReservationsVM(
      {final List<ReservationDM> reservations = const [],
      this.meta,
      this.statusFilter,
      this.bookingTypeFilter,
      this.isLoadingMore = false})
      : _reservations = reservations;

  final List<ReservationDM> _reservations;
  @override
  @JsonKey()
  List<ReservationDM> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

  @override
  final ReservationsMetaDM? meta;
  @override
  final ReservationStatus? statusFilter;
  @override
  final BookingType? bookingTypeFilter;
  @override
  @JsonKey()
  final bool isLoadingMore;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyReservationsVMCopyWith<_MyReservationsVM> get copyWith =>
      __$MyReservationsVMCopyWithImpl<_MyReservationsVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyReservationsVM &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.bookingTypeFilter, bookingTypeFilter) ||
                other.bookingTypeFilter == bookingTypeFilter) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservations),
      meta,
      statusFilter,
      bookingTypeFilter,
      isLoadingMore);

  @override
  String toString() {
    return 'MyReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, bookingTypeFilter: $bookingTypeFilter, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class _$MyReservationsVMCopyWith<$Res>
    implements $MyReservationsVMCopyWith<$Res> {
  factory _$MyReservationsVMCopyWith(
          _MyReservationsVM value, $Res Function(_MyReservationsVM) _then) =
      __$MyReservationsVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      BookingType? bookingTypeFilter,
      bool isLoadingMore});

  @override
  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$MyReservationsVMCopyWithImpl<$Res>
    implements _$MyReservationsVMCopyWith<$Res> {
  __$MyReservationsVMCopyWithImpl(this._self, this._then);

  final _MyReservationsVM _self;
  final $Res Function(_MyReservationsVM) _then;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? bookingTypeFilter = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(_MyReservationsVM(
      reservations: null == reservations
          ? _self._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
      statusFilter: freezed == statusFilter
          ? _self.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as ReservationStatus?,
      bookingTypeFilter: freezed == bookingTypeFilter
          ? _self.bookingTypeFilter
          : bookingTypeFilter // ignore: cast_nullable_to_non_nullable
              as BookingType?,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<$Res>? get meta {
    if (_self.meta == null) {
      return null;
    }

    return $ReservationsMetaDMCopyWith<$Res>(_self.meta!, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

// dart format on
