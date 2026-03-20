// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDM _$ItemDMFromJson(Map<String, dynamic> json) {
  return _ItemDM.fromJson(json);
}

/// @nodoc
mixin _$ItemDM {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Version> get versions => throw _privateConstructorUsedError;
  Prices get prices => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_uuid')
  String? get businessUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodPhotos => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkPhotos => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_combos_reference_photos')
  List<MenuItemPhotoDM>? get comboPhotos => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites_count')
  int get favoritesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_food_category_id')
  int? get foodCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_drink_category_id')
  int? get drinkCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_menu_id')
  int? get comboCategoryId => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_length')
  int get followersLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder =>
      throw _privateConstructorUsedError; // Attributes for editing and rendering
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<MenuItemPhotoDM>? get newPhotos => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Version? get selectedVersion => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ItemEditing get editingField => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get imagePaths => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get photosRemovedDuringEdition => throw _privateConstructorUsedError;

  /// Serializes this ItemDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemDMCopyWith<ItemDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDMCopyWith<$Res> {
  factory $ItemDMCopyWith(ItemDM value, $Res Function(ItemDM) then) =
      _$ItemDMCopyWithImpl<$Res, ItemDM>;
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
class _$ItemDMCopyWithImpl<$Res, $Val extends ItemDM>
    implements $ItemDMCopyWith<$Res> {
  _$ItemDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodPhotos: freezed == foodPhotos
          ? _value.foodPhotos
          : foodPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkPhotos: freezed == drinkPhotos
          ? _value.drinkPhotos
          : drinkPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboPhotos: freezed == comboPhotos
          ? _value.comboPhotos
          : comboPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      foodCategoryId: freezed == foodCategoryId
          ? _value.foodCategoryId
          : foodCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkCategoryId: freezed == drinkCategoryId
          ? _value.drinkCategoryId
          : drinkCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboCategoryId: freezed == comboCategoryId
          ? _value.comboCategoryId
          : comboCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      newPhotos: freezed == newPhotos
          ? _value.newPhotos
          : newPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      selectedVersion: freezed == selectedVersion
          ? _value.selectedVersion
          : selectedVersion // ignore: cast_nullable_to_non_nullable
              as Version?,
      editingField: null == editingField
          ? _value.editingField
          : editingField // ignore: cast_nullable_to_non_nullable
              as ItemEditing,
      imagePaths: null == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photosRemovedDuringEdition: null == photosRemovedDuringEdition
          ? _value.photosRemovedDuringEdition
          : photosRemovedDuringEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res> get prices {
    return $PricesCopyWith<$Res>(_value.prices, (value) {
      return _then(_value.copyWith(prices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemDMImplCopyWith<$Res> implements $ItemDMCopyWith<$Res> {
  factory _$$ItemDMImplCopyWith(
          _$ItemDMImpl value, $Res Function(_$ItemDMImpl) then) =
      __$$ItemDMImplCopyWithImpl<$Res>;
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
class __$$ItemDMImplCopyWithImpl<$Res>
    extends _$ItemDMCopyWithImpl<$Res, _$ItemDMImpl>
    implements _$$ItemDMImplCopyWith<$Res> {
  __$$ItemDMImplCopyWithImpl(
      _$ItemDMImpl _value, $Res Function(_$ItemDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ItemDMImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      menuUuid: freezed == menuUuid
          ? _value.menuUuid
          : menuUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      foodPhotos: freezed == foodPhotos
          ? _value._foodPhotos
          : foodPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      drinkPhotos: freezed == drinkPhotos
          ? _value._drinkPhotos
          : drinkPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      comboPhotos: freezed == comboPhotos
          ? _value._comboPhotos
          : comboPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      foodCategoryId: freezed == foodCategoryId
          ? _value.foodCategoryId
          : foodCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      drinkCategoryId: freezed == drinkCategoryId
          ? _value.drinkCategoryId
          : drinkCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      comboCategoryId: freezed == comboCategoryId
          ? _value.comboCategoryId
          : comboCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      newPhotos: freezed == newPhotos
          ? _value._newPhotos
          : newPhotos // ignore: cast_nullable_to_non_nullable
              as List<MenuItemPhotoDM>?,
      selectedVersion: freezed == selectedVersion
          ? _value.selectedVersion
          : selectedVersion // ignore: cast_nullable_to_non_nullable
              as Version?,
      editingField: null == editingField
          ? _value.editingField
          : editingField // ignore: cast_nullable_to_non_nullable
              as ItemEditing,
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photosRemovedDuringEdition: null == photosRemovedDuringEdition
          ? _value.photosRemovedDuringEdition
          : photosRemovedDuringEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDMImpl extends _ItemDM {
  const _$ItemDMImpl(
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

  factory _$ItemDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ItemDM(name: $name, description: $description, versions: $versions, prices: $prices, id: $id, uuid: $uuid, menuUuid: $menuUuid, businessUuid: $businessUuid, foodPhotos: $foodPhotos, drinkPhotos: $drinkPhotos, comboPhotos: $comboPhotos, favoritesCount: $favoritesCount, foodCategoryId: $foodCategoryId, drinkCategoryId: $drinkCategoryId, comboCategoryId: $comboCategoryId, available: $available, followersLength: $followersLength, sortOrder: $sortOrder, newPhotos: $newPhotos, selectedVersion: $selectedVersion, editingField: $editingField, imagePaths: $imagePaths, photosRemovedDuringEdition: $photosRemovedDuringEdition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDMImpl &&
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

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDMImplCopyWith<_$ItemDMImpl> get copyWith =>
      __$$ItemDMImplCopyWithImpl<_$ItemDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDMImplToJson(
      this,
    );
  }
}

abstract class _ItemDM extends ItemDM {
  const factory _ItemDM(
      {required final String name,
      final String description,
      required final List<Version> versions,
      required final Prices prices,
      required final int? id,
      required final String uuid,
      @JsonKey(name: 'menu_uuid') final String? menuUuid,
      @JsonKey(name: 'business_uuid') final String? businessUuid,
      @JsonKey(name: 'business_food_reference_photos')
      final List<MenuItemPhotoDM>? foodPhotos,
      @JsonKey(name: 'business_drink_reference_photos')
      final List<MenuItemPhotoDM>? drinkPhotos,
      @JsonKey(name: 'business_combos_reference_photos')
      final List<MenuItemPhotoDM>? comboPhotos,
      @JsonKey(name: 'favorites_count') final int favoritesCount,
      @JsonKey(name: 'business_food_category_id') final int? foodCategoryId,
      @JsonKey(name: 'business_drink_category_id') final int? drinkCategoryId,
      @JsonKey(name: 'business_menu_id') final int? comboCategoryId,
      final bool available,
      @JsonKey(name: 'followers_length') final int followersLength,
      @JsonKey(name: 'sort_order') final int sortOrder,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<MenuItemPhotoDM>? newPhotos,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Version? selectedVersion,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final ItemEditing editingField,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> imagePaths,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool photosRemovedDuringEdition}) = _$ItemDMImpl;
  const _ItemDM._() : super._();

  factory _ItemDM.fromJson(Map<String, dynamic> json) = _$ItemDMImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<Version> get versions;
  @override
  Prices get prices;
  @override
  int? get id;
  @override
  String get uuid;
  @override
  @JsonKey(name: 'menu_uuid')
  String? get menuUuid;
  @override
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  @override
  @JsonKey(name: 'business_food_reference_photos')
  List<MenuItemPhotoDM>? get foodPhotos;
  @override
  @JsonKey(name: 'business_drink_reference_photos')
  List<MenuItemPhotoDM>? get drinkPhotos;
  @override
  @JsonKey(name: 'business_combos_reference_photos')
  List<MenuItemPhotoDM>? get comboPhotos;
  @override
  @JsonKey(name: 'favorites_count')
  int get favoritesCount;
  @override
  @JsonKey(name: 'business_food_category_id')
  int? get foodCategoryId;
  @override
  @JsonKey(name: 'business_drink_category_id')
  int? get drinkCategoryId;
  @override
  @JsonKey(name: 'business_menu_id')
  int? get comboCategoryId;
  @override
  bool get available;
  @override
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder; // Attributes for editing and rendering
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<MenuItemPhotoDM>? get newPhotos;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Version? get selectedVersion;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  ItemEditing get editingField;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get imagePaths;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get photosRemovedDuringEdition;

  /// Create a copy of ItemDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemDMImplCopyWith<_$ItemDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prices _$PricesFromJson(Map<String, dynamic> json) {
  return _Prices.fromJson(json);
}

/// @nodoc
mixin _$Prices {
  double get regular => throw _privateConstructorUsedError;
  double get medium => throw _privateConstructorUsedError;
  double get big => throw _privateConstructorUsedError;

  /// Serializes this Prices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricesCopyWith<Prices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricesCopyWith<$Res> {
  factory $PricesCopyWith(Prices value, $Res Function(Prices) then) =
      _$PricesCopyWithImpl<$Res, Prices>;
  @useResult
  $Res call({double regular, double medium, double big});
}

/// @nodoc
class _$PricesCopyWithImpl<$Res, $Val extends Prices>
    implements $PricesCopyWith<$Res> {
  _$PricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
  }) {
    return _then(_value.copyWith(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      big: null == big
          ? _value.big
          : big // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricesImplCopyWith<$Res> implements $PricesCopyWith<$Res> {
  factory _$$PricesImplCopyWith(
          _$PricesImpl value, $Res Function(_$PricesImpl) then) =
      __$$PricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double regular, double medium, double big});
}

/// @nodoc
class __$$PricesImplCopyWithImpl<$Res>
    extends _$PricesCopyWithImpl<$Res, _$PricesImpl>
    implements _$$PricesImplCopyWith<$Res> {
  __$$PricesImplCopyWithImpl(
      _$PricesImpl _value, $Res Function(_$PricesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
    Object? medium = null,
    Object? big = null,
  }) {
    return _then(_$PricesImpl(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      big: null == big
          ? _value.big
          : big // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricesImpl implements _Prices {
  const _$PricesImpl({this.regular = 0, this.medium = 0, this.big = 0});

  factory _$PricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricesImplFromJson(json);

  @override
  @JsonKey()
  final double regular;
  @override
  @JsonKey()
  final double medium;
  @override
  @JsonKey()
  final double big;

  @override
  String toString() {
    return 'Prices(regular: $regular, medium: $medium, big: $big)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricesImpl &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.big, big) || other.big == big));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regular, medium, big);

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      __$$PricesImplCopyWithImpl<_$PricesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricesImplToJson(
      this,
    );
  }
}

abstract class _Prices implements Prices {
  const factory _Prices(
      {final double regular,
      final double medium,
      final double big}) = _$PricesImpl;

  factory _Prices.fromJson(Map<String, dynamic> json) = _$PricesImpl.fromJson;

  @override
  double get regular;
  @override
  double get medium;
  @override
  double get big;

  /// Create a copy of Prices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
