import 'package:foodly_world/core/core_exports.dart' hide CategoryDM;
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_qr_batch_sheet.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_qr_poster.dart';

class MenuSnackbars {
  const MenuSnackbars._();

  static void showDeleteCategorySnackBar(
    BuildContext context,
    ManageMenuCubit cubit,
    CategoryDM subCategory,
    MenuCategory menuCategory,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onPressed: () => cubit.deleteCategory(subCategory, menuCategory),
      buttonText: S.current.confirm,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(text: S.current.delete),
            TextSpan(text: ' ${subCategory.name}?', style: FoodlyTextStyles.actionsBodyBold),
            TextSpan(text: S.current.deleteAllCategoryItems),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  static void showDeleteItemSnackBar(
    BuildContext context,
    ManageMenuCubit cubit,
    ItemDM item,
    MenuCategory menuCategory,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onPressed: () => cubit.deleteItem(item, menuCategory),
      buttonText: S.current.confirm,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(text: S.current.delete),
            TextSpan(text: ' ${item.name}?', style: FoodlyTextStyles.actionsBodyBold),
            TextSpan(text: S.current.cannotUndone),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  static void showQRCodeSnackBar(
    BuildContext context,
    String menuUrl, {
    bool canEdit = false,
    String businessName = '',
    String? logoUrl,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      content: Column(
        spacing: 26,
        children: [
          Row(
            children: [
              FoodlyQrCard(
                // El ancho total no cambia: el QR encoge lo que crece la
                // tarjeta, para no empujar al texto de al lado.
                data: menuUrl,
                size: context.screenWidth * .46 - FoodlyQrCard.chrome,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
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
                    ),
                  ],
                ).paddingLeft(12),
              ),
            ],
          ),
          // Solo el manager dueño puede descargar. Dos salidas distintas:
          // el QR suelto del negocio (PNG, para pegar en la puerta o compartir)
          // y el lote por mesa (PDF imprimible, un QR por mesa).
          if (canEdit) ...[
            MenuQrDownloadButton(
              menuUrl: menuUrl,
              businessName: businessName,
              logoUrl: logoUrl,
            ),
            CustomNeumorphicButton(
              onPressed: () => showMenuQrBatchSheet(
                context,
                menuUrl: menuUrl,
                businessName: businessName,
                logoUrl: logoUrl,
              ),
              disabled: false,
              type: CustomNeumorphicBtnType.secondary,
              text: S.current.qrBatchDownload,
              margin: EdgeInsets.zero,
              fontSize: 14,
              leading: const Icon(Icons.grid_view_rounded, color: FoodlyThemes.primaryFoodly, size: 20),
            ),
          ],
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }
}
