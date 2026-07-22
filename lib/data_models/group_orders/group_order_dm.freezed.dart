// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_order_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupOrderItemDM {
  String get uuid;
  @JsonKey(name: 'participant_uuid')
  String? get participantUuid;
  @JsonKey(name: 'name_snapshot')
  String
      get name; // Precio congelado en el lock; antes del lock se usa el preview.
  @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
  double get unitPriceAtLock;
  @JsonKey(name: 'unit_price_preview', fromJson: _money)
  double get unitPricePreview;
  int get quantity;
  String? get notes;

  /// Create a copy of GroupOrderItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrderItemDMCopyWith<GroupOrderItemDM> get copyWith =>
      _$GroupOrderItemDMCopyWithImpl<GroupOrderItemDM>(
          this as GroupOrderItemDM, _$identity);

  /// Serializes this GroupOrderItemDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrderItemDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.participantUuid, participantUuid) ||
                other.participantUuid == participantUuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPriceAtLock, unitPriceAtLock) ||
                other.unitPriceAtLock == unitPriceAtLock) &&
            (identical(other.unitPricePreview, unitPricePreview) ||
                other.unitPricePreview == unitPricePreview) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, participantUuid, name,
      unitPriceAtLock, unitPricePreview, quantity, notes);

  @override
  String toString() {
    return 'GroupOrderItemDM(uuid: $uuid, participantUuid: $participantUuid, name: $name, unitPriceAtLock: $unitPriceAtLock, unitPricePreview: $unitPricePreview, quantity: $quantity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $GroupOrderItemDMCopyWith<$Res> {
  factory $GroupOrderItemDMCopyWith(
          GroupOrderItemDM value, $Res Function(GroupOrderItemDM) _then) =
      _$GroupOrderItemDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'participant_uuid') String? participantUuid,
      @JsonKey(name: 'name_snapshot') String name,
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      double unitPriceAtLock,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      double unitPricePreview,
      int quantity,
      String? notes});
}

/// @nodoc
class _$GroupOrderItemDMCopyWithImpl<$Res>
    implements $GroupOrderItemDMCopyWith<$Res> {
  _$GroupOrderItemDMCopyWithImpl(this._self, this._then);

  final GroupOrderItemDM _self;
  final $Res Function(GroupOrderItemDM) _then;

  /// Create a copy of GroupOrderItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? participantUuid = freezed,
    Object? name = null,
    Object? unitPriceAtLock = null,
    Object? unitPricePreview = null,
    Object? quantity = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      participantUuid: freezed == participantUuid
          ? _self.participantUuid
          : participantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPriceAtLock: null == unitPriceAtLock
          ? _self.unitPriceAtLock
          : unitPriceAtLock // ignore: cast_nullable_to_non_nullable
              as double,
      unitPricePreview: null == unitPricePreview
          ? _self.unitPricePreview
          : unitPricePreview // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupOrderItemDM].
extension GroupOrderItemDMPatterns on GroupOrderItemDM {
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
    TResult Function(_GroupOrderItemDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM() when $default != null:
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
    TResult Function(_GroupOrderItemDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM():
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
    TResult? Function(_GroupOrderItemDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM() when $default != null:
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
            String uuid,
            @JsonKey(name: 'participant_uuid') String? participantUuid,
            @JsonKey(name: 'name_snapshot') String name,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM() when $default != null:
        return $default(
            _that.uuid,
            _that.participantUuid,
            _that.name,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.notes);
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
            String uuid,
            @JsonKey(name: 'participant_uuid') String? participantUuid,
            @JsonKey(name: 'name_snapshot') String name,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM():
        return $default(
            _that.uuid,
            _that.participantUuid,
            _that.name,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.notes);
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
            String uuid,
            @JsonKey(name: 'participant_uuid') String? participantUuid,
            @JsonKey(name: 'name_snapshot') String name,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM() when $default != null:
        return $default(
            _that.uuid,
            _that.participantUuid,
            _that.name,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupOrderItemDM extends GroupOrderItemDM {
  const _GroupOrderItemDM(
      {required this.uuid,
      @JsonKey(name: 'participant_uuid') this.participantUuid,
      @JsonKey(name: 'name_snapshot') this.name = '',
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      this.unitPriceAtLock = 0,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      this.unitPricePreview = 0,
      this.quantity = 1,
      this.notes})
      : super._();
  factory _GroupOrderItemDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderItemDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: 'participant_uuid')
  final String? participantUuid;
  @override
  @JsonKey(name: 'name_snapshot')
  final String name;
// Precio congelado en el lock; antes del lock se usa el preview.
  @override
  @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
  final double unitPriceAtLock;
  @override
  @JsonKey(name: 'unit_price_preview', fromJson: _money)
  final double unitPricePreview;
  @override
  @JsonKey()
  final int quantity;
  @override
  final String? notes;

  /// Create a copy of GroupOrderItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrderItemDMCopyWith<_GroupOrderItemDM> get copyWith =>
      __$GroupOrderItemDMCopyWithImpl<_GroupOrderItemDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupOrderItemDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrderItemDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.participantUuid, participantUuid) ||
                other.participantUuid == participantUuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPriceAtLock, unitPriceAtLock) ||
                other.unitPriceAtLock == unitPriceAtLock) &&
            (identical(other.unitPricePreview, unitPricePreview) ||
                other.unitPricePreview == unitPricePreview) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, participantUuid, name,
      unitPriceAtLock, unitPricePreview, quantity, notes);

  @override
  String toString() {
    return 'GroupOrderItemDM(uuid: $uuid, participantUuid: $participantUuid, name: $name, unitPriceAtLock: $unitPriceAtLock, unitPricePreview: $unitPricePreview, quantity: $quantity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrderItemDMCopyWith<$Res>
    implements $GroupOrderItemDMCopyWith<$Res> {
  factory _$GroupOrderItemDMCopyWith(
          _GroupOrderItemDM value, $Res Function(_GroupOrderItemDM) _then) =
      __$GroupOrderItemDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'participant_uuid') String? participantUuid,
      @JsonKey(name: 'name_snapshot') String name,
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      double unitPriceAtLock,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      double unitPricePreview,
      int quantity,
      String? notes});
}

