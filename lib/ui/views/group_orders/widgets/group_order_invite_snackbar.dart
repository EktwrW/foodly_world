import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show FontAwesome;
import 'package:share_plus/share_plus.dart' show Share;

/// Invitación a la mesa: QR, código tipeable y compartir.
///
/// Era un `showModalBottomSheet` propio de la GroupOrderPage. Ahora es el
/// `SnackBarWdg` de la casa, como el QR de compartir menú, y vive suelto
/// para que lo usen las dos entradas: la página y el chip flotante.
///
/// El QR es el protagonista (escanear, no tipear); el código corto queda
/// como salida cuando el QR falla o el otro está en web.
void showGroupOrderInviteSnackBar(
  BuildContext context, {
  required String code,
  required String businessName,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final link = '$kGroupOrderInviteUrlBase$code';

  // `context.screenWidth` (ResponsiveBreakpoints) devuelve 0 hasta que su
  // LayoutBuilder mide, y el chip que abre esto es global: se toca en
  // cualquier pantalla, incluso recién montada. Con 0, el `* .40 - chrome`
  // daba un lado NEGATIVO y reventaba el layout. MediaQuery ya está resuelto
  // siempre, y el clamp deja el QR escaneable en un Z Fold cerrado sin
  // comerse el código que va al lado en una tablet.
  final qrSide = (MediaQuery.sizeOf(context).width * .40 - FoodlyQrCard.chrome).clamp(120.0, 190.0);

  final snackBar = SnackBarWdg(
    // El icono ES el mensaje acá: sumar a alguien a la mesa. El de info
    // genérico no decía nada.
    icon: FontAwesome.user_plus_solid,
    content: Row(
      children: [
        FoodlyQrCard(data: link, size: qrSide),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(S.current.groupOrderInviteTitle, style: FoodlyTextStyles.actionsBodyBold),
              const SizedBox(height: 8),
              // Seleccionable a propósito: en mesas ruidosas se copia y se
              // manda por chat en vez de dictarlo.
              SelectableText(
                code,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                  color: FoodlyThemes.primaryFoodly,
                ),
              ),
              const SizedBox(height: 4),
              Text(S.current.groupOrderInviteHint, style: FoodlyTextStyles.caption),
            ],
          ).paddingLeft(12),
        ),
      ],
    ),
    buttonBuilder: (dismiss) => Row(
      spacing: 16,
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.groupOrderInviteShareCta,
            disabled: false,
            margin: EdgeInsets.zero,
            fontSize: 14,
            // No cierra el aviso: quien comparte por chat vuelve a la mesa y
            // el de al lado todavía tiene que escanear el mismo QR.
            onPressed: () => Share.share(
              '${S.current.groupOrderInviteShareMsg(businessName, code)}\n$link',
            ),
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.close,
            type: CustomNeumorphicBtnType.secondary,
            disabled: false,
            margin: EdgeInsets.zero,
            fontSize: 14,
            onPressed: dismiss,
          ),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
}
