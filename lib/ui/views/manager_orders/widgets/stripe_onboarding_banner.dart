import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

/// F4a-6 — banner de onboarding de pagos (maqueta 3, dos estados):
/// sin activar → gradiente vivid→plum con CTA que abre el AccountLink de
/// Stripe (Express hosted, navegador externo); activo → confirmación
/// compacta con refresco manual (al volver del onboarding).
class StripeOnboardingBanner extends StatelessWidget {
  /// Test hook: reemplaza el url_launcher (default: navegador externo).
  final Future<void> Function(Uri url)? onLaunch;

  const StripeOnboardingBanner({super.key, this.onLaunch});

  Future<void> _activate(BuildContext context, StripeOnboardingCubit cubit) async {
    final url = await cubit.startOnboarding();
    if (url == null) return;
    final launch = onLaunch ?? (u) => launchUrl(u, mode: LaunchMode.externalApplication);
    await launch(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StripeOnboardingCubit>();

    return BlocBuilder<StripeOnboardingCubit, StripeOnboardingState>(
      builder: (context, state) {
        // Sin datos aún (o consulta fallida): no ocupamos espacio.
        final charges = state.chargesEnabled;
        if (charges == null) return const SizedBox.shrink();

        if (charges) {
          // Estado activo — compacto.
          return Container(
            margin: const EdgeInsets.fromLTRB(14, 8, 14, 0),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.35)),
            ),
            child: Row(
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    color: FoodlyThemes.tertiaryFoodly,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.managerPaymentsActive, style: FoodlyTextStyles.labelBold),
                      Text(
                        S.current.managerPaymentsActiveSub,
                        style: FoodlyTextStyles.caption.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        // Sin activar — banner CTA (gradiente vivid→plum de la maqueta).
        return Container(
          margin: const EdgeInsets.fromLTRB(14, 8, 14, 0),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [FoodlyThemes.secondaryFoodly, FoodlyThemes.primaryFoodly],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.35),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      S.current.managerActivatePaymentsTitle,
                      style: FoodlyTextStyles.labelBold.copyWith(color: Colors.white),
                    ),
                  ),
                  // Refresco manual: al volver del onboarding de Stripe.
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    tooltip: S.current.managerPaymentsRefresh,
                    onPressed: cubit.load,
                    icon: const Icon(Icons.refresh_rounded, color: Colors.white, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                S.current.managerActivatePaymentsBody,
                style: FoodlyTextStyles.caption.copyWith(color: Colors.white.withValues(alpha: 0.9)),
              ),
              const SizedBox(height: 10),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _activate(context, cubit),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    child: Text(
                      S.current.managerActivateWithStripe,
                      style: FoodlyTextStyles.captionPurpleBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
