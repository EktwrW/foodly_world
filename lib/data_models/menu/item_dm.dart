import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/data_models/business/business_item_photo_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu/item_register_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/core/enums/foodly_enums.dart' show ItemEditing, Version, MenuCategory;

part 'item_dm.freezed.dart';
part 'item_dm.g.dart';

@freezed
abstract class ItemDM with _$ItemDM {
  const ItemDM._();

  const factory ItemDM({
    required String name,
    @Default('') String description,
    required List<Version> versions,
    required Prices prices,
    required int? id,
    required String uuid,
    @JsonKey(name: 'menu_uuid') String? menuUuid,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_food_reference_photos') List<MenuItemPhotoDM>? foodPhotos,
    @JsonKey(name: 'business_drink_reference_photos') List<MenuItemPhotoDM>? drinkPhotos,
    @JsonKey(name: 'business_combos_reference_photos') List<MenuItemPhotoDM>? comboPhotos,
    @JsonKey(name: 'favorites_count') @Default(0) int favoritesCount,
    @JsonKey(name: 'business_food_category_id') int? foodCategoryId,
    @JsonKey(name: 'business_drink_category_id') int? drinkCategoryId,
    @JsonKey(name: 'business_menu_id') int? comboCategoryId,
    @Default(true) bool available,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,

    // Attributes for editing and rendering

    @JsonKey(includeFromJson: false, includeToJson: false) List<MenuItemPhotoDM>? newPhotos,
    @JsonKey(includeFromJson: false, includeToJson: false) Version? selectedVersion,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(ItemEditing.none) ItemEditing editingField,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default([]) List<String> imagePaths,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool photosRemovedDuringEdition,
  }) = _ItemDM;

  factory ItemDM.fromJson(Map<String, dynamic> json) => _$ItemDMFromJson(json);

  int get categoryId => foodCategoryId ?? drinkCategoryId ?? comboCategoryId ?? 0;

  List<MenuItemPhotoDM>? get referencePhotos => newPhotos ?? foodPhotos ?? drinkPhotos ?? comboPhotos;

  bool get hasSavedPhotos => referencePhotos?.isNotEmpty ?? false;

  List<Version> get sortedVersions => List.from(versions)..sort((a, b) => a.index.compareTo(b.index));

  bool get isEditing => editingField != ItemEditing.none;
  bool get isEditingName => editingField == ItemEditing.name;
  bool get isEditingDescription => editingField == ItemEditing.description;
  bool get isEditingVersions => editingField == ItemEditing.versions;
  bool get isEditingPrices => editingField == ItemEditing.prices;
  bool get isEditingPictures => editingField == ItemEditing.pictures;

  bool get isNewItem => uuid == FoodlyStrings.NEW_ITEM;

  Map<Version, double> get _pricesMap => {
        Version.regular: prices.regular,
        Version.medium: prices.medium,
        Version.big: prices.big,
      };
  Version get getSelectedVersion => selectedVersion ?? sortedVersions.first;

  double? get currentPrice => _pricesMap[getSelectedVersion];
  double? getVersionPrice(Version version) => _pricesMap[version];
  bool checkIfVersionCanBeSaved(Version version) => _pricesMap[version] != null && ((_pricesMap[version] ?? 0) > 0);
  bool showAddPriceWarning(Version v) => versions.contains(v) && !checkIfVersionCanBeSaved(v);
  bool get canBeSaved => (versions.every((v) => showAddPriceWarning(v) == false) || !available) && name.length > 2;
}

@freezed
abstract class Prices with _$Prices {
  const factory Prices({
    @Default(0) double regular,
    @Default(0) double medium,
    @Default(0) double big,
  }) = _Prices;

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);
}

extension ItemDMToRegisterDTO on ItemDM {
  ItemRegisterDTO toRegisterDTO({required MenuCategory menuCategory}) {
    final Map<String, double> prices = {
      'regular': this.prices.regular,
      'medium': this.prices.medium,
      'big': this.prices.big,
    };

    final List<String> versions = this.versions.map((v) => v.value).toList();

    final int validCategoryId = categoryId;
    if (validCategoryId <= 0) {
      throw ArgumentError('Invalid category ID: Category ID must be greater than 0');
    }

    switch (menuCategory) {
      case MenuCategory.food:
        return FoodItemRegisterDTO(
          businessFoodCategoryId: validCategoryId,
          name: name.trim(),
          description: description.trim(),
          versions: versions,
          prices: prices,
          favoritesCount: favoritesCount,
          available: available,
        );
      case MenuCategory.drinks:
        return DrinkItemRegisterDTO(
          businessDrinkCategoryId: validCategoryId,
          name: name.trim(),
          description: description.trim(),
          versions: versions,
          prices: prices,
          favoritesCount: favoritesCount,
          available: available,
        );
      case MenuCategory.combos:
        return ComboItemRegisterDTO(
          businessMenuId: validCategoryId,
          name: name.trim(),
          description: description.trim(),
          versions: versions,
          prices: prices,
          favoritesCount: favoritesCount,
          available: available,
        );
    }
  }
}
