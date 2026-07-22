// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_reservations_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageReservationsVM {
  List<ReservationDM> get reservations;
  ReservationsMetaDM? get meta;
  ReservationStatus? get statusFilter;
  BookingType? get bookingTypeFilter;
  bool get isLoadingMore;
  String? get businessUuid;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManageReservationsVMCopyWith<ManageReservationsVM> get copyWith =>
      _$ManageReservationsVMCopyWithImpl<ManageReservationsVM>(
          this as ManageReservationsVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManageReservationsVM &&
            const DeepCollectionEquality()
                .equals(other.reservations, reservations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.bookingTypeFilter, bookingTypeFilter) ||
                other.bookingTypeFilter == bookingTypeFilter) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reservations),
      meta,
      statusFilter,
      bookingTypeFilter,
      isLoadingMore,
      businessUuid);

  @override
  String toString() {
    return 'ManageReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, bookingTypeFilter: $bookingTypeFilter, isLoadingMore: $isLoadingMore, businessUuid: $businessUuid)';
  }
}

/// @nodoc
abstract mixin class $ManageReservationsVMCopyWith<$Res> {
  factory $ManageReservationsVMCopyWith(ManageReservationsVM value,
          $Res Function(ManageReservationsVM) _then) =
      _$ManageReservationsVMCopyWithImpl;
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      BookingType? bookingTypeFilter,
      bool isLoadingMore,
      String? businessUuid});

  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ManageReservationsVMCopyWithImpl<$Res>
    implements $ManageReservationsVMCopyWith<$Res> {
  _$ManageReservationsVMCopyWithImpl(this._self, this._then);

  final ManageReservationsVM _self;
  final $Res Function(ManageReservationsVM) _then;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? bookingTypeFilter = freezed,
    Object? isLoadingMore = null,
    Object? businessUuid = freezed,
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
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ManageReservationsVM
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

/// Adds pattern-matching-related methods to [ManageReservationsVM].
extension ManageReservationsVMPatterns on ManageReservationsVM {
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
    TResult Function(_ManageReservationsVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM() when $default != null:
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
    TResult Function(_ManageReservationsVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM():
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
    TResult? Function(_ManageReservationsVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM() when $default != null:
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
            bool isLoadingMore,
            String? businessUuid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM() when $default != null:
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore, _that.businessUuid);
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
            bool isLoadingMore,
            String? businessUuid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM():
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore, _that.businessUuid);
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
            bool isLoadingMore,
            String? businessUuid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageReservationsVM() when $default != null:
        return $default(_that.reservations, _that.meta, _that.statusFilter,
            _that.bookingTypeFilter, _that.isLoadingMore, _that.businessUuid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ManageReservationsVM implements ManageReservationsVM {
  const _ManageReservationsVM(
      {final List<ReservationDM> reservations = const [],
      this.meta,
      this.statusFilter,
      this.bookingTypeFilter,
      this.isLoadingMore = false,
      this.businessUuid})
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
  @override
  final String? businessUuid;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManageReservationsVMCopyWith<_ManageReservationsVM> get copyWith =>
      __$ManageReservationsVMCopyWithImpl<_ManageReservationsVM>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManageReservationsVM &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.bookingTypeFilter, bookingTypeFilter) ||
                other.bookingTypeFilter == bookingTypeFilter) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservations),
      meta,
      statusFilter,
      bookingTypeFilter,
      isLoadingMore,
      businessUuid);

  @override
  String toString() {
    return 'ManageReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, bookingTypeFilter: $bookingTypeFilter, isLoadingMore: $isLoadingMore, businessUuid: $businessUuid)';
  }
}

/// @nodoc
abstract mixin class _$ManageReservationsVMCopyWith<$Res>
    implements $ManageReservationsVMCopyWith<$Res> {
  factory _$ManageReservationsVMCopyWith(_ManageReservationsVM value,
          $Res Function(_ManageReservationsVM) _then) =
      __$ManageReservationsVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      BookingType? bookingTypeFilter,
      bool isLoadingMore,
      String? businessUuid});

  @override
  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$ManageReservationsVMCopyWithImpl<$Res>
    implements _$ManageReservationsVMCopyWith<$Res> {
  __$ManageReservationsVMCopyWithImpl(this._self, this._then);

  final _ManageReservationsVM _self;
  final $Res Function(_ManageReservationsVM) _then;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? bookingTypeFilter = freezed,
    Object? isLoadingMore = null,
    Object? businessUuid = freezed,
  }) {
    return _then(_ManageReservationsVM(
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
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ManageReservationsVM
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
