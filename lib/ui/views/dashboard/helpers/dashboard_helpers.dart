import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_transfer_objects/business/business_update_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';
import 'package:path_provider/path_provider.dart';

class DashboardHelpers {
  const DashboardHelpers._();

  static DashboardVM setAddressFromPlacesAPI(Place detail, DashboardVM vm) {
    final countryCode =
        detail.addressComponents?.firstWhere((d) => d.types.contains(FoodlyStrings.COUNTRY)).shortName ?? '';

    vm = vm.copyWith(businessCountry: FoodlyCountries.values.firstWhere((c) => c.countryCode.contains(countryCode)));

    vm.businessCityCtrl?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.LOCALITY))?.longName ?? '';

    vm.businessAddressCtrl?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.ROUTE))?.longName ?? '';

    vm.businessZipCodeCtrl?.controller?.text =
        detail.addressComponents?.firstWhereOrNull((d) => d.types.contains(FoodlyStrings.POSTAL_CODE))?.longName ?? '';

    if (detail.geometry != null) {
      final location = detail.geometry!.location;

      vm = vm.copyWith(latitude: location.lat, longitude: location.lng);

      final newMarker = Marker(
        markerId: MarkerId(detail.placeId ?? ''),
        position: LatLng(location.lat, location.lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        infoWindow: InfoWindow(title: '${detail.name ?? ''} ${detail.formattedAddress ?? ''}'),
      );
      vm = vm.copyWith(markers: Set.from(vm.markers)..add(newMarker));
    }

    return vm;
  }

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
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.current.cropImage,
          toolbarColor: FoodlyThemes.primaryFoodly,
          activeControlsWidgetColor: ui.NeumorphicColors.accent,
          toolbarWidgetColor: ui.NeumorphicColors.background,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          showCropGrid: false,
          aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        ),
        IOSUiSettings(
          title: S.current.cropImage,
          aspectRatioLockEnabled: true,
          cancelButtonTitle: S.current.cancel,
          doneButtonTitle: S.current.save,
          aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        ),
        WebUiSettings(
          context: getContext(),
          size: CropperSize(
            width: (getContext().screenWidth - 200).toInt(),
            height: ((getContext().screenWidth - 200) / 16 * 9).toInt(),
          ),
          viewwMode: WebViewMode.mode_0,
        ),
      ],
    );

    return croppedImage != null ? croppedImage.path : '';
  }
}