/// @nodoc
class __$GroupOrderItemDMCopyWithImpl<$Res>
    implements _$GroupOrderItemDMCopyWith<$Res> {
  __$GroupOrderItemDMCopyWithImpl(this._self, this._then);

  final _GroupOrderItemDM _self;
  final $Res Function(_GroupOrderItemDM) _then;

  /// Create a copy of GroupOrderItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? participantUuid = freezed,
    Object? name = null,
    Object? unitPriceAtLock = null,
    Object? unitPricePreview = null,
    Object? quantity = null,
    Object? notes = freezed,
  }) {
    return _then(_GroupOrderItemDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      participantUuid: freezed == participantUuid
          ? _self.participantUuid
          : participantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPriceAtLock: null == unitPriceAtLock
          ? _self.unitPriceAtLock
          : unitPriceAtLock // ignore: cast_nullable_to_non_nullable
              as double,
      unitPricePreview: null == unitPricePreview
          ? _self.unitPricePreview
          : unitPricePreview // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$GroupOrderParticipantDM {
  String get uuid;
  @JsonKey(name: 'display_name')
  String get displayName;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  GroupParticipantRole get role;
  @JsonKey(name: 'payment_status')
  GroupPaymentStatus get paymentStatus;
  @JsonKey(name: 'amount_due', fromJson: _money)
  double get amountDue;
  @JsonKey(name: 'amount_paid', fromJson: _money)
  double get amountPaid;

  /// Create a copy of GroupOrderParticipantDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrderParticipantDMCopyWith<GroupOrderParticipantDM> get copyWith =>
      _$GroupOrderParticipantDMCopyWithImpl<GroupOrderParticipantDM>(
          this as GroupOrderParticipantDM, _$identity);

  /// Serializes this GroupOrderParticipantDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrderParticipantDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.amountDue, amountDue) ||
                other.amountDue == amountDue) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, displayName, avatarUrl,
      role, paymentStatus, amountDue, amountPaid);

  @override
  String toString() {
    return 'GroupOrderParticipantDM(uuid: $uuid, displayName: $displayName, avatarUrl: $avatarUrl, role: $role, paymentStatus: $paymentStatus, amountDue: $amountDue, amountPaid: $amountPaid)';
  }
}

/// @nodoc
abstract mixin class $GroupOrderParticipantDMCopyWith<$Res> {
  factory $GroupOrderParticipantDMCopyWith(GroupOrderParticipantDM value,
          $Res Function(GroupOrderParticipantDM) _then) =
      _$GroupOrderParticipantDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      GroupParticipantRole role,
      @JsonKey(name: 'payment_status') GroupPaymentStatus paymentStatus,
      @JsonKey(name: 'amount_due', fromJson: _money) double amountDue,
      @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid});
}

/// @nodoc
class _$GroupOrderParticipantDMCopyWithImpl<$Res>
    implements $GroupOrderParticipantDMCopyWith<$Res> {
  _$GroupOrderParticipantDMCopyWithImpl(this._self, this._then);

  final GroupOrderParticipantDM _self;
  final $Res Function(GroupOrderParticipantDM) _then;

  /// Create a copy of GroupOrderParticipantDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? role = null,
    Object? paymentStatus = null,
    Object? amountDue = null,
    Object? amountPaid = null,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as GroupParticipantRole,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as GroupPaymentStatus,
      amountDue: null == amountDue
          ? _self.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      amountPaid: null == amountPaid
          ? _self.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupOrderParticipantDM].
