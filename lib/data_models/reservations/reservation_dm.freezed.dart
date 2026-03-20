// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReservationsResponseDM _$ReservationsResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationsResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationsResponseDM {
  List<ReservationDM> get reservations => throw _privateConstructorUsedError;
  ReservationsMetaDM? get meta => throw _privateConstructorUsedError;

  /// Serializes this ReservationsResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationsResponseDMCopyWith<ReservationsResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationsResponseDMCopyWith<$Res> {
  factory $ReservationsResponseDMCopyWith(ReservationsResponseDM value,
          $Res Function(ReservationsResponseDM) then) =
      _$ReservationsResponseDMCopyWithImpl<$Res, ReservationsResponseDM>;
  @useResult
  $Res call({List<ReservationDM> reservations, ReservationsMetaDM? meta});

  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ReservationsResponseDMCopyWithImpl<$Res,
        $Val extends ReservationsResponseDM>
    implements $ReservationsResponseDMCopyWith<$Res> {
  _$ReservationsResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
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
    ) as $Val);
  }

  /// Create a copy of ReservationsResponseDM
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
abstract class _$$ReservationsResponseDMImplCopyWith<$Res>
    implements $ReservationsResponseDMCopyWith<$Res> {
  factory _$$ReservationsResponseDMImplCopyWith(
          _$ReservationsResponseDMImpl value,
          $Res Function(_$ReservationsResponseDMImpl) then) =
      __$$ReservationsResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReservationDM> reservations, ReservationsMetaDM? meta});

  @override
  $ReservationsMetaDMCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ReservationsResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationsResponseDMCopyWithImpl<$Res,
        _$ReservationsResponseDMImpl>
    implements _$$ReservationsResponseDMImplCopyWith<$Res> {
  __$$ReservationsResponseDMImplCopyWithImpl(
      _$ReservationsResponseDMImpl _value,
      $Res Function(_$ReservationsResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
    Object? meta = freezed,
  }) {
    return _then(_$ReservationsResponseDMImpl(
      reservations: null == reservations
          ? _value._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationDM>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ReservationsMetaDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationsResponseDMImpl implements _ReservationsResponseDM {
  const _$ReservationsResponseDMImpl(
      {final List<ReservationDM> reservations = const [], this.meta})
      : _reservations = reservations;

  factory _$ReservationsResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationsResponseDMImplFromJson(json);

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
  String toString() {
    return 'ReservationsResponseDM(reservations: $reservations, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationsResponseDMImpl &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reservations), meta);

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationsResponseDMImplCopyWith<_$ReservationsResponseDMImpl>
      get copyWith => __$$ReservationsResponseDMImplCopyWithImpl<
          _$ReservationsResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationsResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationsResponseDM implements ReservationsResponseDM {
  const factory _ReservationsResponseDM(
      {final List<ReservationDM> reservations,
      final ReservationsMetaDM? meta}) = _$ReservationsResponseDMImpl;

  factory _ReservationsResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReservationsResponseDMImpl.fromJson;

  @override
  List<ReservationDM> get reservations;
  @override
  ReservationsMetaDM? get meta;

  /// Create a copy of ReservationsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationsResponseDMImplCopyWith<_$ReservationsResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationsMetaDM _$ReservationsMetaDMFromJson(Map<String, dynamic> json) {
  return _ReservationsMetaDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationsMetaDM {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this ReservationsMetaDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationsMetaDMCopyWith<ReservationsMetaDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationsMetaDMCopyWith<$Res> {
  factory $ReservationsMetaDMCopyWith(
          ReservationsMetaDM value, $Res Function(ReservationsMetaDM) then) =
      _$ReservationsMetaDMCopyWithImpl<$Res, ReservationsMetaDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class _$ReservationsMetaDMCopyWithImpl<$Res, $Val extends ReservationsMetaDM>
    implements $ReservationsMetaDMCopyWith<$Res> {
  _$ReservationsMetaDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationsMetaDMImplCopyWith<$Res>
    implements $ReservationsMetaDMCopyWith<$Res> {
  factory _$$ReservationsMetaDMImplCopyWith(_$ReservationsMetaDMImpl value,
          $Res Function(_$ReservationsMetaDMImpl) then) =
      __$$ReservationsMetaDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total});
}

/// @nodoc
class __$$ReservationsMetaDMImplCopyWithImpl<$Res>
    extends _$ReservationsMetaDMCopyWithImpl<$Res, _$ReservationsMetaDMImpl>
    implements _$$ReservationsMetaDMImplCopyWith<$Res> {
  __$$ReservationsMetaDMImplCopyWithImpl(_$ReservationsMetaDMImpl _value,
      $Res Function(_$ReservationsMetaDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(_$ReservationsMetaDMImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationsMetaDMImpl implements _ReservationsMetaDM {
  const _$ReservationsMetaDMImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'last_page') this.lastPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 20,
      this.total = 0});

  factory _$ReservationsMetaDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationsMetaDMImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'ReservationsMetaDM(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationsMetaDMImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total);

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationsMetaDMImplCopyWith<_$ReservationsMetaDMImpl> get copyWith =>
      __$$ReservationsMetaDMImplCopyWithImpl<_$ReservationsMetaDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationsMetaDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationsMetaDM implements ReservationsMetaDM {
  const factory _ReservationsMetaDM(
      {@JsonKey(name: 'current_page') final int currentPage,
      @JsonKey(name: 'last_page') final int lastPage,
      @JsonKey(name: 'per_page') final int perPage,
      final int total}) = _$ReservationsMetaDMImpl;

  factory _ReservationsMetaDM.fromJson(Map<String, dynamic> json) =
      _$ReservationsMetaDMImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;

  /// Create a copy of ReservationsMetaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationsMetaDMImplCopyWith<_$ReservationsMetaDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReservationCreateResponseDM _$ReservationCreateResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationCreateResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationCreateResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReservationDM? get reservation => throw _privateConstructorUsedError;

  /// Serializes this ReservationCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationCreateResponseDMCopyWith<ReservationCreateResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCreateResponseDMCopyWith<$Res> {
  factory $ReservationCreateResponseDMCopyWith(
          ReservationCreateResponseDM value,
          $Res Function(ReservationCreateResponseDM) then) =
      _$ReservationCreateResponseDMCopyWithImpl<$Res,
          ReservationCreateResponseDM>;
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationCreateResponseDMCopyWithImpl<$Res,
        $Val extends ReservationCreateResponseDM>
    implements $ReservationCreateResponseDMCopyWith<$Res> {
  _$ReservationCreateResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ) as $Val);
  }

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_value.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_value.reservation!, (value) {
      return _then(_value.copyWith(reservation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReservationCreateResponseDMImplCopyWith<$Res>
    implements $ReservationCreateResponseDMCopyWith<$Res> {
  factory _$$ReservationCreateResponseDMImplCopyWith(
          _$ReservationCreateResponseDMImpl value,
          $Res Function(_$ReservationCreateResponseDMImpl) then) =
      __$$ReservationCreateResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$$ReservationCreateResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationCreateResponseDMCopyWithImpl<$Res,
        _$ReservationCreateResponseDMImpl>
    implements _$$ReservationCreateResponseDMImplCopyWith<$Res> {
  __$$ReservationCreateResponseDMImplCopyWithImpl(
      _$ReservationCreateResponseDMImpl _value,
      $Res Function(_$ReservationCreateResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_$ReservationCreateResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationCreateResponseDMImpl
    implements _ReservationCreateResponseDM {
  const _$ReservationCreateResponseDMImpl(
      {this.success = false, this.message = '', this.reservation});

  factory _$ReservationCreateResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReservationCreateResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationDM? reservation;

  @override
  String toString() {
    return 'ReservationCreateResponseDM(success: $success, message: $message, reservation: $reservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationCreateResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationCreateResponseDMImplCopyWith<_$ReservationCreateResponseDMImpl>
      get copyWith => __$$ReservationCreateResponseDMImplCopyWithImpl<
          _$ReservationCreateResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationCreateResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationCreateResponseDM
    implements ReservationCreateResponseDM {
  const factory _ReservationCreateResponseDM(
      {final bool success,
      final String message,
      final ReservationDM? reservation}) = _$ReservationCreateResponseDMImpl;

  factory _ReservationCreateResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReservationCreateResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ReservationDM? get reservation;

  /// Create a copy of ReservationCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationCreateResponseDMImplCopyWith<_$ReservationCreateResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationActionResponseDM _$ReservationActionResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationActionResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationActionResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReservationDM? get reservation => throw _privateConstructorUsedError;

  /// Serializes this ReservationActionResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationActionResponseDMCopyWith<ReservationActionResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationActionResponseDMCopyWith<$Res> {
  factory $ReservationActionResponseDMCopyWith(
          ReservationActionResponseDM value,
          $Res Function(ReservationActionResponseDM) then) =
      _$ReservationActionResponseDMCopyWithImpl<$Res,
          ReservationActionResponseDM>;
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationActionResponseDMCopyWithImpl<$Res,
        $Val extends ReservationActionResponseDM>
    implements $ReservationActionResponseDMCopyWith<$Res> {
  _$ReservationActionResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ) as $Val);
  }

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_value.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_value.reservation!, (value) {
      return _then(_value.copyWith(reservation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReservationActionResponseDMImplCopyWith<$Res>
    implements $ReservationActionResponseDMCopyWith<$Res> {
  factory _$$ReservationActionResponseDMImplCopyWith(
          _$ReservationActionResponseDMImpl value,
          $Res Function(_$ReservationActionResponseDMImpl) then) =
      __$$ReservationActionResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$$ReservationActionResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationActionResponseDMCopyWithImpl<$Res,
        _$ReservationActionResponseDMImpl>
    implements _$$ReservationActionResponseDMImplCopyWith<$Res> {
  __$$ReservationActionResponseDMImplCopyWithImpl(
      _$ReservationActionResponseDMImpl _value,
      $Res Function(_$ReservationActionResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? reservation = freezed,
  }) {
    return _then(_$ReservationActionResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationActionResponseDMImpl
    implements _ReservationActionResponseDM {
  const _$ReservationActionResponseDMImpl(
      {this.success = false, this.message = '', this.reservation});

  factory _$ReservationActionResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReservationActionResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationDM? reservation;

  @override
  String toString() {
    return 'ReservationActionResponseDM(success: $success, message: $message, reservation: $reservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationActionResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, reservation);

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationActionResponseDMImplCopyWith<_$ReservationActionResponseDMImpl>
      get copyWith => __$$ReservationActionResponseDMImplCopyWithImpl<
          _$ReservationActionResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationActionResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationActionResponseDM
    implements ReservationActionResponseDM {
  const factory _ReservationActionResponseDM(
      {final bool success,
      final String message,
      final ReservationDM? reservation}) = _$ReservationActionResponseDMImpl;

  factory _ReservationActionResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReservationActionResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ReservationDM? get reservation;

  /// Create a copy of ReservationActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationActionResponseDMImplCopyWith<_$ReservationActionResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationShowResponseDM _$ReservationShowResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationShowResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationShowResponseDM {
  ReservationDM? get reservation => throw _privateConstructorUsedError;

  /// Serializes this ReservationShowResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationShowResponseDMCopyWith<ReservationShowResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationShowResponseDMCopyWith<$Res> {
  factory $ReservationShowResponseDMCopyWith(ReservationShowResponseDM value,
          $Res Function(ReservationShowResponseDM) then) =
      _$ReservationShowResponseDMCopyWithImpl<$Res, ReservationShowResponseDM>;
  @useResult
  $Res call({ReservationDM? reservation});

  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class _$ReservationShowResponseDMCopyWithImpl<$Res,
        $Val extends ReservationShowResponseDM>
    implements $ReservationShowResponseDMCopyWith<$Res> {
  _$ReservationShowResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservation = freezed,
  }) {
    return _then(_value.copyWith(
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ) as $Val);
  }

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationDMCopyWith<$Res>? get reservation {
    if (_value.reservation == null) {
      return null;
    }

    return $ReservationDMCopyWith<$Res>(_value.reservation!, (value) {
      return _then(_value.copyWith(reservation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReservationShowResponseDMImplCopyWith<$Res>
    implements $ReservationShowResponseDMCopyWith<$Res> {
  factory _$$ReservationShowResponseDMImplCopyWith(
          _$ReservationShowResponseDMImpl value,
          $Res Function(_$ReservationShowResponseDMImpl) then) =
      __$$ReservationShowResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReservationDM? reservation});

  @override
  $ReservationDMCopyWith<$Res>? get reservation;
}

/// @nodoc
class __$$ReservationShowResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationShowResponseDMCopyWithImpl<$Res,
        _$ReservationShowResponseDMImpl>
    implements _$$ReservationShowResponseDMImplCopyWith<$Res> {
  __$$ReservationShowResponseDMImplCopyWithImpl(
      _$ReservationShowResponseDMImpl _value,
      $Res Function(_$ReservationShowResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservation = freezed,
  }) {
    return _then(_$ReservationShowResponseDMImpl(
      reservation: freezed == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as ReservationDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationShowResponseDMImpl implements _ReservationShowResponseDM {
  const _$ReservationShowResponseDMImpl({this.reservation});

  factory _$ReservationShowResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationShowResponseDMImplFromJson(json);

  @override
  final ReservationDM? reservation;

  @override
  String toString() {
    return 'ReservationShowResponseDM(reservation: $reservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationShowResponseDMImpl &&
            (identical(other.reservation, reservation) ||
                other.reservation == reservation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reservation);

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationShowResponseDMImplCopyWith<_$ReservationShowResponseDMImpl>
      get copyWith => __$$ReservationShowResponseDMImplCopyWithImpl<
          _$ReservationShowResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationShowResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationShowResponseDM implements ReservationShowResponseDM {
  const factory _ReservationShowResponseDM({final ReservationDM? reservation}) =
      _$ReservationShowResponseDMImpl;

  factory _ReservationShowResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReservationShowResponseDMImpl.fromJson;

  @override
  ReservationDM? get reservation;

  /// Create a copy of ReservationShowResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationShowResponseDMImplCopyWith<_$ReservationShowResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PendingReservationsCountDM _$PendingReservationsCountDMFromJson(
    Map<String, dynamic> json) {
  return _PendingReservationsCountDM.fromJson(json);
}

/// @nodoc
mixin _$PendingReservationsCountDM {
  @JsonKey(name: 'pending_count')
  int get pendingCount => throw _privateConstructorUsedError;

  /// Serializes this PendingReservationsCountDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingReservationsCountDMCopyWith<PendingReservationsCountDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingReservationsCountDMCopyWith<$Res> {
  factory $PendingReservationsCountDMCopyWith(PendingReservationsCountDM value,
          $Res Function(PendingReservationsCountDM) then) =
      _$PendingReservationsCountDMCopyWithImpl<$Res,
          PendingReservationsCountDM>;
  @useResult
  $Res call({@JsonKey(name: 'pending_count') int pendingCount});
}

/// @nodoc
class _$PendingReservationsCountDMCopyWithImpl<$Res,
        $Val extends PendingReservationsCountDM>
    implements $PendingReservationsCountDMCopyWith<$Res> {
  _$PendingReservationsCountDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingCount = null,
  }) {
    return _then(_value.copyWith(
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingReservationsCountDMImplCopyWith<$Res>
    implements $PendingReservationsCountDMCopyWith<$Res> {
  factory _$$PendingReservationsCountDMImplCopyWith(
          _$PendingReservationsCountDMImpl value,
          $Res Function(_$PendingReservationsCountDMImpl) then) =
      __$$PendingReservationsCountDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pending_count') int pendingCount});
}

/// @nodoc
class __$$PendingReservationsCountDMImplCopyWithImpl<$Res>
    extends _$PendingReservationsCountDMCopyWithImpl<$Res,
        _$PendingReservationsCountDMImpl>
    implements _$$PendingReservationsCountDMImplCopyWith<$Res> {
  __$$PendingReservationsCountDMImplCopyWithImpl(
      _$PendingReservationsCountDMImpl _value,
      $Res Function(_$PendingReservationsCountDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingCount = null,
  }) {
    return _then(_$PendingReservationsCountDMImpl(
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingReservationsCountDMImpl implements _PendingReservationsCountDM {
  const _$PendingReservationsCountDMImpl(
      {@JsonKey(name: 'pending_count') this.pendingCount = 0});

  factory _$PendingReservationsCountDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PendingReservationsCountDMImplFromJson(json);

  @override
  @JsonKey(name: 'pending_count')
  final int pendingCount;

  @override
  String toString() {
    return 'PendingReservationsCountDM(pendingCount: $pendingCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingReservationsCountDMImpl &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pendingCount);

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingReservationsCountDMImplCopyWith<_$PendingReservationsCountDMImpl>
      get copyWith => __$$PendingReservationsCountDMImplCopyWithImpl<
          _$PendingReservationsCountDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingReservationsCountDMImplToJson(
      this,
    );
  }
}

abstract class _PendingReservationsCountDM
    implements PendingReservationsCountDM {
  const factory _PendingReservationsCountDM(
          {@JsonKey(name: 'pending_count') final int pendingCount}) =
      _$PendingReservationsCountDMImpl;

  factory _PendingReservationsCountDM.fromJson(Map<String, dynamic> json) =
      _$PendingReservationsCountDMImpl.fromJson;

  @override
  @JsonKey(name: 'pending_count')
  int get pendingCount;

  /// Create a copy of PendingReservationsCountDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingReservationsCountDMImplCopyWith<_$PendingReservationsCountDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationDM _$ReservationDMFromJson(Map<String, dynamic> json) {
  return _ReservationDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationDM {
  @JsonKey(name: 'reservation_id')
  int? get reservationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid => throw _privateConstructorUsedError;
  ReservationStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_date')
  DateTime? get reservationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_time')
  String? get reservationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'party_size')
  int get partySize => throw _privateConstructorUsedError;
  @JsonKey(name: 'special_requests')
  String? get specialRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'manager_notes')
  String? get managerNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_by')
  String? get cancelledBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_at')
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejected_at')
  DateTime? get rejectedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name')
  String? get businessName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_photo')
  String? get businessPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_uuid')
  String? get userUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_photo')
  String? get userPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_email')
  String? get userEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_phone')
  String? get userPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReservationDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationDMCopyWith<ReservationDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationDMCopyWith<$Res> {
  factory $ReservationDMCopyWith(
          ReservationDM value, $Res Function(ReservationDM) then) =
      _$ReservationDMCopyWithImpl<$Res, ReservationDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      ReservationStatus status,
      @JsonKey(name: 'reservation_date') DateTime? reservationDate,
      @JsonKey(name: 'reservation_time') String? reservationTime,
      @JsonKey(name: 'party_size') int partySize,
      @JsonKey(name: 'special_requests') String? specialRequests,
      @JsonKey(name: 'manager_notes') String? managerNotes,
      @JsonKey(name: 'cancelled_by') String? cancelledBy,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'user_phone') String? userPhone,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ReservationDMCopyWithImpl<$Res, $Val extends ReservationDM>
    implements $ReservationDMCopyWith<$Res> {
  _$ReservationDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? reservationUuid = freezed,
    Object? status = null,
    Object? reservationDate = freezed,
    Object? reservationTime = freezed,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? managerNotes = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      reservationDate: freezed == reservationDate
          ? _value.reservationDate
          : reservationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      partySize: null == partySize
          ? _value.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _value.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      managerNotes: freezed == managerNotes
          ? _value.managerNotes
          : managerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationDMImplCopyWith<$Res>
    implements $ReservationDMCopyWith<$Res> {
  factory _$$ReservationDMImplCopyWith(
          _$ReservationDMImpl value, $Res Function(_$ReservationDMImpl) then) =
      __$$ReservationDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      ReservationStatus status,
      @JsonKey(name: 'reservation_date') DateTime? reservationDate,
      @JsonKey(name: 'reservation_time') String? reservationTime,
      @JsonKey(name: 'party_size') int partySize,
      @JsonKey(name: 'special_requests') String? specialRequests,
      @JsonKey(name: 'manager_notes') String? managerNotes,
      @JsonKey(name: 'cancelled_by') String? cancelledBy,
      @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'business_photo') String? businessPhoto,
      @JsonKey(name: 'user_uuid') String? userUuid,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_photo') String? userPhoto,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'user_phone') String? userPhone,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ReservationDMImplCopyWithImpl<$Res>
    extends _$ReservationDMCopyWithImpl<$Res, _$ReservationDMImpl>
    implements _$$ReservationDMImplCopyWith<$Res> {
  __$$ReservationDMImplCopyWithImpl(
      _$ReservationDMImpl _value, $Res Function(_$ReservationDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? reservationUuid = freezed,
    Object? status = null,
    Object? reservationDate = freezed,
    Object? reservationTime = freezed,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? managerNotes = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? businessUuid = freezed,
    Object? businessName = freezed,
    Object? businessPhoto = freezed,
    Object? userUuid = freezed,
    Object? userName = freezed,
    Object? userPhoto = freezed,
    Object? userEmail = freezed,
    Object? userPhone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReservationDMImpl(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      reservationDate: freezed == reservationDate
          ? _value.reservationDate
          : reservationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservationTime: freezed == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      partySize: null == partySize
          ? _value.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _value.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      managerNotes: freezed == managerNotes
          ? _value.managerNotes
          : managerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhoto: freezed == businessPhoto
          ? _value.businessPhoto
          : businessPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userUuid: freezed == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhoto: freezed == userPhoto
          ? _value.userPhoto
          : userPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationDMImpl extends _ReservationDM {
  const _$ReservationDMImpl(
      {@JsonKey(name: 'reservation_id') this.reservationId,
      @JsonKey(name: 'reservation_uuid') this.reservationUuid,
      this.status = ReservationStatus.pending,
      @JsonKey(name: 'reservation_date') this.reservationDate,
      @JsonKey(name: 'reservation_time') this.reservationTime,
      @JsonKey(name: 'party_size') this.partySize = 1,
      @JsonKey(name: 'special_requests') this.specialRequests,
      @JsonKey(name: 'manager_notes') this.managerNotes,
      @JsonKey(name: 'cancelled_by') this.cancelledBy,
      @JsonKey(name: 'cancelled_at') this.cancelledAt,
      @JsonKey(name: 'confirmed_at') this.confirmedAt,
      @JsonKey(name: 'rejected_at') this.rejectedAt,
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName,
      @JsonKey(name: 'business_photo') this.businessPhoto,
      @JsonKey(name: 'user_uuid') this.userUuid,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_photo') this.userPhoto,
      @JsonKey(name: 'user_email') this.userEmail,
      @JsonKey(name: 'user_phone') this.userPhone,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$ReservationDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationDMImplFromJson(json);

  @override
  @JsonKey(name: 'reservation_id')
  final int? reservationId;
  @override
  @JsonKey(name: 'reservation_uuid')
  final String? reservationUuid;
  @override
  @JsonKey()
  final ReservationStatus status;
  @override
  @JsonKey(name: 'reservation_date')
  final DateTime? reservationDate;
  @override
  @JsonKey(name: 'reservation_time')
  final String? reservationTime;
  @override
  @JsonKey(name: 'party_size')
  final int partySize;
  @override
  @JsonKey(name: 'special_requests')
  final String? specialRequests;
  @override
  @JsonKey(name: 'manager_notes')
  final String? managerNotes;
  @override
  @JsonKey(name: 'cancelled_by')
  final String? cancelledBy;
  @override
  @JsonKey(name: 'cancelled_at')
  final DateTime? cancelledAt;
  @override
  @JsonKey(name: 'confirmed_at')
  final DateTime? confirmedAt;
  @override
  @JsonKey(name: 'rejected_at')
  final DateTime? rejectedAt;
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  @JsonKey(name: 'business_photo')
  final String? businessPhoto;
  @override
  @JsonKey(name: 'user_uuid')
  final String? userUuid;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_photo')
  final String? userPhoto;
  @override
  @JsonKey(name: 'user_email')
  final String? userEmail;
  @override
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReservationDM(reservationId: $reservationId, reservationUuid: $reservationUuid, status: $status, reservationDate: $reservationDate, reservationTime: $reservationTime, partySize: $partySize, specialRequests: $specialRequests, managerNotes: $managerNotes, cancelledBy: $cancelledBy, cancelledAt: $cancelledAt, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, businessUuid: $businessUuid, businessName: $businessName, businessPhoto: $businessPhoto, userUuid: $userUuid, userName: $userName, userPhoto: $userPhoto, userEmail: $userEmail, userPhone: $userPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationDMImpl &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reservationDate, reservationDate) ||
                other.reservationDate == reservationDate) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize) &&
            (identical(other.specialRequests, specialRequests) ||
                other.specialRequests == specialRequests) &&
            (identical(other.managerNotes, managerNotes) ||
                other.managerNotes == managerNotes) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessPhoto, businessPhoto) ||
                other.businessPhoto == businessPhoto) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhoto, userPhoto) ||
                other.userPhoto == userPhoto) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reservationId,
        reservationUuid,
        status,
        reservationDate,
        reservationTime,
        partySize,
        specialRequests,
        managerNotes,
        cancelledBy,
        cancelledAt,
        confirmedAt,
        rejectedAt,
        businessUuid,
        businessName,
        businessPhoto,
        userUuid,
        userName,
        userPhoto,
        userEmail,
        userPhone,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationDMImplCopyWith<_$ReservationDMImpl> get copyWith =>
      __$$ReservationDMImplCopyWithImpl<_$ReservationDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationDM extends ReservationDM {
  const factory _ReservationDM(
          {@JsonKey(name: 'reservation_id') final int? reservationId,
          @JsonKey(name: 'reservation_uuid') final String? reservationUuid,
          final ReservationStatus status,
          @JsonKey(name: 'reservation_date') final DateTime? reservationDate,
          @JsonKey(name: 'reservation_time') final String? reservationTime,
          @JsonKey(name: 'party_size') final int partySize,
          @JsonKey(name: 'special_requests') final String? specialRequests,
          @JsonKey(name: 'manager_notes') final String? managerNotes,
          @JsonKey(name: 'cancelled_by') final String? cancelledBy,
          @JsonKey(name: 'cancelled_at') final DateTime? cancelledAt,
          @JsonKey(name: 'confirmed_at') final DateTime? confirmedAt,
          @JsonKey(name: 'rejected_at') final DateTime? rejectedAt,
          @JsonKey(name: 'business_uuid') final String? businessUuid,
          @JsonKey(name: 'business_name') final String? businessName,
          @JsonKey(name: 'business_photo') final String? businessPhoto,
          @JsonKey(name: 'user_uuid') final String? userUuid,
          @JsonKey(name: 'user_name') final String? userName,
          @JsonKey(name: 'user_photo') final String? userPhoto,
          @JsonKey(name: 'user_email') final String? userEmail,
          @JsonKey(name: 'user_phone') final String? userPhone,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$ReservationDMImpl;
  const _ReservationDM._() : super._();

  factory _ReservationDM.fromJson(Map<String, dynamic> json) =
      _$ReservationDMImpl.fromJson;

  @override
  @JsonKey(name: 'reservation_id')
  int? get reservationId;
  @override
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid;
  @override
  ReservationStatus get status;
  @override
  @JsonKey(name: 'reservation_date')
  DateTime? get reservationDate;
  @override
  @JsonKey(name: 'reservation_time')
  String? get reservationTime;
  @override
  @JsonKey(name: 'party_size')
  int get partySize;
  @override
  @JsonKey(name: 'special_requests')
  String? get specialRequests;
  @override
  @JsonKey(name: 'manager_notes')
  String? get managerNotes;
  @override
  @JsonKey(name: 'cancelled_by')
  String? get cancelledBy;
  @override
  @JsonKey(name: 'cancelled_at')
  DateTime? get cancelledAt;
  @override
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt;
  @override
  @JsonKey(name: 'rejected_at')
  DateTime? get rejectedAt;
  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  @JsonKey(name: 'business_name')
  String? get businessName;
  @override
  @JsonKey(name: 'business_photo')
  String? get businessPhoto;
  @override
  @JsonKey(name: 'user_uuid')
  String? get userUuid;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(name: 'user_photo')
  String? get userPhoto;
  @override
  @JsonKey(name: 'user_email')
  String? get userEmail;
  @override
  @JsonKey(name: 'user_phone')
  String? get userPhone;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ReservationDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationDMImplCopyWith<_$ReservationDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
