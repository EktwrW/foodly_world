import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/active_group_order_chip.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_floating_chip_host.dart';

/// Cubit mínimo para alimentar el host en tests (sin repo/red/DI).
class _FakeOrderSource extends Cubit<GroupOrderDM?> {
  _FakeOrderSource([super.initial]);
  void set(GroupOrderDM? order) => emit(order);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));
  tearDown(() {
    GroupOrderChipPositionStore.reset();
    GroupOrderPageVisibility.reset();
  });

  const openOrder = GroupOrderDM(uuid: 'o1', subtotal: 12.5);

  Widget host({
    required _FakeOrderSource source,
    required ValueNotifier<String> location,
    void Function(GroupOrderDM)? onOpenOrder,
    Widget? child,
  }) {
    return MaterialApp(
      home: GroupOrderFloatingChipHost(
        ordersSource: source,
        routeListenable: location,
        locationOf: () => location.value,
        onOpenOrder: onOpenOrder ?? (_) {},
        child: child ?? const Scaffold(body: SizedBox.expand()),
      ),
    );
  }

  group('GroupOrderFloatingChipHost', () {
    testWidgets('con orden viva y ruta de contenido, el chip se ve', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
      expect(find.textContaining('€12.50'), findsOneWidget);
    });

    testWidgets('sin orden no hay chip; aparece al nacer la orden', (tester) async {
      final source = _FakeOrderSource();
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip
      expect(find.byType(ActiveGroupOrderChip), findsNothing);

      source.set(openOrder);
      await tester.pumpAndSettle(); // entrega del stream + entrada del chip
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
    });

    testWidgets('navegar a la orden lo oculta; volver al menú lo re-muestra '
        '(escucha cambios de ruta, incl. pops)', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);

      location.value = '/group-order/o1';
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsNothing);

      location.value = '/visit-menu/m1';
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
    });

    testWidgets('arranca dockeado a la IZQUIERDA', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      final topLeft = tester.getTopLeft(find.byType(ActiveGroupOrderChip));
      expect(topLeft.dx, GroupOrderChipLogic.edgeMargin);
    });

    testWidgets('es un Draggable NATIVO: durante el gesto el feedback sigue '
        'al dedo y el hijo queda como fantasma', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      // El chip está montado dentro de un Draggable de verdad.
      expect(
        find.byWidgetPredicate((w) => w is Draggable<GroupOrderDM>),
        findsOneWidget,
      );

      final start = tester.getCenter(find.byType(ActiveGroupOrderChip));
      final gesture = await tester.startGesture(start);
      await gesture.moveBy(const Offset(120, -60));
      await tester.pump();

      // Mid-drag: DOS instancias del visual — el fantasma (childWhenDragging,
      // atenuado) y el feedback en el overlay siguiendo el dedo.
      expect(find.byType(ActiveGroupOrderChip), findsNWidgets(2));
      final ghosts = tester.widgetList<Opacity>(
        find.ancestor(of: find.byType(ActiveGroupOrderChip), matching: find.byType(Opacity)),
      );
      expect(ghosts.any((o) => o.opacity < 1), isTrue, reason: 'debe haber fantasma atenuado');

      await gesture.up();
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
    });

    testWidgets('drop a la derecha: clampea, imanta al borde DERECHO y '
        'persiste la posición', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      final before = tester.getTopLeft(find.byType(ActiveGroupOrderChip));
      await tester.drag(find.byType(ActiveGroupOrderChip), const Offset(500, -100));
      await tester.pump();

      final after = tester.getTopLeft(find.byType(ActiveGroupOrderChip));
      final screen = tester.getSize(find.byType(MaterialApp));
      final chipSize = tester.getSize(find.byType(ActiveGroupOrderChip));
      expect(after.dx, screen.width - GroupOrderChipLogic.edgeMargin - chipSize.width);
      expect(after.dy, lessThan(before.dy));
      expect(GroupOrderChipPositionStore.offset.value, isNotNull);
    });

    testWidgets('drop en la mitad izquierda: vuelve a imantar al borde '
        'IZQUIERDO conservando la altura', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      // Un poco a la derecha y arriba, sin cruzar el centro de pantalla.
      await tester.drag(find.byType(ActiveGroupOrderChip), const Offset(60, -150));
      await tester.pump();

      final after = tester.getTopLeft(find.byType(ActiveGroupOrderChip));
      expect(after.dx, GroupOrderChipLogic.edgeMargin);
    });

    testWidgets('drop fuera de pantalla: el clamp lo mantiene visible', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip

      await tester.drag(find.byType(ActiveGroupOrderChip), const Offset(-999, -9999));
      await tester.pump();

      final after = tester.getTopLeft(find.byType(ActiveGroupOrderChip));
      expect(after.dx, GroupOrderChipLogic.edgeMargin);
      expect(after.dy, GroupOrderChipLogic.edgeMargin);
    });

    testWidgets('la posición arrastrada sobrevive a ocultarse y re-mostrarse '
        '(persiste en el store de sesión)', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip
      await tester.drag(find.byType(ActiveGroupOrderChip), const Offset(500, -100));
      await tester.pump();
      final dragged = tester.getTopLeft(find.byType(ActiveGroupOrderChip));

      location.value = '/group-order/o1';
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsNothing);

      location.value = '/visit-menu/m1';
      await tester.pumpAndSettle(); // el chip re-monta: re-corre la entrada
      expect(tester.getTopLeft(find.byType(ActiveGroupOrderChip)), dragged);
    });

    testWidgets('tap abre la orden (callback de navegación)', (tester) async {
      GroupOrderDM? opened;
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1');

      await tester.pumpWidget(host(
        source: source,
        location: location,
        onOpenOrder: (o) => opened = o,
      ));

      await tester.tap(find.byType(ActiveGroupOrderChip));
      expect(opened?.uuid, 'o1');
    });

    testWidgets('oculto en login aunque haya orden viva', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/login');

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip
      expect(find.byType(ActiveGroupOrderChip), findsNothing);
    });

    testWidgets('e2e r6: abrir la PÁGINA de la orden oculta el chip aunque '
        'la URI no cambie; cerrarla lo re-muestra', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1'); // URI quieta a propósito

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle(); // asienta la animación de entrada del chip
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);

      // La notificación de visibilidad viaja en un microtask (ver _bump), así
      // que hacen falta DOS pumps: el primero deja correr el microtask y
      // agenda el frame, el segundo lo dibuja. Con uno solo el estado ya
      // cambió pero el árbol todavía muestra el chip.
      GroupOrderPageVisibility.markOpened(); // initState de GroupOrderPage
      await tester.pump();
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsNothing);

      GroupOrderPageVisibility.markClosed(); // dispose de GroupOrderPage
      await tester.pump();
      await tester.pump();
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
    });

    // e2e 2026-08-06 — el test de arriba marcaba la visibilidad desde el
    // CUERPO del test, o sea fuera de la fase de build. La app real la marca
    // en `initState`, es decir DURANTE el build del árbol y con el host ya
    // construido en ese mismo frame: la notificación no lo hacía repintar y,
    // estando dentro de la orden, nada más volvía a construirlo, así que el
    // chip quedaba clavado encima. Este test reproduce ESA secuencia.
    //
    // Importa especialmente porque el chip y el FAB del menú abren la orden
    // con `pushNamed`: ahí la URI no cambia y el marcador es el ÚNICO
    // mecanismo que puede ocultarlo.
    testWidgets('la página que marca su visibilidad en initState (durante el '
        'build) igual oculta el chip', (tester) async {
      final source = _FakeOrderSource(openOrder);
      final location = ValueNotifier('/visit-menu/m1'); // URI quieta (pushNamed)

      await tester.pumpWidget(host(source: source, location: location));
      await tester.pumpAndSettle();
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);

      // Monta la "página": su initState corre DURANTE este build.
      await tester.pumpWidget(host(
        source: source,
        location: location,
        child: const _PageMarkingVisibilityInInitState(),
      ));
      await tester.pump(); // deja correr el post-frame

      expect(
        find.byType(ActiveGroupOrderChip),
        findsNothing,
        reason: 'El chip no puede quedar dibujado encima de la propia orden.',
      );

      // Y al desmontarla vuelve, sin quedarse pegado en el estado anterior.
      await tester.pumpWidget(host(source: source, location: location));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.byType(ActiveGroupOrderChip), findsOneWidget);
    });
  });
}

/// Réplica fiel de lo que hace GroupOrderPage: marca visibilidad en
/// `initState`/`dispose`, no desde el cuerpo del test.
class _PageMarkingVisibilityInInitState extends StatefulWidget {
  const _PageMarkingVisibilityInInitState();

  @override
  State<_PageMarkingVisibilityInInitState> createState() => _PageMarkingState();
}

class _PageMarkingState extends State<_PageMarkingVisibilityInInitState> {
  @override
  void initState() {
    super.initState();
    GroupOrderPageVisibility.markOpened();
  }

  @override
  void dispose() {
    GroupOrderPageVisibility.markClosed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: SizedBox.expand());
}
