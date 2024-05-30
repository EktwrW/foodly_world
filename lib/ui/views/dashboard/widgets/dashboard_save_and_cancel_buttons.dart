import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class DashboardSaveAndCancelButtons extends StatelessWidget {
  const DashboardSaveAndCancelButtons({
    super.key,
    this.onCancelPressed,
    this.onSavePressed,
    this.recordControllers = const [],
    this.showSaveButton = true,
  });

  final void Function()? onCancelPressed;
  final void Function()? onSavePressed;
  final List<(TextEditingController, String)> recordControllers;
  final bool showSaveButton;

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

  Row _buildButtons(bool saveButtonVisible) {
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