extension GroupOrderParticipantDMPatterns on GroupOrderParticipantDM {
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
    TResult Function(_GroupOrderParticipantDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
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
    TResult Function(_GroupOrderParticipantDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM():
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
    TResult? Function(_GroupOrderParticipantDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
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
            String uuid,
            @JsonKey(name: 'display_name') String displayName,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            GroupParticipantRole role,
            @JsonKey(name: 'payment_status') GroupPaymentStatus paymentStatus,
            @JsonKey(name: 'amount_due', fromJson: _money) double amountDue,
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
        return $default(_that.uuid, _that.displayName, _that.avatarUrl,
            _that.role, _that.paymentStatus, _that.amountDue, _that.amountPaid);
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
            String uuid,
            @JsonKey(name: 'display_name') String displayName,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            GroupParticipantRole role,
            @JsonKey(name: 'payment_status') GroupPaymentStatus paymentStatus,
            @JsonKey(name: 'amount_due', fromJson: _money) double amountDue,
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM():
        return $default(_that.uuid, _that.displayName, _that.avatarUrl,
            _that.role, _that.paymentStatus, _that.amountDue, _that.amountPaid);
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
            String uuid,
            @JsonKey(name: 'display_name') String displayName,
            @JsonKey(name: 'avatar_url') String? avatarUrl,
            GroupParticipantRole role,
            @JsonKey(name: 'payment_status') GroupPaymentStatus paymentStatus,
            @JsonKey(name: 'amount_due', fromJson: _money) double amountDue,
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
        return $default(_that.uuid, _that.displayName, _that.avatarUrl,
            _that.role, _that.paymentStatus, _that.amountDue, _that.amountPaid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupOrderParticipantDM extends GroupOrderParticipantDM {
  const _GroupOrderParticipantDM(
      {required this.uuid,
      @JsonKey(name: 'display_name') this.displayName = '',
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      this.role = GroupParticipantRole.member,
      @JsonKey(name: 'payment_status')
      this.paymentStatus = GroupPaymentStatus.pending,
      @JsonKey(name: 'amount_due', fromJson: _money) this.amountDue = 0,
      @JsonKey(name: 'amount_paid', fromJson: _money) this.amountPaid = 0})
      : super._();
  factory _GroupOrderParticipantDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderParticipantDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey()
  final GroupParticipantRole role;
  @override
  @JsonKey(name: 'payment_status')
  final GroupPaymentStatus paymentStatus;
  @override
  @JsonKey(name: 'amount_due', fromJson: _money)
  final double amountDue;
  @override
  @JsonKey(name: 'amount_paid', fromJson: _money)
  final double amountPaid;

  /// Create a copy of GroupOrderParticipantDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrderParticipantDMCopyWith<_GroupOrderParticipantDM> get copyWith =>
      __$GroupOrderParticipantDMCopyWithImpl<_GroupOrderParticipantDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupOrderParticipantDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrderParticipantDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.amountDue, amountDue) ||
                other.amountDue == amountDue) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, displayName, avatarUrl,
      role, paymentStatus, amountDue, amountPaid);

  @override
  String toString() {
    return 'GroupOrderParticipantDM(uuid: $uuid, displayName: $displayName, avatarUrl: $avatarUrl, role: $role, paymentStatus: $paymentStatus, amountDue: $amountDue, amountPaid: $amountPaid)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrderParticipantDMCopyWith<$Res>
    implements $GroupOrderParticipantDMCopyWith<$Res> {
  factory _$GroupOrderParticipantDMCopyWith(_GroupOrderParticipantDM value,
          $Res Function(_GroupOrderParticipantDM) _then) =
      __$GroupOrderParticipantDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      GroupParticipantRole role,
      @JsonKey(name: 'payment_status') GroupPaymentStatus paymentStatus,
      @JsonKey(name: 'amount_due', fromJson: _money) double amountDue,
      @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid});
}

/// @nodoc
class __$GroupOrderParticipantDMCopyWithImpl<$Res>
    implements _$GroupOrderParticipantDMCopyWith<$Res> {
  __$GroupOrderParticipantDMCopyWithImpl(this._self, this._then);

  final _GroupOrderParticipantDM _self;
  final $Res Function(_GroupOrderParticipantDM) _then;

  /// Create a copy of GroupOrderParticipantDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? role = null,
    Object? paymentStatus = null,
    Object? amountDue = null,
    Object? amountPaid = null,
  }) {
    return _then(_GroupOrderParticipantDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as GroupParticipantRole,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as GroupPaymentStatus,
      amountDue: null == amountDue
          ? _self.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      amountPaid: null == amountPaid
          ? _self.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$GroupOrderDM {
  String get uuid;
  GroupOrderStatus get status;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'business_name')
  String get businessName;
  @JsonKey(name: 'business_logo')
  String? get businessLogo;
  String get currency;
  @JsonKey(fromJson: _money)
  double get subtotal;
  @JsonKey(name: 'total_amount', fromJson: _money)
  double get totalAmount;
  @JsonKey(name: 'total_paid', fromJson: _money)
  double get totalPaid;
  @JsonKey(name: 'lock_expires_at')
  DateTime? get lockExpiresAt;
  List<GroupOrderParticipantDM> get participants;
  List<GroupOrderItemDM> get items;

  /// Create a copy of GroupOrderDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrderDMCopyWith<GroupOrderDM> get copyWith =>
      _$GroupOrderDMCopyWithImpl<GroupOrderDM>(
          this as GroupOrderDM, _$identity);

  /// Serializes this GroupOrderDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrderDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.lockExpiresAt, lockExpiresAt) ||
                other.lockExpiresAt == lockExpiresAt) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      status,
      businessUuid,
      businessName,
      businessLogo,
      currency,
      subtotal,
      totalAmount,
      totalPaid,
      lockExpiresAt,
      const DeepCollectionEquality().hash(participants),
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'GroupOrderDM(uuid: $uuid, status: $status, businessUuid: $businessUuid, businessName: $businessName, businessLogo: $businessLogo, currency: $currency, subtotal: $subtotal, totalAmount: $totalAmount, totalPaid: $totalPaid, lockExpiresAt: $lockExpiresAt, participants: $participants, items: $items)';
  }
}

/// @nodoc
abstract mixin class $GroupOrderDMCopyWith<$Res> {
  factory $GroupOrderDMCopyWith(
          GroupOrderDM value, $Res Function(GroupOrderDM) _then) =
      _$GroupOrderDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      GroupOrderStatus status,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      String currency,
      @JsonKey(fromJson: _money) double subtotal,
      @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
      @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
      @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
      List<GroupOrderParticipantDM> participants,
      List<GroupOrderItemDM> items});
}

