import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'widgets/foodly_bottom_nav_bar.dart';

class HomePage369 extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const HomePage369({super.key, required this.navigationShell, required this.children});

  @override
  State<HomePage369> createState() => _HomePage369State();
}

class _HomePage369State extends State<HomePage369> with TickerProviderStateMixin {
  final _bottomNavIndex = ValueNotifier<int>(0);
  late TabController _tabController;
  final uuid = di<AuthSessionService>().userSessionDM?.user.uuid;

  @override
  void initState() {
    _bottomNavIndex.value = widget.navigationShell.currentIndex;

    _tabController = TabController(
      initialIndex: widget.navigationShell.currentIndex,
      length: widget.children.length,
      vsync: this,
      animationDuration: Duration.zero,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomePage369 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.navigationShell.currentIndex;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void navigateTo(int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.savedPromotions.name, pathParameters: {AppRoutes.routeIdParam: uuid ?? ''});
        break;
      case 1:
        context.goNamed(AppRoutes.favedBusiness.name, pathParameters: {AppRoutes.routeIdParam: uuid ?? ''});
        break;
      case 2:
        context.goNamed(AppRoutes.usersCommunity.name, pathParameters: {AppRoutes.routeIdParam: uuid ?? ''});
        break;
      case 3:
        context.goNamed(AppRoutes.notifications.name, pathParameters: {AppRoutes.routeIdParam: uuid ?? ''});
        break;
      case 4:
        context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: uuid ?? ''});

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: ValueListenableBuilder(
        valueListenable: _bottomNavIndex,
        builder: (_, indexValue, __) => _buildContent(indexValue),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: widget.children,
    );
  }

  Widget _buildContent(int indexValue) {
    return Scaffold(
      body: _buildTabBarView().paddingBottom(40),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        splashColor: FoodlyThemes.tertiaryFoodly.withValues(alpha: .5),
        onPressed: () {
          _bottomNavIndex.value = 4;
          navigateTo(4);
        },
        shape: const CircleBorder(),
        child: FoodlyIsoIconBehavior(
            height: 26, version: indexValue == 4 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _FoodlyBottomNavBar(
        activeIndex: indexValue,
        onTap: (index) {
          _bottomNavIndex.value = index;
          navigateTo(index);
        },
      ),
    );
  }
}
