import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/main_drawer.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage369 extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const HomePage369({super.key, required this.navigationShell, required this.children});

  @override
  State<HomePage369> createState() => _HomePage369State();
}

class _HomePage369State extends State<HomePage369> with TickerProviderStateMixin {
  final _sidebarController = SidebarXController(selectedIndex: 0);
  final _bottomNavIndex = ValueNotifier<int>(0);
  late TabController _tabController;
  final userId = di<AuthSessionService>().userSessionDM?.user.userId;

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
    _sidebarController.dispose();
    super.dispose();
  }

  void navigateTo(int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.savedPromotions.name, pathParameters: {AppRoutes.routeIdParam: userId ?? ''});
        break;
      case 1:
        context.goNamed(AppRoutes.favedBusiness.name, pathParameters: {AppRoutes.routeIdParam: userId ?? ''});
        break;
      case 2:
        context.goNamed(AppRoutes.usersCommunity.name, pathParameters: {AppRoutes.routeIdParam: userId ?? ''});
        break;
      case 3:
        context.goNamed(AppRoutes.notifications.name, pathParameters: {AppRoutes.routeIdParam: userId ?? ''});
        break;
      case 4:
        context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: userId ?? ''});

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: ValueListenableBuilder(
        valueListenable: _bottomNavIndex,
        builder: (_, indexValue, __) {
          return BlocBuilder<MainDrawerCubit, MainDrawerState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (vm) => _buildContent(indexValue, vm),
                updatingAvatar: (vm) => _buildContent(indexValue, vm),
                orElse: () => const SizedBox.shrink(),
              );
            },
          );
        },
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

  Widget _buildContent(int indexValue, MainDrawerVM vm) {
    return Scaffold(
      key: vm.scaffoldKey,
      drawer: FoodlyDrawer(sidebarController: _sidebarController),
      body: _buildTabBarView().paddingBottom(40),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        splashColor: FoodlyThemes.tertiaryFoodly.withOpacity(.5),
        onPressed: () {
          _bottomNavIndex.value = 4;
          navigateTo(4);
        },
        shape: const CircleBorder(),
        child: FoodlyLogoIconBehavior(
            height: 26, version: indexValue == 4 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        activeIndex: indexValue,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        splashColor: FoodlyThemes.tertiaryFoodly.withOpacity(.5),
        onTap: (index) {
          _bottomNavIndex.value = index;
          navigateTo(index);
        },
        itemCount: UIIconsData.bottomNavigationIcons.length,
        tabBuilder: (int index, bool isActive) => UIIconsData.bottomNavigationIcons[index] == Bootstrap.shop_window
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    UIIconsData.bottomNavigationIcons[index],
                    size: 24,
                    color: isActive ? FoodlyThemes.primaryFoodly : Colors.black.withOpacity(.75),
                  ),
                  Icon(
                    Bootstrap.heart_fill,
                    size: 14,
                    color: isActive ? FoodlyThemes.primaryFoodly : const Color(0xFF313030),
                  ).paddingOnly(bottom: 16, left: 12),
                ],
              )
            : Icon(
                UIIconsData.bottomNavigationIcons[index],
                size: 24,
                color: isActive ? FoodlyThemes.primaryFoodly : Colors.black.withOpacity(.75),
              ),
      ),
    );
  }
}
