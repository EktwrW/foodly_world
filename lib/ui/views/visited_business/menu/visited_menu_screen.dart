import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_utilities.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/visited_business/menu/widgets/menu_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/visited_business/menu/widgets/visited_menu_category_builder_wdg.dart';
import 'package:foodly_world/ui/views/visited_business/menu/widgets/visited_menu_floating_action_button.dart';

class VisitedMenuScreen extends StatefulWidget {
  const VisitedMenuScreen({super.key});

  @override
  State<VisitedMenuScreen> createState() => _VisitedMenuScreenState();
}

class _VisitedMenuScreenState extends State<VisitedMenuScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final ScrollController _scrollController;
  final _isFabVisible = ValueNotifier<bool>(true);
  bool _isProcessingScroll = false;
  late final DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = di<DialogService>();
    _scrollController = ScrollController();
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

  static const _menuBaseUrl = 'https://menu.foodly.solutions';

  String _publicMenuUrl(MenuVM vm) {
    final uuid = vm.menuDM?.business?.uuid ?? '';
    return uuid.isEmpty ? '' : '$_menuBaseUrl/$uuid';
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isFabVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<VisitedMenuCubit, VisitedMenuState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) {
            // Only show dialog overlay for subsequent loads (menu already has data)
            if (vm.menuDM != null) _dialogService.showLoading();
          },
          loaded: (vm) => _dialogService.hideLoading(),
          showSnackbar: (vm, msg) {
            _dialogService.hideLoading();
            FoodlySnackbars.successGeneric(context, msg);
          },
          error: (msg, vm) {
            _dialogService.hideLoading();
            FoodlySnackbars.errorGeneric(context, msg);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (vm) => vm.menuDM == null ? const MenuShimmer() : _buildMenuWdg(context, vm),
          loaded: (vm) => _buildMenuWdg(context, vm),
          showSnackbar: (vm, _) => _buildMenuWdg(context, vm),
          error: (e, vm) => _buildMenuWdg(context, vm),
          orElse: () => const SizedBox.expand(),
        );
      },
    );
  }

  Widget _buildMenuWdg(BuildContext context, MenuVM vm) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _isFabVisible,
        builder: (_, visible, child) {
          return AnimatedOpacity(
            opacity: visible ? UiUtilities.sliverVisibleOpacity : UiUtilities.sliverHiddenOpacity,
            duration: Durations.medium1,
            child: child!,
          );
        },
        child: MenuFloatingActionButton(
          menu: vm.menuDM,
          floatingButtonKey: vm.floatingButtonKey,
          menuUrl: _publicMenuUrl(vm),
        ),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => const [
          PrimaryMenuSliverAppBar(),
          SecondaryMenuSliverAppBar(),
        ],
        body: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: PageView.builder(
            controller: vm.controller,
            physics: const PageScrollPhysics(),
            itemCount: MenuCategory.values.length,
            onPageChanged: (i) => context.read<VisitedMenuCubit>().updateView(i),
            itemBuilder: (context, index) {
              final category = MenuCategory.values[index];

              return RepaintBoundary(
                child: VisitedMenuCategoryPage(
                  key: ValueKey(category),
                  categories: vm.menuScreens[category],
                  vm: vm,
                  menuCategory: category,
                  onScrollStart: _hideFab,
                  onScrollEnd: _showFab,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
