import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/data_models/user/active_session_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/user_profile/sessions/cubit/active_sessions_cubit.dart';

/// El cubit de sesiones activas.
///
/// Lo que de verdad se prueba acá es UNA decisión: qué pasa cuando el cierre
/// falla. La lista NO se recorta en local antes de que el backend confirme.
/// Quitar la tarjeta al instante se ve mejor, pero si la petición falla hay que
/// devolverla a su sitio, y en una pantalla de seguridad "parecía cerrada y
/// volvió" es peor que esperar medio segundo: el usuario se queda sin saber si
/// echó a alguien o no.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  ActiveSessionDM sesion(String id, {bool current = false}) =>
      ActiveSessionDM(id: id, current: current, platform: 'ios', model: 'iPhone16,1');

  /// El tope va a 4 y no a 6 a propósito: 6 es el valor por defecto del
  /// modelo, así que afirmarlo no probaría que el número viaja de verdad desde
  /// la respuesta. El backend lo manda para poder cambiarlo sin publicar una
  /// versión de la app, y eso es lo que hay que proteger.
  ActiveSessionsDM lista(List<ActiveSessionDM> s) => ActiveSessionsDM(sessions: s, max: 4);

  test('carga la lista', () async {
    final repo = _FakeRepo(sesiones: lista([sesion('a', current: true), sesion('b')]));
    final cubit = ActiveSessionsCubit(repo);
    await pumpEventQueue();

    final estado = cubit.state as ActiveSessionsLoaded;
    expect(estado.data.sessions, hasLength(2));
    expect(estado.data.max, 4);
    await cubit.close();
  });

  test('si la carga falla, se dice, no se muestra una lista vacía', () async {
    final repo = _FakeRepo(fallaCarga: true);
    final cubit = ActiveSessionsCubit(repo);
    await pumpEventQueue();

    expect(cubit.state, isA<ActiveSessionsError>());
    await cubit.close();
  });

  test('cerrar una sesión recarga la lista', () async {
    final repo = _FakeRepo(sesiones: lista([sesion('a', current: true), sesion('b')]));
    final cubit = ActiveSessionsCubit(repo);
    await pumpEventQueue();

    repo.sesiones = lista([sesion('a', current: true)]);
    expect(await cubit.closeSession('b'), isTrue);

    expect((cubit.state as ActiveSessionsLoaded).data.sessions, hasLength(1));
    await cubit.close();
  });

  test('si el cierre falla, la sesión sigue en la lista', () async {
    final repo = _FakeRepo(sesiones: lista([sesion('a', current: true), sesion('b')]), fallaCierre: true);
    final cubit = ActiveSessionsCubit(repo);
    await pumpEventQueue();

    expect(await cubit.closeSession('b'), isFalse);

    final estado = cubit.state as ActiveSessionsLoaded;
    expect(estado.data.sessions, hasLength(2), reason: 'la lista se quedó mintiendo');
    expect(estado.closingId, isNull, reason: 'quedó una tarjeta girando para siempre');
  });

  /// Dos toques seguidos dispararían dos peticiones, y la segunda encontraría
  /// una lista ya recargada bajo sus pies.
  test('no se pueden cerrar dos a la vez', () async {
    final repo = _FakeRepo(sesiones: lista([sesion('a', current: true), sesion('b'), sesion('c')]));
    final cubit = ActiveSessionsCubit(repo);
    await pumpEventQueue();

    final primera = cubit.closeSession('b');
    expect(await cubit.closeSession('c'), isFalse, reason: 'el segundo cierre entró igual');
    await primera;

    expect(repo.cerradas, ['b']);
    await cubit.close();
  });
}

class _FakeRepo implements MeRepo {
  _FakeRepo({ActiveSessionsDM? sesiones, this.fallaCarga = false, this.fallaCierre = false})
      : sesiones = sesiones ?? const ActiveSessionsDM();

  ActiveSessionsDM sesiones;
  final bool fallaCarga;
  final bool fallaCierre;
  final List<String> cerradas = [];

  @override
  Future<ApiResult<ActiveSessionsDM>> getActiveSessions() async => fallaCarga
      ? const ApiResult.failure(AppRequestException(error: 'sin red'))
      : ApiResult.success(sesiones);

  @override
  Future<ApiResult<void>> closeSession(String sessionId) async {
    if (fallaCierre) return const ApiResult.failure(AppRequestException(error: 'sin red'));
    cerradas.add(sessionId);

    return const ApiResult.success(null);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
