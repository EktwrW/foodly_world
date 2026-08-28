part of 'active_sessions_cubit.dart';

@freezed
sealed class ActiveSessionsState with _$ActiveSessionsState {
  const factory ActiveSessionsState.loading() = ActiveSessionsLoading;

  /// [closingId] es la sesión que se está cerrando ahora mismo. Mientras vale
  /// algo, la lista bloquea el resto de cierres: pulsar dos tarjetas seguidas
  /// dispararía dos peticiones y la segunda encontraría una lista ya recargada
  /// bajo sus pies.
  const factory ActiveSessionsState.loaded(ActiveSessionsDM data, {String? closingId}) = ActiveSessionsLoaded;

  const factory ActiveSessionsState.error(String message) = ActiveSessionsError;
}
