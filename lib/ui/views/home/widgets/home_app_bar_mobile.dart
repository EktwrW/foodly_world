import 'dart:ui';

import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/main.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/greeting_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

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
        builder: (context, constraints) {
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
                    CustomRoundedNeumorphicButton(
                      diameter: 30,
                      depth: 3,
                      shape: NeumorphicShape.concave,
                      iconSize: 22,
                      onPressed: () => FoodlyMainScaffold.toggleDrawer(),
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
                      color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3),
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
