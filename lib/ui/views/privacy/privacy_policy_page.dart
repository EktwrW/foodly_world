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
import 'package:foodly_world/ui/views/privacy/privacy_policy_content.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    final sections = buildPolicyContent(langCode);
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
              S.current.privacyPolicy,
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
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 48),
            itemCount: sections.length + 1, // +1 for header
            separatorBuilder: (_, __) => const Divider(height: 32),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _Header(colorScheme: colorScheme);
              }
              final section = sections[index - 1];
              final isLast = index == sections.length;
              return _Section(
                section: section,
                colorScheme: colorScheme,
                isContact: isLast,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(Bootstrap.shield_check, color: colorScheme.primary, size: 26),
            const Asset(FoodlyAssets.logo, height: 23),
          ],
        ),
        Text(
          S.current.privacyPolicy,
          style: FoodlyTextStyles.label.copyWith(
            fontSize: 13,
            color: colorScheme.onSurface.withValues(alpha: 0.55),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.section,
    required this.colorScheme,
    this.isContact = false,
  });

  final PolicySection section;
  final ColorScheme colorScheme;
  final bool isContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isContact ? const EdgeInsets.all(14) : EdgeInsets.zero,
      decoration: isContact
          ? BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.25),
              ),
            )
          : null,
      child: Column(
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
              Expanded(
                child: Text(
                  section.heading,
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
            section.body,
            style: FoodlyTextStyles.label.copyWith(
              height: 1.65,
              fontSize: 13,
              color: colorScheme.onSurface.withValues(alpha: 0.80),
            ),
          ),
        ],
      ),
    );
  }
}
