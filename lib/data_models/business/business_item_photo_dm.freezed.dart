// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_item_photo_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MenuItemPhotoDM _$MenuItemPhotoDMFromJson(Map<String, dynamic> json) {
  return _MenuItemPhotoDMDM.fromJson(json);
}

/// @nodoc
mixin _$MenuItemPhotoDM {
  int get id;
  String get uuid;
  @JsonKey(name: 'business_food_photo_url')
  String? get businessFoodPhotoUrl;
  @JsonKey(name: 'business_food_item_id')
  int? get businessFoodItemId;
  @JsonKey(name: 'business_drink_photo_url')
  String? get businessDrinkPhotoUrl;
  @JsonKey(name: 'business_drink_item_id')
  int? get businessDrinkItemId;
  @JsonKey(name: 'business_combos_photo_url')
  String? get businessComboPhotoUrl;
  @JsonKey(name: 'business_combos_id')
  int? get businessComboItemId;

  /// Create a copy of MenuItemPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuItemPhotoDMCopyWith<MenuItemPhotoDM> get copyWith =>
      _$MenuItemPhotoDMCopyWithImpl<MenuItemPhotoDM>(
          this as MenuItemPhotoDM, _$identity);

  /// Serializes this MenuItemPhotoDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuItemPhotoDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessFoodPhotoUrl, businessFoodPhotoUrl) ||
                other.businessFoodPhotoUrl == businessFoodPhotoUrl) &&
            (identical(other.businessFoodItemId, businessFoodItemId) ||
                other.businessFoodItemId == businessFoodItemId) &&
            (identical(other.businessDrinkPhotoUrl, businessDrinkPhotoUrl) ||
                other.businessDrinkPhotoUrl == businessDrinkPhotoUrl) &&
            (identical(other.businessDrinkItemId, businessDrinkItemId) ||
                other.businessDrinkItemId == businessDrinkItemId) &&
            (identical(other.businessComboPhotoUrl, businessComboPhotoUrl) ||
                other.businessComboPhotoUrl == businessComboPhotoUrl) &&
            (identical(other.businessComboItemId, businessComboItemId) ||
                other.businessComboItemId == businessComboItemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      businessFoodPhotoUrl,
      businessFoodItemId,
      businessDrinkPhotoUrl,
      businessDrinkItemId,
      businessComboPhotoUrl,
      businessComboItemId);

  @override
  String toString() {
    return 'MenuItemPhotoDM(id: $id, uuid: $uuid, businessFoodPhotoUrl: $businessFoodPhotoUrl, businessFoodItemId: $businessFoodItemId, businessDrinkPhotoUrl: $businessDrinkPhotoUrl, businessDrinkItemId: $businessDrinkItemId, businessComboPhotoUrl: $businessComboPhotoUrl, businessComboItemId: $businessComboItemId)';
  }
}

/// @nodoc
abstract mixin class $MenuItemPhotoDMCopyWith<$Res> {
  factory $MenuItemPhotoDMCopyWith(
          MenuItemPhotoDM value, $Res Function(MenuItemPhotoDM) _then) =
      _$MenuItemPhotoDMCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_food_photo_url') String? businessFoodPhotoUrl,
      @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
      @JsonKey(name: 'business_drink_photo_url') String? businessDrinkPhotoUrl,
      @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
      @JsonKey(name: 'business_combos_photo_url') String? businessComboPhotoUrl,
      @JsonKey(name: 'business_combos_id') int? businessComboItemId});
}

/// @nodoc
class _$MenuItemPhotoDMCopyWithImpl<$Res>
    implements $MenuItemPhotoDMCopyWith<$Res> {
  _$MenuItemPhotoDMCopyWithImpl(this._self, this._then);

  final MenuItemPhotoDM _self;
  final $Res Function(MenuItemPhotoDM) _then;

  /// Create a copy of MenuItemPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? businessFoodPhotoUrl = freezed,
    Object? businessFoodItemId = freezed,
    Object? businessDrinkPhotoUrl = freezed,
    Object? businessDrinkItemId = freezed,
    Object? businessComboPhotoUrl = freezed,
    Object? businessComboItemId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessFoodPhotoUrl: freezed == businessFoodPhotoUrl
          ? _self.businessFoodPhotoUrl
          : businessFoodPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessFoodItemId: freezed == businessFoodItemId
          ? _self.businessFoodItemId
          : businessFoodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDrinkPhotoUrl: freezed == businessDrinkPhotoUrl
          ? _self.businessDrinkPhotoUrl
          : businessDrinkPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessDrinkItemId: freezed == businessDrinkItemId
          ? _self.businessDrinkItemId
          : businessDrinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessComboPhotoUrl: freezed == businessComboPhotoUrl
          ? _self.businessComboPhotoUrl
          : businessComboPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessComboItemId: freezed == businessComboItemId
          ? _self.businessComboItemId
          : businessComboItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MenuItemPhotoDM].
