import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

class DashboardHelpers {
  const DashboardHelpers._();

  static Future<String> cropImageFromUrl(String imageUrl, BuildContext context) async {
    BuildContext getContext() => context;

    final httpResponse = await http.get(Uri.parse(imageUrl));
    if (httpResponse.statusCode != 200) {
      return '';
    }

    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/tempImage.jpg';
    final imageFile = File(imagePath);

    // Store the image
    imageFile.writeAsBytesSync(httpResponse.bodyBytes);

    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      compressQuality: 100,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.current.cropImage,
          toolbarColor: FoodlyThemes.primaryFoodly,
          activeControlsWidgetColor: ui.NeumorphicColors.accent,
          toolbarWidgetColor: ui.NeumorphicColors.background,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          showCropGrid: false,
        ),
        IOSUiSettings(
          title: S.current.cropImage,
        ),
        WebUiSettings(
          context: getContext(),
          boundary: CroppieBoundary(
            width: (getContext().screenWidth - 200).toInt(),
            height: ((getContext().screenWidth - 200) / 16 * 9).toInt(),
          ),
          viewPort: CroppieViewPort(
            width: (getContext().screenWidth - 200).toInt(),
            height: ((getContext().screenWidth - 200) / 16 * 9).toInt(),
            type: FoodlyStrings.SQUARE,
          ),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
          enableOrientation: true,
        ),
      ],
    );

    return croppedImage != null ? croppedImage.path : '';
  }
}
