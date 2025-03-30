import 'package:foodly_world/core/core_exports.dart';

import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MenuSnackbars {
  const MenuSnackbars._();

  static void showDeleteCategorySnackBar(
    BuildContext context,
    MenuCubit cubit,
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
    MenuCubit cubit,
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
