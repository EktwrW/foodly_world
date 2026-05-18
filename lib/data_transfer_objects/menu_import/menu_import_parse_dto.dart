import 'package:json_annotation/json_annotation.dart';

part 'menu_import_parse_dto.g.dart';

/// DTO para `POST /api/business-menu/{uuid}/import/parse`.
///
/// El FE le pasa al BE un path GCS de una foto previamente subida (paso
/// /upload) + opcional el locale del manager para mejorar la extracción
/// del NLP. El BE proxiea la imagen a Mateo y retorna `grouped_menu`.
///
/// `image_path` viene del response del /upload anterior — el FE NUNCA
/// debería construirlo a mano. Si por algún bug se le pasa un path fuera
/// del prefijo `business-menus/imports/{business_id}/`, el BE responde 422
/// (defensa IDOR).
@JsonSerializable()
class MenuImportParseDTO {
  @JsonKey(name: 'image_path')
  final String imagePath;

  /// ISO 639-1 (`es`, `pt`, `en`). Si null, el BE asume `es` por default.
  @JsonKey(name: 'locale')
  final String? locale;

  const MenuImportParseDTO({
    required this.imagePath,
    this.locale,
  });

  factory MenuImportParseDTO.fromJson(Map<String, dynamic> json) => _$MenuImportParseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportParseDTOToJson(this);
}
