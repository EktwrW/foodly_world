import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show di, LoadingWidgetFoodlyLogo;
import 'package:foodly_world/core/services/pending_group_join.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/join_by_link_page.dart';
import 'package:go_router/go_router.dart';

/// La pantalla del App Link `foodly.solutions/join/{code}` (F3a), pintada.
///
/// POR QUÉ EXISTE ESTE ARCHIVO. La página creció a golpe de bugs e2e —spinner
/// clavado sin salida, "código inválido" genérico tapando lo que decía el
/// backend, aterrizaje en la orden en vez del menú— y no tenía un solo test:
/// cada arreglo se comprobaba a mano en un teléfono. Todos esos arreglos viven
/// en `_run()`, que se lanza SIN await desde `initState`, así que ningún test
/// de cubit ni de rutas los alcanza: hay que montar el widget.
///
/// El caso que más pide cobertura es el `try/catch` alrededor de
/// `joinWithCode`. Es defensivo y silencioso: si alguien lo borra por parecer
/// código muerto, nada se pone rojo y el síntoma que vuelve es el peor de la
/// pantalla —el logo girando para siempre, sin texto, sin botón y sin back,
/// porque la ruta se abre desde fuera de la app y no hay nada debajo.

// ─────────────────────────────────────────────────────────────────────
//  Dobles
// ─────────────────────────────────────────────────────────────────────

/// De `AuthSessionService` la página solo mira tres cosas. El resto cae en
/// `noSuchMethod` y REVIENTA a propósito: si mañana `_run` empieza a depender
/// de otra pieza de la sesión, preferimos enterarnos por un test rojo y no por
/// un null silencioso que hace pasar el caso equivocado.
class _AuthFalso implements AuthSessionService {
  bool logueado = false;

  @override
  bool hasPendingSessionRestore = false;

  @override
  bool get isLoggedIn => logueado;

