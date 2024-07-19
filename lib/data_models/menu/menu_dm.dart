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
  factory MenuDM({
    required String uuid,
    BusinessDM? business,
    @JsonKey(name: 'last_update') DateTime? lastUpdate,
    @JsonKey(name: 'food_categories') List<Category>? foodCategories,
    @JsonKey(name: 'drink_categories') List<Category>? drinkCategories,
    List<ItemDM>? combos,
  }) = _MenuDM;

  factory MenuDM.fromJson(Map<String, dynamic> json) => _$MenuDMFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required String name,
    required String uuid,
    required List<ItemDM> items,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool editingName,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
