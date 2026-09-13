import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:logger/logger.dart';

/// Una acción del manager NO lee la lista. Nunca.
///
/// EL CAMINO HASTA AQUÍ, porque explica por qué el test dice lo que dice:
///
///  1. El panel leía la lista entera después de cada acción, sólo para mover
///     un cubo de los chips. Y la misma mutación emite `BusinessOrdersTouched`,
///     que llega por Pusher y lee otra vez: DOS lecturas por acción, medidas
///     en producción el 2026-09-12 (cuatro pares limpios, mismo tamaño de
///     respuesta y mismo PoP de Cloudflare).
///  2. Se quitó la lectura local y se dejó una red de seguridad de 2 s. Una
///     lectura menos, pero la fila se quedaba a la vista hasta que llegara el
///     evento: al cerrar una cuenta, o al mover una orden de cubo con un chip
///     filtrando, hasta 2 s mostrando algo que el backend ya no incluye.
///  3. Ahora la respuesta de la mutación trae los contadores y si la orden
///     sigue en el panel (be-foodly #148). No hay nada que releer, y la red
///     de seguridad —con su temporizador, sus reintentos y su constante—
///     desaparece.
///
/// `stillInPanel` lo decide el BACKEND a propósito: el predicado de "está en
/// el panel" se corrigió tres veces en agosto de 2026, y replicarlo en Dart
/// sería mantener dos copias de algo que ya costó caro con una.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RepoEspia repo;
  late _RealtimeEspia realtime;
  late ManagerOrdersCubit cubit;

  setUp(() {
    repo = _RepoEspia();
    realtime = _RealtimeEspia();
    cubit = ManagerOrdersCubit(
      businessUuid: 'b1',
      repo: repo,
      logger: Logger(level: Level.off),
      realtime: realtime,
    );
  });

  tearDown(() async {
    await cubit.close();
    await realtime.unwatchAll(); // el fallback a polling deja timers vivos
  });

  test('una acción del manager no lee la lista', () async {
    await cubit.load();
    expect(repo.lecturas, 1, reason: 'la carga inicial');

    await cubit.advanceFulfillment('a', 'ready');

    expect(repo.lecturas, 1, reason: 'la acción no puede leer la lista');
  });

  /// Y no la lee NUNCA: ni al instante ni diferida. La versión anterior armaba
  /// un temporizador de 2 s, así que esperar no bastaba para distinguirlas.
  test('ni la lee más tarde', () async {
    await cubit.load();
    await cubit.advanceFulfillment('a', 'ready');

    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(repo.lecturas, 1, reason: 'quedó un refetch diferido');
  });

  test('los contadores salen de la respuesta de la mutación', () async {
    await cubit.load();
    repo.contadores = const ManagerOrderCountsDM(preparing: 3, ready: 1);

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.counts.preparing, 3);
    expect(cubit.state.counts.ready, 1);
  });

  test('y el total también, sin que el cliente sume los cubos', () async {
    await cubit.load();
    // El total es MAYOR que la suma de los cubos: el backend cuenta también
    // los `fulfillment_status` que el cliente no conoce.
    repo.contadores = const ManagerOrderCountsDM(pending: 1);
    repo.total = 4;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.total, 4, reason: 'sumar los cuatro cubos se queda corto');
  });

  test('la fila se actualiza en el acto', () async {
    await cubit.load();

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.firstWhere((o) => o.uuid == 'a').fulfillmentStatus,
      GroupFulfillmentStatus.ready,
    );
  });

  /// EL CASO QUE MOTIVÓ TODO ESTO: una cuenta que se cierra sale del panel en
  /// vivo en el acto, no "cuando llegue el evento".
  test('una orden que deja el panel desaparece de la lista al instante', () async {
    await cubit.load();
    repo.sigueEnElPanel = false;

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.where((o) => o.uuid == 'a'),
      isEmpty,
      reason: 'el panel de "en vivo" sigue mostrando una orden que el backend ya excluye',
    );
  });

  /// Y una respuesta vieja —de un backend sin desplegar— no puede vaciar la
  /// lista: sin el campo, la orden se queda.
  test('sin el campo, la orden se queda en la lista', () async {
    await cubit.load();
    repo.sigueEnElPanel = null;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.orders.map((o) => o.uuid), contains('a'));
  });

  /// Lo mismo con los contadores: sin ellos se conservan los que había, no se
  /// ponen a cero.
  test('sin contadores en la respuesta, se conservan los de antes', () async {
    repo.contadores = const ManagerOrderCountsDM(pending: 7);
    await cubit.load();
    repo.contadores = null;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.counts.pending, 7);
  });

  // ── Lo que encontró la revisión ──────────────────────────────────────

  /// El pie del panel decía "Mostrando 2 de 9" en cuanto había un chip puesto.
  ///
  /// `meta.total` del listado es el del CUBO FILTRADO; `counts_total` de la
  /// mutación es el GLOBAL. Meter uno en el campo del otro hacía saltar el
  /// contador de "Todas" tras cada acción y encendía el aviso de lista
  /// truncada sin que hubiera nada truncado.
  test('con un chip puesto, el total es el de ESE cubo', () async {
    await cubit.load();
    await cubit.selectBucket('ready');
    // Una sola fila en el cubo, para que el pie no tenga nada que truncar.
    repo.contadores = const ManagerOrderCountsDM(pending: 5, preparing: 2, ready: 1);
    repo.total = 8; // el global

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.total, 1, reason: 'el pie diría "Mostrando 1 de 8"');
    expect(cubit.state.isTruncated, isFalse);
  });

  test('y sin chip, el total es el global', () async {
    await cubit.load();
    repo.contadores = const ManagerOrderCountsDM(pending: 1);
    repo.total = 9;

    await cubit.advanceFulfillment('a', 'ready');

    expect(cubit.state.total, 9);
  });

  /// Con un chip filtrando, una orden que cambia de cubo se iba de la lista
  /// — antes se quedaba visible bajo el chip equivocado, porque
  /// `still_in_panel` contesta "¿sigue en el panel?", no "¿sigue en ESTE cubo?".
  test('una orden que cambia de cubo sale del chip que se está mirando', () async {
    await cubit.load();
    await cubit.selectBucket('preparing');
    repo.estadoDevuelto = GroupFulfillmentStatus.ready;

    await cubit.advanceFulfillment('a', 'ready');

    expect(
      cubit.state.orders.where((o) => o.uuid == 'a'),
      isEmpty,
      reason: 'bajo el chip PREPARANDO hay una orden que ya está LISTA',
    );
  });

  /// Y si la orden debería ENTRAR en el cubo visible y no está en la lista, no
  /// se puede resolver localmente —falta su sitio en el orden—, así que se lee.
  /// Es el único resto de la red de seguridad.
  test('si la orden debería entrar en el cubo visible, se lee', () async {
    await cubit.load();
    // La palanca ANTES del cambio de chip: si no, `selectBucket` trae la orden
    // y entonces ya está en la lista, que es el caso contrario al que se prueba.
    repo.ordenEnLaLista = false;
    await cubit.selectBucket('ready');
    final antes = repo.lecturas;
    repo.estadoDevuelto = GroupFulfillmentStatus.ready;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(Duration.zero);

    expect(repo.lecturas, antes + 1, reason: 'la orden entra en el cubo y nadie la trae');
  });

  /// Una lectura que salió ANTES de la mutación no puede pisar los contadores
  /// frescos. El argumento de "ya lo corrige el evento" no vale:
  /// `BusinessOrdersTouched::safe` se traga los fallos de broadcast y el
  /// polling de 10 s sólo corre con el socket caído.
  test('una lectura vieja no pisa los contadores de la mutación', () async {
    // La acción tiene que ser sobre una orden que NO esté en la lista visible.
    //
    // Si estuviera, la regla de descarte de la PR #87 ya tira esa lectura
    // —marca `_ultimaAplicada`— y este test pasaría sin ejercitar nada. Es lo
    // que me pasó en el primer intento: verde con la guarda quitada. Con la
    // orden fuera de la lista, `_ultimaAplicada` NO se marca (esa es su regla,
    // y se conserva), la lectura vieja sí se aplica, y lo único que protege
    // los contadores es su marcador propio.
    repo.ordenEnLaLista = false;
    await cubit.load();

    repo.retenerLecturas = true;
    repo.contadoresDeLaLista = const ManagerOrderCountsDM(pending: 5);
    final lecturaVieja = cubit.refetchSilently();

    repo.contadores = const ManagerOrderCountsDM(pending: 4, ready: 1);
    await cubit.advanceFulfillment('a', 'ready');

    repo.responderLectura();
    await lecturaVieja;

    expect(cubit.state.counts.pending, 4, reason: 'los chips volvieron a los números de antes');
    expect(cubit.state.counts.ready, 1);
  });

  // ── El cable: las tres claves del JSON ───────────────────────────────

  /// Toda la PR cuelga de tres cadenas, y un error se degrada EN SILENCIO a
  /// los fallbacks — indistinguible de un backend sin desplegar. Mutando
  /// cualquiera de las tres, la suite entera seguía verde.
  test('las tres claves del backend se parsean', () {
    final dm = GroupOrderResponseDM.fromJson(const {
      'group_order': {'uuid': 'a', 'business_uuid': 'b1'},
      'counts': {'pending': 1, 'preparing': 2, 'ready': 3, 'delivered': 4},
      'counts_total': 11,
      'still_in_panel': false,
    });

    expect(dm.panelCounts?.pending, 1);
    expect(dm.panelCounts?.delivered, 4);
    expect(dm.panelTotal, 11);
    expect(dm.stillInPanel, isFalse);
  });

  test('el evento de realtime sigue leyendo, que es lo que NO hay que romper', () async {
    await cubit.load();

    realtime.tocar();
    await Future<void>.delayed(Duration.zero);

    expect(repo.lecturas, 2, reason: 'el panel dejó de escuchar el canal del negocio');
  });
}

