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
  RealtimeSubscription? _sub;
  final String businessUuid;

  ManagerOrdersCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    required this.businessUuid,
    GroupOrderRealtimeService? realtime,
    Duration esperaDeResincronizacion = redPorDefecto,
  })  : _repo = repo,
        _logger = logger,
        _realtime = realtime,
        _esperaDeResincronizacion = esperaDeResincronizacion,
        super(const ManagerOrdersState());

  /// Cuánto se espera al evento antes de leer por nuestra cuenta.
  ///
  /// Dos segundos con margen: medido en producción, el `BusinessOrdersTouched`
  /// de la propia mutación llegaba entre 52 ms y 1 s después de que la
  /// mutación respondiera.
  ///
  /// Está expuesto porque es el valor del que cuelga TODO el ahorro de esta
  /// pantalla, y los tests inyectan uno corto: sin fijarlo, ponerlo a cero
  /// —que restaura la doble lectura— pasaba la suite entera sin que nadie se
  /// enterara. Lo señaló la revisión.
  static const Duration redPorDefecto = Duration(seconds: 2);

  final Duration _esperaDeResincronizacion;

  @visibleForTesting
  Duration get esperaDeResincronizacion => _esperaDeResincronizacion;

  /// Red de seguridad por si el evento no llega (socket caído, evento
  /// perdido). La desarma una lectura con ÉXITO.
  Timer? _redDeSeguridad;

  /// Hay contadores por resincronizar: una lectura fallida re-arma la red.
  bool _contadoresSucios = false;

  int _reintentosDeRed = 0;
  static const int _maxReintentosDeRed = 3;

  /// Sube al LANZAR cada lectura. Nada más: no es un «algo cambió», es un
  /// número de orden de salida (2026-09-12).
  int _generacion = 0;

  /// La de la última lectura que SÍ se aplicó — y la de la acción que tocó una
  /// fila visible, que es la otra cosa que deja la pantalla al día.
  int _ultimaAplicada = 0;

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null));
    await _fetch();
    // Canal live del panel: cualquier evento → refetch silencioso.
    _sub = await _realtime?.watchBusiness(businessUuid, onTouched: refetchSilently);
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

  /// Pide que los contadores se re-sincronicen, SIN leer ahora mismo.
  ///
  /// La mutación que acaba de responder emite `BusinessOrdersTouched`, y ese
  /// evento ya dispara un `refetchSilently()`. Leer aquí además era pedir dos
  /// veces lo mismo por cada acción del manager — medido en producción, con
  /// 52 ms a 1 s entre las dos peticiones.
  ///
  /// La fila del manager NO espera a esto: la actualiza el `emit` optimista
  /// con la respuesta de la propia mutación. Lo único que llega con la
  /// latencia del socket son los contadores de los chips.
  ///
  /// Un solo temporizador para todas las acciones: tres acciones seguidas no
  /// pueden dejar tres lecturas encoladas.
  void _pedirResincronizacion() {
    if (isClosed) return;
    _contadoresSucios = true;
    _reintentosDeRed = 0;
    _armarRed();
  }

  void _armarRed() {
    _redDeSeguridad?.cancel();
    _redDeSeguridad = Timer(_esperaDeResincronizacion, () {
      if (!isClosed) refetchSilently();
    });
  }

  Future<void> _fetch({bool silent = false}) async {
    final generacion = ++_generacion;
    final cubo = state.bucket;
    final res = await _repo.managerOrders(businessUuid, bucket: cubo);
    if (isClosed) return;

    // SE DESCARTA SÓLO SI YA HAY ALGO MEJOR EN PANTALLA, O SI ESTAS FILAS SON
    // DE OTRO CUBO. Que alguien haya lanzado después NO basta: esa otra lectura
    // puede fallar en silencio —un refetch de fondo no le cuenta errores al
    // manager— y entonces tirar ésta deja la pantalla con las filas viejas, sin
    // spinner y sin aviso, que es justo lo que esto existe para borrar.
    if (generacion <= _ultimaAplicada || cubo != state.bucket) return;

    res.when(
      success: (r) {
        // Desarma el ÉXITO, no el intento.
        //
        // La primera versión cancelaba la red ANTES del `await`, y entonces
        // una lectura que fallara dejaba los contadores viejos sin nadie que
        // reintentara: antes de esta pantalla había DOS lecturas por acción y
        // la segunda tapaba el fallo de la primera; ahora sólo hay una. Y no
        // hay rescate: el polling de 10 s **sólo corre con el socket caído**,
        // así que justo en el caso que esto optimiza —socket sano— los chips
        // se quedaban congelados hasta el siguiente evento de otra orden. Lo
        // encontró la revisión, con test.
        _ultimaAplicada = generacion;
        _contadoresSucios = false;
        _reintentosDeRed = 0;
        _redDeSeguridad?.cancel();
        _redDeSeguridad = null;

        emit(state.copyWith(
          loading: false,
          orders: r.orders,
          counts: r.counts,
          // Sin meta (respuesta vieja o test) el total es lo que llegó: así
          // `isTruncated` da false y la UI no inventa un aviso.
          total: r.meta?.total ?? r.orders.length,
          error: null,
        ));
      },
      failure: (e) {
        _logger.e(e);

        // Si había una resincronización pendiente, se vuelve a armar la red.
        // Con tope: un backend caído no puede convertirse en un GET cada dos
        // segundos para siempre.
        if (_contadoresSucios && _reintentosDeRed < _maxReintentosDeRed) {
          _reintentosDeRed++;
          _armarRed();
        }

        // Un refetch de FONDO que falla no se le cuenta al manager: en pantalla
        // siguen los últimos datos buenos y el próximo tick los corrige.
        // Emitirlo encolaba un snackbar por tick — con la pantalla apagada el
        // manager veía diez seguidos al encenderla (bug 2026-08-17). Los
        // errores que sí se muestran son los de `load`, `selectBucket` y las
        // acciones, que son los que el manager provocó.
        if (silent) return;
        // '' = error sin detalle (la UI muestra el genérico i18n). Nunca
        // e.toString(): resuelve DI por dentro y explota fuera de la app.
        emit(state.copyWith(loading: false, error: e.serverMessage ?? ''));
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
    return res.when(
      success: (r) {
        final updated = r.groupOrder;
        // La orden actualizada reemplaza a su versión en la lista en el acto.
        // Los contadores los mueve el cambio de bucket de esa orden, y de eso
        // se encarga el evento de la propia mutación (ver
        // `_pedirResincronizacion`).
        // La MISMA lista si la orden no está en ella (otro cubo, o el chip
        // filtrando): construir una nueva subiría la generación y mataría una
        // lectura buena en vuelo sin que hubiera cambiado nada de lo que se ve.
        final enLaLista = state.orders.any((o) => o.uuid == updated.uuid);
        // Si tocó una fila visible, la pantalla queda tan al día como una
        // lectura: las que salieron antes ya no tienen nada que aportar.
        if (enLaLista) _ultimaAplicada = _generacion;
        emit(state.copyWith(
          orders: enLaLista
              ? [for (final o in state.orders) o.uuid == updated.uuid ? updated : o]
              : state.orders,
          error: null,
        ));
        _pedirResincronizacion();
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
    _redDeSeguridad?.cancel();
    _redDeSeguridad = null;
    await _sub?.cancel();
    return super.close();
  }
}
