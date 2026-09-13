import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:logger/logger.dart';

/// Las suscripciones de realtime se quedaban HUÉRFANAS.
///
/// Los dos cubits pedían su canal DESPUÉS de esperar la primera lectura, y
/// guardaban la suscripción en `_sub` al volver. Salir de la pantalla mientras
/// esa lectura viajaba dejaba a `close()` cancelando un `_sub` todavía null, y
/// al oyente naciendo sobre un cubit ya muerto: **nadie lo cancela nunca**.
///
/// No es sólo memoria. El canal sigue contando como vivo, así que el servicio
/// mantiene el polling y cada resume de la app dispara una lectura por cada
/// huérfano acumulado — sobre un cubit que ya no pinta nada.
///
/// Y en la página había además un segundo camino: cada `load()` pedía otra
/// suscripción y pisaba `_sub` sin cancelar la anterior, así que el botón de
/// reintentar las acumulaba. Con N oyentes, un evento dispara N refetch.
///
/// El testigo es `pollingActivo`: el servicio suelta sus timers cuando se va el
/// último oyente, así que si tras cerrar el cubit sigue encendido es que quedó
/// alguien oyendo.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GroupOrderRealtimeService realtime;

  setUp(() => realtime = GroupOrderRealtimeService(authSession: _AuthFalso()));
  tearDown(() => realtime.unwatchAll()); // el fallback a polling deja timers

  group('el panel del manager', () {
    test('cerrar la pantalla durante la primera lectura no deja oyentes', () async {
      final repo = _RepoFalso();
      final cubit = ManagerOrdersCubit(
        repo: repo,
        logger: _mudo,
        businessUuid: 'b1',
        realtime: realtime,
      );

      final carga = cubit.load(); // la lectura se queda en vuelo
      await cubit.close(); // el manager sale de la pantalla
      repo.responderLista(0);
      await carga;
      await _turno();

      // Ojo con lo que mide ESTE: el `close()` cae antes de que responda el
      // repo, así que lo que corta es la comprobación PREVIA y aquí no se llega
      // a pedir ningún canal. El caso de cancelar de verdad es el de abajo.
      expect(realtime.pollingActivo, isFalse,
          reason: 'ni siquiera debería haberse pedido el canal');
    });

    /// El control: con la pantalla abierta, la suscripción SÍ tiene que quedar.
    /// Sin esto, no suscribirse nunca pasaría el test de arriba.
    test('pero con la pantalla abierta sí queda suscrito', () async {
      final repo = _RepoFalso();
      final cubit = ManagerOrdersCubit(
        repo: repo,
        logger: _mudo,
        businessUuid: 'b1',
        realtime: realtime,
      );
      addTearDown(cubit.close);

      final carga = cubit.load();
      repo.responderLista(0);
      await carga;

      expect(realtime.pollingActivo, isTrue);
    });

    /// La ventana MÁS estrecha, y la que el primer arreglo dejó abierta:
    /// cerrar mientras la suscripción está NACIENDO. La comprobación de después
    /// del await es la única que la cubre.
    test('cerrar mientras nace la suscripción tampoco deja oyentes', () async {
      final lento = _RealtimeLento();
      addTearDown(lento.unwatchAll);
      final repo = _RepoFalso();
      final cubit = ManagerOrdersCubit(
        repo: repo,
        logger: _mudo,
        businessUuid: 'b1',
        realtime: lento,
      );

      final carga = cubit.load();
      repo.responderLista(0);
      await _turno(); // la lectura volvió; la suscripción espera en la puerta
      await cubit.close(); // el manager se va justo ahora
      lento.puerta.complete(); // y el oyente nace ya sin dueño
      await carga;
      await _turno();

      expect(lento.pollingActivo, isFalse);
    });

    /// Y la idempotencia del panel: el botón de reintentar vuelve a llamar a
    /// `load()`, y cada llamada pedía otro oyente pisando el anterior.
    test('dos load() no acumulan oyentes', () async {
      final repo = _RepoFalso();
      final cubit = ManagerOrdersCubit(
        repo: repo,
        logger: _mudo,
        businessUuid: 'b1',
        realtime: realtime,
      );
      addTearDown(cubit.close);

      final a = cubit.load();
      repo.responderLista(0);
      await a;
      final b = cubit.load();
      repo.responderLista(1);
      await b;
      await _turno();

      final antes = repo.lecturasDeLista;
      realtime.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await _turno();

      expect(repo.lecturasDeLista, antes + 1,
          reason: 'con dos oyentes, el mismo evento pedía la lista dos veces');
    });
  });

  group('la página de la orden', () {
    test('cerrar la página durante la primera lectura no deja oyentes', () async {
      final repo = _RepoFalso();
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);

      final carga = cubit.load('o1');
      await cubit.close();
      repo.responderOrden(0);
      await carga;
      await _turno();

      expect(realtime.pollingActivo, isFalse);
    });

    /// El otro camino: el botón de reintentar vuelve a llamar a `load()`, y cada
    /// llamada pedía un oyente nuevo pisando el anterior sin cancelarlo. Con dos
    /// oyentes, UN evento dispara DOS refetch — y eso es por dispositivo, justo
    /// lo que la #69 se dedicó a quitar.
    test('dos load() no acumulan oyentes: un evento, una lectura', () async {
      final repo = _RepoFalso();
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      addTearDown(cubit.close);

      final primera = cubit.load('o1');
      repo.responderOrden(0);
      await primera;
      await _turno();

      final segunda = cubit.load('o1');
      repo.responderOrden(1);
      await segunda;
      await _turno();

      final antes = repo.lecturasDeOrden;
      // La vía real del servicio: es la que usan el resume y el polling.
      realtime.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await _turno();

      expect(repo.lecturasDeOrden, antes + 1,
          reason: 'con dos oyentes vivos, el mismo evento pedía la orden dos veces');
    });

    /// Cambiar de orden SÍ tiene que cancelar la anterior: es el único camino
    /// que ejercita el cancelado, porque para la misma orden la idempotencia ni
    /// siquiera vuelve a suscribirse.
    test('cargar OTRA orden cancela la suscripción de la primera', () async {
      final repo = _RepoFalso();
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      addTearDown(cubit.close);

      final a = cubit.load('o1');
      repo.responderOrden(0);
      await a;
      await _turno();

      final b = cubit.load('o2');
      repo.responderOrden(1, uuid: 'o2');
      await b;
      await _turno();

      final antes = repo.lecturasDeOrden;
      realtime.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await _turno();

      expect(repo.lecturasDeOrden, antes + 1,
          reason: 'la suscripción de o1 seguía viva pidiendo su orden');
    });

    /// OJO CON LA ESPERA. `_suscribir` de la página va `unawaited`, así que
    /// `await carga` NO espera a que la suscripción nazca: con un solo turno
    /// este test pasaba porque el oyente todavía no existía, no porque se
    /// hubiera cancelado — verde por el motivo equivocado, y lo delató que la
    /// mutación de las dos guardas del cierre sobrevivía.
    test('cerrar mientras nace la suscripción tampoco deja oyentes', () async {
      final lento = _RealtimeLento();
      addTearDown(lento.unwatchAll);
      final repo = _RepoFalso();
      final cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: lento);

      final carga = cubit.load('o1');
      repo.responderOrden(0);
      await _turno();
      await cubit.close(); // se va con el oyente a medio nacer
      lento.puerta.complete(); // y ahora nace, ya sin dueño
      await carga;
      await _asentar(); // el tiempo que tarda en nacer Y en cancelarse

      expect(lento.pollingActivo, isFalse,
          reason: 'el oyente nació sin dueño y nadie lo canceló');
    });
  });

  /// EL TERCER CONSUMIDOR, y el peor: lo señaló la revisión. El chip es un
  /// singleton que vive toda la sesión y `watchActive` cuelga de `onChange`, o
  /// sea de CADA emisión. Encima `end()` lo llama `refresh()` ante un 404/403,
  /// y `refresh` ES el callback de realtime: el propio evento se disparaba el
  /// huérfano. Y el comentario del arreglo anterior citaba este código como
  /// modelo a seguir.
  group('el chip flotante', () {
    test('cerrar mientras nace la suscripción no deja oyentes', () async {
      final lento = _RealtimeLento();
      addTearDown(lento.unwatchAll);
      final cubit = ActiveGroupOrderCubit(repo: _RepoFalso(), logger: _mudo, realtime: lento);

      final observando = cubit.watchActive('o1');
      await cubit.close();
      lento.puerta.complete();
      await observando;
      await _asentar();

      expect(lento.pollingActivo, isFalse);
    });

    /// `end()` vacía el carrito, y puede caer mientras la suscripción nace.
    test('end() mientras nace la suscripción tampoco', () async {
      final lento = _RealtimeLento();
      addTearDown(lento.unwatchAll);
      final cubit = ActiveGroupOrderCubit(repo: _RepoFalso(), logger: _mudo, realtime: lento);
      addTearDown(cubit.close);

      final observando = cubit.watchActive('o1');
      cubit.end();
      lento.puerta.complete();
      await observando;
      await _asentar();

      expect(lento.pollingActivo, isFalse);
    });

    /// El control: observando de verdad, la suscripción SÍ tiene que quedar.
    test('pero observando sí queda suscrito', () async {
      final realtime = GroupOrderRealtimeService(authSession: _AuthFalso());
      addTearDown(realtime.unwatchAll);
      final cubit = ActiveGroupOrderCubit(repo: _RepoFalso(), logger: _mudo, realtime: realtime);
      addTearDown(cubit.close);

      await cubit.watchActive('o1');

      expect(realtime.pollingActivo, isTrue);
    });
  });
}