  @override
  String get uuid => 'u1';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _CubitFalso implements ActiveGroupOrderCubit {
  /// Qué hace `joinWithCode`: lanzar, o devolver este resultado.
  Object? excepcion;
  bool resultado = false;

  GroupOrderDM? orden;
  int llamadasAJoin = 0;
  String? codigoRecibido;

  /// Qué había estacionado en [PendingGroupJoin] EN EL MOMENTO del join. Es
  /// el dato que importa del `consume()`: mirarlo al final no distingue
  /// "se consumió antes de unirse" de "se consumió después".
  String? estacionadoAlUnirse;

  @override
  String? lastJoinError;

  @override
  GroupOrderDM? get state => orden;

  @override
  Future<bool> joinWithCode(String code) async {
    llamadasAJoin++;
    codigoRecibido = code;
    estacionadoAlUnirse = PendingGroupJoin.code;
    if (excepcion case final e?) throw e;
    return resultado;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  late _AuthFalso auth;
  late _CubitFalso cubit;

  setUp(() {
    auth = _AuthFalso();
    cubit = _CubitFalso();
    PendingGroupJoin.code = null;

    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();
    if (di.isRegistered<ActiveGroupOrderCubit>()) di.unregister<ActiveGroupOrderCubit>();
    di
      ..registerSingleton<AuthSessionService>(auth)
      ..registerSingleton<ActiveGroupOrderCubit>(cubit);
  });

  tearDown(() {
    PendingGroupJoin.code = null;
    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();
    if (di.isRegistered<ActiveGroupOrderCubit>()) di.unregister<ActiveGroupOrderCubit>();
  });

  // ───────────────────────────────────────────────────────────────────
  //  Arnés
  // ───────────────────────────────────────────────────────────────────

  /// Router mínimo con los cuatro destinos que `_run` y el botón de escape
  /// pueden elegir. Se usan los `name` y `path` REALES de [AppRoutes]: si
  /// alguien renombra una ruta, el `goNamed` de producción y este arnés se
  /// rompen juntos, que es lo que se quiere.
  GoRouter armarRouter(String code) => GoRouter(
        initialLocation: '/join/$code',
        routes: [
          GoRoute(
            path: AppRoutes.joinGroupOrder.path,
            name: AppRoutes.joinGroupOrder.name,
            builder: (_, state) =>
                JoinByLinkPage(code: state.pathParameters[AppRoutes.routeIdParam] ?? ''),
          ),
          GoRoute(
            path: AppRoutes.login.path,
            name: AppRoutes.login.name,
            builder: (_, __) => const Text('LOGIN'),
          ),
          GoRoute(
            path: AppRoutes.visitMenu.path,
            name: AppRoutes.visitMenu.name,
            builder: (_, __) => const Text('MENU'),
          ),
          GoRoute(
            path: AppRoutes.groupOrder.path,
            name: AppRoutes.groupOrder.name,
            builder: (_, __) => const Text('ORDEN'),
          ),
          GoRoute(
            path: '/main/:id/foodly-main-page',
            name: AppRoutes.foodlyMainPage.name,
            builder: (_, __) => const Text('HOME'),
          ),
        ],
      );

  /// Monta la página y deja correr `_run` hasta donde llegue sin esperas.
  ///
  /// NO se usa `pumpAndSettle`: `LoadingWidgetFoodlyLogo` reinicia su
  /// controlador al completarse, así que mientras el spinner esté en pantalla
  /// no hay reposo posible y `pumpAndSettle` agotaría su timeout.
  Future<GoRouter> montar(WidgetTester tester, {String code = 'abc123'}) async {
    final router = armarRouter(code);
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();
    return router;
  }

  /// Deja terminar la transición de ruta para que la página saliente —y su
  /// spinner— se desmonten antes de que acabe el test.
  Future<void> asentarNavegacion(WidgetTester tester) async =>
      tester.pump(const Duration(milliseconds: 500));

  String ubicacion(GoRouter r) => r.routerDelegate.currentConfiguration.uri.toString();

  final spinner = find.byType(LoadingWidgetFoodlyLogo);

  // ───────────────────────────────────────────────────────────────────
  //  La regresión del try/catch
  // ───────────────────────────────────────────────────────────────────

  /// EL TEST QUE JUSTIFICA EL `try/catch`.
  ///
  /// `_run()` se lanza sin await desde `initState`. Sin el catch, cualquier
  /// throw en `joinWithCode` saltaba el `setState` final: `_failed` seguía en
  /// false y `build` devolvía el spinner PARA SIEMPRE. Como a esta ruta se
  /// entra desde un enlace externo, no hay pantalla debajo a la que volver:
  /// la única salida era matar la app.
  ///
  /// Que el repo hoy no lance no vuelve al catch código muerto — lo alcanzan
  /// un `emit` sobre un cubit cerrado, un fallo del realtime que engancha
  /// `onChange`, o cualquier cosa que se agregue al camino del join.
  testWidgets('si joinWithCode LANZA, la pantalla muestra el error y no el spinner',
      (tester) async {
    auth.logueado = true;
    cubit.excepcion = StateError('caída de red simulada');

    await montar(tester);
    await tester.pump();

    expect(spinner, findsNothing,
        reason: 'sin el try/catch el logo se queda girando y no hay forma de salir');
    expect(find.text(S.current.groupOrderJoinFailed), findsOneWidget);
    expect(find.byType(CustomNeumorphicButton), findsOneWidget,
        reason: 'el estado de error existe para ofrecer una salida');
  });

  testWidgets('un throw no se traga la excepción en silencio ni deja la página a medias',
      (tester) async {
    auth.logueado = true;
    cubit.excepcion = StateError('caída de red simulada');
    // Un detalle viejo en el cubit no debe filtrarse al cartel: lo que se sabe
    // de un throw es NADA, y el mensaje genérico es la única verdad decible.
    cubit.lastJoinError = 'la orden ya no admite participantes';

    await montar(tester);
    await tester.pump();

    expect(find.text(S.current.groupOrderJoinFailed), findsOneWidget);
    expect(find.text('la orden ya no admite participantes'), findsNothing);
  });

  // ───────────────────────────────────────────────────────────────────
  //  Fallo declarado por el backend
  // ───────────────────────────────────────────────────────────────────

  /// Arreglo e2e r5: el cartel decía "código inválido" cuando el backend ya
  /// había explicado el motivo. Un comensal al que le dicen que su código no
  /// vale vuelve a pedirlo y a escanearlo; uno al que le dicen que la orden se
  /// cerró, no.
  testWidgets('un failure con motivo del backend muestra ESE motivo, no el genérico',
      (tester) async {
    auth.logueado = true;
    cubit
      ..resultado = false
      ..lastJoinError = 'la orden ya no admite participantes';

    await montar(tester);
    await tester.pump();

    expect(find.text('la orden ya no admite participantes'), findsOneWidget);
    expect(find.text(S.current.groupOrderJoinFailed), findsNothing);
    expect(spinner, findsNothing);
  });

  testWidgets('un failure SIN motivo cae al texto genérico', (tester) async {
    auth.logueado = true;
    cubit.resultado = false;

    await montar(tester);
    await tester.pump();

    expect(find.text(S.current.groupOrderJoinFailed), findsOneWidget);
  });

  /// `ok == true` con estado nulo es la otra mitad de la condición de éxito.
  /// Sin ella la página navegaría con `cubit.state!` y reventaría.
  testWidgets('ok pero sin orden en el cubit también es error, no navegación', (tester) async {
    auth.logueado = true;
    cubit
      ..resultado = true
      ..orden = null;

    await montar(tester);
    await tester.pump();

    expect(find.text(S.current.groupOrderJoinFailed), findsOneWidget);
  });

  // ───────────────────────────────────────────────────────────────────
  //  Éxito: dónde se aterriza
  // ───────────────────────────────────────────────────────────────────

  /// Decisión e2e r4: tras unirse se cae en el MENÚ del negocio para poder
  /// pedir de una. OJO con el uuid: `/visit-menu/:id` lleva el del MENÚ, que
  /// el backend expone como `business_menu_uuid`. Pasarle el del NEGOCIO
  /// abriría un menú que no existe.
  testWidgets('con businessMenuUuid se aterriza en el MENÚ, con ese uuid', (tester) async {
    auth.logueado = true;
    cubit
      ..resultado = true
      ..orden = const GroupOrderDM(
        uuid: 'orden-1',
        businessUuid: 'negocio-1',
        businessMenuUuid: 'menu-9',
      );

    final router = await montar(tester);
    await tester.pump();
    await asentarNavegacion(tester);

    // `?b=`: el uuid del negocio viaja en la ruta para pedirlo en paralelo con el menú.
    expect(ubicacion(router), '/visit-menu/menu-9?b=negocio-1');
    expect(find.text('MENU'), findsOneWidget);
    // La página entrega el código TAL CUAL vino en el enlace: normalizar es
    // trabajo del cubit (`code.trim().toUpperCase()`), y hacerlo dos veces
    // esconde de qué lado está la responsabilidad.
    expect(cubit.codigoRecibido, 'abc123');
  });

  /// El campo es opcional en el DM y en la respuesta del backend. Sin
  /// fallback, una orden sin menú publicado dejaba al invitado en el error
  /// —o peor, en una ruta con `:id` vacío— pese a haberse unido de verdad.
  testWidgets('sin businessMenuUuid se cae a la página de la orden', (tester) async {
    auth.logueado = true;
    cubit
      ..resultado = true
      ..orden = const GroupOrderDM(uuid: 'orden-1', businessUuid: 'negocio-1');

    final router = await montar(tester);
    await tester.pump();
    await asentarNavegacion(tester);

    expect(ubicacion(router), '/group-order/orden-1');
    expect(find.text('ORDEN'), findsOneWidget);
  });

  /// Un `business_menu_uuid` en blanco es lo mismo que no tenerlo: la ruta
  /// `/visit-menu/` no matchea y el invitado terminaría en el 404.
  testWidgets('un businessMenuUuid vacío cuenta como ausente', (tester) async {
    auth.logueado = true;
    cubit
      ..resultado = true
      ..orden = const GroupOrderDM(uuid: 'orden-1', businessMenuUuid: '');

    final router = await montar(tester);
    await tester.pump();
    await asentarNavegacion(tester);

    expect(ubicacion(router), '/group-order/orden-1');
  });

  // ───────────────────────────────────────────────────────────────────
  //  Sesión: estacionar el código, o consumirlo
  // ───────────────────────────────────────────────────────────────────

  /// La restauración termina SIN sesión: el código se estaciona y se sale al
  /// login, que lo canjeará después.
  ///
  /// Se monta con la restauración en curso porque es el único camino por el
  /// que esta página se construye deslogueada: el redirect global de
  /// `AppRouter` manda al login cualquier ruta no pública sin sesión ni
  /// restauración pendiente, y `/join/{code}` no es pública ni navegable por
  /// un invitado. Ver el DEFECTO de más abajo para el otro camino.
  testWidgets('sin sesión el código queda estacionado (en mayúsculas) y se va al login',
      (tester) async {
    auth
      ..hasPendingSessionRestore = true
      ..logueado = false;

    final router = await montar(tester, code: 'xk9m2p');
    await tester.pump(const Duration(milliseconds: 200));

    auth.hasPendingSessionRestore = false; // la restauración volvió vacía
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();
    await asentarNavegacion(tester);

    expect(ubicacion(router), '/login');
    // El código viaja en minúsculas en el enlace y el backend lo espera en
    // mayúsculas; normalizarlo acá evita un 404 tras el login.
    expect(PendingGroupJoin.code, 'XK9M2P');
    expect(cubit.llamadasAJoin, 0, reason: 'sin sesión no hay a quién unir');
  });

  /// DEFECTO ENCONTRADO POR ESTOS TESTS — SE DOCUMENTA, NO SE ARREGLA.
  ///
  /// Cuando `hasPendingSessionRestore` ya es false al montar, el `for` de
  /// `_run` no llega a esperar ni una vez: el cuerpo de una `async` corre
  /// SÍNCRONO hasta el primer `await`, así que `context.goNamed(login)` se
  /// ejecuta dentro del `initState`, es decir en pleno build. El framework
  /// lanza "setState() or markNeedsBuild() called during build" sobre el
  /// `Router`. La navegación termina ocurriendo, pero por un camino que en
  /// debug ensucia la consola y en release depende de que el `Router` se
  /// recupere en el frame siguiente.
  ///
  /// Hoy es una carrera estrecha, no el caso común: el redirect global
  /// intercepta antes a quien no tiene sesión ni restauración pendiente. Se
  /// llega acá si la restauración se resuelve SIN sesión en el hueco entre
  /// ese redirect (que hace `await` sobre LAST_PATH) y el build de la página.
  ///
  /// El arreglo natural sería un `await Future.microtask(...)` —o mover `_run`
  /// a un post-frame callback— antes de la primera navegación. Queda fuera de
  /// este trabajo: acá no se toca producción. Este test fija el estado ACTUAL;
  /// el día que se arregle, se pondrá rojo y habrá que venir a borrarlo.
  ///
  /// El andamiaje de recogida no es capricho: el fallo sale por DOS caminos
  /// distintos y `takeException` solo ve uno. Primero `FlutterError.onError`
  /// (la aserción del framework), y después la MISMA excepción sube por el
  /// `Future` de `_run()`, que nadie espera: llega a la zona como error no
  /// capturado y aborta el caso de test antes de poder preguntar nada. De ahí
  /// el `runZonedGuarded`. Que el error escape por ahí es, en sí, la otra
  /// mitad del defecto.
  testWidgets('DEFECTO: sin restauración pendiente, la salida al login navega durante el build',
      (tester) async {
    auth
      ..hasPendingSessionRestore = false
      ..logueado = false;

    final errores = <Object>[];
    final manejadorReal = FlutterError.onError;
    addTearDown(() => FlutterError.onError = manejadorReal);
    FlutterError.onError = (d) => errores.add(d.exception);

    late GoRouter router;
    await runZonedGuarded(() async {
      router = await montar(tester, code: 'zq4r7t');
    }, (e, _) => errores.add(e));
    FlutterError.onError = manejadorReal;

    expect(errores, isNotEmpty,
        reason: 'si esto deja de lanzar es porque se arregló la navegación en initState');
    expect(errores.map((e) => e.toString()), everyElement(contains('called during build')));

    await tester.pump();
    await asentarNavegacion(tester);

    // Lo que el usuario ve sí termina siendo lo correcto.
    expect(ubicacion(router), '/login');
    expect(PendingGroupJoin.code, 'ZQ4R7T');
  });

  /// EL LOOP. Con sesión, esta página ES la dueña del join, así que limpia el
  /// código estacionado ANTES de unirse. Si sobreviviera, el redirect global
  /// (`PendingGroupJoin.divertPath`) desviaría a `/join/{code}` la navegación
  /// siguiente —la que lleva al menú— y el invitado quedaría rebotando entre
  /// esta página y el menú sin llegar a pedir nada.
  testWidgets('con sesión el código estacionado se consume ANTES del join', (tester) async {
    auth.logueado = true;
    PendingGroupJoin.code = 'ABC123';
    cubit
      ..resultado = true
      ..orden = const GroupOrderDM(uuid: 'orden-1', businessMenuUuid: 'menu-9');

    await montar(tester);
    await tester.pump();
    await asentarNavegacion(tester);

    expect(cubit.estacionadoAlUnirse, isNull,
        reason: 'con el código todavía puesto, el redirect global vuelve a desviar acá');
    expect(PendingGroupJoin.code, isNull);
  });

  // ───────────────────────────────────────────────────────────────────
  //  Arranque en frío
  // ───────────────────────────────────────────────────────────────────

  /// El enlace puede abrir la app desde cero: los tokens cacheados tardan unos
  /// instantes en restaurarse y durante ese hueco `isLoggedIn` es false. Sin
  /// la espera, un usuario CON sesión terminaba en el login.
  ///
  /// Nada duerme de verdad acá: `tester.pump(duración)` adelanta el reloj
  /// falso del test y dispara los `Future.delayed` de la espera.
  testWidgets('la espera del cold start aguanta y luego sigue el flujo, no va al login',
      (tester) async {
    auth
      ..hasPendingSessionRestore = true
      ..logueado = false;
    cubit
      ..resultado = true
      ..orden = const GroupOrderDM(uuid: 'orden-1', businessMenuUuid: 'menu-9');

    final router = await montar(tester);

    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 200));
    expect(spinner, findsOneWidget, reason: 'mientras restaura, la página espera');
    expect(cubit.llamadasAJoin, 0);
    expect(ubicacion(router), '/join/abc123');

    // Llega la sesión restaurada.
    auth
      ..hasPendingSessionRestore = false
      ..logueado = true;

    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();
    await asentarNavegacion(tester);

    expect(cubit.llamadasAJoin, 1);
    expect(ubicacion(router), '/visit-menu/menu-9',
        reason: 'la sesión llegó a tiempo: mandarlo al login sería pedirle que entre de nuevo');
  });

