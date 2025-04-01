part of '../../visit_business_page.dart';

class _AboutUsWdg extends StatelessWidget {
  const _AboutUsWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.about} ',
          secondText: S.current.us,
        ),
        Row(
          children: [
            Expanded(
              child: FadeIn(
                child: BlocSelector<VisitBusinessCubit, VisitBusinessState, String>(
                  selector: (state) {
                    return state.vm.currentBusiness?.aboutUs ?? S.current.informationNotYetProvidedByTheBusiness;
                  },
                  builder: (context, aboutUs) {
                    return Text(
                      aboutUs,
                      style: FoodlyTextStyles.visitBusinessBody,
                    ).paddingAll(8);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
