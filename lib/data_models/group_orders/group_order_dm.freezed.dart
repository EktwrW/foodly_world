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
      get name; // Tamaño elegido por el comensal. null = regular, que es la versión por
// defecto y no se muestra: sólo mediana y grande dicen algo. Un valor
// desconocido cae a null en vez de romper la orden entera.
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Version?
      get version; // Precio congelado en el lock; antes del lock se usa el preview.
  @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
  double get unitPriceAtLock;
  @JsonKey(name: 'unit_price_preview', fromJson: _money)
  double get unitPricePreview;
  int get quantity; // Compartido (F2c): su importe se reparte entre todos en by_items.
  bool get shared;
  String? get notes; // F4a: tilde de entrega del manager (checklist parcial).
  @JsonKey(name: 'delivered_at')
  DateTime?
      get deliveredAt; // F4b (cuenta abierta): tanda enviada a cocina. sentAt null = sigue en
// el carrito (editable) y es lo que habilita "Enviar orden".
  @JsonKey(name: 'batch_no')
  int? get batchNo;
  @JsonKey(name: 'sent_at')
  DateTime?
      get sentAt; // F4b.1: el negocio anuló el ítem (plato devuelto/mal preparado): sigue
// visible con su motivo, pero NO se cobra.
  @JsonKey(name: 'voided_at')
  DateTime? get voidedAt;
  @JsonKey(name: 'voided_reason')
  String? get voidedReason;

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
            (identical(other.version, version) || other.version == version) &&
            (identical(other.unitPriceAtLock, unitPriceAtLock) ||
                other.unitPriceAtLock == unitPriceAtLock) &&
            (identical(other.unitPricePreview, unitPricePreview) ||
                other.unitPricePreview == unitPricePreview) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.shared, shared) || other.shared == shared) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.voidedReason, voidedReason) ||
                other.voidedReason == voidedReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      participantUuid,
      name,
      version,
      unitPriceAtLock,
      unitPricePreview,
      quantity,
      shared,
      notes,
      deliveredAt,
      batchNo,
      sentAt,
      voidedAt,
      voidedReason);

  @override
  String toString() {
    return 'GroupOrderItemDM(uuid: $uuid, participantUuid: $participantUuid, name: $name, version: $version, unitPriceAtLock: $unitPriceAtLock, unitPricePreview: $unitPricePreview, quantity: $quantity, shared: $shared, notes: $notes, deliveredAt: $deliveredAt, batchNo: $batchNo, sentAt: $sentAt, voidedAt: $voidedAt, voidedReason: $voidedReason)';
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
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Version? version,
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      double unitPriceAtLock,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      double unitPricePreview,
      int quantity,
      bool shared,
      String? notes,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'batch_no') int? batchNo,
      @JsonKey(name: 'sent_at') DateTime? sentAt,
      @JsonKey(name: 'voided_at') DateTime? voidedAt,
      @JsonKey(name: 'voided_reason') String? voidedReason});
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
    Object? version = freezed,
    Object? unitPriceAtLock = null,
    Object? unitPricePreview = null,
    Object? quantity = null,
    Object? shared = null,
    Object? notes = freezed,
    Object? deliveredAt = freezed,
    Object? batchNo = freezed,
    Object? sentAt = freezed,
    Object? voidedAt = freezed,
    Object? voidedReason = freezed,
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
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version?,
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
      shared: null == shared
          ? _self.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _self.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as int?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voidedAt: freezed == voidedAt
          ? _self.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voidedReason: freezed == voidedReason
          ? _self.voidedReason
          : voidedReason // ignore: cast_nullable_to_non_nullable
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
            @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            Version? version,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            bool shared,
            String? notes,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'batch_no') int? batchNo,
            @JsonKey(name: 'sent_at') DateTime? sentAt,
            @JsonKey(name: 'voided_at') DateTime? voidedAt,
            @JsonKey(name: 'voided_reason') String? voidedReason)?
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
            _that.version,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.shared,
            _that.notes,
            _that.deliveredAt,
            _that.batchNo,
            _that.sentAt,
            _that.voidedAt,
            _that.voidedReason);
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
            @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            Version? version,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            bool shared,
            String? notes,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'batch_no') int? batchNo,
            @JsonKey(name: 'sent_at') DateTime? sentAt,
            @JsonKey(name: 'voided_at') DateTime? voidedAt,
            @JsonKey(name: 'voided_reason') String? voidedReason)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM():
        return $default(
            _that.uuid,
            _that.participantUuid,
            _that.name,
            _that.version,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.shared,
            _that.notes,
            _that.deliveredAt,
            _that.batchNo,
            _that.sentAt,
            _that.voidedAt,
            _that.voidedReason);
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
            @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            Version? version,
            @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
            double unitPriceAtLock,
            @JsonKey(name: 'unit_price_preview', fromJson: _money)
            double unitPricePreview,
            int quantity,
            bool shared,
            String? notes,
            @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
            @JsonKey(name: 'batch_no') int? batchNo,
            @JsonKey(name: 'sent_at') DateTime? sentAt,
            @JsonKey(name: 'voided_at') DateTime? voidedAt,
            @JsonKey(name: 'voided_reason') String? voidedReason)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderItemDM() when $default != null:
        return $default(
            _that.uuid,
            _that.participantUuid,
            _that.name,
            _that.version,
            _that.unitPriceAtLock,
            _that.unitPricePreview,
            _that.quantity,
            _that.shared,
            _that.notes,
            _that.deliveredAt,
            _that.batchNo,
            _that.sentAt,
            _that.voidedAt,
            _that.voidedReason);
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
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.version,
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      this.unitPriceAtLock = 0,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      this.unitPricePreview = 0,
      this.quantity = 1,
      this.shared = false,
      this.notes,
      @JsonKey(name: 'delivered_at') this.deliveredAt,
      @JsonKey(name: 'batch_no') this.batchNo,
      @JsonKey(name: 'sent_at') this.sentAt,
      @JsonKey(name: 'voided_at') this.voidedAt,
      @JsonKey(name: 'voided_reason') this.voidedReason})
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
// Tamaño elegido por el comensal. null = regular, que es la versión por
// defecto y no se muestra: sólo mediana y grande dicen algo. Un valor
// desconocido cae a null en vez de romper la orden entera.
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Version? version;
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
// Compartido (F2c): su importe se reparte entre todos en by_items.
  @override
  @JsonKey()
  final bool shared;
  @override
  final String? notes;
