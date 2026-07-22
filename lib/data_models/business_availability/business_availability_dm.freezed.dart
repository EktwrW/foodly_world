// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_availability_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessAvailabilityDM {
  @JsonKey(name: 'availability_uuid')
  String? get availabilityUuid;
  DateTime? get date;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @JsonKey(name: 'start_time')
  String? get startTime;
  @JsonKey(name: 'end_time')
  String? get endTime;
  AvailabilityType get type;
  AvailabilitySource get source;
  @JsonKey(name: 'reservation_uuid')
  String? get reservationUuid;
  String? get reason;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityDMCopyWith<BusinessAvailabilityDM> get copyWith =>
      _$BusinessAvailabilityDMCopyWithImpl<BusinessAvailabilityDM>(
          this as BusinessAvailabilityDM, _$identity);

  /// Serializes this BusinessAvailabilityDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityDM &&
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

  @override
  String toString() {
    return 'BusinessAvailabilityDM(availabilityUuid: $availabilityUuid, date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime, type: $type, source: $source, reservationUuid: $reservationUuid, reason: $reason, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityDMCopyWith<$Res> {
  factory $BusinessAvailabilityDMCopyWith(BusinessAvailabilityDM value,
          $Res Function(BusinessAvailabilityDM) _then) =
      _$BusinessAvailabilityDMCopyWithImpl;
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
class _$BusinessAvailabilityDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityDMCopyWith<$Res> {
  _$BusinessAvailabilityDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityDM _self;
  final $Res Function(BusinessAvailabilityDM) _then;

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
    return _then(_self.copyWith(
      availabilityUuid: freezed == availabilityUuid
          ? _self.availabilityUuid
          : availabilityUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AvailabilityType,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as AvailabilitySource,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityDM].
extension BusinessAvailabilityDMPatterns on BusinessAvailabilityDM {
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
    TResult Function(_BusinessAvailabilityDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM():
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
    TResult? Function(_BusinessAvailabilityDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM() when $default != null:
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
            @JsonKey(name: 'availability_uuid') String? availabilityUuid,
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            AvailabilityType type,
            AvailabilitySource source,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            String? reason,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM() when $default != null:
        return $default(
            _that.availabilityUuid,
            _that.date,
            _that.isFullDay,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.source,
            _that.reservationUuid,
            _that.reason,
            _that.createdAt);
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
            @JsonKey(name: 'availability_uuid') String? availabilityUuid,
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            AvailabilityType type,
            AvailabilitySource source,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            String? reason,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM():
        return $default(
            _that.availabilityUuid,
            _that.date,
            _that.isFullDay,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.source,
            _that.reservationUuid,
            _that.reason,
            _that.createdAt);
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
            @JsonKey(name: 'availability_uuid') String? availabilityUuid,
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            AvailabilityType type,
            AvailabilitySource source,
            @JsonKey(name: 'reservation_uuid') String? reservationUuid,
            String? reason,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityDM() when $default != null:
        return $default(
            _that.availabilityUuid,
            _that.date,
            _that.isFullDay,
            _that.startTime,
            _that.endTime,
            _that.type,
            _that.source,
            _that.reservationUuid,
            _that.reason,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityDM extends BusinessAvailabilityDM {
  const _BusinessAvailabilityDM(
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
  factory _BusinessAvailabilityDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessAvailabilityDMFromJson(json);

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

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityDMCopyWith<_BusinessAvailabilityDM> get copyWith =>
      __$BusinessAvailabilityDMCopyWithImpl<_BusinessAvailabilityDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityDM &&
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

  @override
  String toString() {
    return 'BusinessAvailabilityDM(availabilityUuid: $availabilityUuid, date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime, type: $type, source: $source, reservationUuid: $reservationUuid, reason: $reason, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityDMCopyWith<$Res>
    implements $BusinessAvailabilityDMCopyWith<$Res> {
  factory _$BusinessAvailabilityDMCopyWith(_BusinessAvailabilityDM value,
          $Res Function(_BusinessAvailabilityDM) _then) =
      __$BusinessAvailabilityDMCopyWithImpl;
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
class __$BusinessAvailabilityDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityDMCopyWith<$Res> {
  __$BusinessAvailabilityDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityDM _self;
  final $Res Function(_BusinessAvailabilityDM) _then;

  /// Create a copy of BusinessAvailabilityDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_BusinessAvailabilityDM(
      availabilityUuid: freezed == availabilityUuid
          ? _self.availabilityUuid
          : availabilityUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AvailabilityType,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as AvailabilitySource,
      reservationUuid: freezed == reservationUuid
          ? _self.reservationUuid
          : reservationUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$BusinessAvailabilityResponseDM {
  String? get from;
  String? get to;
  List<BusinessAvailabilityDM> get availability;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityResponseDMCopyWith<BusinessAvailabilityResponseDM>
      get copyWith => _$BusinessAvailabilityResponseDMCopyWithImpl<
              BusinessAvailabilityResponseDM>(
          this as BusinessAvailabilityResponseDM, _$identity);

  /// Serializes this BusinessAvailabilityResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityResponseDM &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, from, to, const DeepCollectionEquality().hash(availability));

  @override
  String toString() {
    return 'BusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityResponseDMCopyWith(
          BusinessAvailabilityResponseDM value,
          $Res Function(BusinessAvailabilityResponseDM) _then) =
      _$BusinessAvailabilityResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {String? from, String? to, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class _$BusinessAvailabilityResponseDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityResponseDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityResponseDM _self;
  final $Res Function(BusinessAvailabilityResponseDM) _then;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_self.copyWith(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _self.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityResponseDM].
extension BusinessAvailabilityResponseDMPatterns
    on BusinessAvailabilityResponseDM {
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
    TResult Function(_BusinessAvailabilityResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM():
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
    TResult? Function(_BusinessAvailabilityResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM() when $default != null:
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
    TResult Function(String? from, String? to,
            List<BusinessAvailabilityDM> availability)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM() when $default != null:
        return $default(_that.from, _that.to, _that.availability);
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
            String? from, String? to, List<BusinessAvailabilityDM> availability)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM():
        return $default(_that.from, _that.to, _that.availability);
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
    TResult? Function(String? from, String? to,
            List<BusinessAvailabilityDM> availability)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityResponseDM() when $default != null:
        return $default(_that.from, _that.to, _that.availability);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityResponseDM
    implements BusinessAvailabilityResponseDM {
  const _BusinessAvailabilityResponseDM(
      {this.from,
      this.to,
      final List<BusinessAvailabilityDM> availability = const []})
      : _availability = availability;
  factory _BusinessAvailabilityResponseDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessAvailabilityResponseDMFromJson(json);

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

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityResponseDMCopyWith<_BusinessAvailabilityResponseDM>
      get copyWith => __$BusinessAvailabilityResponseDMCopyWithImpl<
          _BusinessAvailabilityResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityResponseDM &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_availability));

  @override
  String toString() {
    return 'BusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityResponseDMCopyWith<$Res>
    implements $BusinessAvailabilityResponseDMCopyWith<$Res> {
  factory _$BusinessAvailabilityResponseDMCopyWith(
          _BusinessAvailabilityResponseDM value,
          $Res Function(_BusinessAvailabilityResponseDM) _then) =
      __$BusinessAvailabilityResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? from, String? to, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class __$BusinessAvailabilityResponseDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityResponseDMCopyWith<$Res> {
  __$BusinessAvailabilityResponseDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityResponseDM _self;
  final $Res Function(_BusinessAvailabilityResponseDM) _then;

  /// Create a copy of BusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_BusinessAvailabilityResponseDM(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _self._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// @nodoc
mixin _$BusinessAvailabilityCreateResponseDM {
  bool get success;
  BusinessAvailabilityDM? get availability;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityCreateResponseDMCopyWith<
          BusinessAvailabilityCreateResponseDM>
      get copyWith => _$BusinessAvailabilityCreateResponseDMCopyWithImpl<
              BusinessAvailabilityCreateResponseDM>(
          this as BusinessAvailabilityCreateResponseDM, _$identity);

  /// Serializes this BusinessAvailabilityCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, availability);

  @override
  String toString() {
    return 'BusinessAvailabilityCreateResponseDM(success: $success, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityCreateResponseDMCopyWith(
          BusinessAvailabilityCreateResponseDM value,
          $Res Function(BusinessAvailabilityCreateResponseDM) _then) =
      _$BusinessAvailabilityCreateResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, BusinessAvailabilityDM? availability});

  $BusinessAvailabilityDMCopyWith<$Res>? get availability;
}

/// @nodoc
class _$BusinessAvailabilityCreateResponseDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityCreateResponseDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityCreateResponseDM _self;
  final $Res Function(BusinessAvailabilityCreateResponseDM) _then;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? availability = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      availability: freezed == availability
          ? _self.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as BusinessAvailabilityDM?,
    ));
  }

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityDMCopyWith<$Res>? get availability {
    if (_self.availability == null) {
      return null;
    }

    return $BusinessAvailabilityDMCopyWith<$Res>(_self.availability!, (value) {
      return _then(_self.copyWith(availability: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityCreateResponseDM].
extension BusinessAvailabilityCreateResponseDMPatterns
    on BusinessAvailabilityCreateResponseDM {
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
    TResult Function(_BusinessAvailabilityCreateResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityCreateResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM():
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
    TResult? Function(_BusinessAvailabilityCreateResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM() when $default != null:
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
    TResult Function(bool success, BusinessAvailabilityDM? availability)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM() when $default != null:
        return $default(_that.success, _that.availability);
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
    TResult Function(bool success, BusinessAvailabilityDM? availability)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM():
        return $default(_that.success, _that.availability);
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
    TResult? Function(bool success, BusinessAvailabilityDM? availability)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityCreateResponseDM() when $default != null:
        return $default(_that.success, _that.availability);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityCreateResponseDM
    implements BusinessAvailabilityCreateResponseDM {
  const _BusinessAvailabilityCreateResponseDM(
      {this.success = false, this.availability});
  factory _BusinessAvailabilityCreateResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityCreateResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final BusinessAvailabilityDM? availability;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityCreateResponseDMCopyWith<
          _BusinessAvailabilityCreateResponseDM>
      get copyWith => __$BusinessAvailabilityCreateResponseDMCopyWithImpl<
          _BusinessAvailabilityCreateResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityCreateResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, availability);

  @override
  String toString() {
    return 'BusinessAvailabilityCreateResponseDM(success: $success, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityCreateResponseDMCopyWith<$Res>
    implements $BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  factory _$BusinessAvailabilityCreateResponseDMCopyWith(
          _BusinessAvailabilityCreateResponseDM value,
          $Res Function(_BusinessAvailabilityCreateResponseDM) _then) =
      __$BusinessAvailabilityCreateResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, BusinessAvailabilityDM? availability});

  @override
  $BusinessAvailabilityDMCopyWith<$Res>? get availability;
}

/// @nodoc
class __$BusinessAvailabilityCreateResponseDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityCreateResponseDMCopyWith<$Res> {
  __$BusinessAvailabilityCreateResponseDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityCreateResponseDM _self;
  final $Res Function(_BusinessAvailabilityCreateResponseDM) _then;

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? availability = freezed,
  }) {
    return _then(_BusinessAvailabilityCreateResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      availability: freezed == availability
          ? _self.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as BusinessAvailabilityDM?,
    ));
  }

  /// Create a copy of BusinessAvailabilityCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityDMCopyWith<$Res>? get availability {
    if (_self.availability == null) {
      return null;
    }

    return $BusinessAvailabilityDMCopyWith<$Res>(_self.availability!, (value) {
      return _then(_self.copyWith(availability: value));
    });
  }
}

/// @nodoc
mixin _$BusinessAvailabilityBulkResponseDM {
  bool get success;
  int get count;
  List<BusinessAvailabilityDM> get availability;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityBulkResponseDMCopyWith<
          BusinessAvailabilityBulkResponseDM>
      get copyWith => _$BusinessAvailabilityBulkResponseDMCopyWithImpl<
              BusinessAvailabilityBulkResponseDM>(
          this as BusinessAvailabilityBulkResponseDM, _$identity);

  /// Serializes this BusinessAvailabilityBulkResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityBulkResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, count,
      const DeepCollectionEquality().hash(availability));

  @override
  String toString() {
    return 'BusinessAvailabilityBulkResponseDM(success: $success, count: $count, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityBulkResponseDMCopyWith(
          BusinessAvailabilityBulkResponseDM value,
          $Res Function(BusinessAvailabilityBulkResponseDM) _then) =
      _$BusinessAvailabilityBulkResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success, int count, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class _$BusinessAvailabilityBulkResponseDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityBulkResponseDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityBulkResponseDM _self;
  final $Res Function(BusinessAvailabilityBulkResponseDM) _then;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? availability = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _self.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityBulkResponseDM].
extension BusinessAvailabilityBulkResponseDMPatterns
    on BusinessAvailabilityBulkResponseDM {
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
    TResult Function(_BusinessAvailabilityBulkResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityBulkResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM():
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
    TResult? Function(_BusinessAvailabilityBulkResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM() when $default != null:
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
            bool success, int count, List<BusinessAvailabilityDM> availability)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM() when $default != null:
        return $default(_that.success, _that.count, _that.availability);
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
            bool success, int count, List<BusinessAvailabilityDM> availability)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM():
        return $default(_that.success, _that.count, _that.availability);
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
            bool success, int count, List<BusinessAvailabilityDM> availability)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkResponseDM() when $default != null:
        return $default(_that.success, _that.count, _that.availability);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityBulkResponseDM
    implements BusinessAvailabilityBulkResponseDM {
  const _BusinessAvailabilityBulkResponseDM(
      {this.success = false,
      this.count = 0,
      final List<BusinessAvailabilityDM> availability = const []})
      : _availability = availability;
  factory _BusinessAvailabilityBulkResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityBulkResponseDMFromJson(json);

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

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityBulkResponseDMCopyWith<
          _BusinessAvailabilityBulkResponseDM>
      get copyWith => __$BusinessAvailabilityBulkResponseDMCopyWithImpl<
          _BusinessAvailabilityBulkResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityBulkResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityBulkResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, count,
      const DeepCollectionEquality().hash(_availability));

  @override
  String toString() {
    return 'BusinessAvailabilityBulkResponseDM(success: $success, count: $count, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityBulkResponseDMCopyWith<$Res>
    implements $BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  factory _$BusinessAvailabilityBulkResponseDMCopyWith(
          _BusinessAvailabilityBulkResponseDM value,
          $Res Function(_BusinessAvailabilityBulkResponseDM) _then) =
      __$BusinessAvailabilityBulkResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success, int count, List<BusinessAvailabilityDM> availability});
}

/// @nodoc
class __$BusinessAvailabilityBulkResponseDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityBulkResponseDMCopyWith<$Res> {
  __$BusinessAvailabilityBulkResponseDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityBulkResponseDM _self;
  final $Res Function(_BusinessAvailabilityBulkResponseDM) _then;

  /// Create a copy of BusinessAvailabilityBulkResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? availability = null,
  }) {
    return _then(_BusinessAvailabilityBulkResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      availability: null == availability
          ? _self._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
    ));
  }
}

/// @nodoc
mixin _$BusinessAvailabilityActionResponseDM {
  bool get success;
  String get message;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityActionResponseDMCopyWith<
          BusinessAvailabilityActionResponseDM>
      get copyWith => _$BusinessAvailabilityActionResponseDMCopyWithImpl<
              BusinessAvailabilityActionResponseDM>(
          this as BusinessAvailabilityActionResponseDM, _$identity);

  /// Serializes this BusinessAvailabilityActionResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  @override
  String toString() {
    return 'BusinessAvailabilityActionResponseDM(success: $success, message: $message)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  factory $BusinessAvailabilityActionResponseDMCopyWith(
          BusinessAvailabilityActionResponseDM value,
          $Res Function(BusinessAvailabilityActionResponseDM) _then) =
      _$BusinessAvailabilityActionResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$BusinessAvailabilityActionResponseDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  _$BusinessAvailabilityActionResponseDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityActionResponseDM _self;
  final $Res Function(BusinessAvailabilityActionResponseDM) _then;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityActionResponseDM].
extension BusinessAvailabilityActionResponseDMPatterns
    on BusinessAvailabilityActionResponseDM {
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
    TResult Function(_BusinessAvailabilityActionResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityActionResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM():
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
    TResult? Function(_BusinessAvailabilityActionResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM() when $default != null:
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
    TResult Function(bool success, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM() when $default != null:
        return $default(_that.success, _that.message);
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
    TResult Function(bool success, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM():
        return $default(_that.success, _that.message);
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
    TResult? Function(bool success, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityActionResponseDM() when $default != null:
        return $default(_that.success, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityActionResponseDM
    implements BusinessAvailabilityActionResponseDM {
  const _BusinessAvailabilityActionResponseDM(
      {this.success = false, this.message = ''});
  factory _BusinessAvailabilityActionResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityActionResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityActionResponseDMCopyWith<
          _BusinessAvailabilityActionResponseDM>
      get copyWith => __$BusinessAvailabilityActionResponseDMCopyWithImpl<
          _BusinessAvailabilityActionResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityActionResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  @override
  String toString() {
    return 'BusinessAvailabilityActionResponseDM(success: $success, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityActionResponseDMCopyWith<$Res>
    implements $BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  factory _$BusinessAvailabilityActionResponseDMCopyWith(
          _BusinessAvailabilityActionResponseDM value,
          $Res Function(_BusinessAvailabilityActionResponseDM) _then) =
      __$BusinessAvailabilityActionResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$BusinessAvailabilityActionResponseDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityActionResponseDMCopyWith<$Res> {
  __$BusinessAvailabilityActionResponseDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityActionResponseDM _self;
  final $Res Function(_BusinessAvailabilityActionResponseDM) _then;

  /// Create a copy of BusinessAvailabilityActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_BusinessAvailabilityActionResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PublicAvailabilitySlotDM {
  DateTime? get date;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @JsonKey(name: 'start_time')
  String? get startTime;
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublicAvailabilitySlotDMCopyWith<PublicAvailabilitySlotDM> get copyWith =>
      _$PublicAvailabilitySlotDMCopyWithImpl<PublicAvailabilitySlotDM>(
          this as PublicAvailabilitySlotDM, _$identity);

  /// Serializes this PublicAvailabilitySlotDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicAvailabilitySlotDM &&
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

  @override
  String toString() {
    return 'PublicAvailabilitySlotDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class $PublicAvailabilitySlotDMCopyWith<$Res> {
  factory $PublicAvailabilitySlotDMCopyWith(PublicAvailabilitySlotDM value,
          $Res Function(PublicAvailabilitySlotDM) _then) =
      _$PublicAvailabilitySlotDMCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$PublicAvailabilitySlotDMCopyWithImpl<$Res>
    implements $PublicAvailabilitySlotDMCopyWith<$Res> {
  _$PublicAvailabilitySlotDMCopyWithImpl(this._self, this._then);

  final PublicAvailabilitySlotDM _self;
  final $Res Function(PublicAvailabilitySlotDM) _then;

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
    return _then(_self.copyWith(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PublicAvailabilitySlotDM].
extension PublicAvailabilitySlotDMPatterns on PublicAvailabilitySlotDM {
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
    TResult Function(_PublicAvailabilitySlotDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM() when $default != null:
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
    TResult Function(_PublicAvailabilitySlotDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM():
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
    TResult? Function(_PublicAvailabilitySlotDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM() when $default != null:
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
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM() when $default != null:
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
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
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM():
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
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
            DateTime? date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicAvailabilitySlotDM() when $default != null:
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PublicAvailabilitySlotDM extends PublicAvailabilitySlotDM {
  const _PublicAvailabilitySlotDM(
      {this.date,
      @JsonKey(name: 'is_full_day') this.isFullDay = true,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime})
      : super._();
  factory _PublicAvailabilitySlotDM.fromJson(Map<String, dynamic> json) =>
      _$PublicAvailabilitySlotDMFromJson(json);

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

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublicAvailabilitySlotDMCopyWith<_PublicAvailabilitySlotDM> get copyWith =>
      __$PublicAvailabilitySlotDMCopyWithImpl<_PublicAvailabilitySlotDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublicAvailabilitySlotDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublicAvailabilitySlotDM &&
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

  @override
  String toString() {
    return 'PublicAvailabilitySlotDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class _$PublicAvailabilitySlotDMCopyWith<$Res>
    implements $PublicAvailabilitySlotDMCopyWith<$Res> {
  factory _$PublicAvailabilitySlotDMCopyWith(_PublicAvailabilitySlotDM value,
          $Res Function(_PublicAvailabilitySlotDM) _then) =
      __$PublicAvailabilitySlotDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$PublicAvailabilitySlotDMCopyWithImpl<$Res>
    implements _$PublicAvailabilitySlotDMCopyWith<$Res> {
  __$PublicAvailabilitySlotDMCopyWithImpl(this._self, this._then);

  final _PublicAvailabilitySlotDM _self;
  final $Res Function(_PublicAvailabilitySlotDM) _then;

  /// Create a copy of PublicAvailabilitySlotDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = freezed,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_PublicAvailabilitySlotDM(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PublicBusinessAvailabilityResponseDM {
  String? get from;
  String? get to;
  List<PublicAvailabilitySlotDM> get availability;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublicBusinessAvailabilityResponseDMCopyWith<
          PublicBusinessAvailabilityResponseDM>
      get copyWith => _$PublicBusinessAvailabilityResponseDMCopyWithImpl<
              PublicBusinessAvailabilityResponseDM>(
          this as PublicBusinessAvailabilityResponseDM, _$identity);

  /// Serializes this PublicBusinessAvailabilityResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicBusinessAvailabilityResponseDM &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, from, to, const DeepCollectionEquality().hash(availability));

  @override
  String toString() {
    return 'PublicBusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  factory $PublicBusinessAvailabilityResponseDMCopyWith(
          PublicBusinessAvailabilityResponseDM value,
          $Res Function(PublicBusinessAvailabilityResponseDM) _then) =
      _$PublicBusinessAvailabilityResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {String? from, String? to, List<PublicAvailabilitySlotDM> availability});
}

/// @nodoc
class _$PublicBusinessAvailabilityResponseDMCopyWithImpl<$Res>
    implements $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  _$PublicBusinessAvailabilityResponseDMCopyWithImpl(this._self, this._then);

  final PublicBusinessAvailabilityResponseDM _self;
  final $Res Function(PublicBusinessAvailabilityResponseDM) _then;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_self.copyWith(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _self.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<PublicAvailabilitySlotDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PublicBusinessAvailabilityResponseDM].
extension PublicBusinessAvailabilityResponseDMPatterns
    on PublicBusinessAvailabilityResponseDM {
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
    TResult Function(_PublicBusinessAvailabilityResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM() when $default != null:
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
    TResult Function(_PublicBusinessAvailabilityResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM():
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
    TResult? Function(_PublicBusinessAvailabilityResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM() when $default != null:
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
    TResult Function(String? from, String? to,
            List<PublicAvailabilitySlotDM> availability)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM() when $default != null:
        return $default(_that.from, _that.to, _that.availability);
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
    TResult Function(String? from, String? to,
            List<PublicAvailabilitySlotDM> availability)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM():
        return $default(_that.from, _that.to, _that.availability);
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
    TResult? Function(String? from, String? to,
            List<PublicAvailabilitySlotDM> availability)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicBusinessAvailabilityResponseDM() when $default != null:
        return $default(_that.from, _that.to, _that.availability);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PublicBusinessAvailabilityResponseDM
    implements PublicBusinessAvailabilityResponseDM {
  const _PublicBusinessAvailabilityResponseDM(
      {this.from,
      this.to,
      final List<PublicAvailabilitySlotDM> availability = const []})
      : _availability = availability;
  factory _PublicBusinessAvailabilityResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$PublicBusinessAvailabilityResponseDMFromJson(json);

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

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublicBusinessAvailabilityResponseDMCopyWith<
          _PublicBusinessAvailabilityResponseDM>
      get copyWith => __$PublicBusinessAvailabilityResponseDMCopyWithImpl<
          _PublicBusinessAvailabilityResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublicBusinessAvailabilityResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublicBusinessAvailabilityResponseDM &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_availability));

  @override
  String toString() {
    return 'PublicBusinessAvailabilityResponseDM(from: $from, to: $to, availability: $availability)';
  }
}

/// @nodoc
abstract mixin class _$PublicBusinessAvailabilityResponseDMCopyWith<$Res>
    implements $PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  factory _$PublicBusinessAvailabilityResponseDMCopyWith(
          _PublicBusinessAvailabilityResponseDM value,
          $Res Function(_PublicBusinessAvailabilityResponseDM) _then) =
      __$PublicBusinessAvailabilityResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? from, String? to, List<PublicAvailabilitySlotDM> availability});
}

/// @nodoc
class __$PublicBusinessAvailabilityResponseDMCopyWithImpl<$Res>
    implements _$PublicBusinessAvailabilityResponseDMCopyWith<$Res> {
  __$PublicBusinessAvailabilityResponseDMCopyWithImpl(this._self, this._then);

  final _PublicBusinessAvailabilityResponseDM _self;
  final $Res Function(_PublicBusinessAvailabilityResponseDM) _then;

  /// Create a copy of PublicBusinessAvailabilityResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? availability = null,
  }) {
    return _then(_PublicBusinessAvailabilityResponseDM(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: null == availability
          ? _self._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<PublicAvailabilitySlotDM>,
    ));
  }
}

/// @nodoc
mixin _$BusinessAvailabilityBulkEntryDM {
  String get date;
  @JsonKey(name: 'is_full_day')
  bool get isFullDay;
  @JsonKey(name: 'start_time')
  String? get startTime;
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessAvailabilityBulkEntryDMCopyWith<BusinessAvailabilityBulkEntryDM>
      get copyWith => _$BusinessAvailabilityBulkEntryDMCopyWithImpl<
              BusinessAvailabilityBulkEntryDM>(
          this as BusinessAvailabilityBulkEntryDM, _$identity);

  /// Serializes this BusinessAvailabilityBulkEntryDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessAvailabilityBulkEntryDM &&
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

  @override
  String toString() {
    return 'BusinessAvailabilityBulkEntryDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  factory $BusinessAvailabilityBulkEntryDMCopyWith(
          BusinessAvailabilityBulkEntryDM value,
          $Res Function(BusinessAvailabilityBulkEntryDM) _then) =
      _$BusinessAvailabilityBulkEntryDMCopyWithImpl;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$BusinessAvailabilityBulkEntryDMCopyWithImpl<$Res>
    implements $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  _$BusinessAvailabilityBulkEntryDMCopyWithImpl(this._self, this._then);

  final BusinessAvailabilityBulkEntryDM _self;
  final $Res Function(BusinessAvailabilityBulkEntryDM) _then;

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
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessAvailabilityBulkEntryDM].
extension BusinessAvailabilityBulkEntryDMPatterns
    on BusinessAvailabilityBulkEntryDM {
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
    TResult Function(_BusinessAvailabilityBulkEntryDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM() when $default != null:
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
    TResult Function(_BusinessAvailabilityBulkEntryDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM():
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
    TResult? Function(_BusinessAvailabilityBulkEntryDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM() when $default != null:
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
            String date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM() when $default != null:
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
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
            String date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM():
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
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
            String date,
            @JsonKey(name: 'is_full_day') bool isFullDay,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessAvailabilityBulkEntryDM() when $default != null:
        return $default(
            _that.date, _that.isFullDay, _that.startTime, _that.endTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessAvailabilityBulkEntryDM
    implements BusinessAvailabilityBulkEntryDM {
  const _BusinessAvailabilityBulkEntryDM(
      {required this.date,
      @JsonKey(name: 'is_full_day') required this.isFullDay,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime});
  factory _BusinessAvailabilityBulkEntryDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityBulkEntryDMFromJson(json);

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

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessAvailabilityBulkEntryDMCopyWith<_BusinessAvailabilityBulkEntryDM>
      get copyWith => __$BusinessAvailabilityBulkEntryDMCopyWithImpl<
          _BusinessAvailabilityBulkEntryDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessAvailabilityBulkEntryDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessAvailabilityBulkEntryDM &&
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

  @override
  String toString() {
    return 'BusinessAvailabilityBulkEntryDM(date: $date, isFullDay: $isFullDay, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class _$BusinessAvailabilityBulkEntryDMCopyWith<$Res>
    implements $BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  factory _$BusinessAvailabilityBulkEntryDMCopyWith(
          _BusinessAvailabilityBulkEntryDM value,
          $Res Function(_BusinessAvailabilityBulkEntryDM) _then) =
      __$BusinessAvailabilityBulkEntryDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'is_full_day') bool isFullDay,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$BusinessAvailabilityBulkEntryDMCopyWithImpl<$Res>
    implements _$BusinessAvailabilityBulkEntryDMCopyWith<$Res> {
  __$BusinessAvailabilityBulkEntryDMCopyWithImpl(this._self, this._then);

  final _BusinessAvailabilityBulkEntryDM _self;
  final $Res Function(_BusinessAvailabilityBulkEntryDM) _then;

  /// Create a copy of BusinessAvailabilityBulkEntryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? isFullDay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_BusinessAvailabilityBulkEntryDM(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      isFullDay: null == isFullDay
          ? _self.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
