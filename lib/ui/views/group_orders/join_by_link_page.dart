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
  String? _failureDetail;

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

    // Con sesión: esta página ES la dueña del join — se limpia cualquier
    // código estacionado para que el redirect global no vuelva a desviar
    // acá (loop) cuando naveguemos a la orden.
    PendingGroupJoin.consume();

    final cubit = di<ActiveGroupOrderCubit>();
    final ok = await cubit.joinWithCode(widget.code);
    if (!mounted) return;

    if (ok && cubit.state != null) {
      // UX (decisión e2e r4): tras unirse se aterriza en el MENÚ del negocio
      // para agregar ítems de una — la orden queda activa y visible en el
      // chip flotante. OJO: /visit-menu/:id lleva el uuid del MENÚ (no del
      // negocio) — el BE lo expone como business_menu_uuid. Fallback a la
      // página de la orden si no vino.
      final menuUuid = cubit.state!.businessMenuUuid;
      if (menuUuid != null && menuUuid.isNotEmpty) {
        context.goNamed(
          AppRoutes.visitMenu.name,
          pathParameters: {AppRoutes.routeIdParam: menuUuid},
        );
      } else {
        context.goNamed(
          AppRoutes.groupOrder.name,
          pathParameters: {AppRoutes.routeIdParam: cubit.state!.uuid},
        );
      }
    } else {
      // e2e r5: mostrar la causa REAL cuando el backend la manda ("la orden
      // ya no admite participantes") en vez del genérico "código inválido".
      setState(() {
        _failed = true;
        _failureDetail = cubit.lastJoinError;
      });
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
                  _failureDetail ?? S.current.groupOrderJoinFailed,
                  style: FoodlyTextStyles.sectionsTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomNeumorphicButton(
                  text: S.current.groupOrderBackHome,
                  disabled: false,
                  margin: EdgeInsets.zero,
                  // e2e r5: salida DETERMINISTA. Ir a '/' disparaba la
                  // restauración de LAST_PATH, que en storage viejo podía
                  // ser el propio /join → re-render del error = botón
                  // "muerto". Directo a la main page (o login sin sesión).
                  onPressed: () {
                    final auth = di<AuthSessionService>();
                    if (auth.isLoggedIn) {
                      context.goNamed(
                        AppRoutes.foodlyMainPage.name,
                        pathParameters: {AppRoutes.routeIdParam: auth.uuid},
                      );
                    } else {
                      context.goNamed(AppRoutes.login.name);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
