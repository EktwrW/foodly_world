import 'package:collection/collection.dart' show ListExtensions;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_category_builder_wdg.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_floating_action_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (vm) => _buildMenuWdg(context, vm),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildMenuWdg(BuildContext context, MenuVM vm) {
    return Scaffold(
      floatingActionButton: MenuFloatingActionButton(
        floatingButtonKey: vm.floatingButtonKey,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          const PrimaryMenuSliverAppBar(),
          const SecondaryMenuSliverAppBar(),
        ],
        body: PageView(
          controller: vm.controller,
          onPageChanged: (i) => context.read<MenuCubit>().updateView(i),
          children: MenuCategory.values
              .mapIndexed(
                (index, category) => MenuCategoryBuilder(
                  key: ValueKey(index),
                  categoryItems: vm.menuScreens[category],
                  vm: vm,
                  menuCategory: category,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