extension MenuItemPhotoDMPatterns on MenuItemPhotoDM {
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
    TResult Function(_MenuItemPhotoDMDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM() when $default != null:
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
    TResult Function(_MenuItemPhotoDMDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM():
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
    TResult? Function(_MenuItemPhotoDMDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM() when $default != null:
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
            int id,
            String uuid,
            @JsonKey(name: 'business_food_photo_url')
            String? businessFoodPhotoUrl,
            @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
            @JsonKey(name: 'business_drink_photo_url')
            String? businessDrinkPhotoUrl,
            @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
            @JsonKey(name: 'business_combos_photo_url')
            String? businessComboPhotoUrl,
            @JsonKey(name: 'business_combos_id') int? businessComboItemId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessFoodPhotoUrl,
            _that.businessFoodItemId,
            _that.businessDrinkPhotoUrl,
            _that.businessDrinkItemId,
            _that.businessComboPhotoUrl,
            _that.businessComboItemId);
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
            int id,
            String uuid,
            @JsonKey(name: 'business_food_photo_url')
            String? businessFoodPhotoUrl,
            @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
            @JsonKey(name: 'business_drink_photo_url')
            String? businessDrinkPhotoUrl,
            @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
            @JsonKey(name: 'business_combos_photo_url')
            String? businessComboPhotoUrl,
            @JsonKey(name: 'business_combos_id') int? businessComboItemId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.businessFoodPhotoUrl,
            _that.businessFoodItemId,
            _that.businessDrinkPhotoUrl,
            _that.businessDrinkItemId,
            _that.businessComboPhotoUrl,
            _that.businessComboItemId);
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
            int id,
            String uuid,
            @JsonKey(name: 'business_food_photo_url')
            String? businessFoodPhotoUrl,
            @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
            @JsonKey(name: 'business_drink_photo_url')
            String? businessDrinkPhotoUrl,
            @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
            @JsonKey(name: 'business_combos_photo_url')
            String? businessComboPhotoUrl,
            @JsonKey(name: 'business_combos_id') int? businessComboItemId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoDMDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessFoodPhotoUrl,
            _that.businessFoodItemId,
            _that.businessDrinkPhotoUrl,
            _that.businessDrinkItemId,
            _that.businessComboPhotoUrl,
            _that.businessComboItemId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MenuItemPhotoDMDM implements MenuItemPhotoDM {
  const _MenuItemPhotoDMDM(
      {required this.id,
      required this.uuid,
      @JsonKey(name: 'business_food_photo_url') this.businessFoodPhotoUrl,
      @JsonKey(name: 'business_food_item_id') this.businessFoodItemId,
      @JsonKey(name: 'business_drink_photo_url') this.businessDrinkPhotoUrl,
      @JsonKey(name: 'business_drink_item_id') this.businessDrinkItemId,
      @JsonKey(name: 'business_combos_photo_url') this.businessComboPhotoUrl,
      @JsonKey(name: 'business_combos_id') this.businessComboItemId});
  factory _MenuItemPhotoDMDM.fromJson(Map<String, dynamic> json) =>
      _$MenuItemPhotoDMDMFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  @JsonKey(name: 'business_food_photo_url')
  final String? businessFoodPhotoUrl;
  @override
  @JsonKey(name: 'business_food_item_id')
  final int? businessFoodItemId;
  @override
  @JsonKey(name: 'business_drink_photo_url')
  final String? businessDrinkPhotoUrl;
  @override
  @JsonKey(name: 'business_drink_item_id')
  final int? businessDrinkItemId;
  @override
  @JsonKey(name: 'business_combos_photo_url')
  final String? businessComboPhotoUrl;
  @override
  @JsonKey(name: 'business_combos_id')
  final int? businessComboItemId;

  /// Create a copy of MenuItemPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuItemPhotoDMDMCopyWith<_MenuItemPhotoDMDM> get copyWith =>
      __$MenuItemPhotoDMDMCopyWithImpl<_MenuItemPhotoDMDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuItemPhotoDMDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuItemPhotoDMDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessFoodPhotoUrl, businessFoodPhotoUrl) ||
                other.businessFoodPhotoUrl == businessFoodPhotoUrl) &&
            (identical(other.businessFoodItemId, businessFoodItemId) ||
                other.businessFoodItemId == businessFoodItemId) &&
            (identical(other.businessDrinkPhotoUrl, businessDrinkPhotoUrl) ||
                other.businessDrinkPhotoUrl == businessDrinkPhotoUrl) &&
            (identical(other.businessDrinkItemId, businessDrinkItemId) ||
                other.businessDrinkItemId == businessDrinkItemId) &&
            (identical(other.businessComboPhotoUrl, businessComboPhotoUrl) ||
                other.businessComboPhotoUrl == businessComboPhotoUrl) &&
            (identical(other.businessComboItemId, businessComboItemId) ||
                other.businessComboItemId == businessComboItemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      businessFoodPhotoUrl,
      businessFoodItemId,
      businessDrinkPhotoUrl,
      businessDrinkItemId,
      businessComboPhotoUrl,
      businessComboItemId);

