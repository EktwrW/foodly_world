import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/image/logo_foodly_icon_behavior.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
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

  @override
  void initState() {
    _bottomNavIndex.value = widget.navigationShell.currentIndex;
    _hideBottomBarAnimationController = AnimationController(vsync: this, duration: Durations.medium2);
    _tabController = TabController(
      initialIndex: widget.navigationShell.currentIndex,
      length: widget.children.length,
      vsync: this,
      animationDuration: Duration.zero,
    );

    super.initState();
    _checkPendingReservations();

    final mainDrawerCubit = context.read<MainDrawerCubit>();

    if (mainDrawerCubit.state.vm.currentIndex != 0) {
      mainDrawerCubit.updateSelectedIndex(0);
    }
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

  void _checkPendingReservations() async {
    final authService = di<AuthSessionService>();
    if (!authService.userIsManager) return;

    final businesses = authService.userSessionDM?.user.business ?? [];
    if (businesses.isEmpty) return;

    // Small delay to let the UI settle after login
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;

    final repo = di<ReservationRepo>();
    final result = await repo.getPendingCount();

    result.when(
      success: (response) {
        if (!mounted || response.pendingCount == 0) return;

        final count = response.pendingCount;
        final firstBusiness = businesses.first;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => FadeIn(
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              icon: const Icon(Bootstrap.calendar2_check, size: 40, color: FoodlyThemes.primaryFoodly),
              backgroundColor: Colors.white,
              title: Text(
                count == 1 ? S.current.pendingReservationsAlertOne : S.current.pendingReservationsAlertMany(count),
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.actionsBodyBold,
              ),
              content: Text(
                S.current.pendingReservationsContent,
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(
                    S.current.doItLater,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
                const SizedBox(height: 20),
                CustomNeumorphicButton(
                  disabled: false,
                  onPressed: () {
                    Navigator.pop(ctx);
                    context.goNamed(
                      AppRoutes.manageReservations.name,
                      pathParameters: {AppRoutes.routeIdParam: firstBusiness.uuid},
                      queryParameters: {'filter': 'pending'},
                      extra: firstBusiness,
                    );
                  },
                  text: S.current.manageReservations,
                  fontSize: 13,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ],
            ),
          ),
        );
      },
      failure: (_) {},
    );
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
    return BlocConsumer<SmartSearchCubit, SmartSearchState>(
      // Only animate the controller when the flag actually flips.
      listenWhen: (prev, curr) => prev.vm.isBottomBarHidden != curr.vm.isBottomBarHidden,
      listener: (_, state) {
        if (state.vm.isBottomBarHidden) {
          _hideBottomBarAnimationController.forward();
        } else {
          _hideBottomBarAnimationController.reverse();
        }
      },
      builder: (_, state) {
        final isHidden = state.vm.isBottomBarHidden;
        // After every build (including post-pop rebuilds where the cubit state
        // did NOT change), re-assert the controller to its expected position.
        // The guard prevents snapping while a smooth animation is in progress.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || _hideBottomBarAnimationController.isAnimating) return;
          final expected = isHidden ? 1.0 : 0.0;
          if ((_hideBottomBarAnimationController.value - expected).abs() > 0.01) {
            _hideBottomBarAnimationController.value = expected;
          }
        });
        return ValueListenableBuilder(
          valueListenable: _bottomNavIndex,
          builder: (_, indexValue, __) => _buildContent(indexValue, isHidden, state.vm),
        );
      },
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: widget.children,
    );
  }

  Widget _buildContent(int indexValue, bool isHidden, SmartSearchVM vm) {
    final smartSearchCubit = context.read<SmartSearchCubit>();

    return Scaffold(
      body: _buildTabBarView(),
      extendBody: true,
      floatingActionButton: isHidden
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 6,
              children: [
                ViewModeToggleButton(
                  key: const Key('main-page-smart-search-view-mode-toggle-button'),
                  onPressed: vm.searchResults.isNotEmpty ? () => smartSearchCubit.toggleViewMode() : null,
                  isGrid: vm.viewMode.isGrid,
                ).paddingAll(6),
                CustomRoundedNeumorphicButton(
                  onPressed: () => smartSearchCubit.clearSearch(),
                  diameter: 26,
                  depth: 3,
                  shape: ui.NeumorphicShape.concave,
                  child: const Icon(Bootstrap.eraser_fill, color: FoodlyThemes.primaryFoodly),
                ).paddingAll(6),
              ],
            ).paddingOnly(bottom: context.screenHeight * .025, right: 12)
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
          isHidden ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _FoodlyBottomNavBar(
        onTap: (index) {
          _bottomNavIndex.value = index;
          navigateTo(index);
        },
        activeIndex: indexValue,
        hideBottomBarAnimationController: _hideBottomBarAnimationController,
      ),
    );
  }
}