// F4a: tilde de entrega del manager (checklist parcial).
  @override
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
// F4b (cuenta abierta): tanda enviada a cocina. sentAt null = sigue en
// el carrito (editable) y es lo que habilita "Enviar orden".
  @override
  @JsonKey(name: 'batch_no')
  final int? batchNo;
  @override
  @JsonKey(name: 'sent_at')
  final DateTime? sentAt;
// F4b.1: el negocio anuló el ítem (plato devuelto/mal preparado): sigue
// visible con su motivo, pero NO se cobra.
  @override
  @JsonKey(name: 'voided_at')
  final DateTime? voidedAt;
  @override
  @JsonKey(name: 'voided_reason')
  final String? voidedReason;

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
            (identical(other.version, version) || other.version == version) &&
            (identical(other.unitPriceAtLock, unitPriceAtLock) ||
                other.unitPriceAtLock == unitPriceAtLock) &&
            (identical(other.unitPricePreview, unitPricePreview) ||
                other.unitPricePreview == unitPricePreview) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.shared, shared) || other.shared == shared) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.voidedReason, voidedReason) ||
                other.voidedReason == voidedReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      participantUuid,
      name,
      version,
      unitPriceAtLock,
      unitPricePreview,
      quantity,
      shared,
      notes,
      deliveredAt,
      batchNo,
      sentAt,
      voidedAt,
      voidedReason);

  @override
  String toString() {
    return 'GroupOrderItemDM(uuid: $uuid, participantUuid: $participantUuid, name: $name, version: $version, unitPriceAtLock: $unitPriceAtLock, unitPricePreview: $unitPricePreview, quantity: $quantity, shared: $shared, notes: $notes, deliveredAt: $deliveredAt, batchNo: $batchNo, sentAt: $sentAt, voidedAt: $voidedAt, voidedReason: $voidedReason)';
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
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Version? version,
      @JsonKey(name: 'unit_price_at_lock', fromJson: _money)
      double unitPriceAtLock,
      @JsonKey(name: 'unit_price_preview', fromJson: _money)
      double unitPricePreview,
      int quantity,
      bool shared,
      String? notes,
      @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
      @JsonKey(name: 'batch_no') int? batchNo,
      @JsonKey(name: 'sent_at') DateTime? sentAt,
      @JsonKey(name: 'voided_at') DateTime? voidedAt,
      @JsonKey(name: 'voided_reason') String? voidedReason});
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
    Object? version = freezed,
    Object? unitPriceAtLock = null,
    Object? unitPricePreview = null,
    Object? quantity = null,
    Object? shared = null,
    Object? notes = freezed,
    Object? deliveredAt = freezed,
    Object? batchNo = freezed,
    Object? sentAt = freezed,
    Object? voidedAt = freezed,
    Object? voidedReason = freezed,
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
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version?,
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
      shared: null == shared
          ? _self.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _self.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as int?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voidedAt: freezed == voidedAt
          ? _self.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voidedReason: freezed == voidedReason
          ? _self.voidedReason
          : voidedReason // ignore: cast_nullable_to_non_nullable
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
  double
      get amountPaid; // "Yo invito" (F2b): uuid del participante que cubrió su pago; null = pagó él mismo.
  @JsonKey(name: 'paid_by_participant_uuid')
  String? get paidByParticipantUuid;

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
                other.amountPaid == amountPaid) &&
            (identical(other.paidByParticipantUuid, paidByParticipantUuid) ||
                other.paidByParticipantUuid == paidByParticipantUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, displayName, avatarUrl,
      role, paymentStatus, amountDue, amountPaid, paidByParticipantUuid);

  @override
  String toString() {
    return 'GroupOrderParticipantDM(uuid: $uuid, displayName: $displayName, avatarUrl: $avatarUrl, role: $role, paymentStatus: $paymentStatus, amountDue: $amountDue, amountPaid: $amountPaid, paidByParticipantUuid: $paidByParticipantUuid)';
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
      @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid,
      @JsonKey(name: 'paid_by_participant_uuid')
      String? paidByParticipantUuid});
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
    Object? paidByParticipantUuid = freezed,
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
      paidByParticipantUuid: freezed == paidByParticipantUuid
          ? _self.paidByParticipantUuid
          : paidByParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
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
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid,
            @JsonKey(name: 'paid_by_participant_uuid')
            String? paidByParticipantUuid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
        return $default(
            _that.uuid,
            _that.displayName,
            _that.avatarUrl,
            _that.role,
            _that.paymentStatus,
            _that.amountDue,
            _that.amountPaid,
            _that.paidByParticipantUuid);
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
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid,
            @JsonKey(name: 'paid_by_participant_uuid')
            String? paidByParticipantUuid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM():
        return $default(
            _that.uuid,
            _that.displayName,
            _that.avatarUrl,
            _that.role,
            _that.paymentStatus,
            _that.amountDue,
            _that.amountPaid,
            _that.paidByParticipantUuid);
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
            @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid,
            @JsonKey(name: 'paid_by_participant_uuid')
            String? paidByParticipantUuid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupOrderParticipantDM() when $default != null:
        return $default(
            _that.uuid,
            _that.displayName,
            _that.avatarUrl,
            _that.role,
            _that.paymentStatus,
            _that.amountDue,
            _that.amountPaid,
            _that.paidByParticipantUuid);
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
      @JsonKey(name: 'amount_paid', fromJson: _money) this.amountPaid = 0,
      @JsonKey(name: 'paid_by_participant_uuid') this.paidByParticipantUuid})
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
// "Yo invito" (F2b): uuid del participante que cubrió su pago; null = pagó él mismo.
  @override
  @JsonKey(name: 'paid_by_participant_uuid')
  final String? paidByParticipantUuid;

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
                other.amountPaid == amountPaid) &&
            (identical(other.paidByParticipantUuid, paidByParticipantUuid) ||
                other.paidByParticipantUuid == paidByParticipantUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, displayName, avatarUrl,
      role, paymentStatus, amountDue, amountPaid, paidByParticipantUuid);

  @override
  String toString() {
    return 'GroupOrderParticipantDM(uuid: $uuid, displayName: $displayName, avatarUrl: $avatarUrl, role: $role, paymentStatus: $paymentStatus, amountDue: $amountDue, amountPaid: $amountPaid, paidByParticipantUuid: $paidByParticipantUuid)';
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
      @JsonKey(name: 'amount_paid', fromJson: _money) double amountPaid,
      @JsonKey(name: 'paid_by_participant_uuid')
      String? paidByParticipantUuid});
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
    Object? paidByParticipantUuid = freezed,
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
      paidByParticipantUuid: freezed == paidByParticipantUuid
          ? _self.paidByParticipantUuid
          : paidByParticipantUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$GroupOrderDM {
  String get uuid;
  GroupOrderStatus get status;
  @JsonKey(name: 'business_uuid')
  String?
      get businessUuid; // Uuid del MENÚ del negocio: /visit-menu/:id lo necesita para aterrizar
// en el menú tras unirse (la ruta NO lleva el uuid del negocio).
  @JsonKey(name: 'business_menu_uuid')
  String? get businessMenuUuid;
  @JsonKey(name: 'business_name')
  String get businessName;
  @JsonKey(name: 'business_logo')
  String?
      get businessLogo; // País del NEGOCIO de la orden — lo piden Apple Pay y Google Pay como
// `merchantCountryCode`. Viene en la orden y no de la sesión: quien paga
// es el comensal, y el restaurante no es suyo.
  @JsonKey(
      name: 'business_country',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  FoodlyCountries? get businessCountry;
  String get currency;
  @JsonKey(name: 'split_mode')
  GroupSplitMode
      get splitMode; // Tarifa fija por transacción a cargo del comensal (plataforma de pagos).
// La UI SIEMPRE la muestra en el desglose antes de pagar.
  @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
  double get payerFixedFee;
  @JsonKey(fromJson: _money)
  double get subtotal;
  @JsonKey(name: 'total_amount', fromJson: _money)
  double get totalAmount;
  @JsonKey(name: 'total_paid', fromJson: _money)
  double get totalPaid; // F4a "Órdenes en vivo": fulfillment + rondas + mesa.
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt;
  @JsonKey(
      name: 'fulfillment_status',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  GroupFulfillmentStatus? get fulfillmentStatus;
  @JsonKey(name: 'round_number')
  int get roundNumber;
  @JsonKey(name: 'table_label')
  String?
      get tableLabel; // F4b: modo de cobro del NEGOCIO (per_round | open_tab) + marca de
// "cuenta pedida" — de acá sale el CTA mutante del cliente.
  @JsonKey(name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
  GroupPaymentMode get paymentMode;
  @JsonKey(name: 'bill_requested_at')
  DateTime?
      get billRequestedAt; // F4b: la mesa avisó que paga en el mostrador. Campo propio y no
// `billRequestedAt` porque ese arrastra el lock, el reparto y el
// checkout — pagar en caja no necesita nada de eso.
  @JsonKey(name: 'cash_requested_at')
  DateTime?
      get cashRequestedAt; // F4b: cómo terminó una cuenta que NO se cobró por Foodly
// (paid_offline | unpaid | abandoned). null = ciclo normal de pago.
  @JsonKey(name: 'closed_reason')
  String? get closedReason;
  @JsonKey(name: 'closed_at')
  DateTime? get closedAt;
  @JsonKey(name: 'lock_expires_at')
  DateTime?
      get lockExpiresAt; // Ventana de gracia tras vencer el deadline (F2b §A.2); null = sin gracia.
  @JsonKey(name: 'grace_ends_at')
  DateTime? get graceEndsAt;
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
            (identical(other.businessMenuUuid, businessMenuUuid) ||
                other.businessMenuUuid == businessMenuUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.splitMode, splitMode) ||
                other.splitMode == splitMode) &&
            (identical(other.payerFixedFee, payerFixedFee) ||
                other.payerFixedFee == payerFixedFee) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.fulfillmentStatus, fulfillmentStatus) ||
                other.fulfillmentStatus == fulfillmentStatus) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.billRequestedAt, billRequestedAt) ||
                other.billRequestedAt == billRequestedAt) &&
            (identical(other.cashRequestedAt, cashRequestedAt) ||
                other.cashRequestedAt == cashRequestedAt) &&
            (identical(other.closedReason, closedReason) ||
                other.closedReason == closedReason) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.lockExpiresAt, lockExpiresAt) ||
                other.lockExpiresAt == lockExpiresAt) &&
            (identical(other.graceEndsAt, graceEndsAt) ||
                other.graceEndsAt == graceEndsAt) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        status,
        businessUuid,
        businessMenuUuid,
        businessName,
        businessLogo,
        businessCountry,
        currency,
        splitMode,
        payerFixedFee,
        subtotal,
        totalAmount,
        totalPaid,
        confirmedAt,
        fulfillmentStatus,
        roundNumber,
        tableLabel,
        paymentMode,
        billRequestedAt,
        cashRequestedAt,
        closedReason,
        closedAt,
        lockExpiresAt,
        graceEndsAt,
        const DeepCollectionEquality().hash(participants),
        const DeepCollectionEquality().hash(items)
      ]);

  @override
  String toString() {
    return 'GroupOrderDM(uuid: $uuid, status: $status, businessUuid: $businessUuid, businessMenuUuid: $businessMenuUuid, businessName: $businessName, businessLogo: $businessLogo, businessCountry: $businessCountry, currency: $currency, splitMode: $splitMode, payerFixedFee: $payerFixedFee, subtotal: $subtotal, totalAmount: $totalAmount, totalPaid: $totalPaid, confirmedAt: $confirmedAt, fulfillmentStatus: $fulfillmentStatus, roundNumber: $roundNumber, tableLabel: $tableLabel, paymentMode: $paymentMode, billRequestedAt: $billRequestedAt, cashRequestedAt: $cashRequestedAt, closedReason: $closedReason, closedAt: $closedAt, lockExpiresAt: $lockExpiresAt, graceEndsAt: $graceEndsAt, participants: $participants, items: $items)';
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
      @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      FoodlyCountries? businessCountry,
      String currency,
      @JsonKey(name: 'split_mode') GroupSplitMode splitMode,
      @JsonKey(name: 'payer_fixed_fee', fromJson: _money) double payerFixedFee,
      @JsonKey(fromJson: _money) double subtotal,
      @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
      @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(
          name: 'fulfillment_status',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      GroupFulfillmentStatus? fulfillmentStatus,
      @JsonKey(name: 'round_number') int roundNumber,
      @JsonKey(name: 'table_label') String? tableLabel,
      @JsonKey(
          name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
      GroupPaymentMode paymentMode,
      @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
      @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
      @JsonKey(name: 'closed_reason') String? closedReason,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
      @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
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
    Object? businessMenuUuid = freezed,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? businessCountry = freezed,
    Object? currency = null,
    Object? splitMode = null,
    Object? payerFixedFee = null,
    Object? subtotal = null,
    Object? totalAmount = null,
    Object? totalPaid = null,
    Object? confirmedAt = freezed,
    Object? fulfillmentStatus = freezed,
    Object? roundNumber = null,
    Object? tableLabel = freezed,
    Object? paymentMode = null,
    Object? billRequestedAt = freezed,
    Object? cashRequestedAt = freezed,
    Object? closedReason = freezed,
    Object? closedAt = freezed,
    Object? lockExpiresAt = freezed,
    Object? graceEndsAt = freezed,
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
      businessMenuUuid: freezed == businessMenuUuid
          ? _self.businessMenuUuid
          : businessMenuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      splitMode: null == splitMode
          ? _self.splitMode
          : splitMode // ignore: cast_nullable_to_non_nullable
              as GroupSplitMode,
      payerFixedFee: null == payerFixedFee
          ? _self.payerFixedFee
          : payerFixedFee // ignore: cast_nullable_to_non_nullable
              as double,
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
      confirmedAt: freezed == confirmedAt
          ? _self.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fulfillmentStatus: freezed == fulfillmentStatus
          ? _self.fulfillmentStatus
          : fulfillmentStatus // ignore: cast_nullable_to_non_nullable
              as GroupFulfillmentStatus?,
      roundNumber: null == roundNumber
          ? _self.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: freezed == tableLabel
          ? _self.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: null == paymentMode
          ? _self.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as GroupPaymentMode,
      billRequestedAt: freezed == billRequestedAt
          ? _self.billRequestedAt
          : billRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashRequestedAt: freezed == cashRequestedAt
          ? _self.cashRequestedAt
          : cashRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedReason: freezed == closedReason
          ? _self.closedReason
          : closedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _self.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lockExpiresAt: freezed == lockExpiresAt
          ? _self.lockExpiresAt
          : lockExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      graceEndsAt: freezed == graceEndsAt
          ? _self.graceEndsAt
          : graceEndsAt // ignore: cast_nullable_to_non_nullable
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
            @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            String currency,
            @JsonKey(name: 'split_mode') GroupSplitMode splitMode,
            @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
            double payerFixedFee,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(
                name: 'fulfillment_status',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            GroupFulfillmentStatus? fulfillmentStatus,
            @JsonKey(name: 'round_number') int roundNumber,
            @JsonKey(name: 'table_label') String? tableLabel,
            @JsonKey(
                name: 'payment_mode',
                unknownEnumValue: GroupPaymentMode.perRound)
            GroupPaymentMode paymentMode,
            @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
            @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
            @JsonKey(name: 'closed_reason') String? closedReason,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
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
            _that.businessMenuUuid,
            _that.businessName,
            _that.businessLogo,
            _that.businessCountry,
            _that.currency,
            _that.splitMode,
            _that.payerFixedFee,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.confirmedAt,
            _that.fulfillmentStatus,
            _that.roundNumber,
            _that.tableLabel,
            _that.paymentMode,
            _that.billRequestedAt,
            _that.cashRequestedAt,
            _that.closedReason,
            _that.closedAt,
            _that.lockExpiresAt,
            _that.graceEndsAt,
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
            @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            String currency,
            @JsonKey(name: 'split_mode') GroupSplitMode splitMode,
            @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
            double payerFixedFee,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(
                name: 'fulfillment_status',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            GroupFulfillmentStatus? fulfillmentStatus,
            @JsonKey(name: 'round_number') int roundNumber,
            @JsonKey(name: 'table_label') String? tableLabel,
            @JsonKey(
                name: 'payment_mode',
                unknownEnumValue: GroupPaymentMode.perRound)
            GroupPaymentMode paymentMode,
            @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
            @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
            @JsonKey(name: 'closed_reason') String? closedReason,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
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
            _that.businessMenuUuid,
            _that.businessName,
            _that.businessLogo,
            _that.businessCountry,
            _that.currency,
            _that.splitMode,
            _that.payerFixedFee,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.confirmedAt,
            _that.fulfillmentStatus,
            _that.roundNumber,
            _that.tableLabel,
            _that.paymentMode,
            _that.billRequestedAt,
            _that.cashRequestedAt,
            _that.closedReason,
            _that.closedAt,
            _that.lockExpiresAt,
            _that.graceEndsAt,
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
            @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
            @JsonKey(name: 'business_name') String businessName,
            @JsonKey(name: 'business_logo') String? businessLogo,
            @JsonKey(
                name: 'business_country',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            FoodlyCountries? businessCountry,
            String currency,
            @JsonKey(name: 'split_mode') GroupSplitMode splitMode,
            @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
            double payerFixedFee,
            @JsonKey(fromJson: _money) double subtotal,
            @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
            @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
            @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
            @JsonKey(
                name: 'fulfillment_status',
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            GroupFulfillmentStatus? fulfillmentStatus,
            @JsonKey(name: 'round_number') int roundNumber,
            @JsonKey(name: 'table_label') String? tableLabel,
            @JsonKey(
                name: 'payment_mode',
                unknownEnumValue: GroupPaymentMode.perRound)
            GroupPaymentMode paymentMode,
            @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
            @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
            @JsonKey(name: 'closed_reason') String? closedReason,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
            @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
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
            _that.businessMenuUuid,
            _that.businessName,
            _that.businessLogo,
            _that.businessCountry,
            _that.currency,
            _that.splitMode,
            _that.payerFixedFee,
            _that.subtotal,
            _that.totalAmount,
            _that.totalPaid,
            _that.confirmedAt,
            _that.fulfillmentStatus,
            _that.roundNumber,
            _that.tableLabel,
            _that.paymentMode,
            _that.billRequestedAt,
            _that.cashRequestedAt,
            _that.closedReason,
            _that.closedAt,
            _that.lockExpiresAt,
            _that.graceEndsAt,
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
      @JsonKey(name: 'business_menu_uuid') this.businessMenuUuid,
      @JsonKey(name: 'business_name') this.businessName = '',
      @JsonKey(name: 'business_logo') this.businessLogo,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.businessCountry,
      this.currency = 'EUR',
      @JsonKey(name: 'split_mode') this.splitMode = GroupSplitMode.byItems,
      @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
      this.payerFixedFee = 0.25,
      @JsonKey(fromJson: _money) this.subtotal = 0,
      @JsonKey(name: 'total_amount', fromJson: _money) this.totalAmount = 0,
      @JsonKey(name: 'total_paid', fromJson: _money) this.totalPaid = 0,
      @JsonKey(name: 'confirmed_at') this.confirmedAt,
      @JsonKey(
          name: 'fulfillment_status',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.fulfillmentStatus,
      @JsonKey(name: 'round_number') this.roundNumber = 1,
      @JsonKey(name: 'table_label') this.tableLabel,
      @JsonKey(
          name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
      this.paymentMode = GroupPaymentMode.perRound,
      @JsonKey(name: 'bill_requested_at') this.billRequestedAt,
      @JsonKey(name: 'cash_requested_at') this.cashRequestedAt,
      @JsonKey(name: 'closed_reason') this.closedReason,
      @JsonKey(name: 'closed_at') this.closedAt,
      @JsonKey(name: 'lock_expires_at') this.lockExpiresAt,
      @JsonKey(name: 'grace_ends_at') this.graceEndsAt,
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
// Uuid del MENÚ del negocio: /visit-menu/:id lo necesita para aterrizar
// en el menú tras unirse (la ruta NO lleva el uuid del negocio).
  @override
  @JsonKey(name: 'business_menu_uuid')
  final String? businessMenuUuid;
  @override
  @JsonKey(name: 'business_name')
  final String businessName;
  @override
  @JsonKey(name: 'business_logo')
  final String? businessLogo;
// País del NEGOCIO de la orden — lo piden Apple Pay y Google Pay como
// `merchantCountryCode`. Viene en la orden y no de la sesión: quien paga
// es el comensal, y el restaurante no es suyo.
  @override
  @JsonKey(
      name: 'business_country',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final FoodlyCountries? businessCountry;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'split_mode')
  final GroupSplitMode splitMode;
// Tarifa fija por transacción a cargo del comensal (plataforma de pagos).
// La UI SIEMPRE la muestra en el desglose antes de pagar.
  @override
  @JsonKey(name: 'payer_fixed_fee', fromJson: _money)
  final double payerFixedFee;
  @override
  @JsonKey(fromJson: _money)
  final double subtotal;
  @override
  @JsonKey(name: 'total_amount', fromJson: _money)
  final double totalAmount;
  @override
  @JsonKey(name: 'total_paid', fromJson: _money)
  final double totalPaid;
// F4a "Órdenes en vivo": fulfillment + rondas + mesa.
  @override
  @JsonKey(name: 'confirmed_at')
  final DateTime? confirmedAt;
  @override
  @JsonKey(
      name: 'fulfillment_status',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final GroupFulfillmentStatus? fulfillmentStatus;
  @override
  @JsonKey(name: 'round_number')
  final int roundNumber;
  @override
  @JsonKey(name: 'table_label')
  final String? tableLabel;
// F4b: modo de cobro del NEGOCIO (per_round | open_tab) + marca de
// "cuenta pedida" — de acá sale el CTA mutante del cliente.
  @override
  @JsonKey(name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
  final GroupPaymentMode paymentMode;
  @override
  @JsonKey(name: 'bill_requested_at')
  final DateTime? billRequestedAt;
// F4b: la mesa avisó que paga en el mostrador. Campo propio y no
// `billRequestedAt` porque ese arrastra el lock, el reparto y el
// checkout — pagar en caja no necesita nada de eso.
  @override
  @JsonKey(name: 'cash_requested_at')
  final DateTime? cashRequestedAt;
// F4b: cómo terminó una cuenta que NO se cobró por Foodly
// (paid_offline | unpaid | abandoned). null = ciclo normal de pago.
  @override
  @JsonKey(name: 'closed_reason')
  final String? closedReason;
  @override
  @JsonKey(name: 'closed_at')
  final DateTime? closedAt;
  @override
  @JsonKey(name: 'lock_expires_at')
  final DateTime? lockExpiresAt;
// Ventana de gracia tras vencer el deadline (F2b §A.2); null = sin gracia.
  @override
  @JsonKey(name: 'grace_ends_at')
  final DateTime? graceEndsAt;
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
            (identical(other.businessMenuUuid, businessMenuUuid) ||
                other.businessMenuUuid == businessMenuUuid) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.businessLogo, businessLogo) ||
                other.businessLogo == businessLogo) &&
            (identical(other.businessCountry, businessCountry) ||
                other.businessCountry == businessCountry) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.splitMode, splitMode) ||
                other.splitMode == splitMode) &&
            (identical(other.payerFixedFee, payerFixedFee) ||
                other.payerFixedFee == payerFixedFee) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.fulfillmentStatus, fulfillmentStatus) ||
                other.fulfillmentStatus == fulfillmentStatus) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.billRequestedAt, billRequestedAt) ||
                other.billRequestedAt == billRequestedAt) &&
            (identical(other.cashRequestedAt, cashRequestedAt) ||
                other.cashRequestedAt == cashRequestedAt) &&
            (identical(other.closedReason, closedReason) ||
                other.closedReason == closedReason) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.lockExpiresAt, lockExpiresAt) ||
                other.lockExpiresAt == lockExpiresAt) &&
            (identical(other.graceEndsAt, graceEndsAt) ||
                other.graceEndsAt == graceEndsAt) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        status,
        businessUuid,
        businessMenuUuid,
        businessName,
        businessLogo,
        businessCountry,
        currency,
        splitMode,
        payerFixedFee,
        subtotal,
        totalAmount,
        totalPaid,
        confirmedAt,
        fulfillmentStatus,
        roundNumber,
        tableLabel,
        paymentMode,
        billRequestedAt,
        cashRequestedAt,
        closedReason,
        closedAt,
        lockExpiresAt,
        graceEndsAt,
        const DeepCollectionEquality().hash(_participants),
        const DeepCollectionEquality().hash(_items)
      ]);

  @override
  String toString() {
    return 'GroupOrderDM(uuid: $uuid, status: $status, businessUuid: $businessUuid, businessMenuUuid: $businessMenuUuid, businessName: $businessName, businessLogo: $businessLogo, businessCountry: $businessCountry, currency: $currency, splitMode: $splitMode, payerFixedFee: $payerFixedFee, subtotal: $subtotal, totalAmount: $totalAmount, totalPaid: $totalPaid, confirmedAt: $confirmedAt, fulfillmentStatus: $fulfillmentStatus, roundNumber: $roundNumber, tableLabel: $tableLabel, paymentMode: $paymentMode, billRequestedAt: $billRequestedAt, cashRequestedAt: $cashRequestedAt, closedReason: $closedReason, closedAt: $closedAt, lockExpiresAt: $lockExpiresAt, graceEndsAt: $graceEndsAt, participants: $participants, items: $items)';
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
      @JsonKey(name: 'business_menu_uuid') String? businessMenuUuid,
      @JsonKey(name: 'business_name') String businessName,
      @JsonKey(name: 'business_logo') String? businessLogo,
      @JsonKey(
          name: 'business_country',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      FoodlyCountries? businessCountry,
      String currency,
      @JsonKey(name: 'split_mode') GroupSplitMode splitMode,
      @JsonKey(name: 'payer_fixed_fee', fromJson: _money) double payerFixedFee,
      @JsonKey(fromJson: _money) double subtotal,
      @JsonKey(name: 'total_amount', fromJson: _money) double totalAmount,
      @JsonKey(name: 'total_paid', fromJson: _money) double totalPaid,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      @JsonKey(
          name: 'fulfillment_status',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      GroupFulfillmentStatus? fulfillmentStatus,
      @JsonKey(name: 'round_number') int roundNumber,
      @JsonKey(name: 'table_label') String? tableLabel,
      @JsonKey(
          name: 'payment_mode', unknownEnumValue: GroupPaymentMode.perRound)
      GroupPaymentMode paymentMode,
      @JsonKey(name: 'bill_requested_at') DateTime? billRequestedAt,
      @JsonKey(name: 'cash_requested_at') DateTime? cashRequestedAt,
      @JsonKey(name: 'closed_reason') String? closedReason,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'lock_expires_at') DateTime? lockExpiresAt,
      @JsonKey(name: 'grace_ends_at') DateTime? graceEndsAt,
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
    Object? businessMenuUuid = freezed,
    Object? businessName = null,
    Object? businessLogo = freezed,
    Object? businessCountry = freezed,
    Object? currency = null,
    Object? splitMode = null,
    Object? payerFixedFee = null,
    Object? subtotal = null,
    Object? totalAmount = null,
    Object? totalPaid = null,
    Object? confirmedAt = freezed,
    Object? fulfillmentStatus = freezed,
    Object? roundNumber = null,
    Object? tableLabel = freezed,
    Object? paymentMode = null,
    Object? billRequestedAt = freezed,
    Object? cashRequestedAt = freezed,
    Object? closedReason = freezed,
    Object? closedAt = freezed,
    Object? lockExpiresAt = freezed,
    Object? graceEndsAt = freezed,
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
      businessMenuUuid: freezed == businessMenuUuid
          ? _self.businessMenuUuid
          : businessMenuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLogo: freezed == businessLogo
          ? _self.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessCountry: freezed == businessCountry
          ? _self.businessCountry
          : businessCountry // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      splitMode: null == splitMode
          ? _self.splitMode
          : splitMode // ignore: cast_nullable_to_non_nullable
              as GroupSplitMode,
      payerFixedFee: null == payerFixedFee
          ? _self.payerFixedFee
          : payerFixedFee // ignore: cast_nullable_to_non_nullable
              as double,
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
      confirmedAt: freezed == confirmedAt
          ? _self.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fulfillmentStatus: freezed == fulfillmentStatus
          ? _self.fulfillmentStatus
          : fulfillmentStatus // ignore: cast_nullable_to_non_nullable
              as GroupFulfillmentStatus?,
      roundNumber: null == roundNumber
          ? _self.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tableLabel: freezed == tableLabel
          ? _self.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: null == paymentMode
          ? _self.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as GroupPaymentMode,
      billRequestedAt: freezed == billRequestedAt
          ? _self.billRequestedAt
          : billRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cashRequestedAt: freezed == cashRequestedAt
          ? _self.cashRequestedAt
          : cashRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedReason: freezed == closedReason
          ? _self.closedReason
          : closedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _self.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lockExpiresAt: freezed == lockExpiresAt
          ? _self.lockExpiresAt
          : lockExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      graceEndsAt: freezed == graceEndsAt
          ? _self.graceEndsAt
          : graceEndsAt // ignore: cast_nullable_to_non_nullable
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

  /// Checkout hosteado: para MB WAY y demás métodos que el PaymentSheet
  /// nativo no soporta.
  @JsonKey(name: 'checkout_url')
  String? get checkoutUrl;
  @JsonKey(name: 'transaction_uuid')
  String? get transactionUuid;
  @JsonKey(fromJson: _money)
  double
      get amount; // Propina (F2c §B.2), tarifa del comensal y total cobrado (base+tip+fee).
  @JsonKey(name: 'tip_amount', fromJson: _money)
  double get tipAmount;
  @JsonKey(name: 'service_fee_amount', fromJson: _money)
  double get serviceFeeAmount;
  @JsonKey(name: 'total_charged', fromJson: _money)
  double get totalCharged;
  String get currency; // Participantes que este pago cubre ("yo invito", F2b).
  @JsonKey(name: 'covered_participant_uuids')
  List<String> get coveredParticipantUuids;

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
            (identical(other.checkoutUrl, checkoutUrl) ||
                other.checkoutUrl == checkoutUrl) &&
            (identical(other.transactionUuid, transactionUuid) ||
                other.transactionUuid == transactionUuid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.serviceFeeAmount, serviceFeeAmount) ||
                other.serviceFeeAmount == serviceFeeAmount) &&
            (identical(other.totalCharged, totalCharged) ||
                other.totalCharged == totalCharged) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
                other.coveredParticipantUuids, coveredParticipantUuids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientSecret,
      checkoutUrl,
      transactionUuid,
      amount,
      tipAmount,
      serviceFeeAmount,
      totalCharged,
      currency,
      const DeepCollectionEquality().hash(coveredParticipantUuids));

  @override
  String toString() {
    return 'PayIntentResponseDM(clientSecret: $clientSecret, checkoutUrl: $checkoutUrl, transactionUuid: $transactionUuid, amount: $amount, tipAmount: $tipAmount, serviceFeeAmount: $serviceFeeAmount, totalCharged: $totalCharged, currency: $currency, coveredParticipantUuids: $coveredParticipantUuids)';
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
      @JsonKey(name: 'checkout_url') String? checkoutUrl,
      @JsonKey(name: 'transaction_uuid') String? transactionUuid,
      @JsonKey(fromJson: _money) double amount,
      @JsonKey(name: 'tip_amount', fromJson: _money) double tipAmount,
      @JsonKey(name: 'service_fee_amount', fromJson: _money)
      double serviceFeeAmount,
      @JsonKey(name: 'total_charged', fromJson: _money) double totalCharged,
      String currency,
      @JsonKey(name: 'covered_participant_uuids')
      List<String> coveredParticipantUuids});
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
    Object? checkoutUrl = freezed,
    Object? transactionUuid = freezed,
    Object? amount = null,
    Object? tipAmount = null,
    Object? serviceFeeAmount = null,
    Object? totalCharged = null,
    Object? currency = null,
    Object? coveredParticipantUuids = null,
  }) {
    return _then(_self.copyWith(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutUrl: freezed == checkoutUrl
          ? _self.checkoutUrl
          : checkoutUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: freezed == transactionUuid
          ? _self.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _self.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      serviceFeeAmount: null == serviceFeeAmount
          ? _self.serviceFeeAmount
          : serviceFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalCharged: null == totalCharged
          ? _self.totalCharged
          : totalCharged // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      coveredParticipantUuids: null == coveredParticipantUuids
          ? _self.coveredParticipantUuids
          : coveredParticipantUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
            @JsonKey(name: 'checkout_url') String? checkoutUrl,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            @JsonKey(name: 'tip_amount', fromJson: _money) double tipAmount,
            @JsonKey(name: 'service_fee_amount', fromJson: _money)
            double serviceFeeAmount,
            @JsonKey(name: 'total_charged', fromJson: _money)
            double totalCharged,
            String currency,
            @JsonKey(name: 'covered_participant_uuids')
            List<String> coveredParticipantUuids)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
        return $default(
            _that.clientSecret,
            _that.checkoutUrl,
            _that.transactionUuid,
            _that.amount,
            _that.tipAmount,
            _that.serviceFeeAmount,
            _that.totalCharged,
            _that.currency,
            _that.coveredParticipantUuids);
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
            @JsonKey(name: 'checkout_url') String? checkoutUrl,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            @JsonKey(name: 'tip_amount', fromJson: _money) double tipAmount,
            @JsonKey(name: 'service_fee_amount', fromJson: _money)
            double serviceFeeAmount,
            @JsonKey(name: 'total_charged', fromJson: _money)
            double totalCharged,
            String currency,
            @JsonKey(name: 'covered_participant_uuids')
            List<String> coveredParticipantUuids)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM():
        return $default(
            _that.clientSecret,
            _that.checkoutUrl,
            _that.transactionUuid,
            _that.amount,
            _that.tipAmount,
            _that.serviceFeeAmount,
            _that.totalCharged,
            _that.currency,
            _that.coveredParticipantUuids);
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
            @JsonKey(name: 'checkout_url') String? checkoutUrl,
            @JsonKey(name: 'transaction_uuid') String? transactionUuid,
            @JsonKey(fromJson: _money) double amount,
            @JsonKey(name: 'tip_amount', fromJson: _money) double tipAmount,
            @JsonKey(name: 'service_fee_amount', fromJson: _money)
            double serviceFeeAmount,
            @JsonKey(name: 'total_charged', fromJson: _money)
            double totalCharged,
            String currency,
            @JsonKey(name: 'covered_participant_uuids')
            List<String> coveredParticipantUuids)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayIntentResponseDM() when $default != null:
        return $default(
            _that.clientSecret,
            _that.checkoutUrl,
            _that.transactionUuid,
            _that.amount,
            _that.tipAmount,
            _that.serviceFeeAmount,
            _that.totalCharged,
            _that.currency,
            _that.coveredParticipantUuids);
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
      @JsonKey(name: 'checkout_url') this.checkoutUrl,
      @JsonKey(name: 'transaction_uuid') this.transactionUuid,
      @JsonKey(fromJson: _money) this.amount = 0,
      @JsonKey(name: 'tip_amount', fromJson: _money) this.tipAmount = 0,
      @JsonKey(name: 'service_fee_amount', fromJson: _money)
      this.serviceFeeAmount = 0,
      @JsonKey(name: 'total_charged', fromJson: _money) this.totalCharged = 0,
      this.currency = 'EUR',
      @JsonKey(name: 'covered_participant_uuids')
      final List<String> coveredParticipantUuids = const <String>[]})
      : _coveredParticipantUuids = coveredParticipantUuids;
  factory _PayIntentResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PayIntentResponseDMFromJson(json);

  @override
  @JsonKey(name: 'client_secret')
  final String? clientSecret;

  /// Checkout hosteado: para MB WAY y demás métodos que el PaymentSheet
  /// nativo no soporta.
  @override
  @JsonKey(name: 'checkout_url')
  final String? checkoutUrl;
  @override
  @JsonKey(name: 'transaction_uuid')
  final String? transactionUuid;
  @override
  @JsonKey(fromJson: _money)
  final double amount;
