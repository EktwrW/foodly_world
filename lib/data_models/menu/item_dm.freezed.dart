// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemDM {
  String get name;
  String get description;
  List<Version> get versions;
  Prices get prices;
  int? get id;
  String get uuid;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodPhotos;
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkPhotos;
  @JsonKey(name: 'business_combos_reference_photos')
  List<MenuItemPhotoDM>? get comboPhotos;
  @JsonKey(name: 'favorites_count')
  int get favoritesCount;
  @JsonKey(name: 'business_food_category_id')
  int? get foodCategoryId;
  @JsonKey(name: 'business_drink_category_id')
  int? get drinkCategoryId;
  @JsonKey(name: 'business_menu_id')
  int? get comboCategoryId;
  bool get available;
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @JsonKey(name: 'sort_order')
  int get sortOrder; // Attributes for editing and rendering
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<MenuItemPhotoDM>? get newPhotos;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Version? get selectedVersion;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ItemEditing get editingField;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get imagePaths;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get photosRemovedDuringEdition;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemDMCopyWith<ItemDM> get copyWith =>
      _$ItemDMCopyWithImpl<ItemDM>(this as ItemDM, _$identity);

  /// Serializes this ItemDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemDM &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.versions, versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            const DeepCollectionEquality()
                .equals(other.foodPhotos, foodPhotos) &&
            const DeepCollectionEquality()
                .equals(other.drinkPhotos, drinkPhotos) &&
            const DeepCollectionEquality()
                .equals(other.comboPhotos, comboPhotos) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.foodCategoryId, foodCategoryId) ||
                other.foodCategoryId == foodCategoryId) &&
            (identical(other.drinkCategoryId, drinkCategoryId) ||
                other.drinkCategoryId == drinkCategoryId) &&
            (identical(other.comboCategoryId, comboCategoryId) ||
                other.comboCategoryId == comboCategoryId) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other.newPhotos, newPhotos) &&
            (identical(other.selectedVersion, selectedVersion) ||
                other.selectedVersion == selectedVersion) &&
            (identical(other.editingField, editingField) ||
                other.editingField == editingField) &&
            const DeepCollectionEquality()
                .equals(other.imagePaths, imagePaths) &&
            (identical(other.photosRemovedDuringEdition,
                    photosRemovedDuringEdition) ||
                other.photosRemovedDuringEdition ==
                    photosRemovedDuringEdition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        description,
        const DeepCollectionEquality().hash(versions),
        prices,
        id,
        uuid,
        menuUuid,
        businessUuid,
        const DeepCollectionEquality().hash(foodPhotos),
        const DeepCollectionEquality().hash(drinkPhotos),
        const DeepCollectionEquality().hash(comboPhotos),
        favoritesCount,
        foodCategoryId,
        drinkCategoryId,
        comboCategoryId,
        available,
        followersLength,
        sortOrder,
        const DeepCollectionEquality().hash(newPhotos),
        selectedVersion,
        editingField,
        const DeepCollectionEquality().hash(imagePaths),
        photosRemovedDuringEdition
      ]);

  @override
  String toString() {
    return 'ItemDM(name: $name, description: $description, versions: $versions, prices: $prices, id: $id, uuid: $uuid, menuUuid: $menuUuid, businessUuid: $businessUuid, foodPhotos: $foodPhotos, drinkPhotos: $drinkPhotos, comboPhotos: $comboPhotos, favoritesCount: $favoritesCount, foodCategoryId: $foodCategoryId, drinkCategoryId: $drinkCategoryId, comboCategoryId: $comboCategoryId, available: $available, followersLength: $followersLength, sortOrder: $sortOrder, newPhotos: $newPhotos, selectedVersion: $selectedVersion, editingField: $editingField, imagePaths: $imagePaths, photosRemovedDuringEdition: $photosRemovedDuringEdition)';
  }
}

