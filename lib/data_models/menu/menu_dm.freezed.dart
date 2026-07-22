// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuResponse {
  @JsonKey(name: 'menu')
  MenuDM get menuDM;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      _$MenuResponseCopyWithImpl<MenuResponse>(
          this as MenuResponse, _$identity);

  /// Serializes this MenuResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuResponse &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuDM);

  @override
  String toString() {
    return 'MenuResponse(menuDM: $menuDM)';
  }
}

/// @nodoc
abstract mixin class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) _then) =
      _$MenuResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'menu') MenuDM menuDM});

  $MenuDMCopyWith<$Res> get menuDM;
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res> implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._self, this._then);

  final MenuResponse _self;
  final $Res Function(MenuResponse) _then;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuDM = null,
  }) {
    return _then(_self.copyWith(
      menuDM: null == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menuDM {
    return $MenuDMCopyWith<$Res>(_self.menuDM, (value) {
      return _then(_self.copyWith(menuDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MenuResponse].
extension MenuResponsePatterns on MenuResponse {
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
    TResult Function(_MenuResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuResponse() when $default != null:
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
    TResult Function(_MenuResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuResponse():
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
    TResult? Function(_MenuResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'menu') MenuDM menuDM)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuResponse() when $default != null:
        return $default(_that.menuDM);
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
    TResult Function(@JsonKey(name: 'menu') MenuDM menuDM) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuResponse():
        return $default(_that.menuDM);
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
    TResult? Function(@JsonKey(name: 'menu') MenuDM menuDM)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuResponse() when $default != null:
        return $default(_that.menuDM);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MenuResponse implements MenuResponse {
  _MenuResponse({@JsonKey(name: 'menu') required this.menuDM});
  factory _MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  @override
  @JsonKey(name: 'menu')
  final MenuDM menuDM;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuResponse &&
            (identical(other.menuDM, menuDM) || other.menuDM == menuDM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuDM);

  @override
  String toString() {
    return 'MenuResponse(menuDM: $menuDM)';
  }
}

/// @nodoc
abstract mixin class _$MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) _then) =
      __$MenuResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'menu') MenuDM menuDM});

  @override
  $MenuDMCopyWith<$Res> get menuDM;
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(this._self, this._then);

  final _MenuResponse _self;
  final $Res Function(_MenuResponse) _then;

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? menuDM = null,
  }) {
    return _then(_MenuResponse(
      menuDM: null == menuDM
          ? _self.menuDM
          : menuDM // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }

  /// Create a copy of MenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menuDM {
    return $MenuDMCopyWith<$Res>(_self.menuDM, (value) {
      return _then(_self.copyWith(menuDM: value));
    });
  }
}

/// @nodoc
mixin _$MenuDM {
  String get uuid;
  int?
      get id; // Hydrated client-side in some flows (e.g. favorites_vm wires the parent
// BusinessDM in after fetching). [BusinessMenuResource] does NOT include
// it — see [businessName] for the flat name that always comes from the BE.
  BusinessDM? get business;
  @JsonKey(name: 'business_uuid')
  String get businessUuid;
  @JsonKey(name: 'business_id')
  int?
      get businessId; // Flat business name shipped by [BusinessMenuResource] — added so share
// sheets / breadcrumbs can render the parent business without pulling the
// full BusinessDM (~15 KB lite payload, recursion risk). Mirrors the
// existing flat businessUuid / businessId pattern. Nullable for
// forward-compat with any payload that doesn't carry it yet.
  @JsonKey(name: 'business_name')
  String? get businessName;
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdate;
  @JsonKey(name: 'business_food_categories')
  List<CategoryDM> get foodCategories;
  @JsonKey(name: 'business_drink_categories')
  List<CategoryDM> get drinkCategories;
  @JsonKey(name: 'business_combos')
  List<ItemDM> get combos;
  @JsonKey(name: 'followers_length')
  int get followersLength;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<MenuDM> get copyWith =>
      _$MenuDMCopyWithImpl<MenuDM>(this as MenuDM, _$identity);

  /// Serializes this MenuDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            const DeepCollectionEquality()
                .equals(other.foodCategories, foodCategories) &&
            const DeepCollectionEquality()
                .equals(other.drinkCategories, drinkCategories) &&
            const DeepCollectionEquality().equals(other.combos, combos) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      id,
      business,
      businessUuid,
      businessId,
      businessName,
      lastUpdate,
      const DeepCollectionEquality().hash(foodCategories),
      const DeepCollectionEquality().hash(drinkCategories),
      const DeepCollectionEquality().hash(combos),
      followersLength);

  @override
  String toString() {
    return 'MenuDM(uuid: $uuid, id: $id, business: $business, businessUuid: $businessUuid, businessId: $businessId, businessName: $businessName, lastUpdate: $lastUpdate, foodCategories: $foodCategories, drinkCategories: $drinkCategories, combos: $combos, followersLength: $followersLength)';
  }
}

/// @nodoc
abstract mixin class $MenuDMCopyWith<$Res> {
  factory $MenuDMCopyWith(MenuDM value, $Res Function(MenuDM) _then) =
      _$MenuDMCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      int? id,
      BusinessDM? business,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'updated_at') DateTime? lastUpdate,
      @JsonKey(name: 'business_food_categories')
      List<CategoryDM> foodCategories,
      @JsonKey(name: 'business_drink_categories')
      List<CategoryDM> drinkCategories,
      @JsonKey(name: 'business_combos') List<ItemDM> combos,
      @JsonKey(name: 'followers_length') int followersLength});

  $BusinessDMCopyWith<$Res>? get business;
}

