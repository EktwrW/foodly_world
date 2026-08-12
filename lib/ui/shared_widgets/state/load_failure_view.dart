import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Pantalla de "no pudimos cargar esto" con reintento.
///
/// Existe porque el caso de uso es una mesa de restaurante con señal irregular,
/// y sin esto los dos accesos al feature fallaban en silencio: la orden se
/// quedaba en un spinner infinito y el panel del negocio decía "No hay
/// órdenes" —con mesas vivas esperando— cuando en realidad la llamada había
/// fallado (auditoría 2026-08-12).
///
/// Deliberadamente NO muestra el error crudo del backend: llega en inglés y
/// con nombres de campo del API. Un mensaje humano y un botón que funcione
/// valen más que un diagnóstico que el comensal no puede accionar.
class LoadFailureView extends StatelessWidget {
  final VoidCallback onRetry;

  /// Mensaje propio si el genérico no encaja. Nunca el `toString()` de la
  /// excepción.
  final String? message;

  const LoadFailureView({super.key, required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    // Scrollable para que el pull-to-refresh siga funcionando aunque el
    // contenido no llene la pantalla: en una lista vacía, tirar hacia abajo es
    // el primer reflejo de cualquiera.
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off_rounded, size: 40, color: FoodlyThemes.primaryFoodly),
                  const SizedBox(height: 12),
                  Text(
                    message ?? S.current.loadFailedMessage,
                    textAlign: TextAlign.center,
                    style: FoodlyTextStyles.caption,
                  ),
                  const SizedBox(height: 20),
                  // Área táctil cómoda: se toca con prisa y a veces de pie.
                  TextButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded, size: 20),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(120, 48),
                      foregroundColor: FoodlyThemes.primaryFoodly,
                    ),
                    label: Text(S.current.loadFailedRetry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
