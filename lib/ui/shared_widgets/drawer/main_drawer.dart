import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/main.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sidebarx/sidebarx.dart';

class FoodlyDrawer extends StatelessWidget {
  const FoodlyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainDrawerCubit, MainDrawerState>(
      listener: (context, state) {
        state.whenOrNull(
          updatingAvatar: (_) => di<DialogService>().showLoading(),
          loaded: (_) => di<DialogService>().hideLoading(),
          error: (e, vm) {
            di<DialogService>().hideLoading();
            FoodlySnackbars.errorGeneric(context, e);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (vm) => _buildSidebarXContent(context, vm),
          updatingAvatar: (vm) => _buildSidebarXContent(context, vm),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSidebarXContent(BuildContext context, MainDrawerVM vm) {
    final cubit = context.read<MainDrawerCubit>();
    final navigator = di<AppRouter>();
    final authService = di<AuthSessionService>();

    return SafeArea(
      child: SidebarX(
        animationDuration: Durations.medium4,
        controller: vm.sidebarController,
        showToggleButton: false,
        theme: const SidebarXTheme(
          width: 100,
          decoration: BoxDecoration(
            color: ui.NeumorphicColors.background,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        footerBuilder: (context, extended) {
          return Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to privacy policy screen (in-app) and close drawer
                  try {
                    navigator.appRouter.goNamed(AppRoutes.privacyPolicy.name);
                  } catch (_) {
                    // In case of navigation failure, show error snackbar but keep drawer open for retry
                    FoodlySnackbars.errorGeneric(context, S.current.somethingWentWrong);
                  }
                  FoodlyMainScaffold.toggleDrawer();
                },
                child: Row(
                  mainAxisAlignment: extended ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    const Icon(Bootstrap.shield_lock, size: 24).paddingHorizontal(9),
                    if (extended)
                      Flexible(
                        child: FadeIn(
                          delay: Durations.medium2,
                          child: Text(
                            S.current.privacyPolicy,
                            style: FoodlyTextStyles.label,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1, height: 4),
              Flexible(
                child: IconButton(
                  onPressed: () => vm.sidebarController.toggleExtended(),
                  icon: extended
                      ? const Icon(Bootstrap.caret_left_fill, size: 40)
                      : const Icon(Bootstrap.caret_right_fill, size: 40),
                  tooltip: S.current.logout,
                ),
              ),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (extended)
                    Flexible(
                      child: FadeIn(
                        delay: Durations.medium2,
                        duration: Durations.medium2,
                        child: Text(
                          S.current.version,
                          style: FoodlyTextStyles.label,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  Flexible(
                    child: Text(
                      authService.deviceInfo?.appVersion ?? '-',
                      style: FoodlyTextStyles.labelBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (extended)
                    Flexible(
                      child: FadeIn(
                        delay: Durations.medium2,
                        duration: Durations.medium2,
                        child: const Asset(FoodlyAssets.symbol369, width: 20),
                      ).paddingLeft(8),
                    ),
                ],
              )
            ],
          ).paddingBottom(16);
        },
        headerDivider: const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1, height: 12).paddingBottom(12),
        extendedTheme: SidebarXTheme(
          width: 246,
          itemMargin: EdgeInsets.all(context.screenWidth * .005),
          itemTextPadding: const EdgeInsets.only(left: 12),
          selectedItemTextPadding: const EdgeInsets.only(left: 16),
          selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: FoodlyThemes.primaryFoodly),
          decoration: const BoxDecoration(
            color: ui.NeumorphicColors.background,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
        headerBuilder: (context, extended) {
          final Size avatarSize = extended ? UIDimens.AVATAR_DRAWER_BIG_MOB : UIDimens.AVATAR_DRAWER_SMALL_MOB;
          final double iconSize = extended ? 22 : 0;
          final double buttonDiameter = extended ? 25 : 0;

          return AnimatedContainer(
            duration: Durations.medium2,
            width: extended ? 220 : 90,
            height: 180,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                Expanded(
                  child: EditableAvatarWdg(
                    imageUrl: authService.userSessionDM?.user.avatarUrl ?? '',
                    size: avatarSize,
                    iconSize: iconSize,
                    buttonDiameter: buttonDiameter,
                    paddingAll: 0,
                    avatarType: AvatarType.user,
                    onPressed: () async => await pickImage(context)
                        .then((path) => path.isNotEmpty ? cubit.updateProfilePhoto(path) : null),
                  ),
                ),
              ],
            ),
          );
        },
        items: [
          SidebarXItem(
            onTap: () {
              navigator.appRouter
                  .goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: authService.uuid});

              cubit.updateSelectedIndex(0);
              FoodlyMainScaffold.toggleDrawer();
            },
            iconBuilder: (p1, p2) =>
                FoodlyIsoIconBehavior(height: 16, version: p1 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
            label: S.current.home,
          ),
          if (authService.userIsManager)
            SidebarXItem(
              onTap: () {
                navigator.appRouter.goNamed(AppRoutes.myBusiness.name, pathParameters: {
                  AppRoutes.routeIdParam: authService.userSessionDM?.user.business.first.uuid ?? ''
                });

                cubit.updateSelectedIndex(1);
                FoodlyMainScaffold.toggleDrawer();
              },
              icon: Icons.business_center_rounded,
              label: S.current.dashboard,
            ),
          SidebarXItem(
            onTap: () {
              navigator.appRouter
                  .goNamed(AppRoutes.profileScreen.name, pathParameters: {AppRoutes.routeIdParam: authService.uuid});

              cubit.updateSelectedIndex(2);
              FoodlyMainScaffold.toggleDrawer();
            },
            icon: Bootstrap.person_vcard_fill,
            label: S.current.profile,
          ),
          SidebarXItem(
            onTap: () {
              navigator.appRouter.goNamed(AppRoutes.myReservations.name);

              cubit.updateSelectedIndex(3);
              FoodlyMainScaffold.toggleDrawer();
            },
            icon: Bootstrap.calendar2_event,
            label: S.current.myReservations,
          ),
          SidebarXItem(
            iconBuilder: (p1, p2) =>
                FoodlyLogoIconBehavior(height: 8, version: p1 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
            label: S.current.about,
          ),
          SidebarXItem(icon: Bootstrap.mailbox2_flag, label: S.current.contactUs),
          SidebarXItem(icon: Bootstrap.share_fill, label: S.current.recommend),
          SidebarXItem(
            onTap: () {
              FoodlyMainScaffold.toggleDrawer();
              authService.logout(rootNavigatorKey.currentContext ?? context);
            },
            icon: Bootstrap.door_open_fill,
            label: S.current.logout,
          ),
        ],
      ),
    );
  }
}
