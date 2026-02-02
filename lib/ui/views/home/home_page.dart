import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart' show ViewModeToggleButton;
import 'package:go_router/go_router.dart';
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
  late final AnimationController _hideBottomBarAnimationController;
  bool _isBottomBarHidden = false;

  @override
  void initState() {
    _bottomNavIndex.value = widget.navigationShell.currentIndex;
    _hideBottomBarAnimationController = AnimationController(vsync: this, duration: Durations.medium2)
      ..addListener(() {
        if (_hideBottomBarAnimationController.value == 1 && !_isBottomBarHidden) {
          _setBottomBarHidden();
        } else if (_hideBottomBarAnimationController.value == 0 && _isBottomBarHidden) {
          _setBottomBarHidden();
        }
      });
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
    _hideBottomBarAnimationController.dispose();
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

  void _setBottomBarHidden() => setState(() => _isBottomBarHidden = !_isBottomBarHidden);

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
    final smartSearchCubit = context.read<SmartSearchCubit>();
    final smartSeachVM = smartSearchCubit.state.vm;

    return BlocListener<SmartSearchCubit, SmartSearchState>(
      listener: (context, state) {
        state.maybeWhen(searchComplete: (vm) {
          _hideBottomBarAnimationController.forward();
        }, searching: (vm) {
          _hideBottomBarAnimationController.forward();
        }, orElse: () {
          _hideBottomBarAnimationController.reverse();
        });
      },
      child: Scaffold(
        body: _buildTabBarView(),
        extendBody: true,
        floatingActionButton: _isBottomBarHidden
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 6,
                children: [
                  ViewModeToggleButton(
                    key: const Key('main-page-smart-search-view-mode-toggle-button'),
                    onPressed: smartSeachVM.searchResults.isNotEmpty ? () => smartSearchCubit.toggleViewMode() : null,
                    isGrid: smartSeachVM.viewMode.isGrid,
                  ).paddingAll(6),
                  CustomRoundedNeumorphicButton(
                    onPressed: () => smartSearchCubit.clearSearch(),
                    diameter: 26,
                    depth: 3,
                    shape: ui.NeumorphicShape.concave,
                    child: const Icon(Bootstrap.eraser_fill, color: FoodlyThemes.primaryFoodly),
                  ).paddingAll(6),
                ],
              ).paddingBottom(16)
            : FloatingActionButton(
                splashColor: FoodlyThemes.tertiaryFoodly.withValues(alpha: .5),
                onPressed: () {
                  _bottomNavIndex.value = 4;
                  navigateTo(4);
                },
                shape: const CircleBorder(),
                child: FoodlyIsoIconBehavior(
                    height: 26, version: indexValue == 4 ? FoodlyLogoVersion.original : FoodlyLogoVersion.black),
              ),
        floatingActionButtonLocation:
            _isBottomBarHidden ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _FoodlyBottomNavBar(
          onTap: (index) {
            _bottomNavIndex.value = index;
            navigateTo(index);
          },
          activeIndex: indexValue,
          hideBottomBarAnimationController: _hideBottomBarAnimationController,
        ),
      ),
    );
  }
}
