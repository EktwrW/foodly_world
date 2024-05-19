import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class DasboardSaveAndCancelButtons extends StatelessWidget {
  const DasboardSaveAndCancelButtons({
    super.key,
    this.onCancelPressed,
    this.onSavePressed,
    this.showSaveButton = true,
  });

  final void Function()? onCancelPressed;
  final void Function()? onSavePressed;
  final bool showSaveButton;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showSaveButton)
            TextButton(
              onPressed: onSavePressed,
              child: const Text('Guardar', style: FoodlyTextStyles.captionPurpleBold),
            ),
          TextButton(
            onPressed: onCancelPressed,
            child: Text(S.current.cancel, style: FoodlyTextStyles.captionBold),
          ).paddingLeft(8),
        ],
      ),
    );
  }
}
