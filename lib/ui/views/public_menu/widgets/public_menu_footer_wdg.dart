import 'package:animate_do/animate_do.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicMenuFooterWdg extends StatelessWidget {
  const PublicMenuFooterWdg({super.key});

  static const _privacyUrl = 'https://privacy.foodly.solutions/privacy-policy';
  static const _termsUrl = 'https://privacy.foodly.solutions/terms-conditions';

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        spacing: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _launch(_privacyUrl),
                child: Text(
                  S.current.privacyPolicy,
                  style: FoodlyTextStyles.captionPurpleBold.copyWith(
                    fontSize: 11,
                    decorationColor: FoodlyThemes.primaryFoodly,
                  ),
                ),
              ),
              Text(
                '  ·  ',
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.neutralTextGrey, fontSize: 11),
              ),
              GestureDetector(
                onTap: () => _launch(_termsUrl),
                child: Text(
                  S.current.termsConditions,
                  style: FoodlyTextStyles.captionPurpleBold.copyWith(
                    fontSize: 11,
                    decorationColor: FoodlyThemes.primaryFoodly,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Asset(FoodlyAssets.logo, height: 13),
              const SizedBox(width: 6),
              Text(
                '© ${DateTime.now().year}',
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.neutralTextGrey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
