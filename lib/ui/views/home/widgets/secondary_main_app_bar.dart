import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class SecondaryMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String actionText;

  const SecondaryMainAppBar({super.key, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        Text(
          actionText,
          overflow: TextOverflow.ellipsis,
          style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
        ).paddingOnly(right: 18),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const SizedBox(
        height: 18,
        child: Asset(FoodlyAssets.logoWhite),
      ).paddingBottom(2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