  @override
  String toString() {
    return 'MenuItemPhotoDM(id: $id, uuid: $uuid, businessFoodPhotoUrl: $businessFoodPhotoUrl, businessFoodItemId: $businessFoodItemId, businessDrinkPhotoUrl: $businessDrinkPhotoUrl, businessDrinkItemId: $businessDrinkItemId, businessComboPhotoUrl: $businessComboPhotoUrl, businessComboItemId: $businessComboItemId)';
  }
}

/// @nodoc
abstract mixin class _$MenuItemPhotoDMDMCopyWith<$Res>
    implements $MenuItemPhotoDMCopyWith<$Res> {
  factory _$MenuItemPhotoDMDMCopyWith(
          _MenuItemPhotoDMDM value, $Res Function(_MenuItemPhotoDMDM) _then) =
      __$MenuItemPhotoDMDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_food_photo_url') String? businessFoodPhotoUrl,
      @JsonKey(name: 'business_food_item_id') int? businessFoodItemId,
      @JsonKey(name: 'business_drink_photo_url') String? businessDrinkPhotoUrl,
      @JsonKey(name: 'business_drink_item_id') int? businessDrinkItemId,
      @JsonKey(name: 'business_combos_photo_url') String? businessComboPhotoUrl,
      @JsonKey(name: 'business_combos_id') int? businessComboItemId});
}