/// @nodoc
class _$GroupOrderDMCopyWithImpl<$Res> implements $GroupOrderDMCopyWith<$Res> {
  _$GroupOrderDMCopyWithImpl(this._self, this._then);

  final GroupOrderDM _self;
  final $Res Function(GroupOrderDM) _then;

  /// Create a copy of GroupOrderDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? status = null,
    Object? businessUuid = freezed,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? currency = null,
    Object? subtotal = null,
    Object? totalAmount = null,
    Object? totalPaid = null,
    Object? lockExpiresAt = freezed,
    Object? participants = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GroupOrderStatus,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      lockExpiresAt: freezed == lockExpiresAt
          ? _self.lockExpiresAt
          : lockExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participants: null == participants
          ? _self.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderParticipantDM>,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderItemDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupOrderDM].
extension GroupOrderDMPatterns on GroupOrderDM {
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
    TResult Function(_GroupOrderDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM() when $default != null:
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
    TResult Function(_GroupOrderDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM():
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
    TResult? Function(_GroupOrderDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM() when $default != null:
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
            String uuid,
            GroupOrderStatus status,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            String currency,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            List<GroupOrderParticipantDM> participants,
            List<GroupOrderItemDM> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM() when $default != null:
        return $default(
            _that.uuid,
            _that.status,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.currency,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.lockExpiresAt,
            _that.participants,
            _that.items);
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
            String uuid,
            GroupOrderStatus status,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            String currency,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            List<GroupOrderParticipantDM> participants,
            List<GroupOrderItemDM> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM():
        return $default(
            _that.uuid,
            _that.status,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.currency,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.lockExpiresAt,
            _that.participants,
            _that.items);
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
            String uuid,
            GroupOrderStatus status,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            String currency,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            List<GroupOrderParticipantDM> participants,
            List<GroupOrderItemDM> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderDM() when $default != null:
        return $default(
            _that.uuid,
            _that.status,
            _that.businessUuid,
            _that.businessName,
            _that.businessLogo,
            _that.currency,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.lockExpiresAt,
            _that.participants,
            _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupOrderDM extends GroupOrderDM {
  const _GroupOrderDM(
      {required this.uuid,
      this.status = GroupOrderStatus.open,
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_logo') this.businessLogo,
      this.currency = 'EUR',
      @JsonKey(fromJson: _money) this.subtotal = 0,
      @JsonKey(name: 'total_amount', fromJson: _money) this.totalAmount = 0,
      @JsonKey(name: 'total_paid', fromJson: _money) this.totalPaid = 0,
      @JsonKey(name: 'lock_expires_at') this.lockExpiresAt,
      final List<GroupOrderParticipantDM> participants =
          const <GroupOrderParticipantDM>[],
      final List<GroupOrderItemDM> items = const <GroupOrderItemDM>[]})
      : _participants = participants,
        _items = items,
        super._();
  factory _GroupOrderDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderDMFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey()
  final GroupOrderStatus status;
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_logo')
  final String? businessLogo;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _money)
  final double subtotal;
  @override
  @JsonKey(name: 'total_amount', fromJson: _money)
  final double totalAmount;
  @override
  @JsonKey(name: 'total_paid', fromJson: _money)
  final double totalPaid;
  @override
  @JsonKey(name: 'lock_expires_at')
  final DateTime? lockExpiresAt;
  final List<GroupOrderParticipantDM> _participants;
  @override
  @JsonKey()
  List<GroupOrderParticipantDM> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<GroupOrderItemDM> _items;
  @override
  @JsonKey()
  List<GroupOrderItemDM> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of GroupOrderDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrderDMCopyWith<_GroupOrderDM> get copyWith =>
      __$GroupOrderDMCopyWithImpl<_GroupOrderDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupOrderDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrderDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.lockExpiresAt, lockExpiresAt) ||
                other.lockExpiresAt == lockExpiresAt) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      status,
      businessUuid,
      businessName,
      businessLogo,
      currency,
      subtotal,
      totalAmount,
      totalPaid,
      lockExpiresAt,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'GroupOrderDM(uuid: $uuid, status: $status, businessUuid: $businessUuid, businessName: $businessName, businessLogo: $businessLogo, currency: $currency, subtotal: $subtotal, totalAmount: $totalAmount, totalPaid: $totalPaid, lockExpiresAt: $lockExpiresAt, participants: $participants, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrderDMCopyWith<$Res>
    implements $GroupOrderDMCopyWith<$Res> {
  factory _$GroupOrderDMCopyWith(
          _GroupOrderDM value, $Res Function(_GroupOrderDM) _then) =
      __$GroupOrderDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      GroupOrderStatus status,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      String currency,
      @JsonKey(fromJson: _money) double subtotal,
      @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
      @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
      @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
      List<GroupOrderParticipantDM> participants,
      List<GroupOrderItemDM> items});
}

/// @nodoc
class __$GroupOrderDMCopyWithImpl<$Res>
    implements _$GroupOrderDMCopyWith<$Res> {
  __$GroupOrderDMCopyWithImpl(this._self, this._then);

  final _GroupOrderDM _self;
  final $Res Function(_GroupOrderDM) _then;

  /// Create a copy of GroupOrderDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? status = null,
    Object? businessUuid = freezed,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? currency = null,
    Object? subtotal = null,
    Object? totalAmount = null,
    Object? totalPaid = null,
    Object? lockExpiresAt = freezed,
    Object? participants = null,
    Object? items = null,
  }) {
    return _then(_GroupOrderDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as GroupOrderStatus,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      lockExpiresAt: freezed == lockExpiresAt
          ? _self.lockExpiresAt
          : lockExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participants: null == participants
          ? _self._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderParticipantDM>,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderItemDM>,
    ));
  }
}

