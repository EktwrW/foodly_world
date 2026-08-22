import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class MenuSnackbars {
  const MenuSnackbars._();

  static void showQRCodeSnackBar(
    BuildContext context,
    String menuUrl,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      content: Row(
        children: [
          FoodlyQrCard(
            // El ancho total no cambia: el QR encoge lo que crece la
            // tarjeta, para no empujar al texto de al lado.
            data: menuUrl,
            size: _ladoDelQr(context),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: FoodlyTextStyles.snackBarLightBody,
                children: <TextSpan>[
                  TextSpan(
                    text: S.current.scanQRCode,
                    style: FoodlyTextStyles.actionsBodyBold,
                  ),
                  TextSpan(
                    text: S.current.openMenuAnyDevice,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ).paddingLeft(12),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }
}

/// Lado del QR dentro del aviso.
///
/// `context.screenWidth` (ResponsiveBreakpoints) devuelve 0 hasta que su
/// LayoutBuilder mide, y ahí `* .46 - chrome` daba un lado NEGATIVO: el
/// layout revienta, no encoge. Ya mordió una vez en el snackbar de invitar a
/// la mesa (2026-08-22), que se abre desde el chip global. Acá el disparo es
/// menos probable —estas pantallas ya están asentadas— pero es el mismo
/// cálculo. MediaQuery está resuelto siempre, y el clamp deja el QR
/// escaneable en un Z Fold cerrado sin comerse el texto de al lado.
double _ladoDelQr(BuildContext context) =>
    (MediaQuery.sizeOf(context).width * .46 - FoodlyQrCard.chrome).clamp(120.0, 190.0);