// Propina (F2c §B.2), tarifa del comensal y total cobrado (base+tip+fee).
  @override
  @JsonKey(name: 'tip_amount', fromJson: _money)
  final double tipAmount;
  @override
  @JsonKey(name: 'service_fee_amount', fromJson: _money)
  final double serviceFeeAmount;
  @override
  @JsonKey(name: 'total_charged', fromJson: _money)
  final double totalCharged;
  @override
  @JsonKey()
  final String currency;
// Participantes que este pago cubre ("yo invito", F2b).
  final List<String> _coveredParticipantUuids;
// Participantes que este pago cubre ("yo invito", F2b).
  @override
  @JsonKey(name: 'covered_participant_uuids')
  List<String> get coveredParticipantUuids {
    if (_coveredParticipantUuids is EqualUnmodifiableListView)
      return _coveredParticipantUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coveredParticipantUuids);
  }

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
            (identical(other.checkoutUrl, checkoutUrl) ||
                other.checkoutUrl == checkoutUrl) &&
            (identical(other.transactionUuid, transactionUuid) ||
                other.transactionUuid == transactionUuid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.serviceFeeAmount, serviceFeeAmount) ||
                other.serviceFeeAmount == serviceFeeAmount) &&
            (identical(other.totalCharged, totalCharged) ||
                other.totalCharged == totalCharged) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
                other._coveredParticipantUuids, _coveredParticipantUuids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientSecret,
      checkoutUrl,
      transactionUuid,
      amount,
      tipAmount,
      serviceFeeAmount,
      totalCharged,
      currency,
      const DeepCollectionEquality().hash(_coveredParticipantUuids));

  @override
  String toString() {
    return 'PayIntentResponseDM(clientSecret: $clientSecret, checkoutUrl: $checkoutUrl, transactionUuid: $transactionUuid, amount: $amount, tipAmount: $tipAmount, serviceFeeAmount: $serviceFeeAmount, totalCharged: $totalCharged, currency: $currency, coveredParticipantUuids: $coveredParticipantUuids)';
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
      @JsonKey(name: 'checkout_url') String? checkoutUrl,
      @JsonKey(name: 'transaction_uuid') String? transactionUuid,
      @JsonKey(fromJson: _money) double amount,
      @JsonKey(name: 'tip_amount', fromJson: _money) double tipAmount,
      @JsonKey(name: 'service_fee_amount', fromJson: _money)
      double serviceFeeAmount,
      @JsonKey(name: 'total_charged', fromJson: _money) double totalCharged,
      String currency,
      @JsonKey(name: 'covered_participant_uuids')
      List<String> coveredParticipantUuids});
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
    Object? checkoutUrl = freezed,
    Object? transactionUuid = freezed,
    Object? amount = null,
    Object? tipAmount = null,
    Object? serviceFeeAmount = null,
    Object? totalCharged = null,
    Object? currency = null,
    Object? coveredParticipantUuids = null,
  }) {
    return _then(_PayIntentResponseDM(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutUrl: freezed == checkoutUrl
          ? _self.checkoutUrl
          : checkoutUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: freezed == transactionUuid
          ? _self.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _self.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      serviceFeeAmount: null == serviceFeeAmount
          ? _self.serviceFeeAmount
          : serviceFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalCharged: null == totalCharged
          ? _self.totalCharged
          : totalCharged // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      coveredParticipantUuids: null == coveredParticipantUuids
          ? _self._coveredParticipantUuids
          : coveredParticipantUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$GroupInviteResponseDM {
  bool get success;
  @JsonKey(name: 'invite_token')
  String?
      get inviteToken; // Código corto tipeable (F3a): lo comparte el host con la mesa.
  @JsonKey(name: 'invite_code')
  String? get inviteCode;
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
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, inviteToken, inviteCode, inviteUrl);

  @override
  String toString() {
    return 'GroupInviteResponseDM(success: $success, inviteToken: $inviteToken, inviteCode: $inviteCode, inviteUrl: $inviteUrl)';
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
      @JsonKey(name: 'invite_code') String? inviteCode,
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
    Object? inviteCode = freezed,
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
      inviteCode: freezed == inviteCode
          ? _self.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
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
            @JsonKey(name: 'invite_code') String? inviteCode,
            @JsonKey(name: 'invite_url') String? inviteUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
        return $default(_that.success, _that.inviteToken, _that.inviteCode,
            _that.inviteUrl);
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
            @JsonKey(name: 'invite_code') String? inviteCode,
            @JsonKey(name: 'invite_url') String? inviteUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM():
        return $default(_that.success, _that.inviteToken, _that.inviteCode,
            _that.inviteUrl);
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
            @JsonKey(name: 'invite_code') String? inviteCode,
            @JsonKey(name: 'invite_url') String? inviteUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GroupInviteResponseDM() when $default != null:
        return $default(_that.success, _that.inviteToken, _that.inviteCode,
            _that.inviteUrl);
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
      @JsonKey(name: 'invite_code') this.inviteCode,
      @JsonKey(name: 'invite_url') this.inviteUrl});
  factory _GroupInviteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GroupInviteResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'invite_token')
  final String? inviteToken;
// Código corto tipeable (F3a): lo comparte el host con la mesa.
  @override
  @JsonKey(name: 'invite_code')
  final String? inviteCode;
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
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, inviteToken, inviteCode, inviteUrl);

  @override
  String toString() {
    return 'GroupInviteResponseDM(success: $success, inviteToken: $inviteToken, inviteCode: $inviteCode, inviteUrl: $inviteUrl)';
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
      @JsonKey(name: 'invite_code') String? inviteCode,
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
    Object? inviteCode = freezed,
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
      inviteCode: freezed == inviteCode
          ? _self.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inviteUrl: freezed == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