/// @nodoc
class _$MenuDMCopyWithImpl<$Res> implements $MenuDMCopyWith<$Res> {
  _$MenuDMCopyWithImpl(this._self, this._then);

  final MenuDM _self;
  final $Res Function(MenuDM) _then;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? id = freezed,
    Object? business = freezed,
    Object? businessUuid = null,
    Object? businessId = freezed,
    Object? businessName = freezed,
    Object? lastUpdate = freezed,
    Object? foodCategories = null,
    Object? drinkCategories = null,
    Object? combos = null,
    Object? followersLength = null,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      foodCategories: null == foodCategories
          ? _self.foodCategories
          : foodCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      drinkCategories: null == drinkCategories
          ? _self.drinkCategories
          : drinkCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      combos: null == combos
          ? _self.combos
          : combos // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MenuDM].
extension MenuDMPatterns on MenuDM {
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
    TResult Function(_MenuDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuDM() when $default != null:
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
    TResult Function(_MenuDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuDM():
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
    TResult? Function(_MenuDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuDM() when $default != null:
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
            int? id,
            BusinessDM? business,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'updated_at') DateTime? lastUpdate,
            @JsonKey(name: 'business_food_categories')
            List<CategoryDM> foodCategories,
            @JsonKey(name: 'business_drink_categories')
            List<CategoryDM> drinkCategories,
            @JsonKey(name: 'business_combos') List<ItemDM> combos,
            @JsonKey(name: 'followers_length') int followersLength)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuDM() when $default != null:
        return $default(
            _that.uuid,
            _that.id,
            _that.business,
            _that.businessUuid,
            _that.businessId,
            _that.businessName,
            _that.lastUpdate,
            _that.foodCategories,
            _that.drinkCategories,
            _that.combos,
            _that.followersLength);
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
            int? id,
            BusinessDM? business,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'updated_at') DateTime? lastUpdate,
            @JsonKey(name: 'business_food_categories')
            List<CategoryDM> foodCategories,
            @JsonKey(name: 'business_drink_categories')
            List<CategoryDM> drinkCategories,
            @JsonKey(name: 'business_combos') List<ItemDM> combos,
            @JsonKey(name: 'followers_length') int followersLength)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuDM():
        return $default(
            _that.uuid,
            _that.id,
            _that.business,
            _that.businessUuid,
            _that.businessId,
            _that.businessName,
            _that.lastUpdate,
            _that.foodCategories,
            _that.drinkCategories,
            _that.combos,
            _that.followersLength);
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
            int? id,
            BusinessDM? business,
            @JsonKey(name: 'business_uuid') String businessUuid,
            @JsonKey(name: 'business_id') int? businessId,
            @JsonKey(name: 'business_name') String? businessName,
            @JsonKey(name: 'updated_at') DateTime? lastUpdate,
            @JsonKey(name: 'business_food_categories')
            List<CategoryDM> foodCategories,
            @JsonKey(name: 'business_drink_categories')
            List<CategoryDM> drinkCategories,
            @JsonKey(name: 'business_combos') List<ItemDM> combos,
            @JsonKey(name: 'followers_length') int followersLength)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuDM() when $default != null:
        return $default(
            _that.uuid,
            _that.id,
            _that.business,
            _that.businessUuid,
            _that.businessId,
            _that.businessName,
            _that.lastUpdate,
            _that.foodCategories,
            _that.drinkCategories,
            _that.combos,
            _that.followersLength);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MenuDM extends MenuDM {
  _MenuDM(
      {required this.uuid,
      this.id,
      this.business,
      @JsonKey(name: 'business_uuid') required this.businessUuid,
      @JsonKey(name: 'business_id') this.businessId,
      @JsonKey(name: 'business_name') this.businessName,
      @JsonKey(name: 'updated_at') this.lastUpdate,
      @JsonKey(name: 'business_food_categories')
      final List<CategoryDM> foodCategories = const [],
      @JsonKey(name: 'business_drink_categories')
      final List<CategoryDM> drinkCategories = const [],
      @JsonKey(name: 'business_combos') final List<ItemDM> combos = const [],
      @JsonKey(name: 'followers_length') this.followersLength = 0})
      : _foodCategories = foodCategories,
        _drinkCategories = drinkCategories,
        _combos = combos,
        super._();
  factory _MenuDM.fromJson(Map<String, dynamic> json) => _$MenuDMFromJson(json);

  @override
  final String uuid;
  @override
  final int? id;
// Hydrated client-side in some flows (e.g. favorites_vm wires the parent
// BusinessDM in after fetching). [BusinessMenuResource] does NOT include
// it — see [businessName] for the flat name that always comes from the BE.
  @override
  final BusinessDM? business;
  @override
  @JsonKey(name: 'business_uuid')
  final String businessUuid;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
// Flat business name shipped by [BusinessMenuResource] — added so share
// sheets / breadcrumbs can render the parent business without pulling the
// full BusinessDM (~15 KB lite payload, recursion risk). Mirrors the
// existing flat businessUuid / businessId pattern. Nullable for
// forward-compat with any payload that doesn't carry it yet.
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? lastUpdate;
  final List<CategoryDM> _foodCategories;
  @override
  @JsonKey(name: 'business_food_categories')
  List<CategoryDM> get foodCategories {
    if (_foodCategories is EqualUnmodifiableListView) return _foodCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodCategories);
  }

  final List<CategoryDM> _drinkCategories;
  @override
  @JsonKey(name: 'business_drink_categories')
  List<CategoryDM> get drinkCategories {
    if (_drinkCategories is EqualUnmodifiableListView) return _drinkCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinkCategories);
  }

  final List<ItemDM> _combos;
  @override
  @JsonKey(name: 'business_combos')
  List<ItemDM> get combos {
    if (_combos is EqualUnmodifiableListView) return _combos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_combos);
  }

  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuDMCopyWith<_MenuDM> get copyWith =>
      __$MenuDMCopyWithImpl<_MenuDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuDM &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            const DeepCollectionEquality()
                .equals(other._foodCategories, _foodCategories) &&
            const DeepCollectionEquality()
                .equals(other._drinkCategories, _drinkCategories) &&
            const DeepCollectionEquality().equals(other._combos, _combos) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      id,
      business,
      businessUuid,
      businessId,
      businessName,
      lastUpdate,
      const DeepCollectionEquality().hash(_foodCategories),
      const DeepCollectionEquality().hash(_drinkCategories),
      const DeepCollectionEquality().hash(_combos),
      followersLength);

  @override
  String toString() {
    return 'MenuDM(uuid: $uuid, id: $id, business: $business, businessUuid: $businessUuid, businessId: $businessId, businessName: $businessName, lastUpdate: $lastUpdate, foodCategories: $foodCategories, drinkCategories: $drinkCategories, combos: $combos, followersLength: $followersLength)';
  }
}

