import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
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
      esperaEntreIntentos: const Duration(milliseconds: 20),
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
    repo.estadoDevuelto = (valor: GroupFulfillmentStatus.ready);

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
    repo.estadoDevuelto = (valor: GroupFulfillmentStatus.ready);

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

  // ── Lo que encontró la SEGUNDA revisión ──────────────────────────────

  /// La lectura que queda es de UN SOLO DISPARO y no reintenta.
  ///
  /// Antes de la #85, la red se re-armaba hasta 3 veces al fallar. Al borrar
  /// el Timer me llevé el reintento por delante, y esta lectura es silenciosa:
  /// si falla, el chip dice «1» y la lista dice «No hay órdenes», y ese estado
  /// contradictorio se queda hasta que otra mesa genere un evento. Y el evento
  /// no es rescate: `BusinessOrdersTouched::safe` se traga los fallos de
  /// broadcast y el polling de 10 s sólo corre con el socket caído.
  test('si la lectura que trae la orden falla, se reintenta', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    await cubit.selectBucket('ready');
    repo.estadoDevuelto = (valor: GroupFulfillmentStatus.ready);
    repo.fallaLaLectura = true;
    final antes = repo.lecturas;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(Duration.zero);
    expect(repo.lecturas, antes + 1, reason: 'ni siquiera lo intentó');

    repo.fallaLaLectura = false;
    await Future<void>.delayed(const Duration(milliseconds: 120));

    expect(repo.lecturas, greaterThan(antes + 1),
        reason: 'una lectura fallida deja el panel mintiendo sin salida');
  });

  /// Pero con tope: un backend caído no puede convertirse en una tormenta.
  /// Es la preocupación que midió la contra-revisión de la PR #87 (22
  /// peticiones contra 4) y sigue valiendo para lo poco que queda de red.
  /// Si la lectura SALE BIEN pero no trae la orden, no se reintenta: el
  /// backend ya ha contestado que no está ahí. Sin esta distinción, el rescate
  /// pediría sus tres intentos siempre, contra un backend que responde de
  /// maravilla — tres lecturas completas del panel por acción.
  test('una lectura buena que no trae la orden no se reintenta', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    final antes = repo.lecturas;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(const Duration(milliseconds: 120));

    expect(repo.lecturas, antes + 1, reason: 'reintentó contra un backend que respondió bien');
  });

  /// Y el total tiene la misma puerta que los contadores: una lectura anterior
  /// a la mutación no puede pisarlo. Se añadieron las dos en el mismo commit y
  /// sólo una estaba fijada.
  test('una lectura vieja tampoco pisa el total', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();

    repo.retenerLecturas = true;
    repo.contadoresDeLaLista = const ManagerOrderCountsDM(pending: 9);
    final lecturaVieja = cubit.refetchSilently();

    repo.contadores = const ManagerOrderCountsDM(pending: 4);
    repo.total = 4;
    await cubit.advanceFulfillment('a', 'ready');

    repo.responderLectura();
    await lecturaVieja;

    expect(cubit.state.total, 4, reason: 'el pie volvió al número de antes de la acción');
  });

  /// N acciones encadenadas sobre una orden ausente NO son N cadenas de
  /// rescate. La revisión midió 6 acciones = 6 peticiones con el backend sano
  /// y 18 con el backend caído — del mismo orden que las 22 contra 4 que
  /// motivaron el tope de la PR #87. La red anterior ya lo evitaba con un solo
  /// `Timer`; al pasar a recursión me lo llevé por delante.
  test('varias acciones encadenadas arman UNA sola cadena de rescate', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    repo.fallaLaLectura = true;
    final antes = repo.lecturas;

    for (var i = 0; i < 6; i++) {
      await cubit.advanceFulfillment('a', 'ready');
    }
    await Future<void>.delayed(const Duration(milliseconds: 300));

    expect(repo.lecturas - antes, lessThanOrEqualTo(3),
        reason: 'seis acciones dejaron seis cadenas de rescate encoladas');
  });

  /// Y la espera se USA, no sólo se declara. El test del getter no lo fijaba:
  /// poniéndola a cero, las 23 pruebas seguían en verde — el mismo
  /// verde-por-razón-degenerada que esta PR dice estar corrigiendo, en la
  /// línea que esta PR añade.
  test('entre intento e intento se espera de verdad', () async {
    final lento = ManagerOrdersCubit(
      businessUuid: 'b1',
      repo: repo,
      logger: Logger(level: Level.off),
      esperaEntreIntentos: const Duration(milliseconds: 300),
    );
    addTearDown(lento.close);

    repo.ordenEnLaLista = false;
    await lento.load();
    repo.fallaLaLectura = true;
    final antes = repo.lecturas;

    unawaited(lento.advanceFulfillment('a', 'ready'));
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(repo.lecturas - antes, 1, reason: 'se reintentó sin esperar');

    // Y la espera CRECE. La ventana hay que elegirla donde las dos formas
    // difieran, que fue mi primer error aquí: a los 500 ms ambas llevan dos
    // intentos y el test pasaba con la escalada quitada.
    //
    //   con escalada:  intentos en t=0, 300, 900
    //   sin escalada:  intentos en t=0, 300, 600
    //
    // Así que a los 700 ms: dos con escalada, tres sin ella.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    expect(repo.lecturas - antes, 2, reason: 'la espera no escala entre intentos');
  });

  /// Agotados los intentos, el manager tiene que ver un error con reintento y
  /// no un «No hay órdenes» falso. Es la doctrina que ya está escrita en
  /// `manager_orders_page.dart`: un dato falso es peor que un error.
  test('agotados los intentos, la pantalla dice que falló', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    repo.fallaLaLectura = true;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(const Duration(milliseconds: 300));

    expect(cubit.state.error, isNotNull,
        reason: 'el panel dice "No hay órdenes" con el chip marcando 1');
    expect(cubit.state.orders, isEmpty);
  });

  /// Y una orden que SALIÓ del panel no dispara rescate: no hay nada que traer.
  test('una orden que deja el panel no dispara rescate', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    repo.sigueEnElPanel = false;
    final antes = repo.lecturas;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(const Duration(milliseconds: 120));

    expect(repo.lecturas, antes, reason: 'se pidió la lista para traer algo que ya no está');
  });

  /// Y el valor de PRODUCCIÓN, que los tests no ven porque inyectan 20 ms.
  test('la espera entre intentos ni martillea ni se duerme', () {
    final porDefecto = ManagerOrdersCubit(
      businessUuid: 'b1',
      repo: repo,
      logger: Logger(level: Level.off),
    );
    addTearDown(porDefecto.close);

    expect(porDefecto.esperaEntreIntentos, greaterThan(const Duration(milliseconds: 200)),
        reason: 'a cero, un backend caído es una tormenta');
    expect(porDefecto.esperaEntreIntentos, lessThan(const Duration(seconds: 5)),
        reason: 'tan alta que el manager se queda mirando una pantalla que miente');
  });

  test('y los reintentos tienen tope', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    await cubit.selectBucket('ready');
    repo.estadoDevuelto = (valor: GroupFulfillmentStatus.ready);
    repo.fallaLaLectura = true;
    final antes = repo.lecturas;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(const Duration(milliseconds: 400));

    expect(repo.lecturas - antes, lessThanOrEqualTo(4),
        reason: 'se re-arma sin fin y martillea un backend caído');
  });

  /// SIN chip, una orden que debería estar en la lista y no está tampoco se
  /// traía: el `cubo != null` la excluía. Antes de la #85 la red era
  /// incondicional, así que esto es una regresión mía, no una deuda heredada.
  test('sin chip, la orden que falta también se lee', () async {
    repo.ordenEnLaLista = false;
    await cubit.load();
    final antes = repo.lecturas;

    await cubit.advanceFulfillment('a', 'ready');
    await Future<void>.delayed(Duration.zero);

    expect(repo.lecturas, antes + 1,
        reason: 'sin chip, una orden que falta no se recupera nunca');
  });

  // ── Los dos mapeos, rama por rama ────────────────────────────────────
  //
  // Los tests de arriba fijan la FORMA (que no sean constantes) pero no el
  // MAPEO: cruzar `preparing` con `ready` pasaba la suite entera. Es el mismo
  // verde-por-razón-degenerada de siempre, así que van las cuatro ramas, en
  // las dos direcciones.

  /// @dataProvider no existe en Dart; un `for` sobre los cuatro pares.
  test('cada chip sólo se queda con las órdenes de SU cubo', () async {
    const pares = {
      'pending': null,
      'preparing': GroupFulfillmentStatus.preparing,
      'ready': GroupFulfillmentStatus.ready,
      'delivered': GroupFulfillmentStatus.delivered,
    };

    for (final chip in pares.keys) {
      for (final estado in pares.entries) {
        final cubitLocal = ManagerOrdersCubit(
          businessUuid: 'b1',
          repo: repo,
          logger: Logger(level: Level.off),
        );
        repo.ordenEnLaLista = true;
        repo.estadoDevuelto = null;
        await cubitLocal.load();
        await cubitLocal.selectBucket(chip);

        repo.estadoDevuelto = (valor: estado.value);
        await cubitLocal.advanceFulfillment('a', 'ready');

        final sigueVisible = cubitLocal.state.orders.any((o) => o.uuid == 'a');
        expect(
          sigueVisible,
          estado.key == chip,
          reason: 'chip «$chip» con una orden en «${estado.key}»: '
              '${estado.key == chip ? "tenía que quedarse" : "tenía que irse"}',
        );
        await cubitLocal.close();
      }
    }
  });

  test('y el total del pie es el del cubo de ese chip', () async {
    const contadores = ManagerOrderCountsDM(pending: 1, preparing: 2, ready: 3, delivered: 4);
    const esperado = {'pending': 1, 'preparing': 2, 'ready': 3, 'delivered': 4};

    for (final chip in esperado.keys) {
      final cubitLocal = ManagerOrdersCubit(
        businessUuid: 'b1',
        repo: repo,
        logger: Logger(level: Level.off),
      );
      repo.contadores = contadores;
      repo.total = 99; // el global, que NO debe salir con un chip puesto
      await cubitLocal.load();
      await cubitLocal.selectBucket(chip);
      await cubitLocal.advanceFulfillment('a', 'ready');

      expect(cubitLocal.state.total, esperado[chip], reason: 'chip «$chip»');
      await cubitLocal.close();
    }
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
  bool fallaLaLectura = false;
  /// Qué `fulfillment_status` devuelve la mutación.
  ///
  /// Va envuelto porque `null` es un valor VÁLIDO —es el cubo de pendientes— y
  /// con `estadoDevuelto ?? loQueSePidió` no había forma de pedir «devuelve
  /// nulo»: el `??` lo confundía con «no configurado» y el test del mapeo
  /// fallaba en el par (pending, pending) por culpa del fake, no del código.
  ({GroupFulfillmentStatus? valor})? estadoDevuelto;

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
    if (fallaLaLectura) {
      return ApiResult.failure(
        AppRequestException(error: StateError('sin red'), stackTrace: StackTrace.current),
      );
    }
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
          fulfillmentStatus: estadoDevuelto != null
              ? estadoDevuelto!.valor
              : GroupFulfillmentStatus.values.byName(status),
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
