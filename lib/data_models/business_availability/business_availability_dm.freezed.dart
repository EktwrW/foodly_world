// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_availability_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessAvailabilityDM _$BusinessAvailabilityDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessAvailabilityDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityDM {
  @JsonKey(name: 'availability_uuid')
  String? get availabilityUuid => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  AvailabilityType get type => throw _privateConstructorUsedError;
  AvailabilitySource get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityDMCopyWith<BusinessAvailabilityDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityDMCopyWith<$Res> {
  factory $BusinessAvailabilityDMCopyWith(BusinessAvailabilityDM value,
          $Res Function(BusinessAvailabilityDM) then) =
      _$BusinessAvailabilityDMCopyWithImpl<$Res, BusinessAvailabilityDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'availability_uuid') String? availabilityUuid,
      DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      AvailabilityType type,
      AvailabilitySource source,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      String? reason,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$BusinessAvailabilityDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityDM>
    implements $BusinessAvailabilityDMCopyWith<$Res> {
  _$BusinessAvailabilityDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilityUuid = freezed,
    Object? date = freezed,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? type = null,
    Object? source = null,
    Object? reservationUuid = freezed,
    Object? reason = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      availabilityUuid: freezed == availabilityUuid
          ? _value.availabilityUuid
          : availabilityUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AvailabilityType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AvailabilitySource,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityDMImplCopyWith<$Res>
    implements $BusinessAvailabilityDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityDMImplCopyWith(
          _$BusinessAvailabilityDMImpl value,
          $Res Function(_$BusinessAvailabilityDMImpl) then) =
      __$$BusinessAvailabilityDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'availability_uuid') String? availabilityUuid,
      DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      AvailabilityType type,
      AvailabilitySource source,
      @JsonKey(name: 'reservation_uuid') String? reservationUuid,
      String? reason,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$BusinessAvailabilityDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityDMCopyWithImpl<$Res,
        _$BusinessAvailabilityDMImpl>
    implements _$$BusinessAvailabilityDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityDMImplCopyWithImpl(
      _$BusinessAvailabilityDMImpl _value,
      $Res Function(_$BusinessAvailabilityDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilityUuid = freezed,
    Object? date = freezed,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? type = null,
    Object? source = null,
    Object? reservationUuid = freezed,
    Object? reason = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$BusinessAvailabilityDMImpl(
      availabilityUuid: freezed == availabilityUuid
          ? _value.availabilityUuid
          : availabilityUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AvailabilityType,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AvailabilitySource,
      reservationUuid: freezed == reservationUuid
          ? _value.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityDMImpl extends _BusinessAvailabilityDM {
  const _$BusinessAvailabilityDMImpl(
      {@JsonKey(name: 'availability_uuid') this.availabilityUuid,
      this.date,
      @JsonKey(name: 'is_full_day') this.isFullDay = true,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.type = AvailabilityType.blocked,
      this.source = AvailabilitySource.manual,
      @JsonKey(name: 'reservation_uuid') this.reservationUuid,
      this.reason,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$BusinessAvailabilityDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessAvailabilityDMImplFromJson(json);

  @override
  @JsonKey(name: 'availability_uuid')
  final String? availabilityUuid;
  @override
  final DateTime? date;
  @override
  @JsonKey(name: 'is_full_day')
  final bool isFullDay;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey()
  final AvailabilityType type;
  @override
  @JsonKey()
  final AvailabilitySource source;
  @override
  @JsonKey(name: 'reservation_uuid')
  final String? reservationUuid;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'BusinessAvailabilityDM(availabilityUuid: $availabilityUuid, date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime, type: $type, source: $source, reservationUuid: $reservationUuid, reason: $reason, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityDMImpl &&
            (identical(other.availabilityUuid, availabilityUuid) ||
                other.availabilityUuid == availabilityUuid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.reservationUuid, reservationUuid) ||
                other.reservationUuid == reservationUuid) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      availabilityUuid,
      date,
      isFullDay,
      startTime,
      endTime,
      type,
      source,
      reservationUuid,
      reason,
      createdAt);

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityDMImplCopyWith<_$BusinessAvailabilityDMImpl>
      get copyWith => __$$BusinessAvailabilityDMImplCopyWithImpl<
          _$BusinessAvailabilityDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityDM extends BusinessAvailabilityDM {
  const factory _BusinessAvailabilityDM(
          {@JsonKey(name: 'availability_uuid') final String? availabilityUuid,
          final DateTime? date,
          @JsonKey(name: 'is_full_day') final bool isFullDay,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime,
          final AvailabilityType type,
          final AvailabilitySource source,
          @JsonKey(name: 'reservation_uuid') final String? reservationUuid,
          final String? reason,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$BusinessAvailabilityDMImpl;
  const _BusinessAvailabilityDM._() : super._();

  factory _BusinessAvailabilityDM.fromJson(Map<String, dynamic> json) =
      _$BusinessAvailabilityDMImpl.fromJson;

  @override
  @JsonKey(name: 'availability_uuid')
  String? get availabilityUuid;
  @override
  DateTime? get date;
  @override
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  AvailabilityType get type;
  @override
  AvailabilitySource get source;
  @override
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityDMImplCopyWith<_$BusinessAvailabilityDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessAvailabilityResponseDM _$BusinessAvailabilityResponseDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessAvailabilityResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityResponseDM {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  List<BusinessAvailabilityDM> get availability =>
      throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityResponseDMCopyWith<BusinessAvailabilityResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityResponseDMCopyWith(
          BusinessAvailabilityResponseDM value,
          $Res Function(BusinessAvailabilityResponseDM) then) =
      _$BusinessAvailabilityResponseDMCopyWithImpl<$Res,
          BusinessAvailabilityResponseDM>;
  @useResult
  $Res call(
      {String? from, String? to, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class _$BusinessAvailabilityResponseDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityResponseDM>
    implements $BusinessAvailabilityResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityResponseDMImplCopyWith<$Res>
    implements $BusinessAvailabilityResponseDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityResponseDMImplCopyWith(
          _$BusinessAvailabilityResponseDMImpl value,
          $Res Function(_$BusinessAvailabilityResponseDMImpl) then) =
      __$$BusinessAvailabilityResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? from, String? to, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class __$$BusinessAvailabilityResponseDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityResponseDMCopyWithImpl<$Res,
        _$BusinessAvailabilityResponseDMImpl>
    implements _$$BusinessAvailabilityResponseDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityResponseDMImplCopyWithImpl(
      _$BusinessAvailabilityResponseDMImpl _value,
      $Res Function(_$BusinessAvailabilityResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_$BusinessAvailabilityResponseDMImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityResponseDMImpl
    implements _BusinessAvailabilityResponseDM {
  const _$BusinessAvailabilityResponseDMImpl(
      {this.from,
      this.to,
      final List<BusinessAvailabilityDM> availability = const []})
      : _availability = availability;

  factory _$BusinessAvailabilityResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessAvailabilityResponseDMImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  final List<BusinessAvailabilityDM> _availability;
  @override
  @JsonKey()
  List<BusinessAvailabilityDM> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  String toString() {
    return 'BusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityResponseDMImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_availability));

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityResponseDMImplCopyWith<
          _$BusinessAvailabilityResponseDMImpl>
      get copyWith => __$$BusinessAvailabilityResponseDMImplCopyWithImpl<
          _$BusinessAvailabilityResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityResponseDM
    implements BusinessAvailabilityResponseDM {
  const factory _BusinessAvailabilityResponseDM(
          {final String? from,
          final String? to,
          final List<BusinessAvailabilityDM> availability}) =
      _$BusinessAvailabilityResponseDMImpl;

  factory _BusinessAvailabilityResponseDM.fromJson(Map<String, dynamic> json) =
      _$BusinessAvailabilityResponseDMImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  List<BusinessAvailabilityDM> get availability;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityResponseDMImplCopyWith<
          _$BusinessAvailabilityResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessAvailabilityCreateResponseDM
    _$BusinessAvailabilityCreateResponseDMFromJson(Map<String, dynamic> json) {
  return _BusinessAvailabilityCreateResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityCreateResponseDM {
  bool get success => throw _privateConstructorUsedError;
  BusinessAvailabilityDM? get availability =>
      throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityCreateResponseDMCopyWith<
          BusinessAvailabilityCreateResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityCreateResponseDMCopyWith(
          BusinessAvailabilityCreateResponseDM value,
          $Res Function(BusinessAvailabilityCreateResponseDM) then) =
      _$BusinessAvailabilityCreateResponseDMCopyWithImpl<$Res,
          BusinessAvailabilityCreateResponseDM>;
  @useResult
  $Res call({bool success, BusinessAvailabilityDM? availability});

  $BusinessAvailabilityDMCopyWith<$Res>? get availability;
}

/// @nodoc
class _$BusinessAvailabilityCreateResponseDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityCreateResponseDM>
    implements $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityCreateResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? availability = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as BusinessAvailabilityDM?,
    ) as $Val);
  }

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityDMCopyWith<$Res>? get availability {
    if (_value.availability == null) {
      return null;
    }

    return $BusinessAvailabilityDMCopyWith<$Res>(_value.availability!, (value) {
      return _then(_value.copyWith(availability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityCreateResponseDMImplCopyWith<$Res>
    implements $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityCreateResponseDMImplCopyWith(
          _$BusinessAvailabilityCreateResponseDMImpl value,
          $Res Function(_$BusinessAvailabilityCreateResponseDMImpl) then) =
      __$$BusinessAvailabilityCreateResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, BusinessAvailabilityDM? availability});

  @override
  $BusinessAvailabilityDMCopyWith<$Res>? get availability;
}

/// @nodoc
class __$$BusinessAvailabilityCreateResponseDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityCreateResponseDMCopyWithImpl<$Res,
        _$BusinessAvailabilityCreateResponseDMImpl>
    implements _$$BusinessAvailabilityCreateResponseDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityCreateResponseDMImplCopyWithImpl(
      _$BusinessAvailabilityCreateResponseDMImpl _value,
      $Res Function(_$BusinessAvailabilityCreateResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? availability = freezed,
  }) {
    return _then(_$BusinessAvailabilityCreateResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as BusinessAvailabilityDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityCreateResponseDMImpl
    implements _BusinessAvailabilityCreateResponseDM {
  const _$BusinessAvailabilityCreateResponseDMImpl(
      {this.success = false, this.availability});

  factory _$BusinessAvailabilityCreateResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessAvailabilityCreateResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final BusinessAvailabilityDM? availability;

  @override
  String toString() {
    return 'BusinessAvailabilityCreateResponseDM(success: $success, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityCreateResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, availability);

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityCreateResponseDMImplCopyWith<
          _$BusinessAvailabilityCreateResponseDMImpl>
      get copyWith => __$$BusinessAvailabilityCreateResponseDMImplCopyWithImpl<
          _$BusinessAvailabilityCreateResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityCreateResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityCreateResponseDM
    implements BusinessAvailabilityCreateResponseDM {
  const factory _BusinessAvailabilityCreateResponseDM(
          {final bool success, final BusinessAvailabilityDM? availability}) =
      _$BusinessAvailabilityCreateResponseDMImpl;

  factory _BusinessAvailabilityCreateResponseDM.fromJson(
          Map<String, dynamic> json) =
      _$BusinessAvailabilityCreateResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  BusinessAvailabilityDM? get availability;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityCreateResponseDMImplCopyWith<
          _$BusinessAvailabilityCreateResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessAvailabilityBulkResponseDM _$BusinessAvailabilityBulkResponseDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessAvailabilityBulkResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityBulkResponseDM {
  bool get success => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<BusinessAvailabilityDM> get availability =>
      throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityBulkResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityBulkResponseDMCopyWith<
          BusinessAvailabilityBulkResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityBulkResponseDMCopyWith(
          BusinessAvailabilityBulkResponseDM value,
          $Res Function(BusinessAvailabilityBulkResponseDM) then) =
      _$BusinessAvailabilityBulkResponseDMCopyWithImpl<$Res,
          BusinessAvailabilityBulkResponseDM>;
  @useResult
  $Res call(
      {bool success, int count, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class _$BusinessAvailabilityBulkResponseDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityBulkResponseDM>
    implements $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityBulkResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? availability = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityBulkResponseDMImplCopyWith<$Res>
    implements $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityBulkResponseDMImplCopyWith(
          _$BusinessAvailabilityBulkResponseDMImpl value,
          $Res Function(_$BusinessAvailabilityBulkResponseDMImpl) then) =
      __$$BusinessAvailabilityBulkResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success, int count, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class __$$BusinessAvailabilityBulkResponseDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityBulkResponseDMCopyWithImpl<$Res,
        _$BusinessAvailabilityBulkResponseDMImpl>
    implements _$$BusinessAvailabilityBulkResponseDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityBulkResponseDMImplCopyWithImpl(
      _$BusinessAvailabilityBulkResponseDMImpl _value,
      $Res Function(_$BusinessAvailabilityBulkResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? availability = null,
  }) {
    return _then(_$BusinessAvailabilityBulkResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityBulkResponseDMImpl
    implements _BusinessAvailabilityBulkResponseDM {
  const _$BusinessAvailabilityBulkResponseDMImpl(
      {this.success = false,
      this.count = 0,
      final List<BusinessAvailabilityDM> availability = const []})
      : _availability = availability;

  factory _$BusinessAvailabilityBulkResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessAvailabilityBulkResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final int count;
  final List<BusinessAvailabilityDM> _availability;
  @override
  @JsonKey()
  List<BusinessAvailabilityDM> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  String toString() {
    return 'BusinessAvailabilityBulkResponseDM(success: $success, count: $count, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityBulkResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, count,
      const DeepCollectionEquality().hash(_availability));

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityBulkResponseDMImplCopyWith<
          _$BusinessAvailabilityBulkResponseDMImpl>
      get copyWith => __$$BusinessAvailabilityBulkResponseDMImplCopyWithImpl<
          _$BusinessAvailabilityBulkResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityBulkResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityBulkResponseDM
    implements BusinessAvailabilityBulkResponseDM {
  const factory _BusinessAvailabilityBulkResponseDM(
          {final bool success,
          final int count,
          final List<BusinessAvailabilityDM> availability}) =
      _$BusinessAvailabilityBulkResponseDMImpl;

  factory _BusinessAvailabilityBulkResponseDM.fromJson(
          Map<String, dynamic> json) =
      _$BusinessAvailabilityBulkResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  int get count;
  @override
  List<BusinessAvailabilityDM> get availability;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityBulkResponseDMImplCopyWith<
          _$BusinessAvailabilityBulkResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessAvailabilityActionResponseDM
    _$BusinessAvailabilityActionResponseDMFromJson(Map<String, dynamic> json) {
  return _BusinessAvailabilityActionResponseDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityActionResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityActionResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityActionResponseDMCopyWith<
          BusinessAvailabilityActionResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityActionResponseDMCopyWith(
          BusinessAvailabilityActionResponseDM value,
          $Res Function(BusinessAvailabilityActionResponseDM) then) =
      _$BusinessAvailabilityActionResponseDMCopyWithImpl<$Res,
          BusinessAvailabilityActionResponseDM>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$BusinessAvailabilityActionResponseDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityActionResponseDM>
    implements $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityActionResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityActionResponseDMImplCopyWith<$Res>
    implements $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityActionResponseDMImplCopyWith(
          _$BusinessAvailabilityActionResponseDMImpl value,
          $Res Function(_$BusinessAvailabilityActionResponseDMImpl) then) =
      __$$BusinessAvailabilityActionResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$BusinessAvailabilityActionResponseDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityActionResponseDMCopyWithImpl<$Res,
        _$BusinessAvailabilityActionResponseDMImpl>
    implements _$$BusinessAvailabilityActionResponseDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityActionResponseDMImplCopyWithImpl(
      _$BusinessAvailabilityActionResponseDMImpl _value,
      $Res Function(_$BusinessAvailabilityActionResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$BusinessAvailabilityActionResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityActionResponseDMImpl
    implements _BusinessAvailabilityActionResponseDM {
  const _$BusinessAvailabilityActionResponseDMImpl(
      {this.success = false, this.message = ''});

  factory _$BusinessAvailabilityActionResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessAvailabilityActionResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'BusinessAvailabilityActionResponseDM(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityActionResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityActionResponseDMImplCopyWith<
          _$BusinessAvailabilityActionResponseDMImpl>
      get copyWith => __$$BusinessAvailabilityActionResponseDMImplCopyWithImpl<
          _$BusinessAvailabilityActionResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityActionResponseDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityActionResponseDM
    implements BusinessAvailabilityActionResponseDM {
  const factory _BusinessAvailabilityActionResponseDM(
      {final bool success,
      final String message}) = _$BusinessAvailabilityActionResponseDMImpl;

  factory _BusinessAvailabilityActionResponseDM.fromJson(
          Map<String, dynamic> json) =
      _$BusinessAvailabilityActionResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityActionResponseDMImplCopyWith<
          _$BusinessAvailabilityActionResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PublicAvailabilitySlotDM _$PublicAvailabilitySlotDMFromJson(
    Map<String, dynamic> json) {
  return _PublicAvailabilitySlotDM.fromJson(json);
}

/// @nodoc
mixin _$PublicAvailabilitySlotDM {
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this PublicAvailabilitySlotDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicAvailabilitySlotDMCopyWith<PublicAvailabilitySlotDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicAvailabilitySlotDMCopyWith<$Res> {
  factory $PublicAvailabilitySlotDMCopyWith(PublicAvailabilitySlotDM value,
          $Res Function(PublicAvailabilitySlotDM) then) =
      _$PublicAvailabilitySlotDMCopyWithImpl<$Res, PublicAvailabilitySlotDM>;
  @useResult
  $Res call(
      {DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$PublicAvailabilitySlotDMCopyWithImpl<$Res,
        $Val extends PublicAvailabilitySlotDM>
    implements $PublicAvailabilitySlotDMCopyWith<$Res> {
  _$PublicAvailabilitySlotDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicAvailabilitySlotDMImplCopyWith<$Res>
    implements $PublicAvailabilitySlotDMCopyWith<$Res> {
  factory _$$PublicAvailabilitySlotDMImplCopyWith(
          _$PublicAvailabilitySlotDMImpl value,
          $Res Function(_$PublicAvailabilitySlotDMImpl) then) =
      __$$PublicAvailabilitySlotDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$PublicAvailabilitySlotDMImplCopyWithImpl<$Res>
    extends _$PublicAvailabilitySlotDMCopyWithImpl<$Res,
        _$PublicAvailabilitySlotDMImpl>
    implements _$$PublicAvailabilitySlotDMImplCopyWith<$Res> {
  __$$PublicAvailabilitySlotDMImplCopyWithImpl(
      _$PublicAvailabilitySlotDMImpl _value,
      $Res Function(_$PublicAvailabilitySlotDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$PublicAvailabilitySlotDMImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicAvailabilitySlotDMImpl extends _PublicAvailabilitySlotDM {
  const _$PublicAvailabilitySlotDMImpl(
      {this.date,
      @JsonKey(name: 'is_full_day') this.isFullDay = true,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime})
      : super._();

  factory _$PublicAvailabilitySlotDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicAvailabilitySlotDMImplFromJson(json);

  @override
  final DateTime? date;
  @override
  @JsonKey(name: 'is_full_day')
  final bool isFullDay;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;

  @override
  String toString() {
    return 'PublicAvailabilitySlotDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicAvailabilitySlotDMImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, isFullDay, startTime, endTime);

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicAvailabilitySlotDMImplCopyWith<_$PublicAvailabilitySlotDMImpl>
      get copyWith => __$$PublicAvailabilitySlotDMImplCopyWithImpl<
          _$PublicAvailabilitySlotDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicAvailabilitySlotDMImplToJson(
      this,
    );
  }
}

abstract class _PublicAvailabilitySlotDM extends PublicAvailabilitySlotDM {
  const factory _PublicAvailabilitySlotDM(
          {final DateTime? date,
          @JsonKey(name: 'is_full_day') final bool isFullDay,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime}) =
      _$PublicAvailabilitySlotDMImpl;
  const _PublicAvailabilitySlotDM._() : super._();

  factory _PublicAvailabilitySlotDM.fromJson(Map<String, dynamic> json) =
      _$PublicAvailabilitySlotDMImpl.fromJson;

  @override
  DateTime? get date;
  @override
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicAvailabilitySlotDMImplCopyWith<_$PublicAvailabilitySlotDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PublicBusinessAvailabilityResponseDM
    _$PublicBusinessAvailabilityResponseDMFromJson(Map<String, dynamic> json) {
  return _PublicBusinessAvailabilityResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PublicBusinessAvailabilityResponseDM {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  List<PublicAvailabilitySlotDM> get availability =>
      throw _privateConstructorUsedError;

  /// Serializes this PublicBusinessAvailabilityResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicBusinessAvailabilityResponseDMCopyWith<
          PublicBusinessAvailabilityResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  factory $PublicBusinessAvailabilityResponseDMCopyWith(
          PublicBusinessAvailabilityResponseDM value,
          $Res Function(PublicBusinessAvailabilityResponseDM) then) =
      _$PublicBusinessAvailabilityResponseDMCopyWithImpl<$Res,
          PublicBusinessAvailabilityResponseDM>;
  @useResult
  $Res call(
      {String? from, String? to, List<PublicAvailabilitySlotDM> availability});
}

/// @nodoc
class _$PublicBusinessAvailabilityResponseDMCopyWithImpl<$Res,
        $Val extends PublicBusinessAvailabilityResponseDM>
    implements $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  _$PublicBusinessAvailabilityResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<PublicAvailabilitySlotDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicBusinessAvailabilityResponseDMImplCopyWith<$Res>
    implements $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  factory _$$PublicBusinessAvailabilityResponseDMImplCopyWith(
          _$PublicBusinessAvailabilityResponseDMImpl value,
          $Res Function(_$PublicBusinessAvailabilityResponseDMImpl) then) =
      __$$PublicBusinessAvailabilityResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? from, String? to, List<PublicAvailabilitySlotDM> availability});
}

/// @nodoc
class __$$PublicBusinessAvailabilityResponseDMImplCopyWithImpl<$Res>
    extends _$PublicBusinessAvailabilityResponseDMCopyWithImpl<$Res,
        _$PublicBusinessAvailabilityResponseDMImpl>
    implements _$$PublicBusinessAvailabilityResponseDMImplCopyWith<$Res> {
  __$$PublicBusinessAvailabilityResponseDMImplCopyWithImpl(
      _$PublicBusinessAvailabilityResponseDMImpl _value,
      $Res Function(_$PublicBusinessAvailabilityResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_$PublicBusinessAvailabilityResponseDMImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<PublicAvailabilitySlotDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicBusinessAvailabilityResponseDMImpl
    implements _PublicBusinessAvailabilityResponseDM {
  const _$PublicBusinessAvailabilityResponseDMImpl(
      {this.from,
      this.to,
      final List<PublicAvailabilitySlotDM> availability = const []})
      : _availability = availability;

  factory _$PublicBusinessAvailabilityResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PublicBusinessAvailabilityResponseDMImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  final List<PublicAvailabilitySlotDM> _availability;
  @override
  @JsonKey()
  List<PublicAvailabilitySlotDM> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  String toString() {
    return 'PublicBusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicBusinessAvailabilityResponseDMImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_availability));

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicBusinessAvailabilityResponseDMImplCopyWith<
          _$PublicBusinessAvailabilityResponseDMImpl>
      get copyWith => __$$PublicBusinessAvailabilityResponseDMImplCopyWithImpl<
          _$PublicBusinessAvailabilityResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicBusinessAvailabilityResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PublicBusinessAvailabilityResponseDM
    implements PublicBusinessAvailabilityResponseDM {
  const factory _PublicBusinessAvailabilityResponseDM(
          {final String? from,
          final String? to,
          final List<PublicAvailabilitySlotDM> availability}) =
      _$PublicBusinessAvailabilityResponseDMImpl;

  factory _PublicBusinessAvailabilityResponseDM.fromJson(
          Map<String, dynamic> json) =
      _$PublicBusinessAvailabilityResponseDMImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  List<PublicAvailabilitySlotDM> get availability;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicBusinessAvailabilityResponseDMImplCopyWith<
          _$PublicBusinessAvailabilityResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessAvailabilityBulkEntryDM _$BusinessAvailabilityBulkEntryDMFromJson(
    Map<String, dynamic> json) {
  return _BusinessAvailabilityBulkEntryDM.fromJson(json);
}

/// @nodoc
mixin _$BusinessAvailabilityBulkEntryDM {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this BusinessAvailabilityBulkEntryDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAvailabilityBulkEntryDMCopyWith<BusinessAvailabilityBulkEntryDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  factory $BusinessAvailabilityBulkEntryDMCopyWith(
          BusinessAvailabilityBulkEntryDM value,
          $Res Function(BusinessAvailabilityBulkEntryDM) then) =
      _$BusinessAvailabilityBulkEntryDMCopyWithImpl<$Res,
          BusinessAvailabilityBulkEntryDM>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$BusinessAvailabilityBulkEntryDMCopyWithImpl<$Res,
        $Val extends BusinessAvailabilityBulkEntryDM>
    implements $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  _$BusinessAvailabilityBulkEntryDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessAvailabilityBulkEntryDMImplCopyWith<$Res>
    implements $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  factory _$$BusinessAvailabilityBulkEntryDMImplCopyWith(
          _$BusinessAvailabilityBulkEntryDMImpl value,
          $Res Function(_$BusinessAvailabilityBulkEntryDMImpl) then) =
      __$$BusinessAvailabilityBulkEntryDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$BusinessAvailabilityBulkEntryDMImplCopyWithImpl<$Res>
    extends _$BusinessAvailabilityBulkEntryDMCopyWithImpl<$Res,
        _$BusinessAvailabilityBulkEntryDMImpl>
    implements _$$BusinessAvailabilityBulkEntryDMImplCopyWith<$Res> {
  __$$BusinessAvailabilityBulkEntryDMImplCopyWithImpl(
      _$BusinessAvailabilityBulkEntryDMImpl _value,
      $Res Function(_$BusinessAvailabilityBulkEntryDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$BusinessAvailabilityBulkEntryDMImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessAvailabilityBulkEntryDMImpl
    implements _BusinessAvailabilityBulkEntryDM {
  const _$BusinessAvailabilityBulkEntryDMImpl(
      {required this.date,
      @JsonKey(name: 'is_full_day') required this.isFullDay,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime});

  factory _$BusinessAvailabilityBulkEntryDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessAvailabilityBulkEntryDMImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'is_full_day')
  final bool isFullDay;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;

  @override
  String toString() {
    return 'BusinessAvailabilityBulkEntryDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessAvailabilityBulkEntryDMImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, isFullDay, startTime, endTime);

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessAvailabilityBulkEntryDMImplCopyWith<
          _$BusinessAvailabilityBulkEntryDMImpl>
      get copyWith => __$$BusinessAvailabilityBulkEntryDMImplCopyWithImpl<
          _$BusinessAvailabilityBulkEntryDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessAvailabilityBulkEntryDMImplToJson(
      this,
    );
  }
}

abstract class _BusinessAvailabilityBulkEntryDM
    implements BusinessAvailabilityBulkEntryDM {
  const factory _BusinessAvailabilityBulkEntryDM(
          {required final String date,
          @JsonKey(name: 'is_full_day') required final bool isFullDay,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime}) =
      _$BusinessAvailabilityBulkEntryDMImpl;

  factory _BusinessAvailabilityBulkEntryDM.fromJson(Map<String, dynamic> json) =
      _$BusinessAvailabilityBulkEntryDMImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessAvailabilityBulkEntryDMImplCopyWith<
          _$BusinessAvailabilityBulkEntryDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
