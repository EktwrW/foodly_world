import 'dart:io';

import 'package:foodly_world/data_models/menu_import/menu_import_bulk_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_parse_response_dm.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_upload_response_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_import_vm.freezed.dart';

/// View Model del flujo "Importar menú con IA".
///
/// Contiene TODO el estado del flow desde que el manager abre la pantalla
/// hasta que confirma el import. La razón de tenerlo en un VM separado
/// (en vez de campos en cada variante del state) es que la mayoría de
/// las transiciones del state machine preservan los mismos datos —
/// `selectedFiles`, `sessionId`, etc., sobreviven entre `picking`,
/// `uploading`, `parsing`, etc.
@freezed
abstract class MenuImportVM with _$MenuImportVM {
  const MenuImportVM._();

  const factory MenuImportVM({
    /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
    /// se vacía y los paths persistidos viven en `uploadedImages`.
    @Default(<File>[]) List<File> selectedFiles,

    /// Session ID recibido del primer /upload. El FE lo guarda para que,
    /// si el manager agrega más fotos en una segunda tanda (mismo flow,
    /// sin cerrar la pantalla), las nuevas se persistan bajo el mismo
    /// storage path en GCS — necesario para reanudación si la app muere.
    String? sessionId,

    /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
    /// como source-of-truth de qué se subió por si el flow continúa
    /// luego (decisión 1 = B del PRD del 2026-05-09).
    @Default(<MenuImportUploadedImageDM>[]) List<MenuImportUploadedImageDM> uploadedImages,

    /// Acumulado de las respuestas /parse — una por foto. Cada call al
    /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
    /// los unifica/dedup en un único árbol que el manager edita.
    @Default(<ParsedCategoryGroupDM>[]) List<ParsedCategoryGroupDM> parsedGroups,

    /// Progreso visible al manager durante upload/parse. `total` se setea
    /// al inicio del paso correspondiente.
    @Default(0) int currentStepIndex,
    @Default(0) int currentStepTotal,

    /// Stats del bulk-import al confirmar. Usado en el dialog Foodly de
    /// éxito ("Importamos {totalItems} items en {totalCategories} categorías").
    MenuImportBulkStatsDM? bulkStats,

    /// Locale del usuario para hint al NLP. ES por default; el cubit lo
    /// pisa con el locale activo de la app cuando se inyecta.
    @Default('es') String locale,
  }) = _MenuImportVM;

  /// Convenience: si el manager YA subió fotos pero no parseó todas,
  /// `pendingParseCount` indica cuántas faltan. Útil para UI de "reanudar".
  int get pendingParseCount => uploadedImages.length - parsedGroups.length;

  /// True si hay items reviewables (al menos 1 grupo con items).
  bool get hasParsedContent => parsedGroups.any(_groupHasItems);

  static bool _groupHasItems(ParsedCategoryGroupDM g) {
    final flatItems = g.items?.length ?? 0;
    final nestedItems = (g.subcategories ?? []).fold<int>(0, (sum, s) => sum + s.items.length);
    return (flatItems + nestedItems) > 0;
  }
}
