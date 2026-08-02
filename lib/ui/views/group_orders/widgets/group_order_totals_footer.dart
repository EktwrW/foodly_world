import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';

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

  /// Cierre del pedido (lock) por el host. Solo se ofrece mientras la orden
  /// está OPEN; null para participantes que no son host.
  final VoidCallback? onLock;

  /// "Yo invito" global (F2b §A.2): pagar TODO lo pendiente de la orden.
  /// null => sin botón (el caller decide cuándo tiene sentido mostrarlo).
  final VoidCallback? onPayAll;

  /// Operación en curso (loading del cubit o PaymentSheet abierto): los CTAs
  /// se deshabilitan para evitar dobles taps / pagos duplicados.
  final bool isBusy;

  const GroupOrderTotalsFooter({
    super.key,
    required this.order,
    required this.myShare,
    this.onPay,
    this.onLock,
    this.onPayAll,
    this.isBusy = false,
  });

  bool get _canPay => order.isPayable && myShare > 0 && onPay != null && !isBusy;

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

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
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
          if (isOpen)
            // Host: cierra el pedido (congela precios y habilita el pago).
            CustomNeumorphicButton(
              text: S.current.groupOrderLockCta,
              disabled: onLock == null || order.items.isEmpty || isBusy,
              margin: EdgeInsets.zero,
              onPressed: onLock,
            )
          else ...[
            // Los CTAs muestran el TOTAL real a cobrar (parte + tarifa fija
            // del comensal) — nunca un monto menor al del PaymentSheet.
            CustomNeumorphicButton(
              text: _canPay
                  ? (solo
                      ? S.current.groupOrderPayFullOrder(
                          formatMoney(myShare + order.payerFixedFee, order.currency))
                      : S.current.groupOrderPayMyShare(
                          formatMoney(myShare + order.payerFixedFee, order.currency)))
                  : S.current.groupOrderNoBalanceDue,
              disabled: !_canPay,
              margin: EdgeInsets.zero,
              onPressed: onPay,
            ),
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
            // Transparencia del fee: nota discreta + detalle al tocar ⓘ.
            if (order.payerFixedFee > 0 &&
                (_canPay || (onPayAll != null && order.totalRemaining > 0))) ...[
              const SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _showFeeInfo(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          size: 14, color: FoodlyThemes.secondaryFoodly),
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
