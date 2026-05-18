import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' show DioException;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/menu_import/menu_import_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/data_models/menu_import/menu_import_parse_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_bulk_dto.dart';
import 'package:foodly_world/ui/views/business/menu_import/view_model/menu_import_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

part 'menu_import_cubit.freezed.dart';
part 'menu_import_state.dart';

/// Cubit que orquesta el flow completo de importar menú vía IA:
///
/// 1. Manager elige fotos (cámara o galería múltiple).
/// 2. `startImport()` — sube TODAS las fotos a GCS de una (parallel-safe
///    en BE, multipart). Recibe lista de paths.
/// 3. Por cada path, llama a /parse en serie (no paralelo: cada parse
///    puede tardar 30 s y queremos que el progreso sea visible/predecible).
/// 4. Acumula los `grouped_menu` resultantes en el VM.
/// 5. Pasa a state `reviewing` — el manager edita inline en pantalla 2.
/// 6. `confirmBulkImport()` envía el shape editado al BE → transacción
///    atómica → state `done` con stats para el dialog Foodly.
///
/// **Resiliencia parcial (Decisión 1 = B del PRD del 2026-05-09):**
/// si el flow se interrumpe DESPUÉS del upload pero ANTES de bulk-import,
/// las fotos están persistidas en GCS y el FE puede reanudar parsing
/// desde donde quedó (los uploadedImages quedan en VM hasta que se
/// resetea la pantalla). Si la app muere, esa info se pierde y el manager
/// re-empieza, pero al ser uploads idempotentes (BE genera nuevo
/// session_id si no se manda) no es crítico.
class MenuImportCubit extends Cubit<MenuImportState> {
  final MenuImportRepo _repo;
  final Logger _logger;
  final ImagePicker _picker;

  MenuImportCubit({
    MenuImportRepo? repo,
    Logger? logger,
    ImagePicker? picker,
    String? locale,
  })  : _repo = repo ?? di<MenuImportRepo>(),
        _logger = logger ?? di<Logger>(),
        _picker = picker ?? ImagePicker(),
        super(MenuImportState.initial(MenuImportVM(locale: locale ?? 'es')));

  // ─── Image picking ────────────────────────────────────────────────────

  /// Multi-select desde galería. Reusable: si el manager elige más fotos
  /// después del primer pick, las nuevas se concatenan a las ya elegidas
  /// (manteniendo el orden de selección — el manager las ve en una lista
  /// reordenable en la pantalla).
  Future<void> pickFromGallery() async {
    final vm = state.vm;
    emit(MenuImportState.picking(vm));

    try {
      final picked = await _picker.pickMultiImage(
        // Resize defensivo client-side. El BE también hace resize a 1080px
        // pero comprimirlo acá ahorra ancho de banda en uploads grandes
        // (10+ fotos sobre 4G mediocre) y mejora la latencia percibida.
        imageQuality: 85,
        maxWidth: 2048,
        maxHeight: 2048,
      );

      // El user cerró el picker sin elegir nada — volvemos al state previo
      // sin tocar VM. NO emitimos error porque no es un error real.
      if (picked.isEmpty) {
        emit(MenuImportState.initial(vm));
        return;
      }

      final newFiles = [...vm.selectedFiles, ...picked.map((x) => File(x.path))];
      emit(MenuImportState.initial(vm.copyWith(selectedFiles: newFiles)));
    } catch (e, st) {
      _logger.e('MenuImport.pickFromGallery failed', error: e, stackTrace: st);
      emit(MenuImportState.error(_genericPickerError, vm));
    }
  }

