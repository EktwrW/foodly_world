import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:logger/logger.dart';

/// F4a — estado del panel "Órdenes en vivo" (maquetas v3).
///
/// Sin freezed a propósito: es un estado plano de lista (orders + counts +
/// bucket + flags) sin variantes — copyWith manual alcanza y el cubit queda
/// 100% testeable con un fake del repo, como el resto del feature.
class ManagerOrdersState {
  final bool loading;
  final List<GroupOrderDM> orders;
  final ManagerOrderCountsDM counts;

  /// Bucket activo del chip: null = todas (pending|preparing|ready|delivered).
  final String? bucket;
  final String? error;

  /// Cuántas hay en el filtro actual según el BE, que puede ser MÁS que
  /// [orders]: el panel pide una sola página y no pagina a propósito (ver
  /// [ManagerOrdersCubit.refetchSilently]). Se guarda para poder decirlo en
  /// pantalla en vez de mostrar 50 tarjetas como si fueran todas.
  final int total;

  const ManagerOrdersState({
    this.loading = false,
    this.orders = const [],
    this.counts = const ManagerOrderCountsDM(),
    this.bucket,
    this.error,
    this.total = 0,
  });

  /// Hay más de las que caben en la página que pedimos.
  bool get isTruncated => total > orders.length;

  ManagerOrdersState copyWith({
    bool? loading,
    List<GroupOrderDM>? orders,
    ManagerOrderCountsDM? counts,
    Object? bucket = _sentinel,
    Object? error = _sentinel,
    int? total,
  }) =>
      ManagerOrdersState(
        loading: loading ?? this.loading,
        orders: orders ?? this.orders,
        counts: counts ?? this.counts,
        bucket: bucket == _sentinel ? this.bucket : bucket as String?,
        error: error == _sentinel ? this.error : error as String?,
        total: total ?? this.total,
      );

  static const _sentinel = Object();
}

