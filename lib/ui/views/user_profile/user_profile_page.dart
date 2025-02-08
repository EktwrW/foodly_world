import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/check_availabilities/check_availabilities_cubit.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_loading_text_dots.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_opacity.dart';
import 'package:foodly_world/ui/shared_widgets/animations/sliver_app_bar_animations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/texts/email_phone_text_links.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/user_profile/cubit/user_profile_cubit.dart';
import 'package:foodly_world/ui/views/user_profile/helpers/profile_helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart';

part 'widgets/user_birthday_date.dart';
part 'widgets/user_contacts.dart';
part 'widgets/user_gender.dart';
part 'widgets/user_location.dart';
part 'widgets/user_password.dart';
part 'widgets/user_profile_name.dart';
part 'widgets/user_profile_section_wrapper.dart';
part 'widgets/user_profile_sliver_app_bar.dart';
part 'widgets/user_reviews.dart';
part 'widgets/username_dialog/edit_username_dialog.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  void _showSwitchRoleSnackBar(BuildContext context) {
    final snackBar = SnackBarWdg(
      onPressed: () async {
        await di<LocalStorageService>().saveBool('user-migration', true);
        if (context.mounted) context.pushNamed(AppRoutes.signUpBusiness.name);
      },
      content: Text(
        S.current.businessAccountUpgradeInfo,
        style: FoodlyTextStyles.snackBarLightBody,
        textAlign: TextAlign.center,
      ),
      buttonText: S.current.okGo,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (_) => di<DialogService>().showLoading(),
          updatingProfilePicture: (_) => di<DialogService>().showLoading(),
          loaded: (_) => di<DialogService>().hideLoading(),
          userUpdated: (vm, msg) {
            di<DialogService>().hideLoading();
            if (context.mounted) {
              FoodlySnackbars.successGeneric(context, msg);
            }
          },
          error: (e, vm) {
            di<DialogService>().hideLoading();
            if (context.mounted) {
              FoodlySnackbars.errorGeneric(context, e);
            }
          },
        );
      },
      builder: (context, state) {
        final vm = state.vm;
        final cubit = context.read<UserProfileCubit>();

        return Scaffold(
          body: Form(
            key: vm.formKey,
            child: GestureDetector(
              onTap: () {
                if (ScaffoldMessenger.maybeOf(context)?.mounted ?? false) {
                  ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
                }
              },
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  UserProfileSliverAppBar(
                    onLeadingPressed: () {
                      context.read<MainDrawerCubit>().goToPreviousIndex();
                      di<AppRouter>().goBackToLastRoute(context);
                    },
                    onPressed: () async => !vm.loggedUserCanEdit
                        ? null
                        : await pickImage(context).then(
                            (path) => path.isNotEmpty && context.mounted
                                ? context.read<MainDrawerCubit>().updateProfilePhoto(path)
                                : null,
                          ),
                  ),
                  SliverToBoxAdapter(
                    key: const PageStorageKey('sliver-profile-user'),
                    child: Column(
                      children: [
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingPassword
                              ? null
                              : () => cubit.updateEditMode(ProfileEditing.password),
                          key: const Key('User-password'),
                          titleFirstText: '${S.current.userPassword1} ',
                          titleSecondText: S.current.userPassword2,
                          footerText: '(${S.current.onlyYouPrivacyNotice})',
                          editing: vm.edition.isEditingPassword,
                          readOnlyWidget: _PasswordPlaceholder(vm),
                          editingWidget:
                              _EditUsersPassword(vm: vm, key: Key('Edit-${vm.currentUser?.fullName}-password')),
                        ),
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingAddress
                              ? null
                              : () {
                                  if (vm.currentUser?.country != null) cubit.setUserCountry(vm.currentUser?.country);
                                  vm.cityController?.controller?.text = vm.currentUserCity ?? '';
                                  vm.zipCodeController?.controller?.text = vm.currentUserZipCode ?? '';
                                  cubit.updateEditMode(ProfileEditing.location);
                                },
                          key: const Key('User-location'),
                          titleFirstText: '${S.current.profileUserLocation1} ',
                          titleSecondText: S.current.profileUserLocation2,
                          editing: vm.edition.isEditingAddress,
                          readOnlyWidget: UserLocation(vm: vm, key: ValueKey(vm.currentUserFullAddress)),
                          editingWidget:
                              EditUsersLocationWidgets(vm: vm, key: ValueKey('Edit-${vm.currentUserFullAddress}')),
                        ),
                        _UserProfileSectionWdg(
                          key: const Key('Birthday-date'),
                          titleFirstText: '${S.current.profileBirthdayText1} ',
                          titleSecondText: S.current.profileBirthdayText2,
                          editing: false,
                          readOnlyWidget: _BirthdayDate(
                            birthdayDate: vm.currentUserBirthday ?? '',
                            key: ValueKey(vm.currentUserBirthday),
                          ),
                          editingWidget: const SizedBox.shrink(),
                        ),
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingGender
                              ? null
                              : () {
                                  cubit.setUserGender(vm.currentUserGender);
                                  cubit.updateEditMode(ProfileEditing.gender);
                                },
                          key: const Key('Gender'),
                          titleFirstText: '${S.current.userGender1} ',
                          titleSecondText: S.current.userGender2,
                          editing: vm.edition.isEditingGender,
                          readOnlyWidget: _UsersGender(vm: vm, key: ValueKey(vm.currentUserGender)),
                          editingWidget: _EditUserGenderWdg(vm: vm, key: ValueKey('Edit-${vm.currentUserGender}')),
                        ),
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingContact
                              ? null
                              : () {
                                  vm.phoneNumberController?.controller?.text = vm.currentUserPhoneNumber ?? '';
                                  vm.emailController?.controller?.text = vm.currentUserEmail ?? '';
                                  context.read<UserProfileCubit>().updateEditMode(ProfileEditing.contact);
                                },
                          key: const Key('Contact'),
                          titleFirstText: '${S.current.dashboardContactText1} ',
                          titleSecondText: S.current.dashboardContactText2,
                          footerText: '(${S.current.contactPrivacyNotice})',
                          editing: vm.edition.isEditingContact,
                          readOnlyWidget: _ContactWdg(vm: vm, key: const Key('Contact-read-only')),
                          editingWidget: _ContactEditingWdg(vm: vm, key: const Key('Contact-editing')),
                        ),
                        _UserProfileSectionWdg(
                          key: const Key('User-reviews'),
                          titleFirstText: '${S.current.userReviews1} ',
                          titleSecondText: S.current.userReviews2,
                          editing: false,
                          readOnlyWidget: const _UserReviews(key: Key('My-reviews')),
                          editingWidget: const SizedBox.shrink(),
                        ),
                        if (vm.loggedUserCanEdit && (vm.currentUser?.isClient ?? false))
                          CustomNeumorphicButton(
                            onPressed: () => _showSwitchRoleSnackBar(context),
                            text: S.current.switchToManagerRole,
                            shape: ui.NeumorphicShape.concave,
                            disabled: false,
                            type: CustomNeumorphicBtnType.outlined,
                            margin: const EdgeInsets.only(bottom: 20),
                          ),
                      ],
                    ).paddingOnly(
                      right: UIDimens.SCREEN_PADDING_MOB,
                      left: UIDimens.SCREEN_PADDING_MOB,
                      top: 36,
                      bottom: 60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
