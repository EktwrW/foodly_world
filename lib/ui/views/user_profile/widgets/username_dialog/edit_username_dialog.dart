part of '../../user_profile_page.dart';

class EditUserNameDialog extends StatelessWidget {
  final UserProfileVM vm;
  final void Function()? onSavePressed;

  const EditUserNameDialog({super.key, required this.vm, this.onSavePressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckAvailabilitiesCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CheckAvailabilitiesCubit>();

          return FadeIn(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: FoodlyThemes.primaryFoodly,
                    ),
                    child: BlocSelector<CheckAvailabilitiesCubit, CheckAvailabilitiesState, bool>(
                      selector: (state) => state.isAvailable,
                      builder: (context, isAvailable) {
                        return SaveAndCancelButtons(
                          showSaveButton: isAvailable,
                          onSavePressed: onSavePressed,
                          onCancelPressed: () {
                            _cancel(context);
                          },
                          onCancelPressedSecondary: () {
                            _cancel(context);
                          },
                          btnType: SaveAndCancelBtnType.dialog,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ui.NeumorphicColors.background,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 50,
                    right: UIDimens.SCREEN_PADDING_MOB,
                    left: UIDimens.SCREEN_PADDING_MOB,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.current.changeUsername, style: FoodlyTextStyles.confirmationTextPrimary),
                          ],
                        ).paddingOnly(top: 25, bottom: 35),
                        BlocBuilder<CheckAvailabilitiesCubit, CheckAvailabilitiesState>(
                          builder: (context, state) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                FoodlyAnimatedOpacity(
                                  key: const Key('initial'),
                                  visible: state.isInitialState,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Asset(FoodlyAssets.searchAvailability, width: 40).paddingBottom(10),
                                      Text(
                                        S.current.weWillCheckAvailability,
                                        textAlign: TextAlign.center,
                                        style: FoodlyTextStyles.caption,
                                      ),
                                    ],
                                  ),
                                ),
                                FoodlyAnimatedOpacity(
                                  key: const Key('loading'),
                                  visible: state.isLoading,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Asset(FoodlyAssets.searchAvailability, width: 40).paddingBottom(10),
                                      AnimatedTextLoadingDots(
                                        text: S.current.verifyingAvailability,
                                        textStyle: FoodlyTextStyles.caption,
                                        alignment: MainAxisAlignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                FoodlyAnimatedOpacity(
                                  key: const Key('available'),
                                  visible: state.isAvailable,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Asset(FoodlyAssets.available, width: 40).paddingBottom(10),
                                      Text(
                                        S.current.usernameAvailable,
                                        textAlign: TextAlign.center,
                                        style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                                      ),
                                    ],
                                  ),
                                ),
                                FoodlyAnimatedOpacity(
                                  key: const Key('unavailable'),
                                  visible: state.isUnavailable,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Asset(FoodlyAssets.unavailable, width: 40).paddingBottom(10),
                                      Text(
                                        S.current.usernameNotAvailable,
                                        textAlign: TextAlign.center,
                                        style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.error),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ).paddingBottom(24),
                        BlocSelector<CheckAvailabilitiesCubit, CheckAvailabilitiesState, (bool, bool)>(
                          selector: (state) => (state.isLoading, state.isUnavailable),
                          builder: (context, record) {
                            return FoodlyPrimaryInputText(
                              controller: vm.nickNameController?.controller,
                              onChanged: (p0) {
                                cubit.onTextChanged(p0);
                              },
                              focusNode: vm.nickNameController?.focusNode,
                              inputTextType: FoodlyInputType.nickName,
                              autovalidateMode: AutovalidateMode.always,
                              enabled: true,
                              showLeading: false,
                              autofocus: true,
                              isUnavailable: record.$2,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _cancel(BuildContext context) {
    Navigator.of(context).pop();
    vm.nickNameController?.controller?.clear();
  }
}
