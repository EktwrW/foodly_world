import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final _authService = di<AuthSessionService>();

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final vm = state.vm;
          final bloc = context.read<DashboardBloc>();

          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, value) => [
                SliverAppBar(
                  centerTitle: true,
                  toolbarHeight: 70,
                  leadingWidth: 60,
                  expandedHeight: 360,
                  collapsedHeight: 140,
                  pinned: true,
                  floating: true,
                  title: Text(
                    S.current.dashboard,
                    style: FoodlyTextStyles.secondaryTitle,
                  ),
                  leading: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AvatarWidget(
                          avatarUrl: _authService.userSessionDM?.user.avatarUrl,
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    RoundedButtonMobileFoodly(
                      shape: ui.NeumorphicShape.concave,
                      iconSize: 26,
                      depth: 2,
                      diameter: 30,
                      iconData: Bootstrap.door_open_fill,
                      onPressed: () => di<AppRouter>().goBackToLastRoute(context),
                    ).paddingOnly(right: 15),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.zero,
                    centerTitle: true,
                    title: const Text('titulo flexible'),
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: ColoredBox(
                              color: FoodlyThemes.primaryFoodly.withOpacity(0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  EditableAvatarWdg(
                                    onPressed: () async =>
                                        await pickImageFile(context, ImageSource.gallery).then((path) => bloc),
                                    avatarType: AvatarType.business,
                                    size: const Size(130, 130),
                                    paddingAll: 0,
                                    imagePath: vm.logoPath,
                                  ),
                                ],
                              ),
                            ),
                          ).paddingOnly(top: 16),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  ),
                ),
              ],
              body: Form(
                key: vm.formKey,
                autovalidateMode: vm.autovalidateMode,
                child: const SingleChildScrollView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
