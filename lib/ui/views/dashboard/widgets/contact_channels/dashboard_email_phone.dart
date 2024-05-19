import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardEmailAndPhoneWdg extends StatelessWidget {
  final String email;
  final String phoneNumber;

  const DashboardEmailAndPhoneWdg({
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
              onPressed: () => _launchEmail(email),
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
              onPressed: () => _launchPhone(phoneNumber),
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

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      di<Logger>().e('Could not launch $emailUri');
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      di<Logger>().e('Could not launch $phoneUri');
    }
  }
}
