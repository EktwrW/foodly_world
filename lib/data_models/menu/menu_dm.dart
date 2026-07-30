import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dm.freezed.dart';
part 'menu_dm.g.dart';

@freezed
abstract class MenuResponse with _$MenuResponse {
  factory MenuResponse({
    @JsonKey(name: 'menu') required MenuDM menuDM,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}

@freezed
abstract class MenuDM with _$MenuDM {
  const MenuDM._();

  factory MenuDM({
    required String uuid,
    int? id,
    // Hydrated client-side in some flows (e.g. favorites_vm wires the parent
    // BusinessDM in after fetching). [BusinessMenuResource] does NOT include
    // it — see [businessName] for the flat name that always comes from the BE.
    BusinessDM? business,
    @JsonKey(name: 'business_uuid') required String businessUuid,
    @JsonKey(name: 'business_id') int? businessId,
    // Flat business name shipped by [BusinessMenuResource] — added so share
    // sheets / breadcrumbs can render the parent business without pulling the
    // full BusinessDM (~15 KB lite payload, recursion risk). Mirrors the
    // existing flat businessUuid / businessId pattern. Nullable for
    // forward-compat with any payload that doesn't carry it yet.
    @JsonKey(name: 'business_name') String? businessName,
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
abstract class CategoryDM with _$CategoryDM {
  const CategoryDM._();

  factory CategoryDM({
    required String name,
    required String uuid,
    int? id,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    required List<ItemDM> items,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool editingName,
  }) = _CategoryDM;

  factory CategoryDM.fromJson(Map<String, dynamic> json) => _$CategoryDMFromJson(json);
}
