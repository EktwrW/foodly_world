import 'package:flutter/material.dart' show TextEditingController;
import 'package:foodly_world/core/view_models/user_profile_vm.dart';

class ProfileHelpers {
  const ProfileHelpers._();

  static List<(TextEditingController, String)> contactChannelsFieldControllers(UserProfileVM vm) {
    final list = <(TextEditingController, String)>[];

    if (vm.emailController?.controller != null && vm.currentUserEmail != null) {
      list.add((vm.emailController!.controller!, vm.currentUserEmail!));
    }

    if (vm.phoneNumberController?.controller != null && vm.currentUserPhoneNumber != null) {
      list.add(((vm.phoneNumberController!.controller!, vm.currentUserPhoneNumber!)));
    }

    return list;
  }

  static List<(TextEditingController, String)> emailFieldControllers(UserProfileVM vm) {
    final list = <(TextEditingController, String)>[];
    if (vm.emailController?.controller != null && vm.currentUserEmail != null) {
      list.add((vm.emailController!.controller!, vm.currentUserEmail!));
    }
    return list;
  }

  static List<(TextEditingController, String)> phoneFieldControllers(UserProfileVM vm) {
    final list = <(TextEditingController, String)>[];
    if (vm.phoneNumberController?.controller != null && vm.currentUserPhoneNumber != null) {
      list.add((vm.phoneNumberController!.controller!, vm.currentUserPhoneNumber!));
    }
    return list;
  }

  static List<(TextEditingController, String)> addressFieldControllers(UserProfileVM vm) {
    final list = <(TextEditingController, String)>[];

    if (vm.cityController?.controller != null && vm.currentUserCity != null) {
      list.add((vm.cityController!.controller!, vm.currentUserCity!));
    }

    if (vm.zipCodeController?.controller != null && vm.currentUserZipCode != null) {
      list.add((vm.zipCodeController!.controller!, vm.currentUserZipCode!));
    }

    if (vm.addressController?.controller != null && vm.currentUserAddress != null) {
      list.add((vm.addressController!.controller!, vm.currentUserAddress!));
    }

    return list;
  }
}
