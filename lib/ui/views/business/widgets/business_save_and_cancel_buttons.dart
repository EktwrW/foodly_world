import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

enum SaveAndCancelBtnType { dialog, standardView }

class DashboardSaveAndCancelButtons extends StatelessWidget {
  const DashboardSaveAndCancelButtons({
    super.key,
    this.onCancelPressed,
    this.onSavePressed,
    this.recordControllers = const [],
    this.showSaveButton = true,
    this.btnType = SaveAndCancelBtnType.standardView,
    this.onCancelPressedSecondary,
  });

  final void Function()? onCancelPressed;
  final void Function()? onCancelPressedSecondary;
  final void Function()? onSavePressed;
  final List<(TextEditingController, String)> recordControllers;
  final bool showSaveButton;
  final SaveAndCancelBtnType? btnType;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: recordControllers.isNotEmpty
          ? AnimatedBuilder(
              animation: Listenable.merge(
                recordControllers.map((rc) => rc.$1).toList(),
              ),
              builder: (_, __) {
                final mustShowSaveButton = recordControllers.any((rc) => rc.$1.text != rc.$2 && rc.$1.text.isNotEmpty);

                return _buildButtons(mustShowSaveButton);
              },
            )
          : _buildButtons(showSaveButton),
    );
  }

  Widget _buildButtons(bool saveButtonVisible) {
    if (btnType == SaveAndCancelBtnType.dialog) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (saveButtonVisible)
            InkWell(
              onTap: onSavePressed,
              child: Text(S.current.save, style: FoodlyTextStyles.dialogCloseText),
            ),
          InkWell(
            onTap: saveButtonVisible ? onCancelPressedSecondary : onCancelPressed,
            child: Text(
              saveButtonVisible ? S.current.cancel : S.current.close,
              style: FoodlyTextStyles.dialogCloseText,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (saveButtonVisible)
          TextButton(
            onPressed: onSavePressed,
            child: Text(S.current.save, style: FoodlyTextStyles.captionPurpleBold),
          ),
        TextButton(
          onPressed: onCancelPressed,
          child: Text(S.current.cancel, style: FoodlyTextStyles.captionBold),
        ).paddingLeft(8),
      ],
    );
  }
}
