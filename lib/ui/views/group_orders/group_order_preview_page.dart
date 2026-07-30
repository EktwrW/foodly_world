import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_expansible_tile.dart';

/// Página de PREVIEW (solo desarrollo) para ver los widgets de Group Orders
/// con datos de ejemplo, sin backend. No es parte del flujo de producción.
///
/// Cómo verla:
///  A) Temporal como home — en main.dart, reemplaza el widget raíz por
///     `MaterialApp(home: GroupOrderPreviewPage())`.
///  B) Ruta temporal — agrega un GoRoute `/group-orders/preview` que devuelva
///     `const GroupOrderPreviewPage()` y navega a él.
class GroupOrderPreviewPage extends StatelessWidget {
  const GroupOrderPreviewPage({super.key});

  static final _order = GroupOrderDM(
    uuid: 'preview',
    status: GroupOrderStatus.locked,
    businessName: 'Mystic Restaurant',
    subtotal: 60,
    totalAmount: 60,
    totalPaid: 40,
    lockExpiresAt: DateTime.now().add(const Duration(minutes: 10)),
    participants: const [
      GroupOrderParticipantDM(
        uuid: 'p1',
        displayName: 'Hector',
        role: GroupParticipantRole.host,
        paymentStatus: GroupPaymentStatus.paid,
        amountDue: 20,
        amountPaid: 20,
      ),
      GroupOrderParticipantDM(
        uuid: 'p2',
        displayName: 'María',
        paymentStatus: GroupPaymentStatus.paid,
        amountDue: 20,
        amountPaid: 20,
      ),
      GroupOrderParticipantDM(
        uuid: 'p3',
        displayName: 'Pedro',
        amountDue: 20,
      ),
    ],
    items: const [
      GroupOrderItemDM(
          uuid: 'i1', participantUuid: 'p1', name: 'Nachos con guacamole', unitPriceAtLock: 8.5, notes: 'sin cebolla'),
      GroupOrderItemDM(uuid: 'i2', participantUuid: 'p1', name: 'Coca-Cola', unitPriceAtLock: 2.75, quantity: 2),
      GroupOrderItemDM(uuid: 'i3', participantUuid: 'p2', name: 'Pizza Margherita', unitPriceAtLock: 11.0),
      GroupOrderItemDM(uuid: 'i4', participantUuid: 'p3', name: 'Hamburguesa', unitPriceAtLock: 12.5),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Order · Preview')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
              children: [
                const Text('Participantes', style: FoodlyTextStyles.sectionsTitle),
                const SizedBox(height: 8),
                // Diseño v2: ítems agrupados por participante (Expansible).
                ..._order.participants.map(
                  (p) => ParticipantExpansibleTile(
                    key: ValueKey(p.uuid),
                    order: _order,
                    participant: p,
                    initiallyExpanded: p.uuid == 'p1', // simula "mi" grupo
                    onRemoveItem: _order.isOpen ? (_) {} : null,
                  ),
                ),
              ],
            ),
          ),
          GroupOrderTotalsFooter(
            order: _order,
            myShare: 20,
            onPay: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('→ aquí abriría el Stripe PaymentSheet')),
            ),
          ),
        ],
      ),
    );
  }
}
