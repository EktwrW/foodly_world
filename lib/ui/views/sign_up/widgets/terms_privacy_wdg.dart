import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class TermsAndPrivacyPolicyWdg extends StatelessWidget {
  const TermsAndPrivacyPolicyWdg({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : .3,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (_) {}),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '${S.current.termsPrivacyTextSpan1} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan2,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => log(S.current.termsPrivacyTextSpan2),
                  ),
                  TextSpan(text: '${S.current.termsPrivacyTextSpan3} '),
                  TextSpan(
                    text: S.current.termsPrivacyTextSpan4,
                    style: FoodlyTextStyles.primaryBodyBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => log(S.current.termsPrivacyTextSpan4),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          )
        ],
      ).paddingOnly(top: 20),
    );
  }
}
