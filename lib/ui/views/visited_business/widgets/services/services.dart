part of '../../visit_business_page.dart';

class _ServicesWdg extends StatelessWidget {
  const _ServicesWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardServicesAtText1} ',
          secondText: S.current.dashboardServicesAtText2,
        ),
        BlocSelector<VisitBusinessCubit, VisitBusinessState, List<BusinessServices>?>(
          selector: (state) {
            return state.vm.currentBusiness?.businessServices;
          },
          builder: (context, businessServices) {
            return businessServices?.isEmpty ?? true
                ? FadeIn(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            S.current.informationNotYetProvidedByTheBusiness,
                            style: FoodlyTextStyles.visitBusinessBody,
                          ).paddingAll(8),
                        ),
                      ],
                    ),
                  )
                : FadeIn(
                    child: SizedBox(
                      width: context.screenWidth,
                      child: Wrap(
                        spacing: context.screenWidth * .02,
                        runSpacing: 10,
                        children: businessServices!
                            .map(
                              (e) => SizedBox(
                                width: context.screenWidth * .405,
                                child: Row(
                                  children: [
                                    Icon(e.iconData, size: 18, key: Key(e.name), color: FoodlyThemes.primaryFoodly),
                                    Flexible(
                                        child: Text(
                                      e.text,
                                      style: FoodlyTextStyles.captionPurple,
                                      overflow: TextOverflow.ellipsis,
                                    ).paddingLeft(10)),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ).paddingVertical(12),
                    ).paddingHorizontal(8),
                  );
          },
        ),
      ],
    );
  }
}
