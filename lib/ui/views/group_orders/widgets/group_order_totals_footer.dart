import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Brand, Brands;

/// Pie de la orden grupal: progreso de pago ("3 de 5 pagado" + barra), total,
/// la parte del usuario actual y el CTA "Pagar mi parte". Estilo Foodly.
///
/// [myShare] es lo que debe pagar el usuario actual; [onPay] dispara el flujo
/// de pago (PaymentSheet de Stripe). El botón se desactiva si no hay nada que
/// pagar o la orden no admite pagos.
class GroupOrderTotalsFooter extends StatelessWidget {
  final GroupOrderDM order;
  final double myShare;
  final VoidCallback? onPay;

  /// Cobro por el Checkout hosteado de Stripe — la única vía capaz de ofrecer
  /// MB WAY y Bizum. null en quien no puede accionarlo.
  final VoidCallback? onPayHosted;

  /// Método local de ESTE comensal (ver [HostedRail]). [HostedRail.none] deja
  /// el pie con un único CTA, que es el caso de la mayoría del mundo.
  final HostedRail hostedRail;

  /// Cierre del pedido (lock) por el host. Solo se ofrece mientras la orden
  /// está OPEN; null para participantes que no son host.
  final VoidCallback? onLock;

  /// F4b (cuenta abierta): "Enviar orden" — la tanda actual va a cocina sin
  /// pago. null para quien no es host.
  final VoidCallback? onSend;

  /// F4b: "Pagar la cuenta" — pide la cuenta y abre el checkout. null para
  /// quien no es host.
  final VoidCallback? onRequestBill;

  /// F4b: "Pedir más" — vuelve al menú del negocio (cualquier comensal).
  final VoidCallback? onOrderMore;

  /// F4b: "Pagar en caja" — avisa al negocio; el dinero se entrega en el
  /// mostrador y Foodly no cobra comisión. null para quien no es host.
  final VoidCallback? onPayAtRegister;

  /// F4b: deshace el aviso de pago en caja. null para quien no es host.
  final VoidCallback? onCancelCashPayment;

  /// "Yo invito" global (F2b §A.2): pagar TODO lo pendiente de la orden.
  /// null => sin botón (el caller decide cuándo tiene sentido mostrarlo).
  final VoidCallback? onPayAll;

  /// Operación en curso (loading del cubit o PaymentSheet abierto): los CTAs
  /// se deshabilitan para evitar dobles taps / pagos duplicados.
  final bool isBusy;

  /// Salida de una orden TERMINAL (expirada, cancelada, cerrada).
  ///
  /// De una orden terminada no se sale sola, y hasta el 2026-08-14 tampoco a
  /// mano: el comensal quedaba encerrado mirando un botón apagado que decía
  /// "Sin saldo pendiente" sobre una cena que no había pagado.
  final VoidCallback? onExit;

  const GroupOrderTotalsFooter({
    super.key,
    required this.order,
    required this.myShare,
    this.onPay,
    this.onPayHosted,
    this.hostedRail = HostedRail.none,
    this.onLock,
    this.onSend,
    this.onRequestBill,
    this.onOrderMore,
    this.onPayAtRegister,
    this.onCancelCashPayment,
    this.onPayAll,
    this.isBusy = false,
    this.onExit,
  });

  bool get _canPay => order.isPayable && myShare > 0 && onPay != null && !isBusy;

  /// El segundo botón (el método local del comensal) se rige por la MISMA
  /// regla que el primero, con su propio callback. Va deliberadamente atado a
  /// `_canPay` y no a una condición propia: si no se puede pagar, no se puede
  /// pagar por ninguna vía, y dos botones con criterios distintos habrían
  /// terminado divergiendo.
  bool get _canPayLocalRail => _canPay && onPayHosted != null && hostedRail != HostedRail.none;

