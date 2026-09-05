import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/privacy/privacy_policy_content.dart';
import 'package:foodly_world/ui/views/terms/terms_conditions_content.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

enum LegalDoc { terms, privacy }

/// Abre Términos o Política de Privacidad como una ruta full-screen empujada
/// sobre el Navigator ACTUAL, con back vía `Navigator.pop` — SIN tocar el
/// GoRouter.
///
/// Esto es clave cuando el link se abre desde un diálogo modal (p. ej. el
/// consentimiento del alta social): navegar con GoRouter destruiría el diálogo
/// y dejaría al usuario en la starting page, rompiendo el flujo de alta — bug
/// que el revisor de Apple detectó (5.1.1.v). Al empujar sobre el Navigator
/// local, el diálogo queda vivo debajo y el back vuelve a él.
Future<void> showLegalDoc(BuildContext context, LegalDoc doc) {
  return Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => _LegalContentView(doc: doc)),
  );
}

class _LegalContentView extends StatelessWidget {
  final LegalDoc doc;
  const _LegalContentView({required this.doc});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    final title = doc == LegalDoc.terms ? S.current.termsConditions : S.current.privacyPolicy;
    final sections = doc == LegalDoc.terms
        ? buildTermsContent(langCode).map((s) => (s.heading, s.body)).toList()
        : buildPolicyContent(langCode).map((s) => (s.heading, s.body)).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: UIDecorations.glassmorphicPurpleGradient,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
          ).paddingOnly(right: 18),
        ],
        leading: CustomRoundedNeumorphicButton(
          iconSize: 26,
          diameter: 32,
          iconData: Bootstrap.caret_left_fill,
          onPressed: () => Navigator.of(context).pop(),
        ).paddingSymmetric(vertical: 8, horizontal: 8),
        leadingWidth: 60,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 48),
          itemCount: sections.length,
          separatorBuilder: (_, __) => const Divider(height: 32),
          itemBuilder: (_, i) {
            final (heading, body) = sections[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: FoodlyTextStyles.label.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: colorScheme.onSurface,
                  ),
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
          },
        ),
      ),
    );
  }
}
