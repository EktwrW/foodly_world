import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/greeting_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/main_app_search_widget.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class Home369AppBarMobile extends StatelessWidget {
  const Home369AppBarMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 85,
      leadingWidth: 0,
      collapsedHeight: 150,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // var expandedRatio = constraints.biggest.height / 220.0;
          // var opacity = expandedRatio.clamp(0, 1).toDouble();
          // var titleFontSize = opacity * 30;

          return FlexibleSpaceBar(
            expandedTitleScale: 1,
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.screenWidth * .7,
                          child: FittedBox(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.scaleDown,
                              child: GreetingWidget(
                                  userName: di<AuthSessionService>().userSessionDM?.user.username, titleFontSize: 24)),
                        ),
                        Text(
                          S.current.readyToFindSomethingInteresting,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.homeAppBarMobile,
                        ),
                      ],
                    ),
                    BlocBuilder<MainDrawerCubit, MainDrawerState>(
                      builder: (context, state) {
                        Widget buildButton(MainDrawerVM vm) => RoundedButtonMobileFoodly(
                              diameter: 30,
                              depth: 3,
                              shape: NeumorphicShape.concave,
                              iconData: Bootstrap.menu_button_wide_fill,
                              iconSize: 22,
                              onPressed: () => vm.scaffoldKey?.currentState?.openDrawer(),
                            );

                        return state.maybeWhen(
                          loaded: (vm) => buildButton(vm),
                          updatingAvatar: (vm) => buildButton(vm),
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ).paddingAll(6),
                  ],
                ).paddingOnly(left: 12, right: 6),
                const SearchWidget(),
              ],
            ),
            background: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(alignment: Alignment.center, color: Colors.white),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: .75, sigmaY: .75),
                    child: Container(
                      alignment: Alignment.center,
                      color: FoodlyThemes.primaryFoodly.withOpacity(0.3),
                    ),
                  ),
                  Positioned(
                    left: -35,
                    bottom: -10,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                      child: Opacity(
                        opacity: .15,
                        child: Asset(
                          FoodlyAssets.isoFoodlyWhite,
                          fit: BoxFit.fitHeight,
                          height: context.screenHeight / 4.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