  /// Foto individual desde cámara. El manager puede llamarla varias veces
  /// para acumular fotos (1 por sección del menú).
  Future<void> pickFromCamera() async {
    final vm = state.vm;
    emit(MenuImportState.picking(vm));

    try {
      final picked = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 2048,
        maxHeight: 2048,
      );

      if (picked == null) {
        emit(MenuImportState.initial(vm));
        return;
      }

      final newFiles = [...vm.selectedFiles, File(picked.path)];
      emit(MenuImportState.initial(vm.copyWith(selectedFiles: newFiles)));
    } catch (e, st) {
      _logger.e('MenuImport.pickFromCamera failed', error: e, stackTrace: st);
      emit(MenuImportState.error(_genericPickerError, vm));
    }
  }

  /// Quita una foto del array antes del upload. Idempotente: si el index
  /// está fuera de rango, no hace nada (defensivo contra race condition
  /// del usuario tap-tap-tap).
  void removeFile(int index) {
    final vm = state.vm;
    if (index < 0 || index >= vm.selectedFiles.length) return;

    final newFiles = List<File>.from(vm.selectedFiles)..removeAt(index);
    emit(MenuImportState.initial(vm.copyWith(selectedFiles: newFiles)));
  }

  // ─── Pipeline upload → parse → reviewing ──────────────────────────────

  /// Dispara el flow completo. Llama desde el botón "Analizar" de la
  /// pantalla 1.
  ///
  /// Pasos secuenciales:
  ///   A. /upload — multipart con TODAS las fotos a la vez.
  ///   B. /parse — una vez por path GCS, en serie (visible progress).
  ///   C. transición a `reviewing` con los grouped_menu acumulados.
  ///
  /// Si /upload falla → error sin haber gastado parses (cero costo NLP).
  /// Si /parse falla en alguna foto → la skipea, sigue con la siguiente,
  /// y en `reviewing` el manager ve solo lo que parseó OK + un warning si
  /// hubo skips.
  Future<void> startImport(String businessMenuUuid) async {
    final vm = state.vm;
    if (vm.selectedFiles.isEmpty) {
      emit(MenuImportState.error(_noPhotosSelected, vm));
      return;
    }

    // ── A. Upload ─────────────────────────────────────────────────────
    emit(MenuImportState.uploading(vm.copyWith(
      currentStepIndex: 0,
      currentStepTotal: vm.selectedFiles.length,
    )));

    final uploadResult = await _repo.uploadImages(
      businessMenuUuid: businessMenuUuid,
      imageFiles: vm.selectedFiles,
      sessionId: vm.sessionId,
    );

    final uploaded = uploadResult.when(
      success: (data) => data,
      failure: (e) {
        // Diagnóstico verboso del fallo de upload — el genérico anterior
        // ("upload failed" sin más) impedía debuggear casos como
        // payload-too-large (413), formato no soportado (422), o expired
        // session (401). Ahora desempaquetamos el DioException si lo hay.
        final wrapped = e.error;
        if (wrapped is DioException) {
          _logger.e(
            'MenuImport.upload Dio error '
            '— type=${wrapped.type.name} '
            'status=${wrapped.response?.statusCode} '
            'body=${_truncate(wrapped.response?.data, 600)} '
            'msg=${wrapped.message} '
            'requestPath=${wrapped.requestOptions.path}',
          );
        } else {
          _logger.e('MenuImport.upload non-Dio error: $wrapped', stackTrace: e.stackTrace);
        }
        return null;
      },
    );
    if (uploaded == null) {
      emit(MenuImportState.error(_uploadError, vm));
      return;
    }

    final vmAfterUpload = vm.copyWith(
      sessionId: uploaded.sessionId,
      uploadedImages: uploaded.images,
      // Limpiamos selectedFiles — ya están persistidos en GCS, no
      // hace falta mantenerlos en memoria del cliente.
      selectedFiles: const [],
    );

    // ── B. Parse en serie ─────────────────────────────────────────────
    emit(MenuImportState.parsing(vmAfterUpload.copyWith(
      currentStepIndex: 0,
      currentStepTotal: uploaded.images.length,
    )));

    final accumulatedGroups = <ParsedCategoryGroupDM>[];
    int parseSkips = 0;

    for (var i = 0; i < uploaded.images.length; i++) {
      final image = uploaded.images[i];

      final parseResult = await _repo.parseImage(
        businessMenuUuid: businessMenuUuid,
        imagePath: image.path,
        locale: vmAfterUpload.locale,
      );

      parseResult.when(
        success: (data) {
          accumulatedGroups.addAll(data.groupedMenu);
        },
        failure: (e) {
          parseSkips++;
          // Mismo logging verboso que upload — el `e.error` solo retorna
          // el `toString()` del DioException, que NO incluye el body
          // de la respuesta del BE (donde vive el stacktrace PHP en 500s
          // o el detail de validación en 422s). Desempaquetamos.
          final wrapped = e.error;
          if (wrapped is DioException) {
            _logger.w(
              'MenuImport.parse[${i + 1}/${uploaded.images.length}] failed '
              '— type=${wrapped.type.name} '
              'status=${wrapped.response?.statusCode} '
              'body=${_truncate(wrapped.response?.data, 1200)} '
              'msg=${wrapped.message} '
              'imagePath=${image.path}',
            );
          } else {
            _logger.w(
              'MenuImport.parse[${i + 1}/${uploaded.images.length}] non-Dio: $wrapped',
              stackTrace: e.stackTrace,
            );
          }
        },
      );

      // Emit progress después de cada foto.
      emit(MenuImportState.parsing(vmAfterUpload.copyWith(
        currentStepIndex: i + 1,
        currentStepTotal: uploaded.images.length,
        parsedGroups: List.unmodifiable(accumulatedGroups),
      )));
    }

    // ── C. Transición a reviewing ─────────────────────────────────────
    final finalVm = vmAfterUpload.copyWith(
      parsedGroups: List.unmodifiable(accumulatedGroups),
    );

    if (!finalVm.hasParsedContent) {
      // Cero items parseados — no tiene sentido ir a la review screen.
      // Probablemente el OCR no encontró texto (foto borrosa / muy oscura)
      // o el NLP falló en todas. Mostramos error con CTA "intentar otra
      // vez" que vuelve a initial (la pantalla 1 puede ofrecer agregar
      // más fotos).
      emit(MenuImportState.error(_noContentParsed, finalVm));
      return;
    }

    if (parseSkips > 0) {
      _logger.i('MenuImport: ${uploaded.images.length - parseSkips} fotos OK, $parseSkips skipped');
    }

    emit(MenuImportState.reviewing(finalVm));
  }

  // ─── Bulk import (Pantalla 2 — review screen) ─────────────────────────

  /// Confirma el bulk-import al BE. Llamado desde el botón "Agregar al
  /// menú" de la pantalla de revisión, después de que el manager editó.
  ///
  /// Recibe el `groupedMenu` editado (con items posiblemente eliminados,
  /// renombrados o con precios cambiados). El cubit se mantiene tonto
  /// respecto a la edición — la pantalla 2 manipula el árbol y le pasa
  /// al cubit la versión final.
  Future<void> confirmBulkImport({
    required String businessMenuUuid,
    required List<MenuImportBulkGroupDTO> editedGroupedMenu,
  }) async {
    final vm = state.vm;

    if (editedGroupedMenu.isEmpty) {
      emit(MenuImportState.error(_nothingToImport, vm));
      return;
    }

    emit(MenuImportState.confirming(vm));

    final result = await _repo.bulkImport(
      businessMenuUuid: businessMenuUuid,
      body: MenuImportBulkDTO(groupedMenu: editedGroupedMenu),
    );

    result.when(
      success: (data) {
        emit(MenuImportState.done(vm.copyWith(bulkStats: data.stats)));
      },
      failure: (e) {
        _logger.e('MenuImport.bulkImport failed: ${e.error}');
        emit(MenuImportState.error(_bulkImportError, vm));
      },
    );
  }

  // ─── Recovery & navigation ────────────────────────────────────────────

  /// Vuelve al estado inicial preservando el VM (el manager tal vez
  /// quiera agregar más fotos antes de re-empezar). NO descarta fotos ya
  /// subidas a GCS — el BE las cleanup-ea por TTL en otra pasada.
  void resetToInitial() {
    emit(MenuImportState.initial(state.vm));
  }

  /// Limpieza completa post `done` para que la próxima vez que el manager
  /// abra la pantalla, esté virgen. Llamado desde la pantalla de revisión
  /// al cerrar el dialog Foodly de éxito.
  void resetAll() {
    emit(MenuImportState.initial(MenuImportVM(locale: state.vm.locale)));
  }

  /// Helper: trunca a [max] chars una representación cualquiera para no
  /// dump-ear 30 KB de HTML al logger cuando el BE devuelve un error page.
  static String _truncate(Object? value, int max) {
    if (value == null) return '<null>';
    final str = value.toString();
    return str.length <= max ? str : '${str.substring(0, max)}…[+${str.length - max}]';
  }

  // ─── Mensajes de error (i18n keys provisionales) ──────────────────────
  // Las strings reales se reemplazan por `S.current.foo` en Pantalla 1
  // (FE Fase 1B) cuando agregamos las keys al .arb. Las dejo hardcoded
  // por ahora para no bloquear el state machine; el cubit las emite y la
  // UI las pinta — al portear a S.current no toca el cubit.
  static const _genericPickerError = 'No pudimos abrir el selector de fotos. Intentá de nuevo.';
  static const _noPhotosSelected = 'Seleccioná al menos una foto del menú.';
  static const _uploadError = 'No pudimos subir las fotos. Verificá tu conexión y volvé a intentarlo.';
  static const _noContentParsed = 'No pudimos detectar items en las fotos. Probá con fotos más nítidas o con mejor iluminación.';
  static const _nothingToImport = 'No hay items para importar. Agregá al menos uno antes de confirmar.';
  static const _bulkImportError = 'No pudimos guardar el menú. Intentá de nuevo en unos segundos.';
}
