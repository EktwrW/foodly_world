import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  const UrlLauncher._();

  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: FoodlyStrings.MAILTO, path: email);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      di<Logger>().e('Could not launch $emailUri');
    }
  }

  static Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: FoodlyStrings.TEL, path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      di<Logger>().e('Could not launch $phoneUri');
    }
  }
}
