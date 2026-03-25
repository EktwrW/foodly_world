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
        BlocSelector<VisitBusinessCubit, VisitBusinessState, (String, String, String?)>(
          selector: (state) => (
            state.vm.currentBusiness?.email ?? '',
            state.vm.currentBusiness?.phoneNumber ?? '',
            state.vm.currentBusiness?.uuid,
          ),
          builder: (context, record) {
            return Row(
              children: [
                if (record.$1.isEmpty && record.$2.isEmpty)
                  FadeIn(
                    child: Text(
                      S.current.addContact,
                      style: FoodlyTextStyles.profileSectionTextButton,
                    ),
                  )
                else
                  BusinessEmailAndPhoneWdg(
                    email: record.$1,
                    phoneNumber: record.$2,
                    businessUuid: record.$3,
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