/// @nodoc
abstract mixin class _$MenuDMCopyWith<$Res> implements $MenuDMCopyWith<$Res> {
  factory _$MenuDMCopyWith(_MenuDM value, $Res Function(_MenuDM) _then) =
      __$MenuDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      int? id,
      BusinessDM? business,
      @JsonKey(name: 'business_uuid') String businessUuid,
      @JsonKey(name: 'business_id') int? businessId,
      @JsonKey(name: 'business_name') String? businessName,
      @JsonKey(name: 'updated_at') DateTime? lastUpdate,
      @JsonKey(name: 'business_food_categories')
      List<CategoryDM> foodCategories,
      @JsonKey(name: 'business_drink_categories')
      List<CategoryDM> drinkCategories,
      @JsonKey(name: 'business_combos') List<ItemDM> combos,
      @JsonKey(name: 'followers_length') int followersLength});

  @override
  $BusinessDMCopyWith<$Res>? get business;
}

/// @nodoc
class __$MenuDMCopyWithImpl<$Res> implements _$MenuDMCopyWith<$Res> {
  __$MenuDMCopyWithImpl(this._self, this._then);

  final _MenuDM _self;
  final $Res Function(_MenuDM) _then;

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? id = freezed,
    Object? business = freezed,
    Object? businessUuid = null,
    Object? businessId = freezed,
    Object? businessName = freezed,
    Object? lastUpdate = freezed,
    Object? foodCategories = null,
    Object? drinkCategories = null,
    Object? combos = null,
    Object? followersLength = null,
  }) {
    return _then(_MenuDM(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      businessUuid: null == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessName: freezed == businessName
          ? _self.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      foodCategories: null == foodCategories
          ? _self._foodCategories
          : foodCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      drinkCategories: null == drinkCategories
          ? _self._drinkCategories
          : drinkCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDM>,
      combos: null == combos
          ? _self._combos
          : combos // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of MenuDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }
}

/// @nodoc
mixin _$CategoryDM {
  String get name;
  String get uuid;
  int? get id;
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  List<ItemDM> get items;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get editingName;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDMCopyWith<CategoryDM> get copyWith =>
      _$CategoryDMCopyWithImpl<CategoryDM>(this as CategoryDM, _$identity);

  /// Serializes this CategoryDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDM &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.editingName, editingName) ||
                other.editingName == editingName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, id, sortOrder,
      const DeepCollectionEquality().hash(items), editingName);

  @override
  String toString() {
    return 'CategoryDM(name: $name, uuid: $uuid, id: $id, sortOrder: $sortOrder, items: $items, editingName: $editingName)';
  }
}

/// @nodoc
abstract mixin class $CategoryDMCopyWith<$Res> {
  factory $CategoryDMCopyWith(
          CategoryDM value, $Res Function(CategoryDM) _then) =
      _$CategoryDMCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String uuid,
      int? id,
      @JsonKey(name: 'sort_order') int sortOrder,
      List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false) bool editingName});
}

