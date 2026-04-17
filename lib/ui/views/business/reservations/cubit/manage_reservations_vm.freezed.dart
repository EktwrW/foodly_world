// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_reservations_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageReservationsVM {
  List<ReservationDM> get reservations => throw _privateConstructorUsedError;
  ReservationsMetaDM? get meta => throw _privateConstructorUsedError;
  ReservationStatus? get statusFilter => throw _privateConstructorUsedError;
  BookingType? get bookingTypeFilter => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get businessUuid => throw _privateConstructorUsedError;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageReservationsVMCopyWith<ManageReservationsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageReservationsVMCopyWith<$Res> {
  factory $ManageReservationsVMCopyWith(ManageReservationsVM value,
          $Res Function(ManageReservationsVM) then) =
      _$ManageReservationsVMCopyWithImpl<$Res, ManageReservationsVM>;
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
class _$ManageReservationsVMCopyWithImpl<$Res,
        $Val extends ManageReservationsVM>
    implements $ManageReservationsVMCopyWith<$Res> {
  _$ManageReservationsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      reservations: null == reservations
          ? _value.reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
      statusFilter: freezed == statusFilter
          ? _value.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as ReservationStatus?,
      bookingTypeFilter: freezed == bookingTypeFilter
          ? _value.bookingTypeFilter
          : bookingTypeFilter // ignore: cast_nullable_to_non_nullable
              as BookingType?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationsMetaDMCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ReservationsMetaDMCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManageReservationsVMImplCopyWith<$Res>
    implements $ManageReservationsVMCopyWith<$Res> {
  factory _$$ManageReservationsVMImplCopyWith(_$ManageReservationsVMImpl value,
          $Res Function(_$ManageReservationsVMImpl) then) =
      __$$ManageReservationsVMImplCopyWithImpl<$Res>;
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
class __$$ManageReservationsVMImplCopyWithImpl<$Res>
    extends _$ManageReservationsVMCopyWithImpl<$Res, _$ManageReservationsVMImpl>
    implements _$$ManageReservationsVMImplCopyWith<$Res> {
  __$$ManageReservationsVMImplCopyWithImpl(_$ManageReservationsVMImpl _value,
      $Res Function(_$ManageReservationsVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ManageReservationsVMImpl(
      reservations: null == reservations
          ? _value._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
      statusFilter: freezed == statusFilter
          ? _value.statusFilter
          : statusFilter // ignore: cast_nullable_to_non_nullable
              as ReservationStatus?,
      bookingTypeFilter: freezed == bookingTypeFilter
          ? _value.bookingTypeFilter
          : bookingTypeFilter // ignore: cast_nullable_to_non_nullable
              as BookingType?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ManageReservationsVMImpl implements _ManageReservationsVM {
  const _$ManageReservationsVMImpl(
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

  @override
  String toString() {
    return 'ManageReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, bookingTypeFilter: $bookingTypeFilter, isLoadingMore: $isLoadingMore, businessUuid: $businessUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageReservationsVMImpl &&
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

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageReservationsVMImplCopyWith<_$ManageReservationsVMImpl>
      get copyWith =>
          __$$ManageReservationsVMImplCopyWithImpl<_$ManageReservationsVMImpl>(
              this, _$identity);
}

abstract class _ManageReservationsVM implements ManageReservationsVM {
  const factory _ManageReservationsVM(
      {final List<ReservationDM> reservations,
      final ReservationsMetaDM? meta,
      final ReservationStatus? statusFilter,
      final BookingType? bookingTypeFilter,
      final bool isLoadingMore,
      final String? businessUuid}) = _$ManageReservationsVMImpl;

  @override
  List<ReservationDM> get reservations;
  @override
  ReservationsMetaDM? get meta;
  @override
  ReservationStatus? get statusFilter;
  @override
  BookingType? get bookingTypeFilter;
  @override
  bool get isLoadingMore;
  @override
  String? get businessUuid;

  /// Create a copy of ManageReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageReservationsVMImplCopyWith<_$ManageReservationsVMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