/// @nodoc
mixin _$GroupOrderResponseDM {
  bool get success;
  @JsonKey(name: 'group_order')
  GroupOrderDM get groupOrder;
  @JsonKey(name: 'my_share', fromJson: _money)
  double get myShare;
  @JsonKey(name: 'my_participant_uuid')
  String? get myParticipantUuid;

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrderResponseDMCopyWith<GroupOrderResponseDM> get copyWith =>
      _$GroupOrderResponseDMCopyWithImpl<GroupOrderResponseDM>(
          this as GroupOrderResponseDM, _$identity);

  /// Serializes this GroupOrderResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrderResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.groupOrder, groupOrder) ||
                other.groupOrder == groupOrder) &&
            (identical(other.myShare, myShare) || other.myShare == myShare) &&
            (identical(other.myParticipantUuid, myParticipantUuid) ||
                other.myParticipantUuid == myParticipantUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, groupOrder, myShare, myParticipantUuid);

  @override
  String toString() {
    return 'GroupOrderResponseDM(success: $success, groupOrder: $groupOrder, myShare: $myShare, myParticipantUuid: $myParticipantUuid)';
  }
}

/// @nodoc
abstract mixin class $GroupOrderResponseDMCopyWith<$Res> {
  factory $GroupOrderResponseDMCopyWith(GroupOrderResponseDM value,
          $Res Function(GroupOrderResponseDM) _then) =
      _$GroupOrderResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_order') GroupOrderDM groupOrder,
      @JsonKey(name: 'my_share', fromJson: _money) double myShare,
      @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid});

  $GroupOrderDMCopyWith<$Res> get groupOrder;
}

