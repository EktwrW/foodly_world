import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Puente web del onboarding de Stripe. El return_url/refresh_url del
/// AccountLink apunta a menu.foodly.solutions/stripe/{return|refresh}: en el
/// móvil el App Link abre la app, pero la pestaña del navegador queda viva
/// cargando esta URL — antes caía al NotFound ("la ruta solicitada no
/// existe", bug e2e F4a). Esta página la atiende con un mensaje amable.
class StripeBridgePage extends StatelessWidget {
  /// true = /stripe/return (onboarding terminado); false = /stripe/refresh
  /// (flujo incompleto o link vencido — se retoma desde la app).
  final bool completed;

  const StripeBridgePage({super.key, required this.completed});

  @override
  Widget build(BuildContext context) {
    final color = completed ? FoodlyThemes.tertiaryFoodly : const Color(0xFFB87400);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  completed ? Icons.check_circle_rounded : Icons.hourglass_top_rounded,
                  color: color,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                completed
                    ? S.current.stripeBridgeReturnTitle
                    : S.current.stripeBridgeRefreshTitle,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.sectionsTitle,
              ),
              const SizedBox(height: 8),
              Text(
                completed
                    ? S.current.stripeBridgeReturnBody
                    : S.current.stripeBridgeRefreshBody,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
