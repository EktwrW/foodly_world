import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/blocs/check_availabilities/check_availabilities_cubit.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_loading_text_dots.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_opacity.dart';
import 'package:foodly_world/ui/shared_widgets/animations/sliver_app_bar_animations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/cards/review_card.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel_basic.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/password_confirmation_dialog.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/user_profile/cubit/user_profile_cubit.dart';
import 'package:foodly_world/ui/views/user_profile/helpers/profile_helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

part 'widgets/delete_account_section.dart';
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
        final dialogService = di<DialogService>();

        state.whenOrNull(
          loading: (_) => dialogService.showLoading(),
          updatingProfilePicture: (_) => dialogService.showLoading(),
          loaded: (_) => dialogService.hideLoading(),
          userUpdated: (vm, msg) {
            dialogService.hideLoading();
            if (msg == UserProfileCubit.accountDeletedSentinel) {
              di<AuthSessionService>().endSession(context, redirectToStart: true);
              return;
            }
            FoodlySnackbars.successGeneric(context, msg);
          },
          error: (e, vm) {
            dialogService.hideLoading();
            FoodlySnackbars.errorGeneric(context, e);
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
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  UserProfileSliverAppBar(
                    onLeadingPressed: () {
                      context.read<MainDrawerCubit>().goToPreviousIndex();
                      di<AppRouter>().goBackToLastRoute();
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
                                  if (vm.currentUser?.principalAddress?.country != null) {
                                    cubit.setUserCountry(vm.currentUser?.principalAddress?.country);
                                  }
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
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingDateOfBirth
                              ? null
                              : () => cubit.selectBirthday(context),
                          key: const Key('Birthday-date'),
                          titleFirstText: '${S.current.profileBirthdayText1} ',
                          titleSecondText: S.current.profileBirthdayText2,
                          editing: false,
                          readOnlyWidget: _BirthdayDate(
                            // Placeholder atenuado cuando no hay fecha (típico
                            // en altas sociales que entran sin completar perfil).
                            birthdayDate: (vm.currentUserBirthday?.isNotEmpty ?? false)
                                ? vm.currentUserBirthday!
                                : (vm.loggedUserCanEdit ? S.current.dateOfBirth : ''),
                            isPlaceholder: !(vm.currentUserBirthday?.isNotEmpty ?? false),
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
                        // Email and phone used to live in a single "Contact" section.
                        // Email is now isolated because changing it requires re-auth
                        // (it's an account-recovery vector — silent email change
                        // would enable takeover via forgot-password).
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingEmail
                              ? null
                              : () {
                                  vm.emailController?.controller?.text = vm.currentUserEmail ?? '';
                                  context.read<UserProfileCubit>().updateEditMode(ProfileEditing.email);
                                },
                          key: const Key('Email'),
                          titleFirstText: '${S.current.emailSectionTitle1} ',
                          titleSecondText: S.current.emailSectionTitle2,
                          footerText: '(${S.current.contactPrivacyNotice})',
                          editing: vm.edition.isEditingEmail,
                          readOnlyWidget: _EmailWdg(vm: vm, key: const Key('Email-read-only')),
                          editingWidget: _EmailEditingWdg(vm: vm, key: const Key('Email-editing')),
                        ),
                        _UserProfileSectionWdg(
                          onEditBtnPressed: !vm.loggedUserCanEdit || vm.edition.isEditingPhone
                              ? null
                              : () {
                                  vm.phoneNumberController?.controller?.text = vm.currentUserPhoneNumber ?? '';
                                  context.read<UserProfileCubit>().updateEditMode(ProfileEditing.phone);
                                },
                          key: const Key('Phone'),
                          titleFirstText: '${S.current.phoneSectionTitle1} ',
                          titleSecondText: S.current.phoneSectionTitle2,
                          footerText: '(${S.current.contactPrivacyNotice})',
                          editing: vm.edition.isEditingPhone,
                          readOnlyWidget: _PhoneWdg(vm: vm, key: const Key('Phone-read-only')),
                          editingWidget: _PhoneEditingWdg(vm: vm, key: const Key('Phone-editing')),
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
                            margin: const EdgeInsets.only(bottom: 36),
                            padding: const EdgeInsets.all(9),
                          ).paddingHorizontal(27),
                        if (vm.loggedUserCanEdit)
                          CustomNeumorphicButton(
                            onPressed: () => context.pushNamed(AppRoutes.blockedUsers.name),
                            text: S.current.blockedUsers,
                            leading: const Icon(Icons.block, size: 18, color: FoodlyThemes.primaryFoodly),
                            shape: ui.NeumorphicShape.concave,
                            disabled: false,
                            type: CustomNeumorphicBtnType.secondary,
                            margin: const EdgeInsets.only(bottom: 46),
                            padding: const EdgeInsets.all(9),
                          ).paddingHorizontal(27),
                        if (vm.loggedUserCanEdit)
                          _DeleteAccountSection(
                            key: const Key('delete-account-section'),
                            onDeleteConfirmed: () => cubit.deleteAccount(),
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
