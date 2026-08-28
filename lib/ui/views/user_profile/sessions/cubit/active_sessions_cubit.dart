import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/data_models/user/active_session_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_sessions_cubit.freezed.dart';
part 'active_sessions_state.dart';

/// Las sesiones abiertas de la cuenta, y el cierre de una concreta.
class ActiveSessionsCubit extends Cubit<ActiveSessionsState> {
  ActiveSessionsCubit(this._repo) : super(const ActiveSessionsState.loading()) {
    load();
  }

  final MeRepo _repo;

  Future<void> load() async {
    if (isClosed) return;
    emit(const ActiveSessionsState.loading());

    final res = await _repo.getActiveSessions();
    if (isClosed) return;

    res.when(
      success: (data) => emit(ActiveSessionsState.loaded(data)),
      failure: (_) => emit(ActiveSessionsState.error(S.current.activeSessionsLoadError)),
    );
  }

  /// Cierra [sessionId] y recarga. Devuelve si se pudo.
  ///
  /// La lista NO se recorta en local antes de que el backend confirme. Quitar
  /// la tarjeta al instante se ve mejor, pero si la petición falla hay que
  /// devolverla a su sitio, y en una pantalla de seguridad "parecía cerrada y
  /// volvió" es peor que esperar medio segundo: el usuario se queda sin saber
  /// si echó a alguien o no.
  Future<bool> closeSession(String sessionId) async {
    final actual = state;
    if (actual is! ActiveSessionsLoaded || actual.closingId != null) return false;

    emit(actual.copyWith(closingId: sessionId));

    final res = await _repo.closeSession(sessionId);
    if (isClosed) return false;

    return res.when(
      success: (_) async {
        await load();

        return true;
      },
      failure: (_) {
        // Se vuelve al estado anterior tal cual: la sesión sigue abierta y la
        // lista tiene que seguir diciendo la verdad.
        if (!isClosed) emit(actual);

        return Future.value(false);
      },
    );
  }
}
