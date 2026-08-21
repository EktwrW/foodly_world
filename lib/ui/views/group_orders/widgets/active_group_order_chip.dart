import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show FontAwesome;

/// Visual del chip "Ver pedido · €X" (spec v2 §D.1). Widget TONTO: recibe la
/// orden y el tap — la visibilidad, posición global y drag los maneja
/// GroupOrderFloatingChipHost (e2e r4: el chip es global y arrastrable).
class ActiveGroupOrderChip extends StatelessWidget {
  final GroupOrderDM order;
  final VoidCallback onTap;

  /// Suma a alguien a la mesa. null = sin botón. Lo cablea el host, que es
  /// el que tiene DI: el chip vive FUERA del árbol de providers (lo monta el
  /// builder de MaterialApp), así que acá un `context.read` no encuentra
  /// nada — comprobado en device, no en teoría.
  final VoidCallback? onInvite;

  const ActiveGroupOrderChip({
    super.key,
    required this.order,
    required this.onTap,
    this.onInvite,
  });

  /// Estado de cocina en el chip (e2e F4b): con la orden ya confirmada, el
  /// chip informa en vez de repetir "Ver pedido" — "¡Listo!" es la señal que
  /// hace valioso el feature en mostrador y hay que verla sin entrar.
  (IconData, Color, String) get _look {
    if (!order.isConfirmed) {
      return (
        Icons.receipt_long_rounded,
        FoodlyThemes.primaryFoodly,
        '${S.current.groupOrderViewOrder} · ${formatMoney(order.subtotal, order.currency)}',
      );
    }

    // e2e 2026-08-06 — en cuenta abierta el chip obedece a la MISMA máquina
    // pura que el footer, derivada de los ÍTEMS.
    //
    // `fulfillmentStatus` es un único enum a nivel de ORDEN: un resumen con
    // pérdida de lo que pasa por tanda. Creerle producía mentiras reales:
    //  · orden entregada + el negocio anula un plato → decía "preparando";
    //  · tanda 2 enviada y entregada → seguía diciendo "preparando".
    // Los ítems no mienten: si todo lo enviado está entregado, no hay nada
    // en cocina, diga lo que diga el agregado. El estado de cocina solo
    // importa cuando SÍ hay algo esperando (waiting).
    if (order.isOpenTab) {
      return switch (order.openTabCtaState) {
        OpenTabCtaState.send => (
            Icons.outbox_rounded,
            FoodlyThemes.primaryFoodly,
            S.current.groupOrderSendCta,
          ),
        OpenTabCtaState.waiting => _kitchenLook,
        // Avisaron que pagan en caja: el chip NO puede seguir invitando a
        // pagar en la app — el dinero se entrega en el mostrador.
        OpenTabCtaState.cash => (
            Icons.storefront_rounded,
            const Color(0xFF0B8A40),
            S.current.groupOrderCashRequestedCta,
          ),
        // pay / billed: nada pendiente en cocina, la mesa puede cerrar.
        _ => (
            Icons.receipt_long_rounded,
            FoodlyThemes.primaryFoodly,
            S.current.groupOrderChipToPay(formatMoney(order.sentTotal, order.currency)),
          ),
      };
    }

    return switch (order.fulfillmentStatus) {
      GroupFulfillmentStatus.preparing => (
          Icons.soup_kitchen_rounded,
          const Color(0xFFB87400),
          S.current.groupOrderChipPreparing,
        ),
      GroupFulfillmentStatus.ready => (
          Icons.room_service_rounded,
          FoodlyThemes.tertiaryFoodly,
          S.current.groupOrderChipReady,
        ),
      // Entregada en cuenta abierta = falta pagar (el chip vive hasta el
      // pago); en prepago el chip ya no se muestra.
      GroupFulfillmentStatus.delivered => (
          Icons.receipt_long_rounded,
          FoodlyThemes.primaryFoodly,
          S.current.groupOrderChipToPay(formatMoney(order.sentTotal, order.currency)),
        ),
      _ => (
          Icons.receipt_long_rounded,
          FoodlyThemes.primaryFoodly,
          S.current.groupOrderChipSent,
        ),
    };
  }

  /// Señal de cocina — solo tiene sentido cuando hay algo enviado sin
  /// entregar. "¡Listo!" es lo que hace valioso el chip en mostrador.
  ///
  /// Sin estado de fulfillment el negocio AÚN NO tocó la comanda: decir
  /// "Preparando" sería inventar actividad que nadie confirmó. "Pedido
  /// enviado" es lo único que sabemos de cierto.
  (IconData, Color, String) get _kitchenLook => switch (order.fulfillmentStatus) {
        GroupFulfillmentStatus.ready => (
            Icons.room_service_rounded,
            FoodlyThemes.tertiaryFoodly,
            S.current.groupOrderChipReady,
          ),
        GroupFulfillmentStatus.preparing => (
            Icons.soup_kitchen_rounded,
            const Color(0xFFB87400),
            S.current.groupOrderChipPreparing,
          ),
        _ => (
            Icons.receipt_long_rounded,
            FoodlyThemes.primaryFoodly,
            S.current.groupOrderChipSent,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final (icon, color, label) = _look;

    return Material(
      color: color,
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedSize(
        duration: Durations.medium2,
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: FoodlyTextStyles.captionBold.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            if (order.isEditableCart && onInvite != null)
              CustomRoundedNeumorphicButton(
                diameter: 14,
                tooltip: S.current.groupOrderInviteCta,
                onPressed: onInvite,
                child: const Icon(FontAwesome.user_plus_solid, color: FoodlyThemes.primaryFoodly, size: 14),
              ).paddingAll(2),
          ],
        ),
      ),
    );
  }
}
