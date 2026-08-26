import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
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
Future<String?> askTableDialog(BuildContext context) => showDialog<String>(
      context: context,
      builder: (_) => const _AskTableDialog(),
    );

/// El diálogo es dueño de su `TextEditingController` y lo libera en su propio
/// `dispose`.
///
/// La primera versión lo creaba afuera y lo liberaba al completarse el
/// `Future` de `showDialog` — que ocurre al llamar a `Navigator.pop`, NO
/// cuando termina la animación de salida. El `TextField` seguía dibujándose
/// contra un controller liberado y al CANCELAR se rompía la pantalla entera:
/// "A TextEditingController was used after being disposed" y detrás un
/// overflow de 99.577px (device, 2026-08-26).
class _AskTableDialog extends StatefulWidget {
  const _AskTableDialog();

  @override
  State<_AskTableDialog> createState() => _AskTableDialogState();
}

class _AskTableDialogState extends State<_AskTableDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirmar() {
    final mesa = _controller.text.trim();
    if (mesa.isEmpty) {
      // Sin mesa el pedido es indespachable: no se deja pasar en blanco.
      setState(() => _error = S.current.groupOrderTableRequired);

      return;
    }
    Navigator.pop(context, mesa);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(S.current.groupOrderTableTitle, style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            const Asset(FoodlyAssets.reserveTable, height: 40).paddingBottom(6),
            TextField(
              controller: _controller,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              // `varchar(30)` en `group_orders.table_label`. Se corta acá para
              // que el comensal vea el límite en vez de que el backend le
              // trunque la mesa sin avisar.
              maxLength: 30,
              // El teclado arranca en texto y no en numérico a propósito: el
              // generador de QRs deja el prefijo libre, así que hay negocios
              // con "Terraza 2" o "Barra 1", no solo números.
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\x00-\x1F\x7F]'))],
              decoration: InputDecoration(
                hintText: S.current.groupOrderTableHint,
                errorText: _error,
                hintStyle: const TextStyle(color: FoodlyThemes.secondaryFoodly),
                counterText: '',
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) {
                if (_error != null) setState(() => _error = null);
              },
              onSubmitted: (_) => _confirmar(),
            ).paddingVertical(16),
            CustomNeumorphicButton(
              text: S.current.confirm,
              disabled: false,
              margin: EdgeInsets.zero,
              onPressed: _confirmar,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
            ),
          ],
        ),
      ),
    );
  }
}
