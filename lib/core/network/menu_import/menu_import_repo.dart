import 'dart:io';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/menu_import/menu_import_client.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_bulk_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_parse_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_upload_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_bulk_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_parse_dto.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:path/path.dart' as p;

/// Repository wrapper sobre [MenuImportClient]. Convierte excepciones
/// Dio/Retrofit en [ApiResult] para que el cubit pueda hacer pattern
/// matching `result.when(success: ..., failure: ...)` sin try/catch
/// disperso en la capa de UI.
///
/// **Convención del proyecto:** mismo pattern que `PlacesProxyRepo`,
/// `NlpSearchRepo`, etc. Los call-sites (cubits) siempre consumen
/// `ApiResult`, nunca llaman al client directamente.
///
/// **Timeout del parse:** este repo le pasa al endpoint `/parse` un
/// `Options(receiveTimeout: 90s)` per-request, deliberadamente alto.
/// Razones:
///   1. El NLP de Mateo cae al fallback OpenAI Vision en fotos difíciles
///      — observamos hasta 50 s de cola legítima.
///   2. El BE Laravel proxiea sincrónicamente (no hay queue worker), así
///      que la latencia del FE = latencia del NLP + ~200 ms de overhead.
///   3. Si efectivamente timeoutea, la UI puede skipear esa foto y seguir
///      con la siguiente — no bloqueamos todo el flujo por una.
class MenuImportRepo {
  final MenuImportClient _client;

  /// Timeout por foto parseada — generoso porque el fallback OpenAI Vision
  /// es lento. La pantalla de revisión muestra progreso "X/Y procesadas"
  /// para que el manager no sienta que la app se colgó.
  static const Duration _parseTimeout = Duration(seconds: 90);

  /// Timeout para el upload — 60 s cubre subida de 25 fotos × 6 MB cada
  /// una sobre 4G mediocre.
  static const Duration _uploadTimeout = Duration(seconds: 60);

  /// Timeout para el bulk-import — la transacción atómica con varios
  /// items es rápida (~1-2 s en condiciones normales) pero damos espacio
  /// si el menú importado es muy grande (50+ items).
  static const Duration _bulkTimeout = Duration(seconds: 30);

  const MenuImportRepo({required MenuImportClient client}) : _client = client;

  /// Sube N fotos al BE como multipart. Convierte cada `File` local en
  /// un `MultipartFile` con MIME inferido del extension, y delega al
  /// client.
  ///
  /// **Por qué construimos los MultipartFile acá y no en el cubit:**
  /// es plumbing puro de transport (path → bytes → MultipartFile) que
  /// no aporta valor al cubit y dificultaría tests del cubit (tendría
  /// que mockear el filesystem).
  Future<ApiResult<MenuImportUploadResponseDM>> uploadImages({
    required String businessMenuUuid,
    required List<File> imageFiles,
    String? sessionId,
  }) async {
    try {
      final parts = await Future.wait(imageFiles.map((file) async {
        final filename = p.basename(file.path);
        return MultipartFile.fromBytes(
          await file.readAsBytes(),
          filename: filename,
          contentType: _inferContentType(filename),
        );
      }));

      final response = await _client
          .uploadImages(businessMenuUuid, images: parts, sessionId: sessionId)
          .timeout(_uploadTimeout);

      return ApiResult.success(response);
    } catch (e, st) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: st));
    }
  }

  /// Parsea UNA foto (path GCS) via NLP. El cubit llama esto una vez por
  /// foto del session, mostrando progreso al manager.
  Future<ApiResult<MenuImportParseResponseDM>> parseImage({
    required String businessMenuUuid,
    required String imagePath,
    String? locale,
  }) async {
    try {
      final response = await _client.parseImage(
        businessMenuUuid,
        MenuImportParseDTO(imagePath: imagePath, locale: locale),
        options: Options(
          sendTimeout: _parseTimeout,
          receiveTimeout: _parseTimeout,
        ),
      );
      return ApiResult.success(response);
    } catch (e, st) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: st));
    }
  }

  /// Confirma el bulk-import después de que el manager editó los items.
  /// Transacción atómica del lado BE — si algún item falla la validación
  /// de DB, rollbackea todo.
  Future<ApiResult<MenuImportBulkResponseDM>> bulkImport({
    required String businessMenuUuid,
    required MenuImportBulkDTO body,
  }) async {
    try {
      final response = await _client
          .bulkImport(businessMenuUuid, body)
          .timeout(_bulkTimeout);
      return ApiResult.success(response);
    } catch (e, st) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: st));
    }
  }

  /// Infiere el `Content-Type` MIME del filename. Soporta los formatos
  /// que valida el BE (`mimes:jpeg,jpg,png,webp`). Si no matchea ninguno,
  /// fallback a `application/octet-stream` y que el BE lo rechace con 422
  /// — pero ese caso ya debería estar bloqueado en el image picker del FE.
  static MediaType _inferContentType(String filename) {
    final ext = p.extension(filename).toLowerCase().replaceFirst('.', '');
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      case 'webp':
        return MediaType('image', 'webp');
      default:
        return MediaType('application', 'octet-stream');
    }
  }
}
