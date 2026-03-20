// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_reservations_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyReservationsVM {
  List<ReservationDM> get reservations => throw _privateConstructorUsedError;
  ReservationsMetaDM? get meta => throw _privateConstructorUsedError;
  ReservationStatus? get statusFilter => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyReservationsVMCopyWith<MyReservationsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReservationsVMCopyWith<$Res> {
  factory $MyReservationsVMCopyWith(
          MyReservationsVM value, $Res Function(MyReservationsVM) then) =
      _$MyReservationsVMCopyWithImpl<$Res, MyReservationsVM>;
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      bool isLoadingMore});

  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$MyReservationsVMCopyWithImpl<$Res, $Val extends MyReservationsVM>
    implements $MyReservationsVMCopyWith<$Res> {
  _$MyReservationsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? isLoadingMore = null,
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
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MyReservationsVM
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
abstract class _$$MyReservationsVMImplCopyWith<$Res>
    implements $MyReservationsVMCopyWith<$Res> {
  factory _$$MyReservationsVMImplCopyWith(_$MyReservationsVMImpl value,
          $Res Function(_$MyReservationsVMImpl) then) =
      __$$MyReservationsVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReservationDM> reservations,
      ReservationsMetaDM? meta,
      ReservationStatus? statusFilter,
      bool isLoadingMore});

  @override
  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$MyReservationsVMImplCopyWithImpl<$Res>
    extends _$MyReservationsVMCopyWithImpl<$Res, _$MyReservationsVMImpl>
    implements _$$MyReservationsVMImplCopyWith<$Res> {
  __$$MyReservationsVMImplCopyWithImpl(_$MyReservationsVMImpl _value,
      $Res Function(_$MyReservationsVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
    Object? statusFilter = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(_$MyReservationsVMImpl(
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
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MyReservationsVMImpl implements _MyReservationsVM {
  const _$MyReservationsVMImpl(
      {final List<ReservationDM> reservations = const [],
      this.meta,
      this.statusFilter,
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
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'MyReservationsVM(reservations: $reservations, meta: $meta, statusFilter: $statusFilter, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReservationsVMImpl &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.statusFilter, statusFilter) ||
                other.statusFilter == statusFilter) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservations),
      meta,
      statusFilter,
      isLoadingMore);

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReservationsVMImplCopyWith<_$MyReservationsVMImpl> get copyWith =>
      __$$MyReservationsVMImplCopyWithImpl<_$MyReservationsVMImpl>(
          this, _$identity);
}

abstract class _MyReservationsVM implements MyReservationsVM {
  const factory _MyReservationsVM(
      {final List<ReservationDM> reservations,
      final ReservationsMetaDM? meta,
      final ReservationStatus? statusFilter,
      final bool isLoadingMore}) = _$MyReservationsVMImpl;

  @override
  List<ReservationDM> get reservations;
  @override
  ReservationsMetaDM? get meta;
  @override
  ReservationStatus? get statusFilter;
  @override
  bool get isLoadingMore;

  /// Create a copy of MyReservationsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyReservationsVMImplCopyWith<_$MyReservationsVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
