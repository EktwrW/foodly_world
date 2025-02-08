import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_utilities.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';

import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_category_builder_wdg.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_floating_action_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final ScrollController _scrollController;
  final _isFabVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      // Verificar si está scrolleando basado en el offset
      if (_scrollController.position.pixels != _scrollController.position.minScrollExtent &&
          _scrollController.position.isScrollingNotifier.value) {
        _hideFab();
      } else {
        _showFab();
      }
    });
  }

  Future<void> _hideFab() async {
    await Future.delayed(Durations.short2);
    if (mounted) _isFabVisible.value = false;
  }

  Future<void> _showFab() async {
    await Future.delayed(Durations.short2);
    if (mounted) _isFabVisible.value = true;
  }

  String get _publicMenuUrl {
    final baseUrl = di<BaseConfig>().foodlyBaseUrl;
    final cleanLocation = di<AppRouter>().currentLocation.replaceAll('/main', '');

    return '$baseUrl$cleanLocation';
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) {
            di<DialogService>().showLoading();
          },
          loaded: (vm) => di<DialogService>().hideLoading(),
          showSnackbar: (vm, msg) {
            di<DialogService>().hideLoading();
            if (context.mounted) {
              FoodlySnackbars.successGeneric(context, msg);
            }
          },
          error: (msg, vm) {
            di<DialogService>().hideLoading();
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

  Widget _buildMenuWdg(BuildContext context, MenuVM vm) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
          valueListenable: _isFabVisible,
          child: MenuFloatingActionButton(
            floatingButtonKey: vm.floatingButtonKey,
            loggedUserCanEdit: vm.loggerUserCanEdit,
            menuUrl: _publicMenuUrl,
            businessName: vm.menuDM?.business?.name ?? '-',
          ),
          builder: (_, visible, child) {
            return AnimatedOpacity(
              opacity: visible ? UiUtilities.sliverVisibleOpacity : UiUtilities.sliverHiddenOpacity,
              duration: Durations.medium1,
              child: child,
            );
          }),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          const PrimaryMenuSliverAppBar(),
          const SecondaryMenuSliverAppBar(),
        ],
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              _hideFab();
            } else {
              _showFab();
            }
            return true;
          },
          child: PageView.builder(
            controller: vm.controller,
            physics: vm.menuIsEditing ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
            itemCount: MenuCategory.values.length,
            onPageChanged: (i) => context.read<MenuCubit>().updateView(i),
            itemBuilder: (context, index) {
              final category = MenuCategory.values[index];

              return GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                onLongPressStart: (_) async => await _hideFab(),
                onLongPressEnd: (_) async => await _showFab(),
                onLongPressCancel: () async => await _showFab(),
                child: MenuCategoryBuilder(
                  key: ValueKey(category),
                  categories: vm.menuScreens[category],
                  vm: vm,
                  menuCategory: category,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
