import 'package:json_annotation/json_annotation.dart';

part 'menu_import_upload_response_dm.g.dart';

/// Response del endpoint `POST /api/business-menu/{uuid}/import/upload`.
///
/// El BE persiste cada foto en GCS via `ImageHelper::storeAndResize` y
/// devuelve la lista de `(path, url)`. El FE guarda el `sessionId` para
/// reanudar el flow si la app muere antes de terminar el parsing
/// (Decisión 1 = B del PRD del 2026-05-09 — resiliencia parcial:
/// fotos persistidas, parsing reanudable).
@JsonSerializable(explicitToJson: true)
class MenuImportUploadResponseDM {
  final bool success;

  @JsonKey(name: 'session_id')
  final String sessionId;

  /// Lista de fotos uploadeadas exitosamente. El BE descarta del response
  /// las que fallaron (loggea pero no aborta el batch).
  final List<MenuImportUploadedImageDM> images;

  /// Total de fotos efectivamente subidas. Útil para el FE: si pediste 5
  /// y solo entraron 3, hay diferencia visible.
  final int total;

  const MenuImportUploadResponseDM({
    required this.success,
    required this.sessionId,
    required this.images,
    required this.total,
  });

  factory MenuImportUploadResponseDM.fromJson(Map<String, dynamic> json) =>
      _$MenuImportUploadResponseDMFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportUploadResponseDMToJson(this);
}

@JsonSerializable()
class MenuImportUploadedImageDM {
  /// Path relativo en GCS. Pasarlo al endpoint /parse para que el BE lea
  /// el binary y lo envíe al NLP. NO mostrar al user (es interno).
  final String path;

  /// URL pública de la foto. Mostrar como thumbnail mientras el manager
  /// espera el parsing.
  final String url;

  const MenuImportUploadedImageDM({required this.path, required this.url});

  factory MenuImportUploadedImageDM.fromJson(Map<String, dynamic> json) =>
      _$MenuImportUploadedImageDMFromJson(json);
  Map<String, dynamic> toJson() => _$MenuImportUploadedImageDMToJson(this);
}
