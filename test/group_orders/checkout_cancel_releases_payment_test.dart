import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/group_order_page.dart';

/// Volver de CANCELAR en la página hosteada de Stripe tiene que soltar el pago.
///
/// EL BUG (producción, 2026-08-31). Al crear la sesión de Checkout el backend
/// marca al pagador como `processing`, y lo único que lo soltaba era el webhook
/// `checkout.session.expired`, treinta minutos más tarde. El comensal que
/// cancelaba en el navegador volvía a un botón gris con el texto "confirmando
/// tu pago" debajo, sin que hubiera pago ninguno, y así se quedaba hasta que
/// recargaba a mano un buen rato después.
///
/// El deep link de retorno SÍ traía el segmento `{success|cancel}`, pero el
/// redirector solo leía `?order=`: las dos vueltas aterrizaban idénticas y
/// `cancelPayment()` no se llamaba nunca por esta vía.
///
/// `checkout_return_test.dart` cubre que la URL llegue con la marca. Esto cubre
/// la otra mitad —que la pantalla la obedezca—, que es justo donde se escapó el
/// bug anterior de esta misma ruta: la decisión pura estaba bien y el árbol
/// vivo no la usaba.
void main() {
  late _FakeGroupOrderRepo repo;

  setUp(() async {
    repo = _FakeGroupOrderRepo();
    await di.reset();
    di.registerSingleton<GroupOrderRepo>(repo);
    di.registerSingleton<Logger>(Logger(level: Level.off));
    di.registerSingleton<GroupOrderRealtimeService>(_RealtimeMudo());
    await S.load(const Locale('en'));
  });

  tearDown(() => di.reset());

  Future<void> montar(WidgetTester tester, {required bool cancelado}) async {
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      home: GroupOrderPage(orderUuid: _uuid, checkoutCanceled: cancelado),
    ));
    // `addPostFrameCallback` + el await del repo: varios frames.
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  testWidgets('al volver de cancelar, la pantalla suelta el pago', (tester) async {
    await montar(tester, cancelado: true);

    expect(repo.cancelPaymentCalls, 1);
  });

  testWidgets('al volver de pagar NO se cancela nada', (tester) async {
    // El éxito lo sella el webhook firmado. Pedir la cancelación acá sería
    // pelearse con un cobro que ya está en curso.
    await montar(tester, cancelado: false);

    expect(repo.cancelPaymentCalls, 0);
  });

  testWidgets('se pide UNA sola vez aunque la pantalla se reconstruya', (tester) async {
    await montar(tester, cancelado: true);
    await tester.pump();
    await tester.pump();

    expect(repo.cancelPaymentCalls, 1);
  });

  testWidgets('se pide aunque la orden no haya podido cargar', (tester) async {
    // No se decide mirando el estado local: la orden que hay en pantalla es la
    // de ANTES de irse al navegador y no sabe que hubo una sesión de Checkout.
    // Condicionarlo a ella era exactamente el bug.
    repo.detailOutcome = ApiResult.failure(_boom());

    await montar(tester, cancelado: true);

    expect(repo.cancelPaymentCalls, 1);
  });
}

const _uuid = '3f8c1d2e-9a4b-4c7d-8e10-5b6a7c8d9e0f';

/// Envuelve un DioException a propósito: `AppRequestException.toString()` para
/// errores NO-Dio usa `di<BaseConfig>()` + `S.current`, y acá no hay config.
AppRequestException _boom() {
  final opts = RequestOptions(path: '/group-orders/$_uuid');
  return AppRequestException(
    error: DioException(
      requestOptions: opts,
      response: Response(requestOptions: opts, statusCode: 500, statusMessage: 'Server Error'),
      type: DioExceptionType.badResponse,
    ),
  );
}

/// El cubit se suscribe al abrir la pantalla. Acá no hay socket ni falta:
/// devolver null basta para que `watch(...).then(...)` no reviente.
class _RealtimeMudo implements GroupOrderRealtimeService {
  /// `RealtimeSubscription` tiene constructor privado y no se puede fabricar
  /// desde un test. Un futuro que nunca resuelve basta: el `.then` que guarda
  /// la suscripción sencillamente no llega a correr.
  @override
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) =>
      Completer<RealtimeSubscription>().future;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

/// Solo lo que toca esta pantalla al arrancar. El resto lanza a propósito: si
/// una versión futura llama a otra cosa en el camino de la cancelación, el test
/// se entera en vez de pasar en verde por accidente.
class _FakeGroupOrderRepo implements GroupOrderRepo {
  int cancelPaymentCalls = 0;
  ApiResult<GroupOrderResponseDM>? detailOutcome;

  @override
  Future<ApiResult<void>> cancelPayment(String uuid) async {
    cancelPaymentCalls++;
    return const ApiResult.success(null);
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid) async =>
      detailOutcome ?? ApiResult.failure(_boom());

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} no debería llamarse en este flujo');
}
