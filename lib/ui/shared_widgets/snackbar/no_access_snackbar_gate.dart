import 'package:flutter/material.dart';
import 'package:foodly_world/core/routing/no_access_notice.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';

/// Envuelve la página de aterrizaje de /no-access (el home) y, si hay un
/// [NoAccessNotice] pendiente, muestra el aviso "No tenés acceso a esa
/// sección" tras el primer frame. Transparente si no hay aviso.
class NoAccessSnackbarGate extends StatefulWidget {
  final Widget child;

  const NoAccessSnackbarGate({super.key, required this.child});

  @override
  State<NoAccessSnackbarGate> createState() => _NoAccessSnackbarGateState();
}

class _NoAccessSnackbarGateState extends State<NoAccessSnackbarGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && NoAccessNotice.consume()) {
        FoodlySnackbars.warningGeneric(
          context,
          S.current.noAccessSection,
          duration: const Duration(seconds: 4),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
