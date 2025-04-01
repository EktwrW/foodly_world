import 'package:foodly_world/core/core_exports.dart';

import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
          QrImageView(
            data: menuUrl,
            backgroundColor: Colors.white,
            size: context.screenWidth * .46,
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