  /// Qué decirle al comensal cuando NO puede pagar.
  ///
  /// Ver [GroupOrderPayBlock]: cada motivo tiene su frase, y "sin saldo
  /// pendiente" vuelve a ser cierta porque ya solo se usa cuando lo es.
  String? _motivoDelBloqueo(GroupOrderPayBlock bloqueo) => switch (bloqueo) {
        GroupOrderPayBlock.expired => S.current.groupOrderExpiredNotice,
        GroupOrderPayBlock.cancelled => S.current.groupOrderCancelledNotice,
        GroupOrderPayBlock.completed => S.current.groupOrderCompletedNotice,
        GroupOrderPayBlock.confirming => S.current.groupOrderConfirmingPayment,
        _ => null,
      };

  /// Explica la tarifa de procesamiento: es de la plataforma de pagos, no de
  /// Foodly ni del restaurante. Dialog Foodly (shell compartido).
  void _showFeeInfo(BuildContext context) {
    showFoodlyInfo(
      context,
      icon: Icons.info_outline_rounded,
      title: S.current.groupOrderServiceFeeTitle,
      message: S.current.groupOrderServiceFeeExplain(
        formatMoney(order.payerFixedFee, order.currency),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paid = order.paidCount;
    final total = order.participants.length;
    final isOpen = order.isOpen;
    // Modo SOLO (e2e ronda 3): la barra de progreso y el lenguaje de "partes"
    // existen para coordinar a VARIOS pagadores; con uno duplican el CTA.
    final solo = total <= 1;

    // El pie llega hasta el borde FÍSICO de la pantalla y es su padding el
    // que aparta el contenido de la barra de gestos, en vez de un SafeArea que
    // dejaría una franja del color del Scaffold por debajo del blanco. Así la
    // superficie se ve continua y los botones nunca quedan pisados (feedback
    // 2026-08-14: "muy pegados al footer nativo, o por debajo").
    //
    // `viewPadding` y no `padding`: `padding` se pone a cero cuando el teclado
    // tapa la zona, y eso encogería el pie justo mientras alguien teclea.
    final respiroInferior = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(18, 16, 18, 18 + respiroInferior),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, -2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Progreso de pago — solo tras el lock y con VARIOS pagadores.
          if (!isOpen && !solo) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.current.groupOrderPaidProgress(paid, total), style: FoodlyTextStyles.captionPurpleBold),
                Text(formatMoney(order.totalPaid, order.currency), style: FoodlyTextStyles.caption),
              ],
            ),
            const SizedBox(height: 6),
            // Progreso ANIMADO (refinamiento pre-F4a): cuando alguien paga,
            // la barra desliza suave hasta el nuevo valor en vez de saltar.
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: order.paymentProgress),
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOutCubic,
                builder: (_, value, __) => LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  backgroundColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
                  valueColor: const AlwaysStoppedAnimation(FoodlyThemes.tertiaryFoodly),
                ),
              ),
            ),
            const SizedBox(height: 14),
          ],
          // Ventana de gracia (F2b §A.2): el deadline venció pero aún se puede
          // completar el pago — típicamente cubriendo lo que falta.
          if (order.isInGracePeriod) ...[
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16, color: FoodlyThemes.tertiaryFoodly),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    S.current.groupOrderGraceNotice(
                      formatMoney(order.totalRemaining, order.currency),
                    ),
                    style: FoodlyTextStyles.caption,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          // Total de la orden (subtotal mientras está abierta; congelado al cerrar).
          _AmountRow(
            label: S.current.groupOrderTotal,
            value: formatMoney(isOpen ? order.subtotal : order.totalAmount, order.currency),
            style: FoodlyTextStyles.label,
          ),
          // Tu parte — solo relevante tras el lock.
          if (!isOpen) ...[
            const SizedBox(height: 4),
            _AmountRow(
              label: S.current.groupOrderYourShare,
              value: formatMoney(myShare, order.currency),
              style: FoodlyTextStyles.labelPurpleBold,
              valueStyle: FoodlyTextStyles.itemPricePurpleBold,
            ),
          ],
          const SizedBox(height: 14),
          // F4b (cuenta abierta): CTA mutante — enviar tandas y pagar al
          // final. Mientras la cuenta no esté pedida manda esta rama; con la
          // cuenta pedida (billed) cae al bloque de pago de siempre.
          if (order.isOpenTab && order.openTabCtaState != OpenTabCtaState.billed)
            _OpenTabCta(
              order: order,
              isBusy: isBusy,
              onSend: onSend,
              onRequestBill: onRequestBill,
              onOrderMore: onOrderMore,
              onPayAtRegister: onPayAtRegister,
              onCancelCashPayment: onCancelCashPayment,
            )
          else if (isOpen)
            // Host: cierra el pedido (congela precios y habilita el pago).
            CustomNeumorphicButton(
              text: S.current.groupOrderLockCta,
              disabled: onLock == null || order.items.isEmpty || isBusy,
              margin: EdgeInsets.zero,
              onPressed: onLock,
            )
          else if (order.isTerminal) ...[
            // La orden TERMINÓ (expirada, cancelada, cerrada). Antes esto caía
            // en el bloque de pago de abajo y pintaba un botón apagado con
            // "Sin saldo pendiente" — falso en dos de los tres casos — y sin
            // ninguna salida: el comensal se quedaba encerrado en la pantalla
            // (e2e 2026-08-14, una orden de prepago que expiró mientras estaba
            // abierta).
            //
            // Acá se dice QUÉ pasó y se ofrece la puerta.
            Text(
              _motivoDelBloqueo(
                    order.payBlockFor(myParticipantUuid: null, myShare: myShare),
                  ) ??
                  S.current.groupOrderCompletedNotice,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.caption,
            ),
            if (onExit != null) ...[
              const SizedBox(height: 12),
              CustomNeumorphicButton(
                text: S.current.groupOrderBackToMenu,
                disabled: false,
                margin: EdgeInsets.zero,
                onPressed: onExit,
              ),
            ],
          ] else ...[
            // Los CTAs muestran el TOTAL real a cobrar (parte + tarifa fija
            // del comensal) — nunca un monto menor al del PaymentSheet.
            CustomNeumorphicButton(
              text: _canPay
                  ? (solo
                      ? S.current.groupOrderPayFullOrder(formatMoney(myShare + order.payerFixedFee, order.currency))
                      : S.current.groupOrderPayMyShare(formatMoney(myShare + order.payerFixedFee, order.currency)))
                  : S.current.groupOrderNoBalanceDue,
              disabled: !_canPay,
              margin: EdgeInsets.zero,
              onPressed: onPay,
            ),
            // Un pago MÍO en vuelo: lo sella el webhook, no la app. Sin esta
            // línea el comensal veía "Sin saldo pendiente" mientras su cobro
            // se confirmaba, y no sabía si había pagado o no.
            if (!_canPay && order.hasProcessingPayment) ...[
              const SizedBox(height: 6),
              Text(
                S.current.groupOrderConfirmingPayment,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.caption,
              ),
            ],
            // El método local del comensal — MB WAY o Bizum, nunca los dos.
            //
            // Aquí vivía "Otros métodos de pago", un TextButton permanente que
            // llevaba a la misma página hosteada. Tenía dos problemas y el
            // segundo es el grave:
            //
            //  · "Otros" no tenía referente. El comensal todavía no había
            //    visto NINGÚN método —la hoja ni se había abierto— y ya se le
            //    ofrecían alternativas a algo que no conocía.
            //  · Y no llevaba a "otros": llevaba a LO MISMO. La página
            //    dinámica ofrecía tarjeta y carteras, igual que el
            //    PaymentSheet. Dos botones para el mismo cobro.
            //
            // Ahora el backend restringe esa página al método del país de
            // quien paga, así que el botón puede nombrarlo y ponerle su logo
            // en vez de esconderlo tras una palabra vaga — y decir la verdad:
            // es el único camino, porque la hoja nativa no lo pinta (e2e
            // 2026-08-14, con capturas, aun teniendo la capability activa).
            //
            // Outlined y no un tercer estilo: es el secundario de Foodly, el
            // mismo de "Entrar como invitado" en la portada.
            if (_canPayLocalRail) ...[
              const SizedBox(height: 8),
              CustomNeumorphicButton(
                text: switch (hostedRail) {
                  HostedRail.mbWay => S.current.groupOrderPayWithMbWay,
                  HostedRail.bizum => S.current.groupOrderPayWithBizum,
                  HostedRail.none => '',
                },
                // Cada método con SU logo (2026-08-15).
                //
                // El de MB WAY viene del paquete de marcas; el de Bizum no está
                // ahí, así que es un asset propio. Hasta hoy Bizum llevaba un
                // `Icons.smartphone_rounded` genérico, y eso le costaba lo
                // único que justifica sacar al comensal de la app: que
                // reconozca de un vistazo el método que usa todos los días. La
                // marca ES el argumento del botón.
                //
                // `Image.asset` y no `Brand(...)`: `assets/images/` ya está
                // declarado como directorio en el pubspec, así que no hace
                // falta tocar nada más para que entre en el bundle.
                leading: switch (hostedRail) {
                  HostedRail.mbWay => Brand(Brands.mb_way, size: 20),
                  HostedRail.bizum => Image.asset(
                      'assets/images/bizum_icon.png',
                      height: 20,
                      // Si el asset faltara en el bundle, `Image.asset` pinta
                      // un cuadro roto dentro del botón de pagar. El icono
                      // viejo es un final más digno que ese.
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.smartphone_rounded,
                        size: 18,
                        color: FoodlyThemes.primaryFoodly,
                      ),
                    ),
                  HostedRail.none => const SizedBox.shrink(),
                },
                type: CustomNeumorphicBtnType.outlined,
                disabled: false,
                margin: EdgeInsets.zero,
                onPressed: onPayHosted,
              ),
            ],
            // "Pagar todo lo pendiente · €X" (F2b §A.2) — disponible para todos.
            if (onPayAll != null && order.totalRemaining > 0) ...[
              const SizedBox(height: 8),
              CustomNeumorphicButton(
                text: S.current.groupOrderPayAllRemaining(
                  formatMoney(order.totalRemaining + order.payerFixedFee, order.currency),
                ),
                disabled: isBusy,
                margin: EdgeInsets.zero,
                onPressed: onPayAll,
              ),
            ],
            // Quién cobra, dicho una vez y en su sitio.
            //
            // No es adorno legal: en el extracto del banco estos cargos
            // aparecen como Stripe y no como Foodly, y en MB WAY eso es
            // FORZOSO —Stripe ignora el `statement_descriptor` de ese método y
            // pone su propio nombre—. Un cargo que nadie reconoce es una
            // disputa, y las de MB WAY se responden en 7 días. Vale más una
            // línea gris ahora que un chargeback después.
            //
            // Va debajo de los botones y no arriba: informa, no decide.
            if (_canPay || _canPayLocalRail || (onPayAll != null && order.totalRemaining > 0)) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Brand(Brands.stripe, size: 13),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      S.current.groupOrderPoweredByStripe,
                      style: FoodlyTextStyles.caption.copyWith(fontSize: 10.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
            // Transparencia del fee: nota discreta + detalle al tocar ⓘ.
            if (order.payerFixedFee > 0 && (_canPay || (onPayAll != null && order.totalRemaining > 0))) ...[
              const SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _showFeeInfo(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline_rounded, size: 14, color: FoodlyThemes.secondaryFoodly),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          S.current.groupOrderServiceFeeNotice(
                            formatMoney(order.payerFixedFee, order.currency),
                          ),
                          style: FoodlyTextStyles.caption,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

/// F4b — CTA mutante de cuenta abierta (maquetas A1-A4 aprobadas):
/// "Enviar orden" con ítems pendientes; pago BLOQUEADO mientras la cocina
/// no entregue; "Pagar la cuenta · €total" cuando está todo servido.
/// Solo el host acciona (los demás ven el estado, sin botón habilitado).
class _OpenTabCta extends StatelessWidget {
  final GroupOrderDM order;
  final bool isBusy;
  final VoidCallback? onSend;
  final VoidCallback? onRequestBill;
  final VoidCallback? onOrderMore;
  final VoidCallback? onPayAtRegister;
  final VoidCallback? onCancelCashPayment;

  const _OpenTabCta({
    required this.order,
    required this.isBusy,
    this.onSend,
    this.onRequestBill,
    this.onOrderMore,
    this.onPayAtRegister,
    this.onCancelCashPayment,
  });

  @override
  Widget build(BuildContext context) {
    final state = order.openTabCtaState;

    // F4b: ya avisaron que pagan en el mostrador. Acá NO se ofrece pagar —
    // el dinero se entrega en la caja. Solo se confirma que el negocio está
    // al tanto, y se deja volver atrás por si cambian de idea.
    if (state == OpenTabCtaState.cash) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.storefront_rounded, size: 18, color: Color(0xFF0B8A40)),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  S.current.groupOrderCashRequestedCta,
                  style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFF0B8A40)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            S.current.groupOrderCashRequestedHint,
            style: FoodlyTextStyles.caption.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
          ),
          if (onCancelCashPayment != null) ...[
            const SizedBox(height: 4),
            TextButton(
              onPressed: isBusy ? null : onCancelCashPayment,
              child: Text(
                S.current.groupOrderCashRequestUndo,
                style: FoodlyTextStyles.captionPurpleBold,
              ),
            ),
          ],
        ],
      );
    }

    final isSend = state == OpenTabCtaState.send;
    final isPay = state == OpenTabCtaState.pay;

    final label = switch (state) {
      OpenTabCtaState.send => S.current.groupOrderSendCta,
      OpenTabCtaState.waiting => S.current.groupOrderPayBillCta(formatMoney(order.sentTotal, order.currency)),
      _ => S.current.groupOrderPayBillCta(formatMoney(order.sentTotal, order.currency)),
    };

    final hint = switch (state) {
      OpenTabCtaState.send => S.current.groupOrderSendHint,
      OpenTabCtaState.waiting => S.current.groupOrderPayBlockedHint,
      _ => S.current.groupOrderPayBillHint,
    };

    // Habilitado solo en los estados accionables por el host: enviar (con
    // ítems pendientes) o pagar (todo entregado). "waiting" nunca.
    final action = isSend ? onSend : (isPay ? onRequestBill : null);
    final enabled = !isBusy && action != null && (isSend ? order.pendingItems.isNotEmpty : isPay);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomNeumorphicButton(
          text: label,
          disabled: !enabled,
          margin: EdgeInsets.zero,
          onPressed: enabled ? action : null,
        ),
        const SizedBox(height: 6),
        Text(
          hint,
          style: FoodlyTextStyles.caption.copyWith(fontSize: 11),
          textAlign: TextAlign.center,
        ),
        // F4b: alternativa al pago por la app, solo cuando la cuenta está
        // lista para cobrarse. Antes de eso no tiene sentido: todavía falta
        // servir algo, y el backend lo rechaza igual.
        if (isPay && onPayAtRegister != null) ...[
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: isBusy ? null : onPayAtRegister,
            icon: const Icon(Icons.storefront_outlined, size: 16, color: FoodlyThemes.primaryFoodly),
            label: Text(S.current.groupOrderPayAtRegister, style: FoodlyTextStyles.captionPurpleBold),
          ),
        ],
        // e2e F4b: sin esto, tras enviar la tanda NADA le decía al comensal
        // que podía seguir pidiendo — tenía que intuirlo.
        if (state != OpenTabCtaState.send && onOrderMore != null) ...[
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: onOrderMore,
            icon: const Icon(Icons.add_rounded, size: 16, color: FoodlyThemes.primaryFoodly),
            label: Text(S.current.groupOrderOrderMore, style: FoodlyTextStyles.captionPurpleBold),
          ),
        ],
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final TextStyle? valueStyle;

  const _AmountRow({required this.label, required this.value, this.style, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: valueStyle ?? style),
      ],
    );
  }
}
