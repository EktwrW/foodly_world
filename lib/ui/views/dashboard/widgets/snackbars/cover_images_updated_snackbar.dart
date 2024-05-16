import 'package:flutter/material.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

void coverImagesUpdatedSnackbar(BuildContext context) {
  const snackBar = SnackBarWdg(
    type: SnackBarType.success,
    content: Text(
      'Cover Images successfully updated!',
      textAlign: TextAlign.center,
      style: FoodlyTextStyles.snackBarLightBody,
    ),
    duration: Duration(seconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
}
