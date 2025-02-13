import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dm.freezed.dart';
part 'menu_dm.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  factory MenuResponse({
    @JsonKey(name: 'menu') required MenuDM menuDM,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}

@freezed
class MenuDM with _$MenuDM {
  const MenuDM._();

  factory MenuDM({
    required String uuid,
    int? id,
    BusinessDM? business,
    @JsonKey(name: 'business_uuid') required String businessUuid,
    @JsonKey(name: 'business_id') int? businessId,
    @JsonKey(name: 'updated_at') DateTime? lastUpdate,
    @JsonKey(name: 'business_food_categories') @Default([]) List<CategoryDM> foodCategories,
    @JsonKey(name: 'business_drink_categories') @Default([]) List<CategoryDM> drinkCategories,
    @JsonKey(name: 'business_combos') @Default([]) List<ItemDM> combos,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,
  }) = _MenuDM;

  factory MenuDM.fromJson(Map<String, dynamic> json) => _$MenuDMFromJson(json);

  Map<MenuCategory, List<CategoryDM>?> get subCategories => {
        MenuCategory.food: foodCategories,
        MenuCategory.drinks: drinkCategories,
      };
}

@freezed
class CategoryDM with _$CategoryDM {
  const CategoryDM._();

  factory CategoryDM({
    required String name,
    required String uuid,
    int? id,
    required List<ItemDM> items,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool editingName,
  }) = _CategoryDM;

  factory CategoryDM.fromJson(Map<String, dynamic> json) => _$CategoryDMFromJson(json);
}
