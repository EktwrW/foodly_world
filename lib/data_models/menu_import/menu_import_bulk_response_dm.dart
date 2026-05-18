import 'package:json_annotation/json_annotation.dart';

part 'menu_import_bulk_response_dm.g.dart';

/// Response del endpoint `POST /api/business-menu/{uuid}/import/bulk`.
///
/// Stats post-transacción atómica que el FE muestra al manager en el
/// dialog Foodly de éxito ("Importamos 17 items en 4 categorías").
@JsonSerializable(explicitToJson: true)
class MenuImportBulkResponseDM {
  final bool success;
  final MenuImportBulkStatsDM stats;

  const MenuImportBulkResponseDM({required this.success, required this.stats});

  factory MenuImportBulkResponseDM.fromJson(Map<String, dynamic> json) =>
      _$MenuImportBulkResponseDMFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkResponseDMToJson(this);
}

@JsonSerializable()
class MenuImportBulkStatsDM {
  /// Cuántas BusinessFoodCategory NUEVAS creó el BE (las pre-existentes
  /// que el manager ya tenía no se cuentan acá — solo las nuevas via ILIKE
  /// find-or-create).
  @JsonKey(name: 'food_categories_created')
  final int foodCategoriesCreated;

  @JsonKey(name: 'food_items_created')
  final int foodItemsCreated;

  @JsonKey(name: 'drink_categories_created')
  final int drinkCategoriesCreated;

  @JsonKey(name: 'drink_items_created')
  final int drinkItemsCreated;

  @JsonKey(name: 'combos_created')
  final int combosCreated;

  const MenuImportBulkStatsDM({
    required this.foodCategoriesCreated,
    required this.foodItemsCreated,
    required this.drinkCategoriesCreated,
    required this.drinkItemsCreated,
    required this.combosCreated,
  });

  factory MenuImportBulkStatsDM.fromJson(Map<String, dynamic> json) =>
      _$MenuImportBulkStatsDMFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportBulkStatsDMToJson(this);

  /// Total de items creados (food + drink + combo). Usado para el dialog
  /// de éxito: "Importamos {totalItems} items en {totalCategories} categorías."
  int get totalItems => foodItemsCreated + drinkItemsCreated + combosCreated;

  /// Total de categorías nuevas. Las preexistentes no se cuentan — el
  /// manager ya las tenía, no son novedad.
  int get totalCategories => foodCategoriesCreated + drinkCategoriesCreated;
}
