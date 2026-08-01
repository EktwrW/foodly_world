import 'dart:async';

import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/services/pending_group_join.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:go_router/go_router.dart';

/// Destino del App Link `foodly.solutions/join/{code}` (F3a).
///
/// Flujo: espera brevemente la restauración de sesión del arranque →
///  - con sesión: join automático por código y navegación a la orden;
///  - sin sesión: estaciona el código en [PendingGroupJoin] (lo consume
///    AuthSessionService.setSession tras el login) y manda al login.
///
/// Bug e2e ronda 3: ante un fallo la página quedaba clavada en loading sin
/// salida — ahora muestra estado de error con botón de escape.
class JoinByLinkPage extends StatefulWidget {
  final String code;
  const JoinByLinkPage({super.key, required this.code});

  @override
  State<JoinByLinkPage> createState() => _JoinByLinkPageState();
}

class _JoinByLinkPageState extends State<JoinByLinkPage> {
  bool _failed = false;

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
      // El redirect global ya estacionó el código (cinturón y tirantes acá).
      PendingGroupJoin.code = widget.code.toUpperCase();
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
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_failed) {
      return const Scaffold(body: Center(child: LoadingWidgetFoodlyLogo()));
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.link_off_rounded, size: 56, color: FoodlyThemes.secondaryFoodly),
                const SizedBox(height: 16),
                Text(
                  S.current.groupOrderJoinFailed,
                  style: FoodlyTextStyles.sectionsTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomNeumorphicButton(
                  text: S.current.groupOrderBackHome,
                  disabled: false,
                  margin: EdgeInsets.zero,
                  onPressed: () => context.goNamed(AppRoutes.start.name),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
