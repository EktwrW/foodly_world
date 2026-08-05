import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// F4b-2 — "¿Cómo cobra tu negocio?" (maqueta D1 aprobada): elección
/// EXPLÍCITA del dueño, sin default por categoría. Aparece al activar pagos
/// y vive como setting editable en el panel.
///
/// Widget PURO: recibe el modo actual y devuelve el elegido — el caller
/// decide si es onboarding (diálogo) o edición (bottom sheet).
class PaymentModeSelector extends StatefulWidget {
  final GroupPaymentMode? initial;
  final ValueChanged<GroupPaymentMode> onConfirm;

  const PaymentModeSelector({super.key, this.initial, required this.onConfirm});

  /// Abre el selector como diálogo Foodly y devuelve el modo elegido (o null
  /// si el dueño lo cerró sin decidir).
  static Future<GroupPaymentMode?> show(
    BuildContext context, {
    GroupPaymentMode? initial,
  }) {
    return showDialog<GroupPaymentMode>(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 16),
          child: PaymentModeSelector(
            initial: initial,
            onConfirm: (mode) => Navigator.pop(ctx, mode),
          ),
        ),
      ),
    );
  }

  @override
  State<PaymentModeSelector> createState() => _PaymentModeSelectorState();
}

class _PaymentModeSelectorState extends State<PaymentModeSelector> {
  GroupPaymentMode? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.paymentModeTitle,
          style: FoodlyTextStyles.sectionsTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          S.current.paymentModeSubtitle,
          style: FoodlyTextStyles.caption,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        _ModeCard(
          mode: GroupPaymentMode.openTab,
          icon: Icons.restaurant_rounded,
          title: S.current.paymentModeOpenTabTitle,
          body: S.current.paymentModeOpenTabBody,
          flow: S.current.paymentModeOpenTabFlow,
          selected: _selected == GroupPaymentMode.openTab,
          onTap: () => setState(() => _selected = GroupPaymentMode.openTab),
        ),
        const SizedBox(height: 10),
        _ModeCard(
          mode: GroupPaymentMode.perRound,
          icon: Icons.bolt_rounded,
          title: S.current.paymentModePerRoundTitle,
          body: S.current.paymentModePerRoundBody,
          flow: S.current.paymentModePerRoundFlow,
          selected: _selected == GroupPaymentMode.perRound,
          onTap: () => setState(() => _selected = GroupPaymentMode.perRound),
        ),
        const SizedBox(height: 16),
        CustomNeumorphicButton(
          text: S.current.confirm,
          disabled: _selected == null,
          margin: EdgeInsets.zero,
          onPressed: _selected == null ? null : () => widget.onConfirm(_selected!),
        ),
      ],
    );
  }
}

/// Tarjeta de opción con radio (maqueta D1): lenguaje de dueño de negocio,
/// no de developer — el chip resume el flujo real de la mesa.
class _ModeCard extends StatelessWidget {
  final GroupPaymentMode mode;
  final IconData icon;
  final String title;
  final String body;
  final String flow;
  final bool selected;
  final VoidCallback onTap;

  const _ModeCard({
    required this.mode,
    required this.icon,
    required this.title,
    required this.body,
    required this.flow,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? FoodlyThemes.primaryFoodly
                : FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: FoodlyThemes.primaryFoodly),
                const SizedBox(width: 8),
                Expanded(child: Text(title, style: FoodlyTextStyles.labelPurpleBold)),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              color: FoodlyThemes.primaryFoodly,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(body, style: FoodlyTextStyles.caption.copyWith(fontSize: 11.5)),
            const SizedBox(height: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                flow,
                style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
