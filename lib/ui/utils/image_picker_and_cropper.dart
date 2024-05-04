import 'dart:async';

import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

export 'package:image_picker/image_picker.dart' show ImageSource;

Future<String> pickImage(BuildContext context) async {
  final Completer<String> completer = Completer<String>();

  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBarWdg(
    type: SnackBarType.action,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _pickImageButton(
          onPressed: () async => await _captureImage(context, completer, ImageSource.camera),
          iconData: Bootstrap.camera,
          textButton: S.current.camera,
        ),
        _pickImageButton(
          onPressed: () async => await _captureImage(context, completer, ImageSource.gallery),
          iconData: Bootstrap.images,
          textButton: S.current.gallery,
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
) async {
  final pathImage = await pickImageFile(context, source);
  completer.complete(pathImage);
}

Widget _pickImageButton({
  required void Function() onPressed,
  required IconData iconData,
  required String textButton,
}) {
  return Column(
    children: [
      NeumorphicButton(
        margin: const EdgeInsets.all(6),
        onPressed: onPressed,
        style: const NeumorphicStyle(
            shape: NeumorphicShape.convex, intensity: .6, color: NeumorphicColors.decorationMaxWhiteColor),
        child: SizedBox.square(dimension: 80, child: Icon(iconData, size: 36, color: FoodlyThemes.primaryFoodly)),
      ),
      Text(textButton, style: FoodlyTextStyles.loginCTATextButton),
    ],
  );
}

Future<String> pickImageFile(BuildContext context, ImageSource source) async {
  final imagePicker = ImagePicker();
  BuildContext getContext() => context;
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final pickedFile = await imagePicker.pickImage(source: source, imageQuality: 90);

  if (pickedFile != null) {
    return await _cropImage(pickedFile.path, getContext());
  }

  return '';
}

Future<String> _cropImage(String imagePath, BuildContext context) async {
  final croppedImage = await ImageCropper().cropImage(
    sourcePath: imagePath,
    compressFormat: ImageCompressFormat.png,
    cropStyle: CropStyle.circle,
    aspectRatioPresets: [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: S.current.cropImage,
        toolbarColor: FoodlyThemes.primaryFoodly,
        activeControlsWidgetColor: NeumorphicColors.accent,
        toolbarWidgetColor: NeumorphicColors.background,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false,
        showCropGrid: false,
      ),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
        boundary: CroppieBoundary(
          width: (context.screenWidth - 200).toInt(),
          height: (context.screenWidth - 200).toInt(),
        ),
        viewPort: CroppieViewPort(
          width: (context.screenWidth - 200).toInt(),
          height: (context.screenWidth - 200).toInt(),
          type: FoodlyStrings.CIRCLE,
        ),
        enableExif: true,
        enableZoom: true,
        showZoomer: true,
        enableOrientation: true,
        enableResize: true,
      ),
    ],
  );

  return croppedImage != null ? croppedImage.path : '';
}
