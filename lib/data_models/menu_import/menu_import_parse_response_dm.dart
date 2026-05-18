import 'package:json_annotation/json_annotation.dart';

part 'menu_import_parse_response_dm.g.dart';

/// Response del endpoint `POST /api/business-menu/{uuid}/import/parse`.
///
/// Wrapping del payload `data` que devuelve Mateo. El BE Laravel solo
/// proxiea — no transforma. El shape acá matchea exactamente el de Mateo
/// para que el FE no tenga que normalizar dos veces.
@JsonSerializable(explicitToJson: true)
class MenuImportParseResponseDM {
  /// Las 3 categorías raíz fijas con sus subcategorías e items, parseadas
  /// por el OCR + GPT Vision de Mateo.
  @JsonKey(name: 'grouped_menu')
  final List<ParsedCategoryGroupDM> groupedMenu;

  /// Qué motor usó el parser para esta foto: `tesseract` (solo OCR) o
  /// `tesseract+openai` (fallback Vision). Útil para telemetría — no se
  /// muestra al manager.
  @JsonKey(name: 'parser_used')
  final String? parserUsed;

  /// Warnings del parser ("foto borrosa", "muy oscura", etc.). El FE los
  /// puede mostrar como hints al manager si hay alguno.
  final List<String>? warnings;

  const MenuImportParseResponseDM({
    required this.groupedMenu,
    this.parserUsed,
    this.warnings,
  });

  factory MenuImportParseResponseDM.fromJson(Map<String, dynamic> json) =>
      _$MenuImportParseResponseDMFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportParseResponseDMToJson(this);
}

/// Una de las 3 categorías raíz fijas que devuelve Mateo: "Platos",
/// "Bebidas", "Combos/Especiales". El FE las usa para decidir el target
/// de bulk-import (BusinessFood / BusinessDrink / BusinessCombo).
@JsonSerializable(explicitToJson: true)
class ParsedCategoryGroupDM {
  @JsonKey(name: 'category_name')
  final String categoryName;

  /// Para Platos/Bebidas: lista de subcategorías con sus items dentro.
  /// Para Combos: puede venir null o vacío (los items vienen en `items`).
  final List<ParsedSubcategoryDM>? subcategories;

  /// Solo para Combos. Lista flat de items sin nivel de subcategoría
  /// intermedia (los combos son items directos del menú, no agrupados).
  final List<ParsedMenuItemDM>? items;

  const ParsedCategoryGroupDM({
    required this.categoryName,
    this.subcategories,
    this.items,
  });

  factory ParsedCategoryGroupDM.fromJson(Map<String, dynamic> json) =>
      _$ParsedCategoryGroupDMFromJson(json);
  Map<String, dynamic> toJson() => _$ParsedCategoryGroupDMToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ParsedSubcategoryDM {
  @JsonKey(name: 'subcategory_name')
  final String subcategoryName;
  final List<ParsedMenuItemDM> items;

  const ParsedSubcategoryDM({
    required this.subcategoryName,
    required this.items,
  });

  factory ParsedSubcategoryDM.fromJson(Map<String, dynamic> json) =>
      _$ParsedSubcategoryDMFromJson(json);
  Map<String, dynamic> toJson() => _$ParsedSubcategoryDMToJson(this);
}

/// Item parseado por la IA — se renderiza en la pantalla de revisión y
/// el manager lo edita inline antes del bulk-import.
@JsonSerializable()
class ParsedMenuItemDM {
  final String name;
  final String? description;

  /// Lista de presentaciones (`['regular']`, `['regular', 'big']`, etc.).
  final List<String>? versions;

  /// Mapa version → precio. Convertido en el FE a `Map<String, double>`
  /// con `(v as num).toDouble()` defensivo (algunos paths del JSON pueden
  /// tener int en vez de double).
  final Map<String, dynamic>? prices;

  /// Confianza del parser para este item (0.0–1.0). El FE usa el valor
  /// para badge tri-color en la pantalla de revisión:
  ///   ≥ 0.75 → verde "OK"
  ///   0.50–0.75 → amarillo "Revisar"
  ///   < 0.50 → rojo "Verificar" (default-unchecked)
  final double? confidence;

  const ParsedMenuItemDM({
    required this.name,
    this.description,
    this.versions,
    this.prices,
    this.confidence,
  });

  factory ParsedMenuItemDM.fromJson(Map<String, dynamic> json) =>
      _$ParsedMenuItemDMFromJson(json);
  Map<String, dynamic> toJson() => _$ParsedMenuItemDMToJson(this);

  /// Convenience: convierte `prices` (que puede venir con `int` o `double`
  /// del JSON) a `Map<String, double>` consistente para el FE.
  Map<String, double> get pricesAsDouble {
    final raw = prices;
    if (raw == null) return const {};
    return raw.map((k, v) => MapEntry(k, (v as num).toDouble()));
  }
}
