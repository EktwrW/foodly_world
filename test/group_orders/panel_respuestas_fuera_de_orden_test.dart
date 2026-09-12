import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:logger/logger.dart';

/// El panel del manager tenía la MISMA carrera que la orden grupal, y aquí se
/// ve en pantalla.
///
/// `_fetch` leía `state.bucket` al LANZAR y aplicaba la respuesta al volver,
/// sin comprobar si entre medias había pasado algo. Dos caminos reales:
///
///   1. El manager toca otro chip. `selectBucket` emite el cubo nuevo y vuelve
///      a leer; si la lectura del cubo ANTERIOR responde después, sus filas se
///      pintan con el chip nuevo ya marcado.
///   2. Dos lecturas del mismo cubo: el evento de Pusher y la red de seguridad
///      de 2 s. Si la segunda responde antes que la primera, la vieja pisa a la
///      nueva — y no hay rescate, el polling de 10 s sólo corre con el socket
///      caído.
///
/// La guarda es la misma que cerró la #86, con una diferencia que importa: aquí
/// el embudo no puede ser «toda emisión». `loading` y `error` son banderas y no
/// traen datos; si invalidaran, una acción que falla taparía la lectura que
/// venía con la verdad. Eso ya costó una regresión en la orden grupal.
void main() {
  late _RepoFalso repo;
  late ManagerOrdersCubit cubit;

  setUp(() {
    repo = _RepoFalso();
    cubit = ManagerOrdersCubit(
      repo: repo,
      logger: _mudo,
      businessUuid: 'b1',
      esperaDeResincronizacion: const Duration(milliseconds: 40),
    );
  });

  tearDown(() => cubit.close());

  group('el chip cambia: las filas del cubo anterior no se pintan', () {
    /// EL CASO VISIBLE. El manager toca «listos» y ve, durante un instante, las
    /// filas de «pendientes» debajo del chip de «listos».
    test('una lectura del cubo ANTERIOR que llega tarde se descarta', () async {
      final primera = cubit.selectBucket('pending');
      final segunda = cubit.selectBucket('ready');

      repo.responder(1, ['de-listos']); // el cubo nuevo responde primero
      await segunda;
      repo.responder(0, ['de-pendientes']); // el viejo llega ahora
      await primera;

      expect(cubit.state.orders.single.uuid, 'de-listos');
      expect(cubit.state.bucket, 'ready');
    });

    /// EL SÍNTOMA QUE DA NOMBRE A ESTO, y no necesita ninguna carrera: lo
    /// encontró la contra-revisión. `selectBucket` no vaciaba la lista, y el
    /// panel sólo pinta el spinner con `loading && orders.isEmpty`
    /// (`manager_orders_page.dart:196`). O sea que en CADA cambio de chip se
    /// veían las filas del cubo anterior bajo el chip nuevo, sin spinner y sin
    /// aviso, durante todo el viaje. La guarda de generación no lo tocaba: sólo
    /// evita que se apliquen TARDE, no la ventana.
    test('al cambiar de chip la lista se vacía y el spinner puede salir', () async {
      final carga = cubit.load();
      repo.responder(0, ['de-pendientes']);
      await carga;

      final chip = cubit.selectBucket('ready'); // sin responder: en pleno viaje

      expect(cubit.state.orders, isEmpty,
          reason: 'las filas del cubo anterior no son las de éste');
      expect(cubit.state.loading, isTrue);
      expect(cubit.state.total, 0, reason: 'el pie diría «N de M» del cubo viejo');

      repo.responder(1, ['de-listos']);
      await chip;
      expect(cubit.state.orders.single.uuid, 'de-listos');
    });

    /// El control: sin nada que la invalide, la lectura del chip SÍ se aplica.
    /// Sin esto, una guarda que descarte siempre pasaría el banco.
    test('pero el cambio de chip normal sí pinta sus filas', () async {
      final sel = cubit.selectBucket('ready');
      repo.responder(0, ['de-listos']);
      await sel;

      expect(cubit.state.orders.single.uuid, 'de-listos');
      expect(cubit.state.loading, isFalse);
    });

    /// Y el spinner no se puede quedar encendido. Quien releva a una lectura
    /// descartada puede ser un refetch SILENCIOSO, y ésos fallan sin emitir
    /// nada: sin apagarlo a mano, el panel se queda girando para siempre.
    test('una lectura descartada apaga el spinner que encendió', () async {
      final sel = cubit.selectBucket('ready');

      // La releva un refetch silencioso (el evento de Pusher).
      unawaited(cubit.refetchSilently());

      repo.responder(0, ['viejas']); // la del chip llega tarde
      await sel;
      repo.fallar(1); // y su relevo falla en silencio
      await _turno();

      expect(cubit.state.loading, isFalse, reason: 'el panel no puede quedarse girando');
    });
  });

  /// LO QUE ENCONTRÓ LA REVISIÓN, y es la trampa de descartar una lectura que
  /// el manager está esperando: quien la releva puede fallar EN SILENCIO (un
  /// refetch de fondo no le cuenta errores al manager, y es deliberado). Sin
  /// nadie que recoja el testigo, la pantalla se queda con las filas del cubo
  /// ANTERIOR, sin spinner y sin error — el estado exacto que esta PR existe
  /// para borrar, y peor que antes de tocar nada.
  group('descartar no puede dejar la pantalla peor', () {
    test('si el relevo falla en silencio, las filas buenas se aplican igual', () async {
      final carga = cubit.load();
      repo.responder(0, ['de-pendientes']);
      await carga;

      final chip = cubit.selectBucket('ready');
      unawaited(cubit.refetchSilently()); // el relevo, que se va a caer

      repo.responder(1, ['de-listos']); // las filas BUENAS del cubo actual
      await chip;
      repo.fallar(2); // y el relevo se cae sin decir nada
      await _turno();

      // Descartarlas por «alguien lanzó después» dejaba la pantalla con las
      // filas de PENDIENTES bajo el chip de LISTOS. Son del cubo que se está
      // mirando y nadie ha traído nada mejor: se aplican.
      expect(cubit.state.orders.single.uuid, 'de-listos');

      final antes = repo.lecturas;
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(repo.lecturas, antes, reason: 'y sin pagar una petición de rescate');
    });

    /// Y el control del control: pedir que alguien relea NO puede convertirse
    /// en una petición de más en el caso corriente. Si ya llegó algo más nuevo
    /// que la descartada, la pantalla está fresca y no hace falta nadie.
    test('pero si ya llegó algo más nuevo, no se pide nada', () async {
      final vieja = cubit.refetchSilently();
      final nueva = cubit.refetchSilently();

      repo.responder(1, ['nuevas']); // la nueva llega primero y se aplica
      await nueva;
      repo.responder(0, ['viejas']); // la vieja se descarta
      await vieja;

      final antes = repo.lecturas;
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(repo.lecturas, antes, reason: 'la pantalla ya está fresca');
    });

    /// El reintento del `LoadFailureView` va por `refetchSilently`, así que si
    /// se descarta no emite NADA: ni datos, ni spinner, ni error. El manager
    /// acaba de pulsar el botón y parece muerto.
    /// El reintento del `LoadFailureView` va por `refetchSilently`. Si se
    /// descartara no emitiría NADA —ni datos, ni spinner, ni error— y el botón
    /// parecería muerto con el manager mirándolo.
    test('un reintento no se pierde aunque algo lo releve', () async {
      final carga = cubit.load();
      repo.fallar(0);
      await carga;

      final reintento = cubit.refetchSilently();
      unawaited(cubit.refetchSilently()); // algo lo releva y se cae

      repo.responder(1, ['buenas']);
      await reintento;
      repo.fallar(2);
      await _turno();

      expect(cubit.state.orders.single.uuid, 'buenas');
      expect(cubit.state.error, isNull);
    });

    /// Y el spinner es de quien lo encendió: descartar la lectura del PRIMER
    /// chip no puede apagar el que encendió el segundo, que sigue en vuelo.
    /// Con la lista vacía, apagarlo pinta «No hay órdenes» — un dato falso.
    test('descartar una lectura no apaga el spinner de otra', () async {
      final primera = cubit.selectBucket('pending');
      final segunda = cubit.selectBucket('ready');

      repo.responder(0, ['viejas']); // la primera se descarta
      await primera;

      expect(cubit.state.loading, isTrue,
          reason: 'la segunda sigue en vuelo: su spinner no es de la primera');
      repo.responder(1, ['nuevas']);
      await segunda;
      expect(cubit.state.loading, isFalse);
    });
  });

  group('dos lecturas del mismo cubo', () {
    test('la respuesta vieja no pisa a la nueva', () async {
      final vieja = cubit.refetchSilently();
      final nueva = cubit.refetchSilently();

      repo.responder(1, ['nuevas']);
      await nueva;
      repo.responder(0, ['viejas']);
      await vieja;

      expect(cubit.state.orders.single.uuid, 'nuevas');
    });

    /// La otra mitad de la guarda: el bump AL LANZAR. Aquí las respuestas
    /// llegan EN ORDEN, así que si el contador sólo subiera al aplicar, ganaría
    /// la primera en volver en vez de la última lanzada.
    test('en orden, gana la ÚLTIMA lanzada y no la primera en volver', () async {
      final vieja = cubit.refetchSilently();
      final nueva = cubit.refetchSilently();

      repo.responder(0, ['viejas']);
      await vieja;
      repo.responder(1, ['nuevas']);
      await nueva;

      expect(cubit.state.orders.single.uuid, 'nuevas');
    });
  });

  group('qué invalida una lectura y qué no', () {
    /// Una acción con ÉXITO trae la orden actualizada del servidor, así que una
    /// lectura lanzada ANTES devolvería la fila sin el cambio y la revertiría.
    test('una acción con ÉXITO invalida la lectura anterior', () async {
      final carga = cubit.load();
      repo.responder(0, ['a']);
      await carga;

      final lectura = cubit.refetchSilently(); // sale antes de la acción

      final accion = cubit.advanceFulfillment('a', 'ready');
      repo.responderAccion(uuid: 'a', mesa: 'ya-lista');
      await accion;

      repo.responder(1, ['a']); // llega tarde, con la fila de antes
      await lectura;

      expect(cubit.state.orders.single.tableLabel, 'ya-lista',
          reason: 'una lectura anterior a la acción no puede revertir la fila');
    });

    /// Una acción sobre una orden que NO está en la lista (otro cubo, o el chip
    /// filtrando) no cambia nada de lo que se ve, así que no puede invalidar
    /// una lectura buena en vuelo. `copyWith` construía una lista nueva SIEMPRE.
    test('una acción que no toca la lista no invalida nada', () async {
      final carga = cubit.load();
      repo.responder(0, ['a']);
      await carga;

      final lectura = cubit.refetchSilently();

      final accion = cubit.advanceFulfillment('no-esta', 'ready');
      repo.responderAccion(uuid: 'no-esta', mesa: 'otra');
      await accion;

      repo.responder(1, ['a', 'b']);
      await lectura;

      expect(cubit.state.orders.length, 2);
    });

    /// LA LECCIÓN DE LA #86, y aquí valía igual: un error NO trae foto del
    /// servidor. Si invalidara, una acción que falla taparía la lectura que
    /// venía con la verdad — y no hay segundo evento que la repare.
    test('una acción que FALLA no invalida nada', () async {
      final carga = cubit.load();
      repo.responder(0, ['a']);
      await carga;

      final lectura = cubit.refetchSilently();

      final accion = cubit.advanceFulfillment('a', 'ready');
      repo.fallarAccion();
      await accion;

      repo.responder(1, ['b']); // la lectura trae el estado real
      await lectura;

      expect(cubit.state.orders.single.uuid, 'b');
    });

    /// LA PREMISA DE ESTE TEST NO OCURRÍA, y lo cazó la revisión: yo lanzaba la
    /// lectura que falla ANTES que otra, así que la guarda la descartaba por el
    /// bump de lanzamiento y nunca llegaba a la rama de fallo. El test pasaba
    /// sin ejercitar nada. La aserción del `error` es lo que lo impide ahora.
    ///
    /// (Que una lectura en vuelo sobreviva a un `error` sólo puede pasar con
    /// las ACCIONES, que no suben el contador al lanzarse. Eso es el test de
    /// arriba; para las lecturas es imposible por construcción.)
    test('una lectura que falla pinta el error y la siguiente lo repara', () async {
      final visible = cubit.selectBucket('ready');
      repo.fallar(0);
      await visible;

      expect(cubit.state.error, isNotNull,
          reason: 'sin llegar a la rama de fallo, este test no mide nada');
      expect(cubit.state.loading, isFalse);

      final siguiente = cubit.refetchSilently();
      repo.responder(1, ['buenas']);
      await siguiente;

      expect(cubit.state.orders.single.uuid, 'buenas');
    });
  });

  group('lo que sólo se ve contando peticiones', () {
    /// El fake ignoraba el cubo, así que ningún test comprobaba que la petición
    /// saliera con el chip correcto: la historia entera estaba simulada con
    /// etiquetas. Lo señaló la revisión.
    test('cada chip pide SU cubo', () async {
      final a = cubit.selectBucket('pending');
      repo.responder(0, ['x']);
      await a;
      final b = cubit.selectBucket('ready');
      repo.responder(1, ['y']);
      await b;

      expect(repo.cubosPedidos, ['pending', 'ready'],
          reason: 'cada chip pide el suyo, no el que estuviera antes');
    });

    /// Una lectura que falla SIN nada pendiente de resincronizar no puede
    /// re-armar la red: serían hasta tres GET de más cada dos segundos contra
    /// un backend que ya está fallando.
    test('una lectura fallida sin resync pendiente no re-arma la red', () async {
      final carga = cubit.load();
      repo.fallar(0);
      await carga;

      final antes = repo.lecturas;
      await Future<void>.delayed(const Duration(milliseconds: 140));
      expect(repo.lecturas, antes, reason: 'no había nada que resincronizar');
    });
  });

  group('la red de seguridad', () {
    /// Una respuesta descartada no puede desarmar la red: sus contadores son
    /// tan viejos como sus filas. Si la desarmara, los chips se quedarían con
    /// números de antes de la acción y nadie volvería a pedirlos.
    test('una lectura descartada NO desarma la red', () async {
      final carga = cubit.load();
      repo.responder(0, ['a']);
      await carga;

      final lectura = cubit.refetchSilently(); // se queda en vuelo

      final accion = cubit.advanceFulfillment('a', 'ready'); // arma la red
      repo.responderAccion(uuid: 'a', mesa: 'ya-lista');
      await accion;

      final antes = repo.lecturas;
      repo.responder(1, ['a']); // descartada
      await lectura;

      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(repo.lecturas, antes + 1, reason: 'la red tenía que saltar igual');
    });

    /// EL TOPE DE REINTENTOS TIENE QUE AGUANTAR CON LECTURAS CRUZADAS, y la
    /// versión anterior de esta guarda lo rompía: pedía una resincronización al
    /// descartar, y eso reseteaba `_reintentosDeRed`, así que cada descarte
    /// devolvía la red a cero. Medido por la contra-revisión: 22 peticiones
    /// contra las 4 de referencia. El comentario del propio cubit dice que «un
    /// backend caído no puede convertirse en un GET cada dos segundos para
    /// siempre» — y podía.
    test('un backend caído no dispara una tormenta de peticiones', () async {
      final carga = cubit.load();
      repo.fallar(0);
      await carga;

      final accion = cubit.advanceFulfillment('a', 'ready'); // arma la red
      repo.responderAccion(uuid: 'a', mesa: 'x');
      await accion;

      // Todo lo que salga a partir de aquí se cae, y encima cruzado.
      for (var i = 0; i < 12; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 25));
        unawaited(cubit.refetchSilently());
        for (var j = repo.respondidas; j < repo.lecturas; j++) {
          repo.fallar(j);
        }
      }
      await Future<void>.delayed(const Duration(milliseconds: 120));

      expect(repo.lecturas, lessThanOrEqualTo(18),
          reason: 'el tope de 3 reintentos tiene que seguir acotando');
    });

    /// El control: una lectura que SÍ se aplica sí la desarma. Sin esto, «no
    /// desarmar nunca» pasaría el test de arriba.
    test('pero una lectura que se aplica sí la desarma', () async {
      final carga = cubit.load();
      repo.responder(0, ['a']);
      await carga;

      final accion = cubit.advanceFulfillment('a', 'ready');
      repo.responderAccion(uuid: 'a', mesa: 'ya-lista');
      await accion;

      final lectura = cubit.refetchSilently();
      repo.responder(1, ['a']);
      await lectura;

      final antes = repo.lecturas;
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(repo.lecturas, antes, reason: 'ya se resincronizó: la red sobra');
    });
  });

  /// Emitir sobre un cubit cerrado lanza `StateError`, y una lectura en vuelo
  /// sobrevive a que el manager salga de la pantalla.
  test('cerrar el panel con una lectura en vuelo no revienta', () async {
    final lectura = cubit.refetchSilently();
    await cubit.close();

    repo.responder(0, ['tarde']);
    await expectLater(lectura, completes);
  });
}

