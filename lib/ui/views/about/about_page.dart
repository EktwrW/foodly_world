import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show AppRouter, AuthSessionService, di, PaddingExtension, MainDrawerCubit, ReadContext;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart' show YouTubeVideoPlayer;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Brand, Brands;
import 'package:share_plus/share_plus.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  /// YouTube video IDs for the Foodly manifesto, keyed by language code.
  /// Defaults to PT (Portugal launch). Add ES and EN IDs when available.
  static const _manifestoVideoIds = <String, String>{
    'pt': 'eEw8pgI2QQA',
    // 'es': '', // TODO: add Spanish manifesto video ID
    // 'en': '', // TODO: add English manifesto video ID
  };

  /// Returns the YouTube URL for the manifesto video in the current app language,
  /// falling back to Portuguese if the current language is not yet available.
  static String get manifestoVideoUrl {
    final lang = di<AuthSessionService>().lang;
    final videoId = _manifestoVideoIds[lang] ?? _manifestoVideoIds['pt']!;
    return 'https://youtu.be/$videoId';
  }

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

                    // Manifesto video — locale-aware YouTube embed
                    FadeInUp(
                      delay: const Duration(milliseconds: 100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: YouTubeVideoPlayer(
                            url: AboutPage.manifestoVideoUrl,
                            videoTitle: s.aboutVideoPlaceholder,
                          ),
                        ),
                      ),
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
              onPressed: () => _shareApp(FoodlyStrings.PLAY_STORE_URL),
              icon: Brand(Brands.google_play, size: 22),
              label: s.shareOnAndroid,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ShareButton(
              // Mientras Apple no apruebe iOS (`FoodlyStrings.IOS_APP_LIVE`
              // sigue en false), tocar el botón muestra un info snackbar
              // localizado anunciando la llegada de Foodly a la App Store
              // en junio de 2026 — en vez de compartir un link a "page not
              // found". Cuando flipemos el flag a true, el botón vuelve a
              // su comportamiento normal de share.
              onPressed: () {
                if (FoodlyStrings.IOS_APP_LIVE) {
                  _shareApp(FoodlyStrings.APP_STORE_URL);
                } else {
                  FoodlySnackbars.infoGeneric(context, s.iosComingSoonMessage);
                }
              },
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