/// @nodoc
abstract mixin class $ItemDMCopyWith<$Res> {
  factory $ItemDMCopyWith(ItemDM value, $Res Function(ItemDM) _then) =
      _$ItemDMCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String description,
      List<Version> versions,
      Prices prices,
      int? id,
      String uuid,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_food_reference_photos')
      List<MenuItemPhotoDM>? foodPhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      List<MenuItemPhotoDM>? drinkPhotos,
      @JsonKey(name: 'business_combos_reference_photos')
      List<MenuItemPhotoDM>? comboPhotos,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
      @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
      @JsonKey(name: 'business_menu_id') int? comboCategoryId,
      bool available,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<MenuItemPhotoDM>? newPhotos,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Version? selectedVersion,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ItemEditing editingField,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> imagePaths,
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool photosRemovedDuringEdition});

  $PricesCopyWith<$Res> get prices;
}

/// @nodoc
class _$ItemDMCopyWithImpl<$Res> implements $ItemDMCopyWith<$Res> {
  _$ItemDMCopyWithImpl(this._self, this._then);

  final ItemDM _self;
  final $Res Function(ItemDM) _then;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? versions = null,
    Object? prices = null,
    Object? id = freezed,
    Object? uuid = null,
    Object? menuUuid = freezed,
    Object? businessUuid = freezed,
    Object? foodPhotos = freezed,
    Object? drinkPhotos = freezed,
    Object? comboPhotos = freezed,
    Object? favoritesCount = null,
    Object? foodCategoryId = freezed,
    Object? drinkCategoryId = freezed,
    Object? comboCategoryId = freezed,
    Object? available = null,
    Object? followersLength = null,
    Object? sortOrder = null,
    Object? newPhotos = freezed,
    Object? selectedVersion = freezed,
    Object? editingField = null,
    Object? imagePaths = null,
    Object? photosRemovedDuringEdition = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _self.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: null == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodPhotos: freezed == foodPhotos
          ? _self.foodPhotos
          : foodPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkPhotos: freezed == drinkPhotos
          ? _self.drinkPhotos
          : drinkPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboPhotos: freezed == comboPhotos
          ? _self.comboPhotos
          : comboPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      foodCategoryId: freezed == foodCategoryId
          ? _self.foodCategoryId
          : foodCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkCategoryId: freezed == drinkCategoryId
          ? _self.drinkCategoryId
          : drinkCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboCategoryId: freezed == comboCategoryId
          ? _self.comboCategoryId
          : comboCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      newPhotos: freezed == newPhotos
          ? _self.newPhotos
          : newPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      selectedVersion: freezed == selectedVersion
          ? _self.selectedVersion
          : selectedVersion // ignore: cast_nullable_to_non_nullable
              as Version?,
      editingField: null == editingField
          ? _self.editingField
          : editingField // ignore: cast_nullable_to_non_nullable
              as ItemEditing,
      imagePaths: null == imagePaths
          ? _self.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photosRemovedDuringEdition: null == photosRemovedDuringEdition
          ? _self.photosRemovedDuringEdition
          : photosRemovedDuringEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res> get prices {
    return $PricesCopyWith<$Res>(_self.prices, (value) {
      return _then(_self.copyWith(prices: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ItemDM].
extension ItemDMPatterns on ItemDM {
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
    TResult Function(_ItemDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemDM() when $default != null:
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
    TResult Function(_ItemDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemDM():
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
    TResult? Function(_ItemDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemDM() when $default != null:
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
            String description,
            List<Version> versions,
            Prices prices,
            int? id,
            String uuid,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodPhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkPhotos,
            @JsonKey(name: 'business_combos_reference_photos')
            List<MenuItemPhotoDM>? comboPhotos,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
            @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
            @JsonKey(name: 'business_menu_id') int? comboCategoryId,
            bool available,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<MenuItemPhotoDM>? newPhotos,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Version? selectedVersion,
            @JsonKey(includeFromJson: false, includeToJson: false)
            ItemEditing editingField,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<String> imagePaths,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool photosRemovedDuringEdition)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemDM() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.versions,
            _that.prices,
            _that.id,
            _that.uuid,
            _that.menuUuid,
            _that.businessUuid,
            _that.foodPhotos,
            _that.drinkPhotos,
            _that.comboPhotos,
            _that.favoritesCount,
            _that.foodCategoryId,
            _that.drinkCategoryId,
            _that.comboCategoryId,
            _that.available,
            _that.followersLength,
            _that.sortOrder,
            _that.newPhotos,
            _that.selectedVersion,
            _that.editingField,
            _that.imagePaths,
            _that.photosRemovedDuringEdition);
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
            String description,
            List<Version> versions,
            Prices prices,
            int? id,
            String uuid,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodPhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkPhotos,
            @JsonKey(name: 'business_combos_reference_photos')
            List<MenuItemPhotoDM>? comboPhotos,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
            @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
            @JsonKey(name: 'business_menu_id') int? comboCategoryId,
            bool available,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<MenuItemPhotoDM>? newPhotos,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Version? selectedVersion,
            @JsonKey(includeFromJson: false, includeToJson: false)
            ItemEditing editingField,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<String> imagePaths,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool photosRemovedDuringEdition)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemDM():
        return $default(
            _that.name,
            _that.description,
            _that.versions,
            _that.prices,
            _that.id,
            _that.uuid,
            _that.menuUuid,
            _that.businessUuid,
            _that.foodPhotos,
            _that.drinkPhotos,
            _that.comboPhotos,
            _that.favoritesCount,
            _that.foodCategoryId,
            _that.drinkCategoryId,
            _that.comboCategoryId,
            _that.available,
            _that.followersLength,
            _that.sortOrder,
            _that.newPhotos,
            _that.selectedVersion,
            _that.editingField,
            _that.imagePaths,
            _that.photosRemovedDuringEdition);
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
            String description,
            List<Version> versions,
            Prices prices,
            int? id,
            String uuid,
            @JsonKey(name: 'menu_uuid') String? menuUuid,
            @JsonKey(name: 'business_uuid') String? businessUuid,
            @JsonKey(name: 'business_food_reference_photos')
            List<MenuItemPhotoDM>? foodPhotos,
            @JsonKey(name: 'business_drink_reference_photos')
            List<MenuItemPhotoDM>? drinkPhotos,
            @JsonKey(name: 'business_combos_reference_photos')
            List<MenuItemPhotoDM>? comboPhotos,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
            @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
            @JsonKey(name: 'business_menu_id') int? comboCategoryId,
            bool available,
            @JsonKey(name: 'followers_length') int followersLength,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<MenuItemPhotoDM>? newPhotos,
            @JsonKey(includeFromJson: false, includeToJson: false)
            Version? selectedVersion,
            @JsonKey(includeFromJson: false, includeToJson: false)
            ItemEditing editingField,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<String> imagePaths,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool photosRemovedDuringEdition)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemDM() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.versions,
            _that.prices,
            _that.id,
            _that.uuid,
            _that.menuUuid,
            _that.businessUuid,
            _that.foodPhotos,
            _that.drinkPhotos,
            _that.comboPhotos,
            _that.favoritesCount,
            _that.foodCategoryId,
            _that.drinkCategoryId,
            _that.comboCategoryId,
            _that.available,
            _that.followersLength,
            _that.sortOrder,
            _that.newPhotos,
            _that.selectedVersion,
            _that.editingField,
            _that.imagePaths,
            _that.photosRemovedDuringEdition);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ItemDM extends ItemDM {
  const _ItemDM(
      {required this.name,
      this.description = '',
      required final List<Version> versions,
      required this.prices,
      required this.id,
      required this.uuid,
      @JsonKey(name: 'menu_uuid') this.menuUuid,
      @JsonKey(name: 'business_uuid') this.businessUuid,
      @JsonKey(name: 'business_food_reference_photos')
      final List<MenuItemPhotoDM>? foodPhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      final List<MenuItemPhotoDM>? drinkPhotos,
      @JsonKey(name: 'business_combos_reference_photos')
      final List<MenuItemPhotoDM>? comboPhotos,
      @JsonKey(name: 'favorites_count') this.favoritesCount = 0,
      @JsonKey(name: 'business_food_category_id') this.foodCategoryId,
      @JsonKey(name: 'business_drink_category_id') this.drinkCategoryId,
      @JsonKey(name: 'business_menu_id') this.comboCategoryId,
      this.available = true,
      @JsonKey(name: 'followers_length') this.followersLength = 0,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<MenuItemPhotoDM>? newPhotos,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.selectedVersion,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.editingField = ItemEditing.none,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> imagePaths = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.photosRemovedDuringEdition = false})
      : _versions = versions,
        _foodPhotos = foodPhotos,
        _drinkPhotos = drinkPhotos,
        _comboPhotos = comboPhotos,
        _newPhotos = newPhotos,
        _imagePaths = imagePaths,
        super._();
  factory _ItemDM.fromJson(Map<String, dynamic> json) => _$ItemDMFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<Version> _versions;
  @override
  List<Version> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  final Prices prices;
  @override
  final int? id;
  @override
  final String uuid;
  @override
  @JsonKey(name: 'menu_uuid')
  final String? menuUuid;
  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  final List<MenuItemPhotoDM>? _foodPhotos;
  @override
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodPhotos {
    final value = _foodPhotos;
    if (value == null) return null;
    if (_foodPhotos is EqualUnmodifiableListView) return _foodPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuItemPhotoDM>? _drinkPhotos;
  @override
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkPhotos {
    final value = _drinkPhotos;
    if (value == null) return null;
    if (_drinkPhotos is EqualUnmodifiableListView) return _drinkPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MenuItemPhotoDM>? _comboPhotos;
  @override
  @JsonKey(name: 'business_combos_reference_photos')
  List<MenuItemPhotoDM>? get comboPhotos {
    final value = _comboPhotos;
    if (value == null) return null;
    if (_comboPhotos is EqualUnmodifiableListView) return _comboPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;
  @override
  @JsonKey(name: 'business_food_category_id')
  final int? foodCategoryId;
  @override
  @JsonKey(name: 'business_drink_category_id')
  final int? drinkCategoryId;
  @override
  @JsonKey(name: 'business_menu_id')
  final int? comboCategoryId;
  @override
  @JsonKey()
  final bool available;
  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
// Attributes for editing and rendering
  final List<MenuItemPhotoDM>? _newPhotos;
// Attributes for editing and rendering
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<MenuItemPhotoDM>? get newPhotos {
    final value = _newPhotos;
    if (value == null) return null;
    if (_newPhotos is EqualUnmodifiableListView) return _newPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Version? selectedVersion;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final ItemEditing editingField;
  final List<String> _imagePaths;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool photosRemovedDuringEdition;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemDMCopyWith<_ItemDM> get copyWith =>
      __$ItemDMCopyWithImpl<_ItemDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemDM &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.menuUuid, menuUuid) ||
                other.menuUuid == menuUuid) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            const DeepCollectionEquality()
                .equals(other._foodPhotos, _foodPhotos) &&
            const DeepCollectionEquality()
                .equals(other._drinkPhotos, _drinkPhotos) &&
            const DeepCollectionEquality()
                .equals(other._comboPhotos, _comboPhotos) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.foodCategoryId, foodCategoryId) ||
                other.foodCategoryId == foodCategoryId) &&
            (identical(other.drinkCategoryId, drinkCategoryId) ||
                other.drinkCategoryId == drinkCategoryId) &&
            (identical(other.comboCategoryId, comboCategoryId) ||
                other.comboCategoryId == comboCategoryId) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other._newPhotos, _newPhotos) &&
            (identical(other.selectedVersion, selectedVersion) ||
                other.selectedVersion == selectedVersion) &&
            (identical(other.editingField, editingField) ||
                other.editingField == editingField) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths) &&
            (identical(other.photosRemovedDuringEdition,
                    photosRemovedDuringEdition) ||
                other.photosRemovedDuringEdition ==
                    photosRemovedDuringEdition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        description,
        const DeepCollectionEquality().hash(_versions),
        prices,
        id,
        uuid,
        menuUuid,
        businessUuid,
        const DeepCollectionEquality().hash(_foodPhotos),
        const DeepCollectionEquality().hash(_drinkPhotos),
        const DeepCollectionEquality().hash(_comboPhotos),
        favoritesCount,
        foodCategoryId,
        drinkCategoryId,
        comboCategoryId,
        available,
        followersLength,
        sortOrder,
        const DeepCollectionEquality().hash(_newPhotos),
        selectedVersion,
        editingField,
        const DeepCollectionEquality().hash(_imagePaths),
        photosRemovedDuringEdition
      ]);

  @override
  String toString() {
    return 'ItemDM(name: $name, description: $description, versions: $versions, prices: $prices, id: $id, uuid: $uuid, menuUuid: $menuUuid, businessUuid: $businessUuid, foodPhotos: $foodPhotos, drinkPhotos: $drinkPhotos, comboPhotos: $comboPhotos, favoritesCount: $favoritesCount, foodCategoryId: $foodCategoryId, drinkCategoryId: $drinkCategoryId, comboCategoryId: $comboCategoryId, available: $available, followersLength: $followersLength, sortOrder: $sortOrder, newPhotos: $newPhotos, selectedVersion: $selectedVersion, editingField: $editingField, imagePaths: $imagePaths, photosRemovedDuringEdition: $photosRemovedDuringEdition)';
  }
}

/// @nodoc
abstract mixin class _$ItemDMCopyWith<$Res> implements $ItemDMCopyWith<$Res> {
  factory _$ItemDMCopyWith(_ItemDM value, $Res Function(_ItemDM) _then) =
      __$ItemDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      List<Version> versions,
      Prices prices,
      int? id,
      String uuid,
      @JsonKey(name: 'menu_uuid') String? menuUuid,
      @JsonKey(name: 'business_uuid') String? businessUuid,
      @JsonKey(name: 'business_food_reference_photos')
      List<MenuItemPhotoDM>? foodPhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      List<MenuItemPhotoDM>? drinkPhotos,
      @JsonKey(name: 'business_combos_reference_photos')
      List<MenuItemPhotoDM>? comboPhotos,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
      @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
      @JsonKey(name: 'business_menu_id') int? comboCategoryId,
      bool available,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<MenuItemPhotoDM>? newPhotos,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Version? selectedVersion,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ItemEditing editingField,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> imagePaths,
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool photosRemovedDuringEdition});

  @override
  $PricesCopyWith<$Res> get prices;
}