/// @nodoc
class __$MenuItemPhotoDMDMCopyWithImpl<$Res>
    implements _$MenuItemPhotoDMDMCopyWith<$Res> {
  __$MenuItemPhotoDMDMCopyWithImpl(this._self, this._then);

  final _MenuItemPhotoDMDM _self;
  final $Res Function(_MenuItemPhotoDMDM) _then;

  /// Create a copy of MenuItemPhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? businessFoodPhotoUrl = freezed,
    Object? businessFoodItemId = freezed,
    Object? businessDrinkPhotoUrl = freezed,
    Object? businessDrinkItemId = freezed,
    Object? businessComboPhotoUrl = freezed,
    Object? businessComboItemId = freezed,
  }) {
    return _then(_MenuItemPhotoDMDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      businessFoodPhotoUrl: freezed == businessFoodPhotoUrl
          ? _self.businessFoodPhotoUrl
          : businessFoodPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessFoodItemId: freezed == businessFoodItemId
          ? _self.businessFoodItemId
          : businessFoodItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessDrinkPhotoUrl: freezed == businessDrinkPhotoUrl
          ? _self.businessDrinkPhotoUrl
          : businessDrinkPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessDrinkItemId: freezed == businessDrinkItemId
          ? _self.businessDrinkItemId
          : businessDrinkItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      businessComboPhotoUrl: freezed == businessComboPhotoUrl
          ? _self.businessComboPhotoUrl
          : businessComboPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      businessComboItemId: freezed == businessComboItemId
          ? _self.businessComboItemId
          : businessComboItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$MenuItemPhotoResponse {
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodReferencePhotos;
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkReferencePhotos;
  @JsonKey(name: 'business_combo_photos')
  List<MenuItemPhotoDM>? get comboReferencePhotos;

  /// Create a copy of MenuItemPhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuItemPhotoResponseCopyWith<MenuItemPhotoResponse> get copyWith =>
      _$MenuItemPhotoResponseCopyWithImpl<MenuItemPhotoResponse>(
          this as MenuItemPhotoResponse, _$identity);

  /// Serializes this MenuItemPhotoResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuItemPhotoResponse &&
            const DeepCollectionEquality()
                .equals(other.foodReferencePhotos, foodReferencePhotos) &&
            const DeepCollectionEquality()
                .equals(other.drinkReferencePhotos, drinkReferencePhotos) &&
            const DeepCollectionEquality()
                .equals(other.comboReferencePhotos, comboReferencePhotos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(foodReferencePhotos),
      const DeepCollectionEquality().hash(drinkReferencePhotos),
      const DeepCollectionEquality().hash(comboReferencePhotos));

  @override
  String toString() {
    return 'MenuItemPhotoResponse(foodReferencePhotos: $foodReferencePhotos, drinkReferencePhotos: $drinkReferencePhotos, comboReferencePhotos: $comboReferencePhotos)';
  }
}

/// @nodoc
abstract mixin class $MenuItemPhotoResponseCopyWith<$Res> {
  factory $MenuItemPhotoResponseCopyWith(MenuItemPhotoResponse value,
          $Res Function(MenuItemPhotoResponse) _then) =
      _$MenuItemPhotoResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_food_reference_photos')
      List<MenuItemPhotoDM>? foodReferencePhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      List<MenuItemPhotoDM>? drinkReferencePhotos,
      @JsonKey(name: 'business_combo_photos')
      List<MenuItemPhotoDM>? comboReferencePhotos});
}

