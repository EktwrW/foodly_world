import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// F4c — le pregunta la mesa al comensal.
///
/// POR QUÉ EXISTE. La mesa solo se llenaba si el comensal entraba escaneando
/// un QR con `?t=`. Llegar por la búsqueda, por el perfil del negocio o por un
/// link compartido creaba la orden sin mesa, y no había forma de indicarla: en
/// un local de 30 mesas eso es un pedido que no se puede entregar.
///
/// CUÁNDO. Solo si el negocio declaró servicio en mesa Y la orden no la tiene
/// (ver `GroupOrderDM.needsTable`). Al ENVIAR el pedido, no al empezarlo: al
/// empezar todavía no hay nada que servir y la pregunta sería fricción
/// prematura; al enviar es información necesaria y se entiende por qué.
///
/// Devuelve la mesa escrita, o `null` si el comensal cerró sin responder — en
/// ese caso el caller NO debe enviar. Sin mesa el pedido es indespachable, así
/// que el campo es obligatorio; el backend además lo rechaza con 422 por si
/// llega de una app vieja.
Future<String?> askTableDialog(BuildContext context) {
  final controller = TextEditingController();
  final error = ValueNotifier<String?>(null);

  // Se liberan pase lo que pase, igual que hace `payment_mode_selector`.
  // Antes quedaban vivos tras cada apertura del diálogo.
  return _conCierre(controller, error, showDialog<String>(
    context: context,
    builder: (ctx) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.table_restaurant_rounded, size: 34, color: FoodlyThemes.primaryFoodly),
            const SizedBox(height: 12),
            Text(S.current.groupOrderTableTitle,
                style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
            const SizedBox(height: 6),
            Text(S.current.groupOrderTableBody,
                style: FoodlyTextStyles.caption, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ValueListenableBuilder<String?>(
              valueListenable: error,
              builder: (_, msg, __) => TextField(
                controller: controller,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                // `varchar(30)` en `group_orders.table_label`. Se corta acá
                // para que el comensal vea el límite en vez de que el backend
                // le trunque la mesa sin avisar.
                maxLength: 30,
                // El teclado arranca en texto y no en numérico a propósito:
                // el generador de QRs deja el prefijo libre, así que hay
                // negocios con "Terraza 2" o "Barra 1", no solo números.
                inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\x00-\x1F\x7F]'))],
                decoration: InputDecoration(
                  hintText: S.current.groupOrderTableHint,
                  errorText: msg,
                  counterText: '',
                  border: const OutlineInputBorder(),
                ),
                onChanged: (_) => error.value = null,
                onSubmitted: (_) => _confirmar(ctx, controller, error),
              ),
            ),
            const SizedBox(height: 12),
            CustomNeumorphicButton(
              text: S.current.confirm,
              disabled: false,
              margin: EdgeInsets.zero,
              onPressed: () => _confirmar(ctx, controller, error),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
            ),
          ],
        ),
      ),
    ),
  ));
}

/// Libera los recursos del diálogo cuando se cierre, con o sin respuesta.
Future<String?> _conCierre(
  TextEditingController controller,
  ValueNotifier<String?> error,
  Future<String?> resultado,
) async {
  try {
    return await resultado;
  } finally {
    controller.dispose();
    error.dispose();
  }
}

void _confirmar(BuildContext ctx, TextEditingController c, ValueNotifier<String?> error) {
  final mesa = c.text.trim();
  if (mesa.isEmpty) {
    // Sin mesa el pedido es indespachable: no se deja pasar en blanco.
    error.value = S.current.groupOrderTableRequired;

    return;
  }
  Navigator.pop(ctx, mesa);
}