/// Cubit del panel del negocio: lista live por buckets + acciones de
/// fulfillment/checklist/mesa. Realtime vía canal `business-orders.{uuid}`
/// (opcional: null en tests) con las mismas garantías del cliente
/// (fallback polling, lifecycle-aware).
class ManagerOrdersCubit extends Cubit<ManagerOrdersState> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  final GroupOrderRealtimeService? _realtime;

  /// Suscripción PROPIA al canal del negocio. Antes el servicio era
  /// mono-canal y cualquier otro consumidor (el chip del comensal) dejaba
  /// mudo este panel al suscribirse (2026-08-06).
  /// El FUTURO, no la suscripción resuelta: hasta que `watchBusiness` vuelve,
  /// `_sub` era null y un segundo `load()` no tenía nada que cancelar.
  Future<RealtimeSubscription>? _sub;
  final String businessUuid;

  ManagerOrdersCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    required this.businessUuid,
    GroupOrderRealtimeService? realtime,
    Duration esperaEntreIntentos = esperaEntreIntentosPorDefecto,
  })  : _repo = repo,
        _logger = logger,
        _realtime = realtime,
        _esperaEntreIntentos = esperaEntreIntentos,
        super(const ManagerOrdersState());

  /// Sube al LANZAR cada lectura. Nada más: no es un «algo cambió», es un
  /// número de orden de salida (2026-09-12).
  int _generacion = 0;

  /// La de la última lectura que SÍ se aplicó — y la de la acción que tocó una
  /// fila visible, que es la otra cosa que deja la pantalla al día.
  int _ultimaAplicada = 0;

  /// Marcador SÓLO para los contadores: una lectura anterior a la última
  /// mutación no puede pisarlos, aunque sus filas sí valgan.
  int _ultimaAplicadaContadores = 0;

  static bool _perteneceAlCubo(GroupOrderDM orden, String cubo) => switch (cubo) {
        'pending' => orden.fulfillmentStatus == null,
        'preparing' => orden.fulfillmentStatus == GroupFulfillmentStatus.preparing,
        'ready' => orden.fulfillmentStatus == GroupFulfillmentStatus.ready,
        'delivered' => orden.fulfillmentStatus == GroupFulfillmentStatus.delivered,
        _ => true,
      };

  static int? _totalDelCubo(String? cubo, ManagerOrderCountsDM c) => switch (cubo) {
        'pending' => c.pending,
        'preparing' => c.preparing,
        'ready' => c.ready,
        'delivered' => c.delivered,
        _ => null,
      };

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null));
    await _fetch();
    await _suscribir();
  }

  /// Canal live del panel: cualquier evento → refetch silencioso.
  ///
  /// `_sub` se asignaba DESPUÉS de dos `await`, así que salir de la pantalla
  /// mientras corría la primera lectura dejaba la suscripción naciendo sobre un
  /// cubit ya cerrado: `close()` cancelaba un `_sub` todavía null y el oyente se
  /// quedaba oyendo para siempre, con un GET por cada resume.
  /// La bandera se marca ANTES del await: sin eso, dos `load()` seguidos entran
  /// los dos con `_sub` todavía en null y ninguno cancela nada.
  bool _suscrito = false;

  Future<void> _suscribir() async {
    final realtime = _realtime;
    if (realtime == null || isClosed || _suscrito) return;
    _suscrito = true;
    // `watchBusiness` registra el oyente SINCRÓNICAMENTE: cancelar antes metería
    // un microtask entre la carga y la suscripción, y ahí se pierde un evento.
    final anterior = _sub;
    final pendiente = realtime.watchBusiness(businessUuid, onTouched: refetchSilently);
    _sub = pendiente;
    GroupOrderRealtimeService.cancelarCuandoExista(anterior);
    final RealtimeSubscription sub;
    try {
      sub = await pendiente;
    } catch (e) {
      _suscrito = false; // o el panel se queda sin canal el resto de la sesión
      _logger.e(e); // sin relanzar: `load()` se llama con `..load()`
      return;
    }
    if (isClosed) {
      await sub.cancel();
      _suscrito = false;
    }
  }

  Future<void> selectBucket(String? bucket) async {
    // La lista se VACÍA, y no es cosmético: el panel sólo pinta el spinner con
    // `loading && orders.isEmpty`, así que conservando las filas del cubo
    // anterior se veían bajo el chip nuevo durante todo el viaje, sin spinner
    // y sin aviso. Es el síntoma que da nombre a esto, y pasaba en CADA cambio
    // de chip, sin carrera ninguna. `total` va con ellas o el pie miente.
    emit(state.copyWith(
      bucket: bucket,
      loading: true,
      error: null,
      orders: const [],
      total: 0,
    ));
    await _fetch();
  }

  /// Refetch sin loading NI error (realtime/polling): la lista no parpadea y
  /// un tick que falla no interrumpe al manager.
  Future<void> refetchSilently() => _fetch(silent: true);

  static const int _maxIntentosDeRescate = 3;

  /// UNA cadena de rescate a la vez.
  ///
  /// Sin esto, cada acción sobre una orden ausente de la lista arrancaba su
  /// propia cadena: medido por la revisión, 6 acciones encadenadas son 6
  /// peticiones con el backend sano y **18** con el backend caído — del mismo
  /// orden que las 22 contra 4 que motivaron el tope de la PR #87. La red
  /// anterior ya lo evitaba con un único `Timer` («tres acciones seguidas no
  /// pueden dejar tres lecturas encoladas»), y al pasar a recursión me lo
  /// llevé por delante.
  Future<void>? _rescateEnVuelo;
  bool _otroRescatePendiente = false;

  /// A quién busca la cadena encolada. Va aparte de la bandera porque la
  /// bandera sola tiraba el uuid: ver `_traerLaOrdenQueFalta`.
  String? _uuidPendiente;
  Timer? _esperaDelRescate;

  /// Una cadena a la vez, pero **sin unirse a la que ya está en vuelo**.
  ///
  /// Unirse era un fallo sutil y lo encontró la revisión: la acción B quedaba
  /// satisfecha por una lectura lanzada ANTES de la mutación de B, así que si
  /// esa lectura salía bien la cadena terminaba y B no se releía nunca — sin
  /// error y sin reintento. La red vieja no lo tenía porque `_armarRed()`
  /// cancelaba y re-armaba: una petición tardía conseguía siempre una lectura
  /// FRESCA. Así que se marca y se encadena UNA más al terminar.
  ///
  /// El rescate **persigue un uuid concreto**, y eso no es un detalle: sin
  /// saber a quién busca no puede distinguir un descarte que le afecta de uno
  /// que no, y se abandonaba en silencio. Ver `_rescatar`.
  void _traerLaOrdenQueFalta(String uuid) {
    if (_rescateEnVuelo != null) {
      _otroRescatePendiente = true;
      // Y CON SU UUID. La primera versión sólo levantaba la bandera, así que
      // la cadena encadenada salía a buscar a la orden de la PRIMERA acción:
      // si ésa ya había llegado, el descarte la daba por satisfecha y la
      // segunda no volvía nunca. El mismo fallo que esto arregla, una capa
      // más adentro; lo encontró la revisión.
      _uuidPendiente = uuid;
      return;
    }

    _rescateEnVuelo = _rescatar(uuid).whenComplete(() {
      _rescateEnVuelo = null;
      if (_otroRescatePendiente && !isClosed) {
        _otroRescatePendiente = false;
        final siguiente = _uuidPendiente ?? uuid;
        _uuidPendiente = null;
        _traerLaOrdenQueFalta(siguiente);
      }
    });
  }

  Future<void> _rescatar(String uuid, [int intento = 1]) async {
    final cuboAlSalir = state.bucket;
    final desenlace = await _fetch(silent: true);

    if (isClosed) return;

    // Aplicada: ya está.
    if (desenlace == _Lectura.aplicada) return;

    // DESCARTADA no es «alguien se ocupa»: una acción sobre otra fila sube
    // `_ultimaAplicada` y descarta esta lectura sin leer nada en su lugar.
    // Sólo se abandona cuando el descarte significa algo de verdad: cambió el
    // cubo —trae su propia lectura— o la orden ya llegó.
    if (desenlace == _Lectura.descartada) {
      if (cuboAlSalir != state.bucket) return;
      if (state.orders.any((o) => o.uuid == uuid)) return;
    }

    if (intento >= _maxIntentosDeRescate) {
      // Sin aviso, el panel diría «No hay órdenes» con el chip marcando 1, y
      // aquí «un dato falso es peor que un error». Pero sólo si sigue faltando
      // y sólo si falló algo: avisar siempre pintaba un fallo con la pantalla
      // ya correcta y pisaba un mensaje mejor del backend. `loading: false`
      // porque con un `selectBucket` en vuelo el aviso queda bajo el spinner.
      if (desenlace == _Lectura.fallida && !state.orders.any((o) => o.uuid == uuid)) {
        emit(state.copyWith(loading: false, error: state.error ?? ''));
      }

      return;
    }

    // El retardo va en un `Timer` cancelable y no en un `Future.delayed`
    // suelto: el suelto sobrevive a `close()` y revienta cualquier
    // `testWidgets` del panel con «A Timer is still pending», con una traza
    // que no señala a nada. La red anterior sí lo guardaba en un campo.
    final espera = Completer<void>();
    _esperaDelRescate?.cancel();
    _esperaDelRescateCompleta = espera;
    _esperaDelRescate = Timer(_esperaEntreIntentos * intento, () {
      if (!espera.isCompleted) espera.complete();
    });
    await espera.future;

    if (!isClosed) await _rescatar(uuid, intento + 1);
  }

  /// Espera entre intentos de rescate. Expuesta porque un valor mal puesto se
  /// degrada en silencio —a cero es una tormenta, muy alta es no reintentar— y
  /// los tests inyectan uno corto: sin fijarla, cambiarla pasa la suite entera.
  /// Es la lección de la red anterior.
  static const Duration esperaEntreIntentosPorDefecto = Duration(milliseconds: 800);

  /// El `Completer` que espera ese `Timer`, para poder soltarlo en `close()`.
  Completer<void>? _esperaDelRescateCompleta;

  final Duration _esperaEntreIntentos;

  @visibleForTesting
  Duration get esperaEntreIntentos => _esperaEntreIntentos;

  /// Cómo acabó ESTA lectura, en tres desenlaces y no dos.
  ///
  /// Un booleano no bastaba —y el commit anterior decía que sí—: `false`
  /// mezclaba «falló» con «se descartó porque hay algo más nuevo», y el
  /// rescate trataba las dos igual. Tres descartes seguidos acababan emitiendo
  /// un error que la página convierte en snackbar: un aviso de fallo por
  /// lecturas que estaban perfectamente bien. Lo señaló la revisión.
  Future<_Lectura> _fetch({bool silent = false}) async {
    final generacion = ++_generacion;
    final cubo = state.bucket;
    final res = await _repo.managerOrders(businessUuid, bucket: cubo);
    if (isClosed) return _Lectura.descartada;

    // SE DESCARTA SÓLO SI YA HAY ALGO MEJOR EN PANTALLA, O SI ESTAS FILAS SON
    // DE OTRO CUBO. Que alguien haya lanzado después NO basta: esa otra lectura
    // puede fallar en silencio —un refetch de fondo no le cuenta errores al
    // manager— y entonces tirar ésta deja la pantalla con las filas viejas, sin
    // spinner y sin aviso, que es justo lo que esto existe para borrar.
    if (generacion <= _ultimaAplicada || cubo != state.bucket) return _Lectura.descartada;

    return res.when(
      success: (r) {
        _ultimaAplicada = generacion;
        final contadoresAlDia = generacion > _ultimaAplicadaContadores;
        if (contadoresAlDia) _ultimaAplicadaContadores = generacion;

        emit(state.copyWith(
          loading: false,
          orders: r.orders,
          counts: contadoresAlDia ? r.counts : state.counts,
          // Sin meta (respuesta vieja o test) el total es lo que llegó: así
          // `isTruncated` da false y la UI no inventa un aviso.
          total: contadoresAlDia ? (r.meta?.total ?? r.orders.length) : state.total,
          error: null,
        ));

        return _Lectura.aplicada;
      },
      failure: (e) {
        _logger.e(e);

        // Un refetch de FONDO que falla no se le cuenta al manager: en pantalla
        // siguen los últimos datos buenos y el próximo tick los corrige.
        // Emitirlo encolaba un snackbar por tick — con la pantalla apagada el
        // manager veía diez seguidos al encenderla (bug 2026-08-17). Los
        // errores que sí se muestran son los de `load`, `selectBucket` y las
        // acciones, que son los que el manager provocó.
        if (silent) return _Lectura.fallida;
        // '' = error sin detalle (la UI muestra el genérico i18n). Nunca
        // e.toString(): resuelve DI por dentro y explota fuera de la app.
        emit(state.copyWith(loading: false, error: e.serverMessage ?? ''));

        return _Lectura.fallida;
      },
    );
  }

  // ── Acciones del detalle (aplican la orden devuelta sobre la lista) ──

  Future<bool> advanceFulfillment(String orderUuid, String status) => _applyAction(
        () => _repo.managerSetFulfillment(orderUuid, status: status),
      );

  Future<bool> setItemDelivered(String orderUuid, String itemUuid, bool delivered) =>
      _applyAction(
        () => _repo.managerSetItemDelivered(orderUuid, itemUuid, delivered: delivered),
      );

  Future<bool> deliverAll(String orderUuid) =>
      _applyAction(() => _repo.managerDeliverAll(orderUuid));

  /// F4b.1: anula/restaura un ítem (plato devuelto) — deja de cobrarse.
  Future<bool> setItemVoided(String orderUuid, String itemUuid, bool voided, {String? reason}) =>
      _applyAction(
        () => _repo.managerSetItemVoided(orderUuid, itemUuid, voided: voided, reason: reason),
      );

  Future<bool> setTableLabel(String orderUuid, String? label) =>
      _applyAction(() => _repo.managerSetTable(orderUuid, tableLabel: label));

  /// F4b: cierra una cuenta abierta cobrada EN CAJA (o impagada). Es el
  /// desenlace más común en un restaurante tradicional y no cobra comisión:
  /// Foodly no procesó el dinero.
  Future<bool> closeTab(String orderUuid, String reason) =>
      _applyAction(() => _repo.managerCloseTab(orderUuid, reason: reason));

  Future<bool> _applyAction(
    Future<ApiResult<GroupOrderResponseDM>> Function() call,
  ) async {
    final res = await call();

    // Salir de la pantalla con una acción en vuelo lanzaba `Bad state: Cannot
    // emit new states after calling close` — y como los `onPressed` del
    // detalle no esperan el future, era un error asíncrono sin dueño.
    // Preexistente, no de esta cadena, pero aquí se cierra.
    if (isClosed) return false;

    return res.when(
      success: (r) {
        final updated = r.groupOrder;
        // La respuesta de la mutación trae los contadores, el total y si la
        // orden sigue perteneciendo al panel en vivo (be-foodly #148). Con eso
        // la pantalla se pone al día sin releer.
        //
        // `stillInPanel` lo decide el BACKEND. El predicado de "está en el
        // panel" se corrigió tres veces en agosto de 2026; replicarlo en Dart
        // sería mantener dos copias de algo que ya costó caro con una.
        //
        // Sin el campo —un backend sin desplegar— la orden se queda: una
        // respuesta vieja no puede vaciarle la lista al manager.
        final sigue = r.stillInPanel ?? true;
        final contadores = r.panelCounts ?? state.counts;

        // Pertenecer al PANEL y pertenecer al CUBO QUE SE ESTÁ MIRANDO son dos
        // preguntas distintas, y la primera versión sólo contestaba la
        // primera: con un chip filtrando, una orden que cambiaba de cubo se
        // quedaba visible bajo el chip equivocado. Lo encontró la revisión.
        //
        // Esto SÍ es del cliente y no contradice lo de arriba: el mapeo
        // cubo<->estado ya vive en `manager_orders_page.dart` y es trivial
        // (`fulfillment_status == bucket`, pendientes = null). Lo que no se
        // replica es el predicado del panel, que es harina de otro costal.
        final cubo = state.bucket;
        final enSuCubo = cubo == null || _perteneceAlCubo(updated, cubo);
        final visible = sigue && enSuCubo;

        final estaba = state.orders.any((o) => o.uuid == updated.uuid);

        // La regla de generación es la de la PR #87 y se conserva TAL CUAL:
        // sólo se marca si cambió algo de lo que se VE en la lista, porque
        // marcarla mata una lectura en vuelo que quizá sea la única que traiga
        // las filas de las demás mesas.
        if (estaba) _ultimaAplicada = _generacion;

        // Los contadores llevan su PROPIO marcador. Sin él, una lectura que
        // salió antes de esta mutación y aterriza después pisaba los chips con
        // números viejos —medido por la revisión—, y el argumento de "ya lo
        // corrige el evento" no se sostiene: `BusinessOrdersTouched::safe` se
        // traga los fallos de broadcast, y el polling de 10 s sólo corre con el
        // socket caído. Este marcador no toca la regla de la lista.
        _ultimaAplicadaContadores = _generacion;

        emit(state.copyWith(
          orders: estaba
              ? [
                  for (final o in state.orders)
                    if (o.uuid != updated.uuid) o else if (visible) updated,
                ]
              : state.orders,
          counts: contadores,
          // El total del listado es el del CUBO FILTRADO (el backend devuelve
          // `meta.total` ya filtrado), y `counts_total` de la mutación es el
          // GLOBAL. Meter uno en el campo del otro hacía que el pie dijera
          // "Mostrando 2 de 9" en cuanto había un chip puesto. Con filtro, el
          // total sale del contador de ese cubo, que es lo que hace el backend.
          total: _totalDelCubo(cubo, contadores) ?? r.panelTotal ?? state.total,
          error: null,
        ));

        // El único caso que NO se puede resolver aquí: la orden debería estar
        // en la lista y no está. Falta su sitio en el orden, así que hay que
        // leer. Es todo lo que queda de la red de seguridad de la PR #82.
        //
        // SIN `cubo != null`: la primera versión lo llevaba y dejaba fuera el
        // caso sin chip —que es el 90 % del uso—, donde una orden que debía
        // aparecer no se recuperaba NUNCA. Antes de la #85 la red era
        // incondicional, así que era una regresión mía. Lo encontró la segunda
        // revisión.
        //
        // Y con reintento: esta lectura es silenciosa, así que si falla deja
        // el chip diciendo «1» y la lista diciendo «No hay órdenes».
        //
        // Matiz que corrigió la revisión, porque yo lo había escrito mal: el
        // evento de la PROPIA mutación sí vuelve a este dispositivo —se emite
        // sin `toOthers()`— y repara la pantalla en unos cientos de ms. Para
        // que esto importe tiene que fallar ADEMÁS el broadcast (`::safe` se
        // los traga) o estar el socket caído. Es un caso combinado, no el
        // camino normal. Con tope, que es la lección de la PR #87.
        if (!estaba && visible) _traerLaOrdenQueFalta(updated.uuid);

        return true;
      },
      failure: (e) {
        _logger.e(e);
        emit(state.copyWith(error: e.serverMessage ?? ''));
        return false;
      },
    );
  }

  @override
  Future<void> close() async {
    _esperaDelRescate?.cancel();
    _esperaDelRescate = null;
    // Cancelar el `Timer` deja al `Completer` de `_rescatar` sin completar
    // nunca, y con él el `whenComplete` de la cadena. No es una fuga real —el
    // ciclo es autorreferente y lo recoge el GC, y no queda ningún timer
    // pendiente— pero completarlo hace que `close()` termine de verdad: el
    // rescate reanuda, ve `isClosed` y sale por su pie.
    if (_esperaDelRescateCompleta?.isCompleted == false) _esperaDelRescateCompleta!.complete();
    _esperaDelRescateCompleta = null;
    _otroRescatePendiente = false;
    _uuidPendiente = null;
    _suscrito = false;
    GroupOrderRealtimeService.cancelarCuandoExista(_sub);
    _sub = null;
    return super.close();
  }
}


/// Cómo acabó una lectura del panel. Tres desenlaces, no dos: «descartada» no
/// es «fallida», y tratarlas igual acababa avisando de un fallo inexistente.
enum _Lectura { aplicada, descartada, fallida }
