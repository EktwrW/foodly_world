part of '../../visit_business_page.dart';

class _ContactChannelsWdg extends StatelessWidget {
  const _ContactChannelsWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardContactText1} ',
          secondText: S.current.dashboardContactText2,
        ),
        BlocSelector<VisitBusinessCubit, VisitBusinessState, (String, String)>(
          selector: (state) => (state.vm.currentBusiness?.email ?? '', state.vm.currentBusiness?.phoneNumber ?? ''),
          builder: (context, stringsRecord) {
            return Row(
              children: [
                if (stringsRecord.$1.isEmpty && stringsRecord.$2.isEmpty)
                  FadeIn(
                    child: Text(
                      S.current.addContact,
                      style: FoodlyTextStyles.profileSectionTextButton,
                    ),
                  )
                else
                  BusinessEmailAndPhoneWdg(
                    email: stringsRecord.$1,
                    phoneNumber: stringsRecord.$2,
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
