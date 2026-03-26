import 'dart:ui';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/main.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/greeting_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart';

class Home369AppBarMobile extends StatelessWidget {
  const Home369AppBarMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 149,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 85,
      leadingWidth: 0,
      collapsedHeight: 149,
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
                      spacing: 2,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.screenWidth * .73,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: GreetingWidget(
                              userName: di<AuthSessionService>().userSessionDM?.user.firstName?.split(' ').first,
                              titleFontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomRoundedNeumorphicButton(
                      diameter: 31,
                      shape: ui.NeumorphicShape.concave,
                      iconSize: 22,
                      onPressed: () => FoodlyMainScaffold.toggleDrawer(),
                    ).paddingHorizontal(6),
                  ],
                ).paddingOnly(left: 12, right: 6, bottom: 3),
                Text(
                  S.current.whatAreYouCravingToday,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.homeAppBarSmallSubtitle,
                ).paddingVertical(3),
                const SearchWidget().paddingBottom(12),
              ],
            ),
            background: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