/// Servicio real con una PUERTA delante de la suscripción: deja cerrar el cubit
/// con el oyente a medio nacer, que es la ventana más estrecha de todas.
class _RealtimeLento extends GroupOrderRealtimeService {
  _RealtimeLento() : super(authSession: _AuthFalso());

  final puerta = Completer<void>();

  @override
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) async {
    await puerta.future;
    return super.watch(orderUuid, onTouched: onTouched);
  }

  @override
  Future<RealtimeSubscription> watchBusiness(
    String businessUuid, {
    required VoidCallback onTouched,
  }) async {
    await puerta.future;
    return super.watchBusiness(businessUuid, onTouched: onTouched);
  }
}

Future<void> _turno() => Future<void>.delayed(Duration.zero);

/// Lo que tarda una suscripción real en nacer: `watch` espera a `_connect()`,
/// que sin socket falla y cae al polling. Un solo turno NO alcanza.
Future<void> _asentar() => Future<void>.delayed(const Duration(milliseconds: 60));

final _mudo = Logger(level: Level.off);

/// Repo con respuestas a mano: lo único que permite cerrar el cubit con la
/// primera lectura todavía en vuelo.
class _RepoFalso implements GroupOrderRepo {
  final List<Completer<ApiResult<ManagerOrdersResponseDM>>> _listas = [];
  final List<Completer<ApiResult<GroupOrderResponseDM>>> _ordenes = [];

  int get lecturasDeOrden => _ordenes.length;
  int get lecturasDeLista => _listas.length;

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) {
    final c = Completer<ApiResult<ManagerOrdersResponseDM>>();
    _listas.add(c);
    return c.future;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid, {bool coalesce = false}) {
    final c = Completer<ApiResult<GroupOrderResponseDM>>();
    _ordenes.add(c);
    return c.future;
  }

  void responderLista(int indice) => _listas[indice].complete(
        const ApiResult.success(ManagerOrdersResponseDM()),
      );

  void responderOrden(int indice, {String uuid = 'o1'}) => _ordenes[indice].complete(
        ApiResult.success(
          GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1')),
        ),
      );

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

class _AuthFalso implements AuthSessionService {
  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
