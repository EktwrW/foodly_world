import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Enum to define the type of display for the Save and Cancel buttons.
/// - `dialog`: Buttons are styled for use within dialog windows.
/// - `standardView`: Buttons are styled for standard views.
enum SaveAndCancelBtnType { dialog, standardView }

/// A stateless widget that provides customizable Save and Cancel buttons
/// for different contexts, such as dialogs or standard views.
class SaveAndCancelButtons extends StatelessWidget {
  const SaveAndCancelButtons({
    super.key,
    this.onCancelPressed,
    this.onSavePressed,
    this.recordControllers = const [],
    this.showSaveButton = false,
    this.btnType = SaveAndCancelBtnType.standardView,
    this.onCancelPressedSecondary,
    this.saveButtonText,
  });

  /// Callback function triggered when the Cancel button is pressed.
  final void Function()? onCancelPressed;

  /// Secondary callback for Cancel, used if `Save` is currently visible.
  final void Function()? onCancelPressedSecondary;

  /// Callback function triggered when the Save button is pressed.
  final void Function()? onSavePressed;

  /// List of paired text controllers and initial values for tracking changes.
  /// Used to determine when Save should be visible based on user input.
  final List<(TextEditingController, String)> recordControllers;

  /// Determines whether the Save button should be shown by default.
  final bool showSaveButton;

  /// The type of button display; controls layout and styling.
  final SaveAndCancelBtnType? btnType;

  /// Text for the Save button.
  final String? saveButtonText;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      /// If there are controllers to monitor, wrap buttons in an AnimatedBuilder
      /// to listen for changes in text fields, otherwise show buttons directly.
      child: recordControllers.isNotEmpty
          ? AnimatedBuilder(
              animation: Listenable.merge(
                recordControllers.map((rc) => rc.$1).toList(),
              ),
              builder: (_, __) {
                // Determines if Save should be visible by checking if any text
                // field has been edited and is non-empty.
                final mustShowSaveButton = recordControllers.any((rc) => rc.$1.text != rc.$2 && rc.$1.text.isNotEmpty);

                return _buildButtons(mustShowSaveButton || showSaveButton);
              },
            )
          : _buildButtons(showSaveButton),
    );
  }

  /// Builds the row of Save and Cancel buttons with styles and layout based
  /// on the specified button type.
  Widget _buildButtons(bool saveButtonVisible) {
    if (btnType == SaveAndCancelBtnType.dialog) {
      // Dialog-style layout with even spacing and `AnimatedOpacity` for smooth
      // show/hide animations of the Save button.
      return Row(
        mainAxisAlignment: saveButtonVisible ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedSize(
            duration: Durations.medium1,
            curve: Curves.decelerate,
            child: saveButtonVisible
                ? InkWell(
                    onTap: onSavePressed,
                    child: Text(saveButtonText ?? S.current.save, style: FoodlyTextStyles.dialogCloseText),
                  )
                : const SizedBox.shrink(),
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

    // Standard view layout: Save button aligned to the right if visible.
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (saveButtonVisible)
          TextButton(
            onPressed: onSavePressed,
            child: Text(saveButtonText ?? S.current.save, style: FoodlyTextStyles.captionPurpleBold),
          ),
        TextButton(
          onPressed: onCancelPressed,
          child: Text(S.current.cancel, style: FoodlyTextStyles.captionBold),
        ).paddingLeft(8),
      ],
    );
  }
}