/// @nodoc
class _$MenuItemPhotoResponseCopyWithImpl<$Res>
    implements $MenuItemPhotoResponseCopyWith<$Res> {
  _$MenuItemPhotoResponseCopyWithImpl(this._self, this._then);

  final MenuItemPhotoResponse _self;
  final $Res Function(MenuItemPhotoResponse) _then;

  /// Create a copy of MenuItemPhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodReferencePhotos = freezed,
    Object? drinkReferencePhotos = freezed,
    Object? comboReferencePhotos = freezed,
  }) {
    return _then(_self.copyWith(
      foodReferencePhotos: freezed == foodReferencePhotos
          ? _self.foodReferencePhotos
          : foodReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkReferencePhotos: freezed == drinkReferencePhotos
          ? _self.drinkReferencePhotos
          : drinkReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboReferencePhotos: freezed == comboReferencePhotos
          ? _self.comboReferencePhotos
          : comboReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MenuItemPhotoResponse].
extension MenuItemPhotoResponsePatterns on MenuItemPhotoResponse {
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
    TResult Function(_MenuItemPhotoResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse() when $default != null:
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
    TResult Function(_MenuItemPhotoResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse():
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
    TResult? Function(_MenuItemPhotoResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse() when $default != null:
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
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodReferencePhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkReferencePhotos,
            @JsonKey(name: 'business_combo_photos')
            List<MenuItemPhotoDM>? comboReferencePhotos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse() when $default != null:
        return $default(_that.foodReferencePhotos, _that.drinkReferencePhotos,
            _that.comboReferencePhotos);
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
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodReferencePhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkReferencePhotos,
            @JsonKey(name: 'business_combo_photos')
            List<MenuItemPhotoDM>? comboReferencePhotos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse():
        return $default(_that.foodReferencePhotos, _that.drinkReferencePhotos,
            _that.comboReferencePhotos);
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
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodReferencePhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkReferencePhotos,
            @JsonKey(name: 'business_combo_photos')
            List<MenuItemPhotoDM>? comboReferencePhotos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuItemPhotoResponse() when $default != null:
        return $default(_that.foodReferencePhotos, _that.drinkReferencePhotos,
            _that.comboReferencePhotos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MenuItemPhotoResponse implements MenuItemPhotoResponse {
  const _MenuItemPhotoResponse(
      {@JsonKey(name: 'business_food_reference_photos')
      final List<MenuItemPhotoDM>? foodReferencePhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      final List<MenuItemPhotoDM>? drinkReferencePhotos,
      @JsonKey(name: 'business_combo_photos')
      final List<MenuItemPhotoDM>? comboReferencePhotos})
      : _foodReferencePhotos = foodReferencePhotos,
        _drinkReferencePhotos = drinkReferencePhotos,
        _comboReferencePhotos = comboReferencePhotos;
  factory _MenuItemPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuItemPhotoResponseFromJson(json);

  final List<MenuItemPhotoDM>? _foodReferencePhotos;
  @override
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodReferencePhotos {
    final value = _foodReferencePhotos;
    if (value == null) return null;
    if (_foodReferencePhotos is EqualUnmodifiableListView)
      return _foodReferencePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuItemPhotoDM>? _drinkReferencePhotos;
  @override
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkReferencePhotos {
    final value = _drinkReferencePhotos;
    if (value == null) return null;
    if (_drinkReferencePhotos is EqualUnmodifiableListView)
      return _drinkReferencePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuItemPhotoDM>? _comboReferencePhotos;
  @override
  @JsonKey(name: 'business_combo_photos')
  List<MenuItemPhotoDM>? get comboReferencePhotos {
    final value = _comboReferencePhotos;
    if (value == null) return null;
    if (_comboReferencePhotos is EqualUnmodifiableListView)
      return _comboReferencePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MenuItemPhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuItemPhotoResponseCopyWith<_MenuItemPhotoResponse> get copyWith =>
      __$MenuItemPhotoResponseCopyWithImpl<_MenuItemPhotoResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MenuItemPhotoResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuItemPhotoResponse &&
            const DeepCollectionEquality()
                .equals(other._foodReferencePhotos, _foodReferencePhotos) &&
            const DeepCollectionEquality()
                .equals(other._drinkReferencePhotos, _drinkReferencePhotos) &&
            const DeepCollectionEquality()
                .equals(other._comboReferencePhotos, _comboReferencePhotos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foodReferencePhotos),
      const DeepCollectionEquality().hash(_drinkReferencePhotos),
      const DeepCollectionEquality().hash(_comboReferencePhotos));

  @override
  String toString() {
    return 'MenuItemPhotoResponse(foodReferencePhotos: $foodReferencePhotos, drinkReferencePhotos: $drinkReferencePhotos, comboReferencePhotos: $comboReferencePhotos)';
  }
}

/// @nodoc
abstract mixin class _$MenuItemPhotoResponseCopyWith<$Res>
    implements $MenuItemPhotoResponseCopyWith<$Res> {
  factory _$MenuItemPhotoResponseCopyWith(_MenuItemPhotoResponse value,
          $Res Function(_MenuItemPhotoResponse) _then) =
      __$MenuItemPhotoResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_food_reference_photos')
      List<MenuItemPhotoDM>? foodReferencePhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      List<MenuItemPhotoDM>? drinkReferencePhotos,
      @JsonKey(name: 'business_combo_photos')
      List<MenuItemPhotoDM>? comboReferencePhotos});
}

/// @nodoc
class __$MenuItemPhotoResponseCopyWithImpl<$Res>
    implements _$MenuItemPhotoResponseCopyWith<$Res> {
  __$MenuItemPhotoResponseCopyWithImpl(this._self, this._then);

  final _MenuItemPhotoResponse _self;
  final $Res Function(_MenuItemPhotoResponse) _then;

  /// Create a copy of MenuItemPhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? foodReferencePhotos = freezed,
    Object? drinkReferencePhotos = freezed,
    Object? comboReferencePhotos = freezed,
  }) {
    return _then(_MenuItemPhotoResponse(
      foodReferencePhotos: freezed == foodReferencePhotos
          ? _self._foodReferencePhotos
          : foodReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkReferencePhotos: freezed == drinkReferencePhotos
          ? _self._drinkReferencePhotos
          : drinkReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboReferencePhotos: freezed == comboReferencePhotos
          ? _self._comboReferencePhotos
          : comboReferencePhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
    ));
  }
}

// dart format on
