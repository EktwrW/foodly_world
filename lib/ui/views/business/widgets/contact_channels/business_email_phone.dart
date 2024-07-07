import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/utils/url_launcher.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class BusinessEmailAndPhoneWdg extends StatelessWidget {
  final String email;
  final String phoneNumber;

  const BusinessEmailAndPhoneWdg({
    super.key,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (email.isNotEmpty)
          FadeIn(
            child: TextButton.icon(
              onPressed: () => UrlLauncher.launchEmail(email),
              icon: const Icon(Bootstrap.envelope_at),
              label: Text(
                email,
                style: FoodlyTextStyles.bodyLink,
              ),
            ),
          ),
        if (phoneNumber.isNotEmpty)
          FadeIn(
            child: TextButton.icon(
              onPressed: () => UrlLauncher.launchPhone(phoneNumber),
              icon: const Icon(Bootstrap.phone_vibrate),
              label: Text(
                phoneNumber,
                style: FoodlyTextStyles.bodyLink,
              ),
            ),
          ),
      ],
    );
  }
}
