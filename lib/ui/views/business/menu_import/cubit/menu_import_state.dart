part of 'menu_import_cubit.dart';

/// State machine del flujo "Importar menú con IA".
///
/// 7 variantes que cubren cada momento del flow lineal:
///
///   `initial` — pantalla recién abierta o post-reset.
///   `picking` — image picker abierto (transient, dura <1s).
///   `uploading` — subiendo fotos a GCS, con `currentStepIndex`/`Total` para progress bar.
///   `parsing` — procesando fotos en NLP, con `currentStepIndex`/`Total`.
///   `reviewing` — pantalla de revisión, manager edita items inline.
///   `confirming` — bulk-import en curso, button loading.
///   `done` — éxito, dialog Foodly se muestra y al cerrar volvemos al menú.
///   `error` — recoverable: mantenemos el VM para que el manager pueda reintentar.
///
/// **Por qué TODOS los states cargan VM:** las pantallas usan
/// `BlocBuilder` con `state.vm` para renderizar; preservar el VM en cada
/// transición permite que el `error` muestre las fotos ya subidas + un
/// retry button sin perder progreso. El bloc `manage_promotions_state.dart`
/// sigue exactamente el mismo patrón (referencia del proyecto).
@freezed
sealed class MenuImportState with _$MenuImportState {
  const factory MenuImportState.initial(MenuImportVM vm) = _Initial;
  const factory MenuImportState.picking(MenuImportVM vm) = _Picking;
  const factory MenuImportState.uploading(MenuImportVM vm) = _Uploading;
  const factory MenuImportState.parsing(MenuImportVM vm) = _Parsing;
  const factory MenuImportState.reviewing(MenuImportVM vm) = _Reviewing;
  const factory MenuImportState.confirming(MenuImportVM vm) = _Confirming;
  const factory MenuImportState.done(MenuImportVM vm) = _Done;
  const factory MenuImportState.error(String message, MenuImportVM vm) = _Error;
}
