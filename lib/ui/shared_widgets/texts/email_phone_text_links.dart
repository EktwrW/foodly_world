import 'package:animate_do/animate_do.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/core/utils/url_launcher.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class BusinessEmailAndPhoneWdg extends StatelessWidget {
  final String email;
  final String phoneNumber;
  final String? businessUuid;

  const BusinessEmailAndPhoneWdg({
    super.key,
    required this.email,
    required this.phoneNumber,
    this.businessUuid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (email.isNotEmpty)
          FadeIn(
            child: TextButton.icon(
              onPressed: () {
                if (businessUuid != null) {
                  di<EventTrackingService>().track(
                    'business.cta_clicked',
                    'business_detail_page',
                    page: 'business_detail',
                    targetType: 'business',
                    targetUuid: businessUuid,
                    data: {'cta_type': 'email'},
                  );
                }
                UrlLauncher.launchEmail(email);
              },
              icon: const Icon(Bootstrap.envelope_at),
              label: Text(
                email,
                style: FoodlyTextStyles.bodyLink,
              ).paddingLeft(4),
            ),
          ),
        if (phoneNumber.isNotEmpty)
          FadeIn(
            child: TextButton.icon(
              onPressed: () {
                if (businessUuid != null) {
                  di<EventTrackingService>().track(
                    'business.cta_clicked',
                    'business_detail_page',
                    page: 'business_detail',
                    targetType: 'business',
                    targetUuid: businessUuid,
                    data: {'cta_type': 'call'},
                  );
                }
                UrlLauncher.launchPhone(phoneNumber);
              },
              icon: const Icon(Bootstrap.phone_vibrate),
              label: Text(
                phoneNumber,
                style: FoodlyTextStyles.bodyLink,
              ).paddingLeft(4),
            ),
          ),
      ],
    );
  }
}
