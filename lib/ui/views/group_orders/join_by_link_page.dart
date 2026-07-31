import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show di, LoadingWidgetFoodlyLogo;
import 'package:foodly_world/core/services/pending_group_join.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:go_router/go_router.dart';

/// Destino del App Link `foodly.solutions/join/{code}` (F3a).
///
/// Flujo: espera brevemente la restauración de sesión del arranque →
///  - con sesión: join automático por código y navegación a la orden;
///  - sin sesión: estaciona el código en [PendingGroupJoin] (lo consume
///    AuthSessionService.setSession tras el login) y manda al login.
class JoinByLinkPage extends StatefulWidget {
  final String code;
  const JoinByLinkPage({super.key, required this.code});

  @override
  State<JoinByLinkPage> createState() => _JoinByLinkPageState();
}

class _JoinByLinkPageState extends State<JoinByLinkPage> {
  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    final auth = di<AuthSessionService>();

    // El App Link puede llegar en cold-start: la sesión cacheada tarda unos
    // instantes en restaurarse. Espera corta y acotada.
    for (var i = 0; i < 20 && auth.hasPendingSessionRestore; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
    if (!mounted) return;

    if (!auth.isLoggedIn) {
      PendingGroupJoin.code = widget.code;
      context.goNamed(AppRoutes.login.name);
      return;
    }

    final cubit = di<ActiveGroupOrderCubit>();
    final ok = await cubit.joinWithCode(widget.code);
    if (!mounted) return;

    if (ok && cubit.state != null) {
      context.goNamed(
        AppRoutes.groupOrder.name,
        pathParameters: {AppRoutes.routeIdParam: cubit.state!.uuid},
      );
    } else {
      FoodlySnackbars.errorGeneric(context, S.current.groupOrderJoinFailed);
      context.goNamed(AppRoutes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LoadingWidgetFoodlyLogo()));
  }
}
