import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui show NeumorphicColors;
import 'package:universal_io/io.dart' as uni_io;

export 'package:image_cropper/image_cropper.dart' show CropAspectRatioPreset, CropAspectRatio, CropStyle;
export 'package:image_picker/image_picker.dart' show ImageSource;

Future<String> pickImage(
  BuildContext context, {
  List<CropAspectRatioPreset>? aspectRatioPresets,
  CropStyle? cropStyle,
  CropAspectRatio? aspectRatio,
}) async {
  final Completer<String> completer = Completer<String>();

  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBarWdg(
    type: SnackBarType.action,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FooterButton(
          onPressed: () async =>
              await _captureImage(context, completer, ImageSource.camera, aspectRatioPresets, cropStyle, aspectRatio),
          iconData: Bootstrap.camera,
          buttonText: S.current.camera,
        ),
        FooterButton(
          onPressed: () async =>
              await _captureImage(context, completer, ImageSource.gallery, aspectRatioPresets, cropStyle, aspectRatio),
          iconData: Bootstrap.images,
          buttonText: S.current.gallery,
        ),
      ],
    ),
    duration: const Duration(seconds: 30),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));

  return await completer.future;
}

Future<void> _captureImage(
  BuildContext context,
  Completer<String> completer,
  ImageSource source,
  List<CropAspectRatioPreset>? aspectRatioPresets,
  CropStyle? cropStyle,
  CropAspectRatio? aspectRatio,
) async {
  final pathImage = await pickImageFile(
    context,
    source,
    aspectRatioPresets: aspectRatioPresets,
    cropStyle: cropStyle,
    aspectRatio: aspectRatio,
  );
  completer.complete(pathImage);
}

Future<String> pickImageFile(
  BuildContext context,
  ImageSource source, {
  List<CropAspectRatioPreset>? aspectRatioPresets,
  CropStyle? cropStyle,
  CropAspectRatio? aspectRatio,
}) async {
  final imagePicker = ImagePicker();
  BuildContext getContext() => context;
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final pickedFile = await imagePicker.pickImage(source: source);

  if (pickedFile != null) {
    final fileSize = await getFileSize(pickedFile);
    int quality = 100;

    if (fileSize > 1000000) quality = 70;
    if (fileSize > 1500000) quality = 60;
    if (fileSize > 3000000) quality = 40;
    if (fileSize > 5000000) quality = 30;
    if (fileSize > 8000000) quality = 20;

    //if(fileSize >10000000) return 'Image size must be less than 10mb';

    return await _cropImage(pickedFile.path, getContext(), quality, aspectRatioPresets, cropStyle, aspectRatio);
  }

  return '';
}

Future<String> _cropImage(
  String imagePath,
  BuildContext context,
  int quality,
  List<CropAspectRatioPreset>? aspectRatioPresets,
  CropStyle? cropStyle,
  CropAspectRatio? aspectRatio,
) async {
  final isRectangle = cropStyle == CropStyle.rectangle;

  final croppedImage = await ImageCropper().cropImage(
    sourcePath: imagePath,
    compressQuality: quality,
    cropStyle: cropStyle ?? CropStyle.circle,
    aspectRatio: aspectRatio,
    aspectRatioPresets: aspectRatioPresets ??
        [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
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
        context: context,
        boundary: CroppieBoundary(
          width: (context.screenWidth - 200).toInt(),
          height: isRectangle ? ((context.screenWidth - 200) / 16 * 9).toInt() : (context.screenWidth - 200).toInt(),
        ),
        viewPort: CroppieViewPort(
          width: (context.screenWidth - 200).toInt(),
          height: isRectangle ? ((context.screenWidth - 200) / 16 * 9).toInt() : (context.screenWidth - 200).toInt(),
          type: isRectangle ? FoodlyStrings.SQUARE : FoodlyStrings.CIRCLE,
        ),
        enableExif: true,
        enableZoom: true,
        showZoomer: true,
        enableOrientation: true,
        enableResize: !isRectangle,
      ),
    ],
  );

  return croppedImage != null ? croppedImage.path : '';
}

Future<int> getFileSize(XFile pickedFile) async {
  if (uni_io.Platform.isAndroid || uni_io.Platform.isIOS) {
    // Mobile use case
    uni_io.File file = uni_io.File(pickedFile.path);
    return await file.length();
  } else {
    // Web use case
    final bytes = await pickedFile.readAsBytes();
    return bytes.length;
  }
}
