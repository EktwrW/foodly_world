import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show AppRouter, di, PaddingExtension, MainDrawerCubit, ReadContext;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Brand, Brands;
import 'package:share_plus/share_plus.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // TODO: replace with actual store URLs before release
  static const _googlePlayUrl = '';
  static const _appStoreUrl = '';

  @override
  Widget build(BuildContext context) {
    final s = S.current;
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();
        if (!router.isOnShellRoute) {
          router.goBackToLastRoute();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          actions: [
            Text(
              s.about,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
            ).paddingOnly(right: 18),
          ],
          leading: CustomRoundedNeumorphicButton(
            iconSize: 26,
            diameter: 32,
            iconData: Bootstrap.caret_left_fill,
            onPressed: () {
              if (context.canPop()) {
                di<AppRouter>().removeLastRouteHistory();
                context.pop();
              } else {
                di<AppRouter>().goBackToLastRoute();
              }
              context.read<MainDrawerCubit>().goToPreviousIndex();
            },
          ).paddingSymmetric(vertical: 8, horizontal: 8),
          leadingWidth: 60,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                  children: [
                    // Header: logo + tagline
                    FadeIn(
                      child: Column(
                        children: [
                          const Asset(FoodlyAssets.logo, height: 30),
                          const SizedBox(height: 10),
                          Text(
                            s.aboutTagline,
                            textAlign: TextAlign.center,
                            style: FoodlyTextStyles.label.copyWith(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Video placeholder
                    FadeInUp(
                      delay: const Duration(milliseconds: 100),
                      child: _VideoPlaceholder(label: s.aboutVideoPlaceholder),
                    ),
                    const SizedBox(height: 28),

                    // Content sections
                    FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      child: _ContentSection(
                        icon: Bootstrap.lightbulb,
                        title: s.aboutMissionTitle,
                        body: s.aboutMission,
                        colorScheme: colorScheme,
                      ),
                    ),
                    const Divider(height: 32),
                    FadeInUp(
                      delay: const Duration(milliseconds: 300),
                      child: _ContentSection(
                        icon: Bootstrap.shop,
                        title: s.aboutForBusinessTitle,
                        body: s.aboutForBusiness,
                        colorScheme: colorScheme,
                      ),
                    ),
                    const Divider(height: 32),
                    FadeInUp(
                      delay: const Duration(milliseconds: 400),
                      child: _ContentSection(
                        icon: Bootstrap.people,
                        title: s.aboutForCustomersTitle,
                        body: s.aboutForCustomers,
                        colorScheme: colorScheme,
                      ),
                    ),
                    const Divider(height: 32),
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      child: _ContentSection(
                        icon: Bootstrap.gift,
                        title: s.aboutFreeTitle,
                        body: s.aboutFree,
                        colorScheme: colorScheme,
                      ),
                    ),
                    const Divider(height: 32),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      child: _ContentSection(
                        icon: Bootstrap.rocket_takeoff,
                        title: s.aboutEvolvingTitle,
                        body: s.aboutEvolving,
                        colorScheme: colorScheme,
                      ),
                    ),
                  ],
                ),
              ),

              // Footer: share buttons
              _ShareFooter(s: s),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Video Placeholder ──────────────────────────────────────────────

class _VideoPlaceholder extends StatelessWidget {
  const _VideoPlaceholder({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            FoodlyThemes.primaryFoodly.withValues(alpha: 0.85),
            FoodlyThemes.primaryFoodly.withValues(alpha: 0.55),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Subtle background icon
          Positioned(
            right: 20,
            bottom: 16,
            child: Icon(
              Bootstrap.camera_video,
              size: 80,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.18),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 2),
                ),
                child: const Icon(Bootstrap.play_fill, color: Colors.white, size: 26),
              ),
              const SizedBox(height: 14),
              Text(
                label,
                style: FoodlyTextStyles.label.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Content Section ────────────────────────────────────────────────

class _ContentSection extends StatelessWidget {
  const _ContentSection({
    required this.icon,
    required this.title,
    required this.body,
    required this.colorScheme,
  });

  final IconData icon;
  final String title;
  final String body;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 16,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, size: 18, color: colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: FoodlyTextStyles.label.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: colorScheme.onSurface,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          body,
          style: FoodlyTextStyles.label.copyWith(
            height: 1.65,
            fontSize: 13,
            color: colorScheme.onSurface.withValues(alpha: 0.80),
          ),
        ),
      ],
    );
  }
}

// ─── Share Footer ───────────────────────────────────────────────────

class _ShareFooter extends StatelessWidget {
  const _ShareFooter({required this.s});
  final S s;

  Future<void> _shareApp(String storeUrl) async {
    final text = s.shareAppMessage;
    final shareText = storeUrl.isNotEmpty ? '$text\n\n$storeUrl' : text;
    await Share.share(shareText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 20, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ShareButton(
              onPressed: () => _shareApp(AboutPage._googlePlayUrl),
              icon: Brand(Brands.google_play, size: 22),
              label: s.shareOnAndroid,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ShareButton(
              onPressed: () => _shareApp(AboutPage._appStoreUrl),
              icon: Brand(Brands.apple_logo,
                  size: 22, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              label: s.shareOnIOS,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: FoodlyThemes.primaryFoodly,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