/// @nodoc
class _$GroupOrderResponseDMCopyWithImpl<$Res>
    implements $GroupOrderResponseDMCopyWith<$Res> {
  _$GroupOrderResponseDMCopyWithImpl(this._self, this._then);

  final GroupOrderResponseDM _self;
  final $Res Function(GroupOrderResponseDM) _then;

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? groupOrder = null,
    Object? myShare = null,
    Object? myParticipantUuid = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrder: null == groupOrder
          ? _self.groupOrder
          : groupOrder // ignore: cast_nullable_to_non_nullable
              as GroupOrderDM,
      myShare: null == myShare
          ? _self.myShare
          : myShare // ignore: cast_nullable_to_non_nullable
              as double,
      myParticipantUuid: freezed == myParticipantUuid
          ? _self.myParticipantUuid
          : myParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupOrderDMCopyWith<$Res> get groupOrder {
    return $GroupOrderDMCopyWith<$Res>(_self.groupOrder, (value) {
      return _then(_self.copyWith(groupOrder: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GroupOrderResponseDM].
extension GroupOrderResponseDMPatterns on GroupOrderResponseDM {
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
    TResult Function(_GroupOrderResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM() when $default != null:
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
    TResult Function(_GroupOrderResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM():
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
    TResult? Function(_GroupOrderResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM() when $default != null:
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
            bool success,
            @JsonKey(name: 'group_order') GroupOrderDM groupOrder,
            @JsonKey(name: 'my_share', fromJson: _money) double myShare,
            @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM() when $default != null:
        return $default(_that.success, _that.groupOrder, _that.myShare,
            _that.myParticipantUuid);
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
            bool success,
            @JsonKey(name: 'group_order') GroupOrderDM groupOrder,
            @JsonKey(name: 'my_share', fromJson: _money) double myShare,
            @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM():
        return $default(_that.success, _that.groupOrder, _that.myShare,
            _that.myParticipantUuid);
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
            bool success,
            @JsonKey(name: 'group_order') GroupOrderDM groupOrder,
            @JsonKey(name: 'my_share', fromJson: _money) double myShare,
            @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderResponseDM() when $default != null:
        return $default(_that.success, _that.groupOrder, _that.myShare,
            _that.myParticipantUuid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupOrderResponseDM implements GroupOrderResponseDM {
  const _GroupOrderResponseDM(
      {this.success = true,
      @JsonKey(name: 'group_order') required this.groupOrder,
      @JsonKey(name: 'my_share', fromJson: _money) this.myShare = 0,
      @JsonKey(name: 'my_participant_uuid') this.myParticipantUuid});
  factory _GroupOrderResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrderResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'group_order')
  final GroupOrderDM groupOrder;
  @override
  @JsonKey(name: 'my_share', fromJson: _money)
  final double myShare;
  @override
  @JsonKey(name: 'my_participant_uuid')
  final String? myParticipantUuid;

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrderResponseDMCopyWith<_GroupOrderResponseDM> get copyWith =>
      __$GroupOrderResponseDMCopyWithImpl<_GroupOrderResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupOrderResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrderResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.groupOrder, groupOrder) ||
                other.groupOrder == groupOrder) &&
            (identical(other.myShare, myShare) || other.myShare == myShare) &&
            (identical(other.myParticipantUuid, myParticipantUuid) ||
                other.myParticipantUuid == myParticipantUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, groupOrder, myShare, myParticipantUuid);

  @override
  String toString() {
    return 'GroupOrderResponseDM(success: $success, groupOrder: $groupOrder, myShare: $myShare, myParticipantUuid: $myParticipantUuid)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrderResponseDMCopyWith<$Res>
    implements $GroupOrderResponseDMCopyWith<$Res> {
  factory _$GroupOrderResponseDMCopyWith(_GroupOrderResponseDM value,
          $Res Function(_GroupOrderResponseDM) _then) =
      __$GroupOrderResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_order') GroupOrderDM groupOrder,
      @JsonKey(name: 'my_share', fromJson: _money) double myShare,
      @JsonKey(name: 'my_participant_uuid') String? myParticipantUuid});

  @override
  $GroupOrderDMCopyWith<$Res> get groupOrder;
}

/// @nodoc
class __$GroupOrderResponseDMCopyWithImpl<$Res>
    implements _$GroupOrderResponseDMCopyWith<$Res> {
  __$GroupOrderResponseDMCopyWithImpl(this._self, this._then);

  final _GroupOrderResponseDM _self;
  final $Res Function(_GroupOrderResponseDM) _then;

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? groupOrder = null,
    Object? myShare = null,
    Object? myParticipantUuid = freezed,
  }) {
    return _then(_GroupOrderResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrder: null == groupOrder
          ? _self.groupOrder
          : groupOrder // ignore: cast_nullable_to_non_nullable
              as GroupOrderDM,
      myShare: null == myShare
          ? _self.myShare
          : myShare // ignore: cast_nullable_to_non_nullable
              as double,
      myParticipantUuid: freezed == myParticipantUuid
          ? _self.myParticipantUuid
          : myParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of GroupOrderResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupOrderDMCopyWith<$Res> get groupOrder {
    return $GroupOrderDMCopyWith<$Res>(_self.groupOrder, (value) {
      return _then(_self.copyWith(groupOrder: value));
    });
  }
}

/// @nodoc
mixin _$GroupOrdersListResponseDM {
  bool get success;
  @JsonKey(name: 'group_orders')
  List<GroupOrderDM> get groupOrders;

  /// Create a copy of GroupOrdersListResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupOrdersListResponseDMCopyWith<GroupOrdersListResponseDM> get copyWith =>
      _$GroupOrdersListResponseDMCopyWithImpl<GroupOrdersListResponseDM>(
          this as GroupOrdersListResponseDM, _$identity);

  /// Serializes this GroupOrdersListResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupOrdersListResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other.groupOrders, groupOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(groupOrders));

  @override
  String toString() {
    return 'GroupOrdersListResponseDM(success: $success, groupOrders: $groupOrders)';
  }
}

/// @nodoc
abstract mixin class $GroupOrdersListResponseDMCopyWith<$Res> {
  factory $GroupOrdersListResponseDMCopyWith(GroupOrdersListResponseDM value,
          $Res Function(GroupOrdersListResponseDM) _then) =
      _$GroupOrdersListResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_orders') List<GroupOrderDM> groupOrders});
}

/// @nodoc
class _$GroupOrdersListResponseDMCopyWithImpl<$Res>
    implements $GroupOrdersListResponseDMCopyWith<$Res> {
  _$GroupOrdersListResponseDMCopyWithImpl(this._self, this._then);

  final GroupOrdersListResponseDM _self;
  final $Res Function(GroupOrdersListResponseDM) _then;

  /// Create a copy of GroupOrdersListResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? groupOrders = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrders: null == groupOrders
          ? _self.groupOrders
          : groupOrders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupOrdersListResponseDM].
extension GroupOrdersListResponseDMPatterns on GroupOrdersListResponseDM {
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
    TResult Function(_GroupOrdersListResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM() when $default != null:
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
    TResult Function(_GroupOrdersListResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM():
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
    TResult? Function(_GroupOrdersListResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM() when $default != null:
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
    TResult Function(bool success,
            @JsonKey(name: 'group_orders') List<GroupOrderDM> groupOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM() when $default != null:
        return $default(_that.success, _that.groupOrders);
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
    TResult Function(bool success,
            @JsonKey(name: 'group_orders') List<GroupOrderDM> groupOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM():
        return $default(_that.success, _that.groupOrders);
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
    TResult? Function(bool success,
            @JsonKey(name: 'group_orders') List<GroupOrderDM> groupOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrdersListResponseDM() when $default != null:
        return $default(_that.success, _that.groupOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupOrdersListResponseDM implements GroupOrdersListResponseDM {
  const _GroupOrdersListResponseDM(
      {this.success = true,
      @JsonKey(name: 'group_orders')
      final List<GroupOrderDM> groupOrders = const <GroupOrderDM>[]})
      : _groupOrders = groupOrders;
  factory _GroupOrdersListResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupOrdersListResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<GroupOrderDM> _groupOrders;
  @override
  @JsonKey(name: 'group_orders')
  List<GroupOrderDM> get groupOrders {
    if (_groupOrders is EqualUnmodifiableListView) return _groupOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupOrders);
  }

  /// Create a copy of GroupOrdersListResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupOrdersListResponseDMCopyWith<_GroupOrdersListResponseDM>
      get copyWith =>
          __$GroupOrdersListResponseDMCopyWithImpl<_GroupOrdersListResponseDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupOrdersListResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupOrdersListResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._groupOrders, _groupOrders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_groupOrders));

  @override
  String toString() {
    return 'GroupOrdersListResponseDM(success: $success, groupOrders: $groupOrders)';
  }
}

/// @nodoc
abstract mixin class _$GroupOrdersListResponseDMCopyWith<$Res>
    implements $GroupOrdersListResponseDMCopyWith<$Res> {
  factory _$GroupOrdersListResponseDMCopyWith(_GroupOrdersListResponseDM value,
          $Res Function(_GroupOrdersListResponseDM) _then) =
      __$GroupOrdersListResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'group_orders') List<GroupOrderDM> groupOrders});
}

/// @nodoc
class __$GroupOrdersListResponseDMCopyWithImpl<$Res>
    implements _$GroupOrdersListResponseDMCopyWith<$Res> {
  __$GroupOrdersListResponseDMCopyWithImpl(this._self, this._then);

  final _GroupOrdersListResponseDM _self;
  final $Res Function(_GroupOrdersListResponseDM) _then;

  /// Create a copy of GroupOrdersListResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? groupOrders = null,
  }) {
    return _then(_GroupOrdersListResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrders: null == groupOrders
          ? _self._groupOrders
          : groupOrders // ignore: cast_nullable_to_non_nullable
              as List<GroupOrderDM>,
    ));
  }
}

/// @nodoc
mixin _$PayIntentResponseDM {
  @JsonKey(name: 'client_secret')
  String? get clientSecret;
  @JsonKey(name: 'transaction_uuid')
  String? get transactionUuid;
  @JsonKey(fromJson: _money)
  double get amount;
  String get currency;

  /// Create a copy of PayIntentResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayIntentResponseDMCopyWith<PayIntentResponseDM> get copyWith =>
      _$PayIntentResponseDMCopyWithImpl<PayIntentResponseDM>(
          this as PayIntentResponseDM, _$identity);

  /// Serializes this PayIntentResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayIntentResponseDM &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.transactionUuid, transactionUuid) ||
                other.transactionUuid == transactionUuid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientSecret, transactionUuid, amount, currency);

  @override
  String toString() {
    return 'PayIntentResponseDM(clientSecret: $clientSecret, transactionUuid: $transactionUuid, amount: $amount, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $PayIntentResponseDMCopyWith<$Res> {
  factory $PayIntentResponseDMCopyWith(
          PayIntentResponseDM value, $Res Function(PayIntentResponseDM) _then) =
      _$PayIntentResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_secret') String? clientSecret,
      @JsonKey(name: 'transaction_uuid') String? transactionUuid,
      @JsonKey(fromJson: _money) double amount,
      String currency});
}

/// @nodoc
class _$PayIntentResponseDMCopyWithImpl<$Res>
    implements $PayIntentResponseDMCopyWith<$Res> {
  _$PayIntentResponseDMCopyWithImpl(this._self, this._then);

  final PayIntentResponseDM _self;
  final $Res Function(PayIntentResponseDM) _then;

  /// Create a copy of PayIntentResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = freezed,
    Object? transactionUuid = freezed,
    Object? amount = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: freezed == transactionUuid
          ? _self.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PayIntentResponseDM].
extension PayIntentResponseDMPatterns on PayIntentResponseDM {
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
    TResult Function(_PayIntentResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
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
    TResult Function(_PayIntentResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM():
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
    TResult? Function(_PayIntentResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
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
            @JsonKey(name: 'client_secret') String? clientSecret,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            String currency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
        return $default(_that.clientSecret, _that.transactionUuid, _that.amount,
            _that.currency);
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
            @JsonKey(name: 'client_secret') String? clientSecret,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            String currency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM():
        return $default(_that.clientSecret, _that.transactionUuid, _that.amount,
            _that.currency);
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
            @JsonKey(name: 'client_secret') String? clientSecret,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            String currency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
        return $default(_that.clientSecret, _that.transactionUuid, _that.amount,
            _that.currency);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PayIntentResponseDM implements PayIntentResponseDM {
  const _PayIntentResponseDM(
      {@JsonKey(name: 'client_secret') this.clientSecret,
      @JsonKey(name: 'transaction_uuid') this.transactionUuid,
      @JsonKey(fromJson: _money) this.amount = 0,
      this.currency = 'EUR'});
  factory _PayIntentResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PayIntentResponseDMFromJson(json);

  @override
  @JsonKey(name: 'client_secret')
  final String? clientSecret;
  @override
  @JsonKey(name: 'transaction_uuid')
  final String? transactionUuid;
  @override
  @JsonKey(fromJson: _money)
  final double amount;
  @override
  @JsonKey()
  final String currency;

  /// Create a copy of PayIntentResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayIntentResponseDMCopyWith<_PayIntentResponseDM> get copyWith =>
      __$PayIntentResponseDMCopyWithImpl<_PayIntentResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayIntentResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayIntentResponseDM &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.transactionUuid, transactionUuid) ||
                other.transactionUuid == transactionUuid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientSecret, transactionUuid, amount, currency);

  @override
  String toString() {
    return 'PayIntentResponseDM(clientSecret: $clientSecret, transactionUuid: $transactionUuid, amount: $amount, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$PayIntentResponseDMCopyWith<$Res>
    implements $PayIntentResponseDMCopyWith<$Res> {
  factory _$PayIntentResponseDMCopyWith(_PayIntentResponseDM value,
          $Res Function(_PayIntentResponseDM) _then) =
      __$PayIntentResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_secret') String? clientSecret,
      @JsonKey(name: 'transaction_uuid') String? transactionUuid,
      @JsonKey(fromJson: _money) double amount,
      String currency});
}

/// @nodoc
class __$PayIntentResponseDMCopyWithImpl<$Res>
    implements _$PayIntentResponseDMCopyWith<$Res> {
  __$PayIntentResponseDMCopyWithImpl(this._self, this._then);

  final _PayIntentResponseDM _self;
  final $Res Function(_PayIntentResponseDM) _then;

  /// Create a copy of PayIntentResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientSecret = freezed,
    Object? transactionUuid = freezed,
    Object? amount = null,
    Object? currency = null,
  }) {
    return _then(_PayIntentResponseDM(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: freezed == transactionUuid
          ? _self.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$GroupInviteResponseDM {
  bool get success;
  @JsonKey(name: 'invite_token')
  String? get inviteToken;
  @JsonKey(name: 'invite_url')
  String? get inviteUrl;

  /// Create a copy of GroupInviteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupInviteResponseDMCopyWith<GroupInviteResponseDM> get copyWith =>
      _$GroupInviteResponseDMCopyWithImpl<GroupInviteResponseDM>(
          this as GroupInviteResponseDM, _$identity);

  /// Serializes this GroupInviteResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupInviteResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.inviteToken, inviteToken) ||
                other.inviteToken == inviteToken) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, inviteToken, inviteUrl);

  @override
  String toString() {
    return 'GroupInviteResponseDM(success: $success, inviteToken: $inviteToken, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class $GroupInviteResponseDMCopyWith<$Res> {
  factory $GroupInviteResponseDMCopyWith(GroupInviteResponseDM value,
          $Res Function(GroupInviteResponseDM) _then) =
      _$GroupInviteResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'invite_token') String? inviteToken,
      @JsonKey(name: 'invite_url') String? inviteUrl});
}

/// @nodoc
class _$GroupInviteResponseDMCopyWithImpl<$Res>
    implements $GroupInviteResponseDMCopyWith<$Res> {
  _$GroupInviteResponseDMCopyWithImpl(this._self, this._then);

  final GroupInviteResponseDM _self;
  final $Res Function(GroupInviteResponseDM) _then;

  /// Create a copy of GroupInviteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? inviteToken = freezed,
    Object? inviteUrl = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      inviteToken: freezed == inviteToken
          ? _self.inviteToken
          : inviteToken // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteUrl: freezed == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GroupInviteResponseDM].
extension GroupInviteResponseDMPatterns on GroupInviteResponseDM {
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
    TResult Function(_GroupInviteResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
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
    TResult Function(_GroupInviteResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM():
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
    TResult? Function(_GroupInviteResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
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
            bool success,
            @JsonKey(name: 'invite_token') String? inviteToken,
            @JsonKey(name: 'invite_url') String? inviteUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
        return $default(_that.success, _that.inviteToken, _that.inviteUrl);
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
            bool success,
            @JsonKey(name: 'invite_token') String? inviteToken,
            @JsonKey(name: 'invite_url') String? inviteUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM():
        return $default(_that.success, _that.inviteToken, _that.inviteUrl);
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
            bool success,
            @JsonKey(name: 'invite_token') String? inviteToken,
            @JsonKey(name: 'invite_url') String? inviteUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
        return $default(_that.success, _that.inviteToken, _that.inviteUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GroupInviteResponseDM implements GroupInviteResponseDM {
  const _GroupInviteResponseDM(
      {this.success = true,
      @JsonKey(name: 'invite_token') this.inviteToken,
      @JsonKey(name: 'invite_url') this.inviteUrl});
  factory _GroupInviteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'invite_token')
  final String? inviteToken;
  @override
  @JsonKey(name: 'invite_url')
  final String? inviteUrl;

  /// Create a copy of GroupInviteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupInviteResponseDMCopyWith<_GroupInviteResponseDM> get copyWith =>
      __$GroupInviteResponseDMCopyWithImpl<_GroupInviteResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupInviteResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupInviteResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.inviteToken, inviteToken) ||
                other.inviteToken == inviteToken) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, inviteToken, inviteUrl);

  @override
  String toString() {
    return 'GroupInviteResponseDM(success: $success, inviteToken: $inviteToken, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class _$GroupInviteResponseDMCopyWith<$Res>
    implements $GroupInviteResponseDMCopyWith<$Res> {
  factory _$GroupInviteResponseDMCopyWith(_GroupInviteResponseDM value,
          $Res Function(_GroupInviteResponseDM) _then) =
      __$GroupInviteResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'invite_token') String? inviteToken,
      @JsonKey(name: 'invite_url') String? inviteUrl});
}

/// @nodoc
class __$GroupInviteResponseDMCopyWithImpl<$Res>
    implements _$GroupInviteResponseDMCopyWith<$Res> {
  __$GroupInviteResponseDMCopyWithImpl(this._self, this._then);

  final _GroupInviteResponseDM _self;
  final $Res Function(_GroupInviteResponseDM) _then;

  /// Create a copy of GroupInviteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? inviteToken = freezed,
    Object? inviteUrl = freezed,
  }) {
    return _then(_GroupInviteResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      inviteToken: freezed == inviteToken
          ? _self.inviteToken
          : inviteToken // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteUrl: freezed == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