/// @nodoc
class _$CategoryDMCopyWithImpl<$Res> implements $CategoryDMCopyWith<$Res> {
  _$CategoryDMCopyWithImpl(this._self, this._then);

  final CategoryDM _self;
  final $Res Function(CategoryDM) _then;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? id = freezed,
    Object? sortOrder = null,
    Object? items = null,
    Object? editingName = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      editingName: null == editingName
          ? _self.editingName
          : editingName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoryDM].
extension CategoryDMPatterns on CategoryDM {
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
    TResult Function(_CategoryDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
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
    TResult Function(_CategoryDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM():
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
    TResult? Function(_CategoryDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
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
            String name,
            String uuid,
            int? id,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ItemDM> items,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool editingName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
        return $default(_that.name, _that.uuid, _that.id, _that.sortOrder,
            _that.items, _that.editingName);
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
            String name,
            String uuid,
            int? id,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ItemDM> items,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool editingName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM():
        return $default(_that.name, _that.uuid, _that.id, _that.sortOrder,
            _that.items, _that.editingName);
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
            String name,
            String uuid,
            int? id,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ItemDM> items,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool editingName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDM() when $default != null:
        return $default(_that.name, _that.uuid, _that.id, _that.sortOrder,
            _that.items, _that.editingName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryDM extends CategoryDM {
  _CategoryDM(
      {required this.name,
      required this.uuid,
      this.id,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      required final List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.editingName = false})
      : _items = items,
        super._();
  factory _CategoryDM.fromJson(Map<String, dynamic> json) =>
      _$CategoryDMFromJson(json);

  @override
  final String name;
  @override
  final String uuid;
  @override
  final int? id;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  final List<ItemDM> _items;
  @override
  List<ItemDM> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool editingName;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDMCopyWith<_CategoryDM> get copyWith =>
      __$CategoryDMCopyWithImpl<_CategoryDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDM &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.editingName, editingName) ||
                other.editingName == editingName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, id, sortOrder,
      const DeepCollectionEquality().hash(_items), editingName);

  @override
  String toString() {
    return 'CategoryDM(name: $name, uuid: $uuid, id: $id, sortOrder: $sortOrder, items: $items, editingName: $editingName)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDMCopyWith<$Res>
    implements $CategoryDMCopyWith<$Res> {
  factory _$CategoryDMCopyWith(
          _CategoryDM value, $Res Function(_CategoryDM) _then) =
      __$CategoryDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      int? id,
      @JsonKey(name: 'sort_order') int sortOrder,
      List<ItemDM> items,
      @JsonKey(includeFromJson: false, includeToJson: false) bool editingName});
}

/// @nodoc
class __$CategoryDMCopyWithImpl<$Res> implements _$CategoryDMCopyWith<$Res> {
  __$CategoryDMCopyWithImpl(this._self, this._then);

  final _CategoryDM _self;
  final $Res Function(_CategoryDM) _then;

  /// Create a copy of CategoryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? id = freezed,
    Object? sortOrder = null,
    Object? items = null,
    Object? editingName = null,
  }) {
    return _then(_CategoryDM(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemDM>,
      editingName: null == editingName
          ? _self.editingName
          : editingName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
