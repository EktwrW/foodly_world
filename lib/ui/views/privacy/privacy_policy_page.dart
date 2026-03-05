import 'package:flutter/material.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show AppRouter, di;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();

        // Shell routes are blocked by their own PopScope(canPop: false).
        // For other routes (categories, visit-business, etc.), navigate back.
        if (!router.isOnShellRoute) {
          router.goBackToLastRoute();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.privacyPolicy),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.privacyPolicy,
                  style: FoodlyTextStyles.sectionsTitle,
                ),
                const SizedBox(height: 12),
                Text(
                  // Minimal placeholder copy for MVP. Product/legal should provide final text.
                  'This Privacy Policy describes how we collect and use your information.\n\nFor the first MVP, include the full privacy policy text here or link to the canonical web version.',
                  style: FoodlyTextStyles.label.copyWith(height: 1.5),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    // Optionally open external full policy — implement later if needed
                  },
                  child: Text(
                    'Read full Privacy Policy on our website',
                    style: FoodlyTextStyles.footerButtonNormal.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
