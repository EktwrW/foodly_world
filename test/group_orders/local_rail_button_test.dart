import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// El segundo botón del pie: el método local del comensal.
///
/// EL PROBLEMA (e2e 2026-08-14). Debajo del CTA había un "Otros métodos de
/// pago" permanente. Dos defectos, y el segundo es el que obliga a este
/// archivo:
///
///  · "Otros" no tenía referente. El comensal aún no había visto NINGÚN
///    método —la hoja ni se había abierto— y ya se le ofrecían alternativas.
///  · Y no llevaba a otros: llevaba a LO MISMO. La página hosteada ofrecía
///    tarjeta y carteras igual que el PaymentSheet. Dos botones, un cobro.
///
/// LA DECISIÓN. El backend restringe esa página al método del país de quien
/// paga, y el botón pasa a nombrarlo. Con eso el segundo botón deja de
/// competir con el primero: es el único camino de algo que dentro de la app no
/// existe (la hoja nativa no pinta ni MB WAY ni Bizum, ni con las capabilities
/// activas — comprobado con capturas).
///
/// Lo que fijan estos tests es la CONDICIÓN de aparición, que es donde está el
/// riesgo: pintarlo de más manda a alguien a una página con un método que no
/// tiene; pintarlo de menos deja a un portugués sin la única forma de pagar
/// como paga en su país.
/// Los botones outlined que hay pintados ahora mismo. El método local es el
/// único que usa ese estilo en el pie, así que su presencia es la señal —y no
/// depende de qué texto lleve dentro.
List<CustomNeumorphicButton> _outlined(WidgetTester tester) => tester
    .widgetList<CustomNeumorphicButton>(find.byType(CustomNeumorphicButton))
    .where((b) => b.type == CustomNeumorphicBtnType.outlined)
    .toList();

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Widget host(Widget child) => MaterialApp(home: Scaffold(body: child));

  GroupOrderDM orden({
    GroupOrderStatus estado = GroupOrderStatus.locked,
    GroupPaymentMode modo = GroupPaymentMode.perRound,
    List<GroupOrderItemDM> items = const [],
    DateTime? cuentaPedidaEn,
  }) => GroupOrderDM(
    uuid: 'o1',
    status: estado,
    paymentMode: modo,
    items: items,
    billRequestedAt: cuentaPedidaEn,
    totalAmount: 20,
    participants: const [
      GroupOrderParticipantDM(uuid: 'p1', displayName: 'Yo', amountDue: 20),
    ],
  );

  final elBotonMbWay = find.text('Pagar con MB WAY');
  final elBotonBizum = find.text('Pagar con Bizum');
  final laNotaDeStripe = find.text('Pagos procesados por Stripe Inc.');

  Future<void> pintar(
    WidgetTester tester, {
    required GroupOrderDM order,
    HostedRail rail = HostedRail.mbWay,
    double myShare = 20,
    VoidCallback? onPayHosted,
    bool isBusy = false,
  }) => tester.pumpWidget(
    host(
      GroupOrderTotalsFooter(
        order: order,
        myShare: myShare,
        onPay: () {},
        onPayHosted: onPayHosted ?? () {},
        hostedRail: rail,
        isBusy: isBusy,
      ),
    ),
  );

  group('cada comensal ve SU método', () {
    testWidgets('portugués → MB WAY, y no Bizum', (tester) async {
      // `pintar` monta el rail portugués por defecto: así los tests de "NO
      // aparece" de más abajo fallan por su motivo y no porque no hubiera rail.
      await pintar(tester, order: orden());

      expect(elBotonMbWay, findsOneWidget);
      expect(elBotonBizum, findsNothing);
    });

    testWidgets('español → Bizum, y no MB WAY', (tester) async {
      await pintar(tester, order: orden(), rail: HostedRail.bizum);

      expect(elBotonBizum, findsOneWidget);
      expect(elBotonMbWay, findsNothing);
    });

    /// CADA MÉTODO CON SU LOGO. El de Bizum es un asset propio (no está en el
    /// paquete de marcas), y hasta el 2026-08-15 el botón llevaba un
    /// `Icons.smartphone_rounded` genérico.
    ///
    /// Se afirma la RUTA del asset porque es lo único de este cambio que puede
    /// romperse sin que nada se queje: si alguien renombra o mueve el png,
    /// `Image.asset` cae en su `errorBuilder`, el botón se sigue pintando —con
    /// el icono viejo— y no hay error, ni log, ni test rojo. Reconocer la marca
    /// de un vistazo es lo único que justifica sacar al comensal de la app;
    /// perderla en silencio es perder el argumento del botón.
    testWidgets('el de Bizum lleva su logo, no un icono genérico', (tester) async {
      await pintar(tester, order: orden(), rail: HostedRail.bizum);

      final logo = tester.widget<Image>(
        find.descendant(
          of: find.byType(CustomNeumorphicButton),
          matching: find.byType(Image),
        ),
      );

      expect((logo.image as AssetImage).assetName, 'assets/images/bizum_icon.png');
      expect(find.byIcon(Icons.smartphone_rounded), findsNothing);
    });

    testWidgets('nunca los dos a la vez', (tester) async {
      // La página hosteada se restringe a UN método: dos botones prometerían
      // dos destinos que no existen.
      await pintar(tester, order: orden(), rail: HostedRail.bizum);

      expect(find.textContaining('Pagar con'), findsOneWidget);
    });

    testWidgets('sin método local → solo el CTA principal', (tester) async {
      await pintar(tester, order: orden(), rail: HostedRail.none);

      expect(elBotonMbWay, findsNothing);
      expect(elBotonBizum, findsNothing);
      expect(find.textContaining('Pagar la orden'), findsOneWidget);

      // Y NINGÚN botón outlined, no solo ninguno con esas etiquetas.
      //
      // Sin esta línea el test era ciego a un fallo real: quitando el guard
      // de `hostedRail`, el switch de la etiqueta cae en `HostedRail.none =>
      // ''` y se pinta un botón outlined VACÍO. Buscar por texto no lo ve —
      // lo destapó una mutación, no una revisión.
      expect(_outlined(tester), isEmpty);
    });
  });

  group('sigue la misma regla que el CTA principal', () {
    testWidgets('sin saldo a mi nombre → NO aparece', (tester) async {
      await pintar(tester, order: orden(), myShare: 0);

      expect(elBotonMbWay, findsNothing);
    });

    testWidgets('orden que todavía no admite pagos → NO aparece', (tester) async {
      await pintar(tester, order: orden(estado: GroupOrderStatus.confirmed));

      expect(elBotonMbWay, findsNothing);
    });

    testWidgets('orden expirada → NO aparece (el pie ofrece la salida)', (tester) async {
      await pintar(tester, order: orden(estado: GroupOrderStatus.expired));

      expect(elBotonMbWay, findsNothing);
      expect(find.textContaining('Pagar la orden'), findsNothing);
    });

    testWidgets('operación en curso → NO aparece', (tester) async {
      // Mientras hay un cobro en vuelo el CTA se apaga para evitar dobles
      // pagos; un segundo botón vivo sería justo el agujero que eso tapa.
      await pintar(tester, order: orden(), isBusy: true);

      expect(elBotonMbWay, findsNothing);
    });

    testWidgets('sin callback (el caller no lo permite) → NO aparece', (tester) async {
      await tester.pumpWidget(
        host(
          GroupOrderTotalsFooter(
            order: orden(),
            myShare: 20,
            onPay: () {},
            hostedRail: HostedRail.mbWay,
          ),
        ),
      );

      expect(elBotonMbWay, findsNothing);
    });
  });

  group('cuenta abierta', () {
    final enviado = DateTime(2026, 8, 14, 20);
    final entregado = DateTime(2026, 8, 14, 20, 30);

    GroupOrderItemDM plato({DateTime? sentAt, DateTime? deliveredAt}) => GroupOrderItemDM(
      uuid: 'i1',
      name: 'Bacalhau',
      unitPricePreview: 20,
      sentAt: sentAt,
      batchNo: sentAt == null ? null : 1,
      deliveredAt: deliveredAt,
    );

    testWidgets('con la cuenta PEDIDA y todo servido → aparece', (tester) async {
      // Es el momento de pagar de una mesa: el mismo bloque de cobro que el
      // prepago, así que el botón tiene que llegar hasta acá.
      await pintar(
        tester,
        order: orden(
          modo: GroupPaymentMode.openTab,
          items: [plato(sentAt: enviado, deliveredAt: entregado)],
          cuentaPedidaEn: DateTime(2026, 8, 14, 21),
        ),
        rail: HostedRail.bizum,
      );

      expect(elBotonBizum, findsOneWidget);
    });

    testWidgets('sin pedir la cuenta todavía → NO aparece', (tester) async {
      // Acá manda el CTA mutante de cuenta abierta ("Enviar orden" / "Pagar la
      // cuenta"): el pago ni siquiera está habilitado en el backend.
      await pintar(
        tester,
        order: orden(
          estado: GroupOrderStatus.confirmed,
          modo: GroupPaymentMode.openTab,
          items: [plato(sentAt: enviado)],
        ),
      );

      expect(elBotonMbWay, findsNothing);
    });
  });

  group('quién cobra, dicho una vez', () {
    testWidgets('la nota de Stripe acompaña a los botones de pago', (tester) async {
      // No es adorno legal: en el extracto estos cargos salen a nombre de
      // Stripe, y en MB WAY eso es forzoso. Un cargo que nadie reconoce es una
      // disputa.
      await pintar(tester, order: orden());

      expect(laNotaDeStripe, findsOneWidget);
    });

    testWidgets('también con un solo CTA, sin método local', (tester) async {
      await pintar(tester, order: orden(), rail: HostedRail.none);

      expect(laNotaDeStripe, findsOneWidget);
    });

    testWidgets('pero NO cuando no hay nada que cobrar', (tester) async {
      // Sin saldo a mi nombre el bloque de pago SÍ se pinta —con el CTA
      // apagado y "Sin saldo pendiente"—, así que es aquí donde la condición
      // de la nota decide de verdad.
      //
      // La versión anterior de este test usaba una orden expirada y era
      // VACUA: una orden terminal ni siquiera entra en el bloque de pago, así
      // que pasaba por la rama que la envuelve y no por la condición que dice
      // probar. Lo destapó una mutación.
      await pintar(tester, order: orden(), myShare: 0, rail: HostedRail.none);

      expect(find.text('Sin saldo pendiente'), findsOneWidget, reason: 'el bloque de pago sí se pintó');
      expect(laNotaDeStripe, findsNothing);
    });

    testWidgets('ni sobre una orden terminal, que no pasa por el bloque de pago', (tester) async {
      await pintar(tester, order: orden(estado: GroupOrderStatus.expired));

      expect(laNotaDeStripe, findsNothing);
    });
  });

  group('qué hace al tocarlo', () {
    testWidgets('dispara el callback del checkout hosteado, no el del CTA', (tester) async {
      var hosteado = 0;
      var nativo = 0;

      await tester.pumpWidget(
        host(
          GroupOrderTotalsFooter(
            order: orden(),
            myShare: 20,
            onPay: () => nativo++,
            onPayHosted: () => hosteado++,
            hostedRail: HostedRail.bizum,
          ),
        ),
      );

      await tester.tap(elBotonBizum);
      await tester.pumpAndSettle(); // drena la animación del NeumorphicButton

      expect(hosteado, 1);
      expect(nativo, 0, reason: 'los dos botones no pueden compartir acción');
    });
  });

  group('respiro contra la barra de gestos', () {
    testWidgets('el pie aparta su contenido del borde inferior del sistema', (tester) async {
      // Feedback 2026-08-14: los CTAs quedaban pegados al footer nativo de
      // Android, o directamente por debajo. El pie ya no vive dentro de un
      // SafeArea —eso dejaba una franja del Scaffold bajo el blanco— sino que
      // suma él mismo el inset del sistema a su padding.
      const insetDelSistema = 48.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            viewPadding: EdgeInsets.only(bottom: insetDelSistema),
            padding: EdgeInsets.only(bottom: insetDelSistema),
          ),
          child: host(
            GroupOrderTotalsFooter(
              order: orden(),
              myShare: 20,
              onPay: () {},
              onPayHosted: () {},
              hostedRail: HostedRail.mbWay,
            ),
          ),
        ),
      );

      final contenedor = tester.widget<Container>(
        find
            .descendant(of: find.byType(GroupOrderTotalsFooter), matching: find.byType(Container))
            .first,
      );
      final padding = contenedor.padding as EdgeInsets;

      expect(
        padding.bottom,
        greaterThanOrEqualTo(insetDelSistema),
        reason: 'el inset del sistema tiene que sumarse, no sustituir al padding propio',
      );
      expect(padding.bottom, 18 + insetDelSistema);
    });

    testWidgets('sin inset del sistema conserva su padding de diseño', (tester) async {
      await pintar(tester, order: orden());

      final contenedor = tester.widget<Container>(
        find
            .descendant(of: find.byType(GroupOrderTotalsFooter), matching: find.byType(Container))
            .first,
      );

      expect((contenedor.padding as EdgeInsets).bottom, 18);
    });
  });
}