  /// La espera es ACOTADA (20 × 200 ms). Si la restauración nunca termina la
  /// página no puede quedarse esperando: se va al login, que es la salida
  /// honesta, y deja el código estacionado para canjearlo después.
  testWidgets('si la restauración nunca termina, a los 4 s se va al login', (tester) async {
    auth
      ..hasPendingSessionRestore = true
      ..logueado = false;

    final router = await montar(tester);

    await tester.pump(const Duration(seconds: 3));
    expect(ubicacion(router), '/join/abc123', reason: 'todavía dentro de la ventana de espera');

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await asentarNavegacion(tester);

    expect(ubicacion(router), '/login');
    expect(PendingGroupJoin.code, 'ABC123', reason: 'el código sobrevive para el post-login');
  });

  // ───────────────────────────────────────────────────────────────────
  //  La salida del estado de error
  // ───────────────────────────────────────────────────────────────────

  /// Arreglo e2e r5: el botón va DIRECTO a la main page. Mandarlo a '/'
  /// disparaba la restauración de LAST_PATH, que en storage viejo podía ser el
  /// propio `/join` — el error se repintaba y el botón parecía muerto.
  testWidgets('el botón de escape saca de la página de error', (tester) async {
    auth.logueado = true;
    cubit.resultado = false;

    final router = await montar(tester);
    await tester.pump();

    await tester.tap(find.byType(CustomNeumorphicButton));
    await tester.pump();
    await asentarNavegacion(tester);

    expect(ubicacion(router), '/main/u1/foodly-main-page');
  });
}
