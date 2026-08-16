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
            size: context.screenWidth * .46 - FoodlyQrCard.chrome,
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
