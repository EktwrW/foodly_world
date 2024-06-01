import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

class DashboardHelpers {
  const DashboardHelpers._();

  static List<(TextEditingController, String)> addressFieldControllers(DashboardVM vm) {
    final list = <(TextEditingController, String)>[];

    if (vm.businessCityCtrl?.controller != null && vm.currentBusiness?.city != null) {
      list.add((vm.businessCityCtrl!.controller!, vm.currentBusiness!.city!));
    }
    if (vm.businessAddressCtrl?.controller != null && vm.currentBusiness?.address != null) {
      list.add((vm.businessAddressCtrl!.controller!, vm.currentBusiness!.address!));
    }
    if (vm.businessZipCodeCtrl?.controller != null && vm.currentBusiness?.zipCode != null) {
      list.add((vm.businessZipCodeCtrl!.controller!, vm.currentBusiness!.zipCode!));
    }

    return list;
  }

  static List<(TextEditingController, String)> contactChannelsFieldControllers(DashboardVM vm) {
    final list = <(TextEditingController, String)>[];

    if (vm.businessEmailCtrl?.controller != null && vm.currentBusiness?.email != null) {
      list.add((vm.businessEmailCtrl!.controller!, vm.currentBusiness!.email!));
    }

    if (vm.businessPhoneCtrl?.controller != null && vm.currentBusiness?.phoneNumber != null) {
      list.add(((vm.businessPhoneCtrl!.controller!, vm.currentBusiness!.phoneNumber!)));
    }

    return list;
  }

  static BusinessUpdateDTO getContactUsFields(BusinessUpdateDTO dto, DashboardVM vm) {
    if (vm.businessEmailCtrl?.text?.isNotEmpty ?? false) {
      dto = dto.copyWith(businessEmail: vm.businessEmailCtrl?.text);
    }

    if (vm.businessPhoneCtrl?.text?.isNotEmpty ?? false) {
      dto = dto.copyWith(businessPhone: vm.businessPhoneCtrl?.text);
    }
    return dto;
  }

  static BusinessUpdateDTO getAddressFields(BusinessUpdateDTO dto, DashboardVM vm) {
    if (vm.businessCountry != null) {
      dto = dto.copyWith(businessCountry: vm.businessCountry);
    }

    if (vm.businessCityCtrl?.text?.isNotEmpty ?? false) {
      dto = dto.copyWith(businessCity: vm.businessCityCtrl?.text);
    }

    if (vm.businessAddressCtrl?.text?.isNotEmpty ?? false) {
      dto = dto.copyWith(businessAddress: vm.businessAddressCtrl?.text);
    }

    if (vm.businessZipCodeCtrl?.text?.isNotEmpty ?? false) {
      dto = dto.copyWith(businessZipcode: vm.businessZipCodeCtrl?.text);
    }

    if (vm.latitude != null && vm.longitude != null) {
      dto = dto.copyWith(businessLatitude: vm.latitude, businessLongitude: vm.longitude);
    }

    return dto;
  }

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
