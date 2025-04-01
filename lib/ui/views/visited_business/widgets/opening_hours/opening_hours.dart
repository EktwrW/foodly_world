part of '../../visit_business_page.dart';

class _OpeningHoursWdg extends StatelessWidget {
  const _OpeningHoursWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardOpeningHoursText1} ',
          secondText: S.current.dashboardOpeningHoursText2,
        ),
        const CurrentOpeningHoursWdg(),
      ],
    );
  }
}
