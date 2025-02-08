import 'package:flutter/material.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class FoodlySnackbars {
  const FoodlySnackbars._();

  static void successGeneric(BuildContext context, String? message) {
    final snackBar = SnackBarWdg(
      type: SnackBarType.success,
      content: Text(
        message ?? 'Success',
        textAlign: TextAlign.center,
        style: FoodlyTextStyles.snackBarLightBody,
      ),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  static void errorGeneric(BuildContext context, String? errorMsg) {
    final snackBar = SnackBarWdg(
      type: SnackBarType.error,
      content: Text(
        errorMsg ?? 'Error',
        textAlign: TextAlign.center,
        style: FoodlyTextStyles.snackBarLightBody,
      ),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }
}
