import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';

/// Qué queda corriendo cuando el teléfono se duerme.
///
/// EL BUG (2026-08-17). El manager dejó el detalle de una orden abierto, la
/// pantalla se apagó sola y al encenderla le salieron diez modales de error
/// seguidos. `paused` cancelaba el polling pero NO el reintento del socket: ese
/// timer sobrevivía, disparaba `_connect()` con la pantalla apagada, fallaba, y
/// su `catch` volvía a arrancar el polling. Un GET cada 10 s en reposo, y cada
/// fallo un snackbar encolado.
///
/// Acá no hay plugin de Pusher —el canal de plataforma no existe en un test—,
/// así que `_connect()` falla siempre y el servicio cae al fallback: es
/// exactamente el estado del que hay que salir al pausar.
class _AuthFalso implements AuthSessionService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GroupOrderRealtimeService service;

  setUp(() => service = GroupOrderRealtimeService(authSession: _AuthFalso()));
  tearDown(() => service.unwatchAll());

  test('sin socket, el servicio queda con polling y reintento armados', () async {
    await service.watchBusiness('biz-1', onTouched: () {});

    expect(service.pollingActivo, isTrue);
    expect(service.reintentoProgramado, isTrue);
  });

  test('al pausar no queda NINGÚN timer vivo', () async {
    await service.watchBusiness('biz-1', onTouched: () {});

    service.didChangeAppLifecycleState(AppLifecycleState.paused);

    expect(service.pollingActivo, isFalse);
    expect(
      service.reintentoProgramado,
      isFalse,
      reason: 'el reintento resucitaba el polling con la pantalla apagada',
    );
  });

  test('inactive cuenta igual que paused: la pantalla apagándose ya corta', () async {
    await service.watchBusiness('biz-1', onTouched: () {});

    service.didChangeAppLifecycleState(AppLifecycleState.inactive);

    expect(service.pollingActivo, isFalse);
    expect(service.reintentoProgramado, isFalse);
  });

  test('cancelar la última suscripción tampoco deja timers', () async {
    final sub = await service.watchBusiness('biz-1', onTouched: () {});

    await sub.cancel();

    expect(service.pollingActivo, isFalse);
    expect(service.reintentoProgramado, isFalse);
  });
}