class _RepoEspia implements GroupOrderRepo {
  int lecturas = 0;
  ManagerOrderCountsDM? contadores = const ManagerOrderCountsDM();
  ManagerOrderCountsDM? contadoresDeLaLista;
  int? total;
  bool? sigueEnElPanel = true;
  bool ordenEnLaLista = true;
  GroupFulfillmentStatus? estadoDevuelto;

  /// Con esto puesto, las lecturas se quedan EN VUELO hasta que el test las
  /// responda. Sin ello no hay forma de tener una lectura vieja aterrizando
  /// después de la mutación: el fake resolvía al instante y el test pasaba
  /// por no medir nada.
  bool retenerLecturas = false;
  final List<Completer<ApiResult<ManagerOrdersResponseDM>>> pendientes = [];

  void responderLectura() => pendientes.removeAt(0).complete(_respuestaDeLista());

  ApiResult<ManagerOrdersResponseDM> _respuestaDeLista() =>
      ApiResult.success(ManagerOrdersResponseDM(
        orders: ordenEnLaLista ? const [_orden] : const [],
        counts: contadoresDeLaLista ?? contadores ?? const ManagerOrderCountsDM(),
      ));

  static const _orden = GroupOrderDM(uuid: 'a', businessUuid: 'b1');

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    lecturas++;
    if (retenerLecturas) {
      final c = Completer<ApiResult<ManagerOrdersResponseDM>>();
      pendientes.add(c);
      return c.future;
    }
    return _respuestaDeLista();
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async =>
      ApiResult.success(GroupOrderResponseDM(
        groupOrder: _orden.copyWith(
          fulfillmentStatus: estadoDevuelto ?? GroupFulfillmentStatus.values.byName(status),
        ),
        panelCounts: contadores,
        panelTotal: total,
        stillInPanel: sigueEnElPanel,
      ));

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

/// Extiende el servicio REAL: `load()` hace
/// `_sub = await _realtime?.watchBusiness(...)`, así que un fake que devuelva
/// un `Future` sin completar cuelga el cubit, y `RealtimeSubscription` tiene
/// constructor privado.
class _RealtimeEspia extends GroupOrderRealtimeService {
  _RealtimeEspia() : super(authSession: _AuthFalso());

  VoidCallback? _onTouched;

  void tocar() => _onTouched?.call();

  @override
  Future<RealtimeSubscription> watchBusiness(
    String businessUuid, {
    required VoidCallback onTouched,
  }) {
    _onTouched = onTouched;
    return super.watchBusiness(businessUuid, onTouched: onTouched);
  }
}

class _AuthFalso implements AuthSessionService {
  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
