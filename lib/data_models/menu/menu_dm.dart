import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dm.freezed.dart';
part 'menu_dm.g.dart';

@freezed
class MenuDM with _$MenuDM {
  factory MenuDM({
    required Menu menu,
  }) = _MenuDM;

  factory MenuDM.fromJson(Map<String, dynamic> json) => _$MenuDMFromJson(json);
}

@freezed
class Menu with _$Menu {
  factory Menu({
    required String uuid,
    BusinessDM? business,
    @JsonKey(name: 'last_update') DateTime? lastUpdate,
    @JsonKey(name: 'food_categories') List<Category>? foodCategories,
    @JsonKey(name: 'drink_categories') List<Category>? drinkCategories,
    List<ComboDM>? combos,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required String name,
    required List<ItemDM> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