/// @nodoc
class __$ItemDMCopyWithImpl<$Res> implements _$ItemDMCopyWith<$Res> {
  __$ItemDMCopyWithImpl(this._self, this._then);

  final _ItemDM _self;
  final $Res Function(_ItemDM) _then;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? versions = null,
    Object? prices = null,
    Object? id = freezed,
    Object? uuid = null,
    Object? menuUuid = freezed,
    Object? businessUuid = freezed,
    Object? foodPhotos = freezed,
    Object? drinkPhotos = freezed,
    Object? comboPhotos = freezed,
    Object? favoritesCount = null,
    Object? foodCategoryId = freezed,
    Object? drinkCategoryId = freezed,
    Object? comboCategoryId = freezed,
    Object? available = null,
    Object? followersLength = null,
    Object? sortOrder = null,
    Object? newPhotos = freezed,
    Object? selectedVersion = freezed,
    Object? editingField = null,
    Object? imagePaths = null,
    Object? photosRemovedDuringEdition = null,
  }) {
    return _then(_ItemDM(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _self._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: null == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      menuUuid: freezed == menuUuid
          ? _self.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodPhotos: freezed == foodPhotos
          ? _self._foodPhotos
          : foodPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkPhotos: freezed == drinkPhotos
          ? _self._drinkPhotos
          : drinkPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboPhotos: freezed == comboPhotos
          ? _self._comboPhotos
          : comboPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      foodCategoryId: freezed == foodCategoryId
          ? _self.foodCategoryId
          : foodCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkCategoryId: freezed == drinkCategoryId
          ? _self.drinkCategoryId
          : drinkCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboCategoryId: freezed == comboCategoryId
          ? _self.comboCategoryId
          : comboCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      newPhotos: freezed == newPhotos
          ? _self._newPhotos
          : newPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      selectedVersion: freezed == selectedVersion
          ? _self.selectedVersion
          : selectedVersion // ignore: cast_nullable_to_non_nullable
              as Version?,
      editingField: null == editingField
          ? _self.editingField
          : editingField // ignore: cast_nullable_to_non_nullable
              as ItemEditing,
      imagePaths: null == imagePaths
          ? _self._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photosRemovedDuringEdition: null == photosRemovedDuringEdition
          ? _self.photosRemovedDuringEdition
          : photosRemovedDuringEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res> get prices {
    return $PricesCopyWith<$Res>(_self.prices, (value) {
      return _then(_self.copyWith(prices: value));
    });
  }
}

/// @nodoc
mixin _$Prices {
  double get regular;
  double get medium;
  double get big;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PricesCopyWith<Prices> get copyWith =>
      _$PricesCopyWithImpl<Prices>(this as Prices, _$identity);

  /// Serializes this Prices to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Prices &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.big, big) || other.big == big));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regular, medium, big);

  @override
  String toString() {
    return 'Prices(regular: $regular, medium: $medium, big: $big)';
  }
}

/// @nodoc
abstract mixin class $PricesCopyWith<$Res> {
  factory $PricesCopyWith(Prices value, $Res Function(Prices) _then) =
      _$PricesCopyWithImpl;
  @useResult
  $Res call({double regular, double medium, double big});
}

/// @nodoc
class _$PricesCopyWithImpl<$Res> implements $PricesCopyWith<$Res> {
  _$PricesCopyWithImpl(this._self, this._then);

  final Prices _self;
  final $Res Function(Prices) _then;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
  }) {
    return _then(_self.copyWith(
      regular: null == regular
          ? _self.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _self.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      big: null == big
          ? _self.big
          : big // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Prices].
extension PricesPatterns on Prices {
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
    TResult Function(_Prices value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Prices() when $default != null:
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
    TResult Function(_Prices value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Prices():
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
    TResult? Function(_Prices value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Prices() when $default != null:
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
    TResult Function(double regular, double medium, double big)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Prices() when $default != null:
        return $default(_that.regular, _that.medium, _that.big);
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
    TResult Function(double regular, double medium, double big) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Prices():
        return $default(_that.regular, _that.medium, _that.big);
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
    TResult? Function(double regular, double medium, double big)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Prices() when $default != null:
        return $default(_that.regular, _that.medium, _that.big);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Prices implements Prices {
  const _Prices({this.regular = 0, this.medium = 0, this.big = 0});
  factory _Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);

  @override
  @JsonKey()
  final double regular;
  @override
  @JsonKey()
  final double medium;
  @override
  @JsonKey()
  final double big;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PricesCopyWith<_Prices> get copyWith =>
      __$PricesCopyWithImpl<_Prices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PricesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Prices &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.big, big) || other.big == big));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regular, medium, big);

  @override
  String toString() {
    return 'Prices(regular: $regular, medium: $medium, big: $big)';
  }
}

/// @nodoc
abstract mixin class _$PricesCopyWith<$Res> implements $PricesCopyWith<$Res> {
  factory _$PricesCopyWith(_Prices value, $Res Function(_Prices) _then) =
      __$PricesCopyWithImpl;
  @override
  @useResult
  $Res call({double regular, double medium, double big});
}

/// @nodoc
class __$PricesCopyWithImpl<$Res> implements _$PricesCopyWith<$Res> {
  __$PricesCopyWithImpl(this._self, this._then);

  final _Prices _self;
  final $Res Function(_Prices) _then;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
  }) {
    return _then(_Prices(
      regular: null == regular
          ? _self.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _self.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      big: null == big
          ? _self.big
          : big // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
