import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_client.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_repo.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_cubit.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_state.dart';

/// Public menu page — served at menu.foodly.solutions/{businessUuid}.
///
/// Wire up in GoRouter (detect hostname first):
///   if (Uri.base.host.startsWith('menu.')) {
///     GoRoute(path: '/:businessUuid',
///       builder: (ctx, state) => PublicMenuPage(
///         businessUuid: state.pathParameters['businessUuid']!,
///         dio: di<Dio>(),
///       ))
///   }
class PublicMenuPage extends StatelessWidget {
  final String businessUuid;
  final Dio dio;

  const PublicMenuPage({super.key, required this.businessUuid, required this.dio});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PublicMenuCubit(
        repo: PublicMenuRepo(client: PublicMenuClient(dio)),
      )..load(businessUuid),
      child: const _PublicMenuView(),
    );
  }
}

class _PublicMenuView extends StatelessWidget {
  const _PublicMenuView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PublicMenuCubit, PublicMenuState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (business, menu) {
              // TODO: build your UI here — business + menu data are ready.
              // business: BusinessDM (logo, name, address, opening hours, category…)
              // menu: MenuDM (foodCategories, drinkCategories, combos)
              return Center(child: Text(business.name ?? ''));
            },
          );
        },
      ),
    );
  }
}
