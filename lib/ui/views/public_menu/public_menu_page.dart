import 'package:dio/dio.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart' show MenuCategory;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_client.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart' hide CategoryDM;
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/constants/ui_utilities.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_cubit.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_state.dart';
import 'package:foodly_world/ui/views/public_menu/widgets/public_menu_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/public_menu/widgets/public_menu_category_page.dart';
import 'package:foodly_world/ui/views/public_menu/widgets/public_menu_fab.dart';
import 'package:foodly_world/ui/views/public_menu/widgets/public_menu_footer_wdg.dart' show PublicMenuFooterWdg;

/// Public menu page — served at menu.foodly.solutions/{businessUuid}.
class PublicMenuPage extends StatelessWidget {
  final String businessUuid;
  final Dio dio;

  const PublicMenuPage({super.key, required this.businessUuid, required this.dio});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: BlocProvider(
          create: (_) => PublicMenuCubit(
            repo: PublicMenuRepo(client: PublicMenuClient(dio)),
          )..load(businessUuid),
          child: const _PublicMenuView(),
        ),
      ),
    );
  }
}

class _PublicMenuView extends StatefulWidget {
  const _PublicMenuView();

  @override
  State<_PublicMenuView> createState() => _PublicMenuViewState();
}

class _PublicMenuViewState extends State<_PublicMenuView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final ScrollController _scrollController;
  late final PageController _pageController;
  late final ValueNotifier<bool> _isFabVisible;
  late final ValueNotifier<int> _tabIndex;
  late final GlobalKey<FabCircularMenuPlusState> _fabKey;
  bool _isProcessingScroll = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController();
    _isFabVisible = ValueNotifier(true);
    _tabIndex = ValueNotifier(0);
    _fabKey = GlobalKey<FabCircularMenuPlusState>();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_isProcessingScroll) return;
      _isProcessingScroll = true;
      Future.delayed(Durations.short2, () async {
        if (_scrollController.position.pixels != _scrollController.position.minScrollExtent &&
            _scrollController.position.isScrollingNotifier.value) {
          await _hideFab();
        } else {
          await _showFab();
        }
        _isProcessingScroll = false;
      });
    });
  }

  Future<void> _hideFab() async {
    if (!mounted || !_isFabVisible.value) return;
    _isFabVisible.value = false;
  }

  Future<void> _showFab() async {
    if (!mounted || _isFabVisible.value) return;
    _isFabVisible.value = true;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _isFabVisible.dispose();
    _tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<PublicMenuCubit, PublicMenuState>(
      builder: (context, state) => state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Scaffold(body: MenuShimmer()),
        error: (msg) => Scaffold(body: Center(child: Text(msg))),
        loaded: (business, menu) => _buildMenuWdg(context, business, menu),
      ),
    );
  }

  Widget _buildMenuWdg(BuildContext context, BusinessDM business, MenuDM menu) {
    final currency = business.country?.currencySymbol ?? '\$';
    final menuScreens = <MenuCategory, List<CategoryDM>?>{
      MenuCategory.food: menu.foodCategories,
      MenuCategory.drinks: menu.drinkCategories,
      MenuCategory.combos: [CategoryDM(items: menu.combos, name: MenuCategory.combos.textWith(combosLabel: business.combosLabel), uuid: '')],
    };

    return Scaffold(
      persistentFooterButtons: [
        const PublicMenuFooterWdg(),
      ],
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _isFabVisible,
        builder: (_, visible, child) => AnimatedOpacity(
          opacity: visible ? UiUtilities.sliverVisibleOpacity : UiUtilities.sliverHiddenOpacity,
          duration: Durations.medium1,
          child: child!,
        ),
        child: PublicMenuFab(floatingButtonKey: _fabKey, menu: menu).paddingLeft(context.isMobile ? 0 : 30),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          PublicPrimaryMenuSliverAppBar(business: business),
          PublicSecondaryMenuSliverAppBar(
            pageController: _pageController,
            indexNotifier: _tabIndex,
            combosLabel: business.combosLabel,
          ),
        ],
        body: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: context.isMobile
              ? _buildPageView(menuScreens, currency)
              : Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 999),
                    child: _buildPageView(menuScreens, currency),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildPageView(Map<MenuCategory, List<CategoryDM>?> menuScreens, String currency) {
    return PageView.builder(
      controller: _pageController,
      physics: const PageScrollPhysics(),
      itemCount: MenuCategory.values.length,
      onPageChanged: (i) => _tabIndex.value = i,
      itemBuilder: (context, index) {
        final category = MenuCategory.values[index];
        return RepaintBoundary(
          child: PublicMenuCategoryPage(
            key: ValueKey(category),
            categories: menuScreens[category],
            menuCategory: category,
            currency: currency,
            onScrollStart: _hideFab,
            onScrollEnd: _showFab,
          ),
        );
      },
    );
  }
}
