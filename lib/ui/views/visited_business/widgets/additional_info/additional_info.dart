part of '../../visit_business_page.dart';

class _AdditionalInfoWdg extends StatelessWidget {
  const _AdditionalInfoWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardAdditionalInformationText1} ',
          secondText: S.current.dashboardAdditionalInformationText2,
        ),
        Row(
          children: [
            Expanded(
              child: BlocSelector<VisitBusinessCubit, VisitBusinessState, String?>(
                selector: (state) => state.vm.currentBusiness?.additionalInfo,
                builder: (context, additionalInfo) {
                  return Text(
                    additionalInfo ?? S.current.informationNotYetProvidedByTheBusiness,
                    style: FoodlyTextStyles.visitBusinessBody,
                  ).paddingAll(8);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