Future<void> _turno() => Future<void>.delayed(Duration.zero);

final _mudo = Logger(level: Level.off);

/// Repo con respuestas a mano: la cola es cronológica y `responder` elige en
/// qué orden VUELVEN, que es lo único que permite montar la carrera de forma
/// determinista. Mismo patrón que `respuestas_fuera_de_orden_test.dart`.
class _RepoFalso implements GroupOrderRepo {
  final List<Completer<ApiResult<ManagerOrdersResponseDM>>> _lecturas = [];
  final List<Completer<ApiResult<GroupOrderResponseDM>>> _acciones = [];

  int get lecturas => _lecturas.length;

  /// Con qué cubo salió cada petición, en orden. Sin esto el fake ignoraba el
  /// argumento y toda la historia del «cubo anterior» quedaba simulada con
  /// etiquetas: ningún test comprobaba qué se pidió de verdad.
  final List<String?> cubosPedidos = [];

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) {
    cubosPedidos.add(bucket);
    final c = Completer<ApiResult<ManagerOrdersResponseDM>>();
    _lecturas.add(c);
    return c.future;
  }

  /// [uuids] etiqueta las filas para poder ver CUÁL respuesta se aplicó.
  void responder(int indice, List<String> uuids) =>
      _lecturas[indice].complete(ApiResult.success(ManagerOrdersResponseDM(
        orders: [for (final u in uuids) GroupOrderDM(uuid: u, businessUuid: 'b1')],
      )));

  /// Hasta dónde se ha respondido ya, para poder ir contestando una ráfaga sin
  /// llevar la cuenta desde fuera.
  int respondidas = 0;

  void fallar(int indice) {
    if (indice >= respondidas) respondidas = indice + 1;
    _lecturas[indice].complete(ApiResult.failure(
      AppRequestException(error: StateError('sin red'), stackTrace: StackTrace.current),
    ));
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String orderUuid, {
    required String status,
  }) {
    final c = Completer<ApiResult<GroupOrderResponseDM>>();
    _acciones.add(c);
    return c.future;
  }

  void responderAccion({required String uuid, required String mesa}) =>
      _acciones.removeAt(0).complete(ApiResult.success(GroupOrderResponseDM(
        groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1', tableLabel: mesa),
      )));

  void fallarAccion() => _acciones.removeAt(0).complete(ApiResult.failure(
        AppRequestException(error: StateError('409'), stackTrace: StackTrace.current),
      ));

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
