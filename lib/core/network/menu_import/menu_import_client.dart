import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_bulk_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_parse_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_upload_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_bulk_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_parse_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'menu_import_client.g.dart';

/// Retrofit client del feature "Importar menú con IA" (refactor Mateo
/// 2026-05-09).
///
/// 3 endpoints contra el BE Foodly. Auth requerido en los 3 (Sanctum +
/// permission Manager — el `DioRequestHandler` agrega Bearer
/// automáticamente, no hay que tocarlo acá):
///
///   - `/upload` — multipart, sube N fotos a GCS, devuelve URLs y session_id
///   - `/parse`  — JSON con un path GCS, BE proxiea al NLP, devuelve grouped_menu
///   - `/bulk`   — JSON con grouped_menu editado, BE persiste atómicamente
///
/// **No expone una "gran llamada":** el feature requiere que el FE
/// orqueste los 3 pasos (uno por foto en el caso del parse) para poder
/// mostrar progreso al manager y separar fallos por foto. Una sola request
/// "todo o nada" acumularía 30+ s sin feedback y sin posibilidad de
/// recuperación parcial.
@RestApi()
abstract class MenuImportClient {
  factory MenuImportClient(Dio dio) = _MenuImportClient;

  /// `POST /api/business-menu/{businessMenuUuid}/import/upload`
  ///
  /// Sube 1+ fotos al BE como multipart. El BE las guarda en GCS via
  /// `ImageHelper::storeAndResize` y devuelve `(path, url)` por cada una.
  ///
  /// **`sessionId` opcional:** si el FE ya tiene una session activa
  /// (reanudando un import interrumpido), la pasa para que el BE agrupe
  /// las nuevas fotos bajo el mismo storage path. Si null, el BE genera
  /// uno nuevo y lo retorna en la response.
  ///
  /// **Validación BE** (replicada acá para que el FE no mande basura):
  ///   - 1 ≤ images.length ≤ 25
  ///   - cada imagen ≤ 6 MB
  ///   - mimes: jpeg, jpg, png, webp
  @MultiPart()
  @POST('/business-menu/{businessMenuUuid}/import/upload')
  Future<MenuImportUploadResponseDM> uploadImages(
    @Path('businessMenuUuid') String businessMenuUuid, {
    // **Sufijo `[]` deliberado**: Retrofit genera
    //   `_data.files.addAll(images.map((i) => MapEntry('<name>', i)))`,
    // y para que Laravel reciba el field como `array` (regla `'images' =>
    // ['required','array',...]` en `BusinessMenuImportController::uploadImages`),
    // cada part debe llevar el sufijo `[]`. Sin él, Laravel ve `images`
    // como un único string filename y la validación dispara
    //   "The images field must be an array. The images field must not
    //    have more than 25 items."
    // (medido en prod con un build manager + Razr 50 Ultra el 2026-05-09).
    @Part(name: 'images[]') required List<MultipartFile> images,
    @Part(name: 'session_id') String? sessionId,
  });

  /// `POST /api/business-menu/{businessMenuUuid}/import/parse`
  ///
  /// El FE itera las URLs del upload y llama esto una vez por foto. El BE
  /// lee el binary de GCS, lo manda al NLP de Mateo, y retorna
  /// `grouped_menu`. Latencia esperada: 5–30 s por foto (fallback OpenAI
  /// Vision puede ser lento). Si hay 502 → reintentar opcional o skipear
  /// esa foto.
  ///
  /// **`options` per-request:** permite al caller setear timeouts altos
  /// (60+ s) sin tocar `BaseOptions` global. CRÍTICO porque otros endpoints
  /// del cliente Foodly están con timeouts de 6 s.
  @POST('/business-menu/{businessMenuUuid}/import/parse')
  Future<MenuImportParseResponseDM> parseImage(
    @Path('businessMenuUuid') String businessMenuUuid,
    @Body() MenuImportParseDTO body, {
    @DioOptions() Options? options,
  });

  /// `POST /api/business-menu/{businessMenuUuid}/import/bulk`
  ///
  /// El manager edita los items en la pantalla de revisión y al confirmar,
  /// el FE manda este shape. El BE persiste todo en una transacción
  /// atómica: find-or-create de subcategorías (ILIKE case-insensitive) y
  /// creación de items / combos. Cualquier falla rollbackea todo.
  ///
  /// Devuelve stats con totales reales para el dialog Foodly de éxito.
  @POST('/business-menu/{businessMenuUuid}/import/bulk')
  Future<MenuImportBulkResponseDM> bulkImport(
    @Path('businessMenuUuid') String businessMenuUuid,
    @Body() MenuImportBulkDTO body,
  );
}
