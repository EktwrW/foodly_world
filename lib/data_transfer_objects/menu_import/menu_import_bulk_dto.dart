import 'package:json_annotation/json_annotation.dart';

part 'menu_import_bulk_dto.g.dart';

/// DTO para `POST /api/business-menu/{uuid}/import/bulk`.
///
/// El manager edita los items en la pantalla de revisión y al confirmar,
/// el FE manda este shape al BE. El BE persiste todo en una transacción
/// atómica (food → BusinessFoodCategory + BusinessFoodItem, drink →
/// BusinessDrinkCategory + BusinessDrinkItem, combo → BusinessCombo).
///
/// **Naming del campo `groupedMenu`:** matchea exactamente el shape que
/// devuelve Mateo en el endpoint `/parse`. Mantener el mismo nombre en el
/// FE evita transformaciones intermedias entre "lo que el NLP devolvió" y
/// "lo que el manager confirmó" — el manager edita IN-PLACE el mismo
/// objeto y cuando confirma, lo enviamos tal cual.
@JsonSerializable(explicitToJson: true)
class MenuImportBulkDTO {
  @JsonKey(name: 'grouped_menu')
  final List<MenuImportBulkGroupDTO> groupedMenu;

  const MenuImportBulkDTO({required this.groupedMenu});

  factory MenuImportBulkDTO.fromJson(Map<String, dynamic> json) => _$MenuImportBulkDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkDTOToJson(this);
}

/// Una de las 3 categorías raíz fijas: "Platos", "Bebidas", "Combos/Especiales".
///
/// Para Platos y Bebidas, los items vienen anidados dentro de
/// `subcategories`. Para Combos, vienen directo en `items` (sin nivel
/// intermedio) — el BE tolera ambos shapes en `MenuParserService::importComboGroup`.
@JsonSerializable(explicitToJson: true)
class MenuImportBulkGroupDTO {
  @JsonKey(name: 'category_name')
  final String categoryName;

  @JsonKey(name: 'subcategories')
  final List<MenuImportBulkSubcategoryDTO>? subcategories;

  /// Solo para combos. Si la categoría es Platos/Bebidas, dejar null.
  @JsonKey(name: 'items')
  final List<MenuImportBulkItemDTO>? items;

  const MenuImportBulkGroupDTO({
    required this.categoryName,
    this.subcategories,
    this.items,
  });

  factory MenuImportBulkGroupDTO.fromJson(Map<String, dynamic> json) => _$MenuImportBulkGroupDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkGroupDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MenuImportBulkSubcategoryDTO {
  @JsonKey(name: 'subcategory_name')
  final String subcategoryName;

  @JsonKey(name: 'items')
  final List<MenuImportBulkItemDTO> items;

  const MenuImportBulkSubcategoryDTO({
    required this.subcategoryName,
    required this.items,
  });

  factory MenuImportBulkSubcategoryDTO.fromJson(Map<String, dynamic> json) => _$MenuImportBulkSubcategoryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkSubcategoryDTOToJson(this);
}

/// Item editable. Las `versions` y `prices` se guardan tal cual como
/// arrays en `BusinessFoodItem.versions` / `.prices` (cast nativo). Si el
/// item solo tiene una presentación: `versions: ['regular'], prices: {regular: 10}`.
/// Si tiene varias: `versions: ['regular', 'medium', 'big'], prices: {regular: 8, medium: 12, big: 16}`.
@JsonSerializable()
class MenuImportBulkItemDTO {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String? description;

  /// Lista de tamaños/presentaciones. Default `['regular']` si solo hay 1.
  @JsonKey(name: 'versions')
  final List<String>? versions;

  /// Mapa size → precio. Las keys deben matchear las de `versions`.
  /// Ej: `{'regular': 10.0, 'big': 16.0}`.
  @JsonKey(name: 'prices')
  final Map<String, double>? prices;

  const MenuImportBulkItemDTO({
    required this.name,
    this.description,
    this.versions,
    this.prices,
  });

  factory MenuImportBulkItemDTO.fromJson(Map<String, dynamic> json) => _$MenuImportBulkItemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkItemDTOToJson(this);
}
