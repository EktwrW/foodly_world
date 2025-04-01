import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_utilities.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';

import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/view_model/manage_menu_vm.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_category_builder_wdg.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_floating_action_button.dart';

class ManageMenuScreen extends StatefulWidget {
  const ManageMenuScreen({super.key});

  @override
  State<ManageMenuScreen> createState() => _ManageMenuScreenState();
}

class _ManageMenuScreenState extends State<ManageMenuScreen> {
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

      Future.delayed(const Duration(milliseconds: 50), () async {
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

  String get _publicMenuUrl {
    final baseUrl = di<BaseConfig>().foodlyBaseUrl;
    final cleanLocation = di<AppRouter>().currentLocation.replaceAll('/main', '');
    return '$baseUrl$cleanLocation';
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isFabVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageMenuCubit, ManageMenuState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) {
            _dialogService.showLoading();
          },
          loaded: (vm) => _dialogService.hideLoading(),
          showSnackbar: (vm, msg) {
            _dialogService.hideLoading();
            if (context.mounted) {
              FoodlySnackbars.successGeneric(context, msg);
            }
          },
          error: (msg, vm) {
            _dialogService.hideLoading();
            if (context.mounted) {
              FoodlySnackbars.errorGeneric(context, msg);
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (vm) => _buildMenuWdg(context, vm),
          loaded: (vm) => _buildMenuWdg(context, vm),
          showSnackbar: (vm, _) => _buildMenuWdg(context, vm),
          error: (e, vm) => _buildMenuWdg(context, vm),
          orElse: () => const SizedBox.expand(),
        );
      },
    );
  }

  Widget _buildMenuWdg(BuildContext context, ManageMenuVM vm) {
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
          loggedUserCanEdit: vm.loggerUserCanEdit,
          menuUrl: _publicMenuUrl,
        ),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          const PrimaryMenuSliverAppBar(),
          const SecondaryMenuSliverAppBar(),
        ],
        body: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: PageView.builder(
            controller: vm.controller,
            physics: vm.menuIsEditing ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
            itemCount: MenuCategory.values.length,
            onPageChanged: (i) => context.read<ManageMenuCubit>().updateView(i),
            itemBuilder: (context, index) {
              final category = MenuCategory.values[index];

              // Eliminamos el RepaintBoundary para permitir actualizaciones correctas de UI
              return MenuCategoryPage(
                key: ValueKey(category),
                categories: vm.menuScreens[category],
                vm: vm,
                menuCategory: category,
                onScrollStart: _hideFab,
                onScrollEnd: _showFab,
              );
            },
          ),
        ),
      ),
    );
  }
}
