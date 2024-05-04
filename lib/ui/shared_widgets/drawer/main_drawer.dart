import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sidebarx/sidebarx.dart';

class FoodlyDrawer extends StatelessWidget {
  const FoodlyDrawer({
    super.key,
    required SidebarXController sidebarController,
  }) : _sidebarController = sidebarController;

  final SidebarXController _sidebarController;

  MainDrawerCubit getCubit(BuildContext context) => context.read<MainDrawerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainDrawerCubit(),
      child: BlocConsumer<MainDrawerCubit, MainDrawerState>(
        listener: (context, state) {
          state.whenOrNull(
            updatingAvatar: (_) => di<DialogService>().showLoading(),
            loaded: (_) => di<DialogService>().hideLoading(),
            error: (e, vm) {
              di<DialogService>().hideLoading();
              // TODO: handle error
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
      ),
    );
  }

  Widget _buildSidebarXContent(BuildContext context, MainDrawerVM vm) {
    return SidebarX(
      animationDuration: const Duration(milliseconds: 400),
      controller: _sidebarController,
      theme: const SidebarXTheme(
        width: 90,
        decoration: BoxDecoration(
          color: NeumorphicColors.background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      footerDivider: Column(
        children: [
          IconButton(
            onPressed: () => di<AuthSessionService>().logout(context),
            icon: const Icon(Bootstrap.door_open_fill, size: 32),
            tooltip: S.current.logout,
          ).paddingOnly(bottom: 6),
          const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1, height: 1),
        ],
      ),
      headerDivider: const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1, height: 1),
      extendedTheme: const SidebarXTheme(
        width: 220,
        itemTextPadding: EdgeInsets.only(left: 8),
        selectedItemTextPadding: EdgeInsets.only(left: 10),
        selectedTextStyle: TextStyle(fontWeight: FontWeight.bold, color: FoodlyThemes.primaryFoodly),
        decoration: BoxDecoration(
          color: NeumorphicColors.background,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
      ),
      headerBuilder: (context, extended) {
        final Size avatarSize = extended ? UIDimens.AVATAR_DRAWER_BIG_MOB : UIDimens.AVATAR_DRAWER_SMALL_MOB;
        final double iconSize = extended ? 22 : 0;
        final double buttonDiameter = extended ? 25 : 0;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: extended ? 220 : 90,
          height: 180,
          margin: const EdgeInsets.only(top: 40, bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: EditableAvatarWdg(
                  imageUrl: vm.avatarUrl,
                  size: avatarSize,
                  iconSize: iconSize,
                  buttonDiameter: buttonDiameter,
                  paddingAll: 0,
                  onPressed: () async =>
                      await pickImage(context).then((path) => getCubit(context).updateProfilePhoto(path)),
                ),
              ),
            ],
          ),
        );
      },
      items: [
        if (di<AuthSessionService>().userIsManager)
          SidebarXItem(
            onTap: () => context.goNamed(AppRoutes.businessPanel.name,
                pathParameters: {AppRoutes.routeIdParam: di<AuthSessionService>().userId}),
            icon: Icons.business_center_rounded,
            label: S.current.dashboard,
          ),
        SidebarXItem(
          onTap: () => context.goNamed(AppRoutes.profileScreen.name,
              pathParameters: {AppRoutes.routeIdParam: di<AuthSessionService>().userId}),
          icon: Bootstrap.person_vcard_fill,
          label: S.current.profile,
        ),
        SidebarXItem(icon: Bootstrap.house_gear_fill, label: S.current.account),
        // SidebarXItem(icon: Bootstrap.sliders2, label: S.current.preferences), TODO: move this section to profile page
        SidebarXItem(icon: Icons.history_outlined, label: S.current.myHistory),
        SidebarXItem(
            iconBuilder: (p1, p2) =>
                FoodlyLogoIconBehavior(height: 16, version: p1 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
            label: S.current.about),
        SidebarXItem(icon: Bootstrap.mailbox2_flag, label: S.current.contactUs),
        SidebarXItem(icon: Bootstrap.share_fill, label: S.current.recommend),
      ],
    );
  }
}
