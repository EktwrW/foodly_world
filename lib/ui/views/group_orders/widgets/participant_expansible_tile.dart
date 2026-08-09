import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_item_tile.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_status_badge.dart';

/// Tarjeta expandible de un participante en la orden grupal (spec v2 §F).
///
/// Header: avatar + nombre + badge Host + subtotal vivo (preview antes del
/// lock, amount_due congelado después) + indicador de pago (solo post-lock)
/// + chevron animado. Cuerpo: sus ítems ([GroupOrderItemTile]).
///
/// Construido sobre [Expansible] (Flutter ≥3.32) para control total del
/// header con estilo Foodly. El estado expandido vive en el State del tile:
/// se preserva entre refreshes del cubit mientras la key ([participant.uuid])
/// sea estable.
class ParticipantExpansibleTile extends StatefulWidget {
  final GroupOrderDM order;
  final GroupOrderParticipantDM participant;

  /// Expandido al construirse (mi propio grupo).
  final bool initiallyExpanded;

  /// Callback de borrado por ítem; null => sin X para ese ítem. La regla de
  /// quién puede borrar qué (dueño del ítem / host) la decide el caller.
  /// Future (e2e r6): el tile muestra spinner hasta que el borrado termina.
  final Future<void> Function(GroupOrderItemDM item)? onRemoveItem;

  /// F2c: alterna "compartido con la mesa" en un ítem (solo OPEN, dueño/host).
  final void Function(GroupOrderItemDM item)? onToggleSharedItem;

  /// "Yo invito" (F2b §A.2): pagar la parte de ESTE participante. null =>
  /// sin CTA (la regla — pendiente, no soy yo, orden pagable — la decide el caller).
  final VoidCallback? onCover;

  /// Nombre de quien cubrió su pago ("Pagado por X"); null si pagó él mismo.
  final String? paidByName;

  const ParticipantExpansibleTile({
    super.key,
    required this.order,
    required this.participant,
    this.initiallyExpanded = false,
    this.onRemoveItem,
    this.onToggleSharedItem,
    this.onCover,
    this.paidByName,
  });

  @override
  State<ParticipantExpansibleTile> createState() => _ParticipantExpansibleTileState();
}

class _ParticipantExpansibleTileState extends State<ParticipantExpansibleTile> {
  final _controller = ExpansibleController();

  @override
  void initState() {
    super.initState();
    if (widget.initiallyExpanded) _controller.expand();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() => _controller.isExpanded ? _controller.collapse() : _controller.expand();

  @override
  Widget build(BuildContext context) {
    final items = widget.order.itemsFor(widget.participant.uuid);

    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 10),
      child: Expansible(
        controller: _controller,
        headerBuilder: (context, animation) => InkWell(
          onTap: _toggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                AvatarWidget(
                  avatarUrl: widget.participant.avatarUrl,
                  width: 38,
                  height: 38,
                  avatarType: AvatarType.user,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.participant.displayName,
                              style: FoodlyTextStyles.labelBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (widget.participant.isHost) ...[
                            const SizedBox(width: 6),
                            const _HostBadge(),
                          ],
                        ],
                      ),
                      // "Yo invito": deja rastro de quién cubrió esta parte.
                      if (widget.paidByName != null)
                        Text(
                          S.current.groupOrderPaidBy(widget.paidByName!),
                          style: FoodlyTextStyles.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formatMoney(widget.order.liveSubtotalFor(widget.participant), widget.order.currency),
                  style: FoodlyTextStyles.itemPricePurpleBold,
                ),
                // Estado de pago: solo tras el lock y con VARIOS participantes
                // (en solitario es ruido — el CTA del footer ya lo dice todo).
                if (!widget.order.isOpen && widget.order.participants.length > 1) ...[
                  const SizedBox(width: 8),
                  GroupOrderPaymentStatusBadge(status: widget.participant.paymentStatus),
                ],
                const SizedBox(width: 4),
                RotationTransition(
                  turns: animation.drive(Tween(begin: 0.0, end: 0.5)),
                  child: const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 22, color: FoodlyThemes.secondaryFoodly),
                ),
              ],
            ),
          ),
        ),
        bodyBuilder: (context, animation) => Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (items.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(S.current.groupOrderNoItems, style: FoodlyTextStyles.caption),
                  ),
                )
              else
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: GroupOrderItemTile(
                      item: item,
                      currency: widget.order.currency,
                      // e2e F4a: el cliente ve qué ítems ya le entregaron.
                      delivered: widget.order.isConfirmed && item.deliveredAt != null,
                      // F4b: lo ENVIADO a cocina es inmutable — es el registro
                      // de lo que el negocio recibió. En cuenta abierta el
                      // carrito sigue editable con la orden ya confirmada, así
                      // que la frontera es el ítem, no el estado de la orden.
                      onRemove: (widget.onRemoveItem == null || item.isSent)
                          ? null
                          : () => widget.onRemoveItem!(item),
                      // "Compartido" NO es un atributo de cocina, es de
                      // REPARTO: no cambia lo que el negocio prepara, cambia
                      // entre quiénes se divide. Gatearlo por `isSent` —la
                      // regla correcta para cantidad y borrado— lo volvía
                      // inalcanzable en cuenta abierta, donde todo se envía al
                      // instante: la jarra de sangría para la mesa no se podía
                      // marcar justo cuando hace falta (e2e 2026-08-09). El
                      // reparto se congela al pedir la cuenta, y de eso ya se
                      // ocupa `isEditableCart` en el caller.
                      onToggleShared: widget.onToggleSharedItem == null
                          ? null
                          : () => widget.onToggleSharedItem!(item),
                    ),
                  ),
              // "Cubrir su parte" (F2b §A.2) — solo si el caller lo habilitó.
              if (widget.onCover != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: widget.onCover,
                    icon: const Icon(Icons.volunteer_activism_outlined,
                        size: 16, color: FoodlyThemes.primaryFoodly),
                    label: Text(S.current.groupOrderCoverShare,
                        style: FoodlyTextStyles.captionPurpleBold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HostBadge extends StatelessWidget {
  const _HostBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(S.current.groupOrderHostBadge, style: FoodlyTextStyles.captionPurpleBold),
    );
  }
}
