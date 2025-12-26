part of '../user_profile_page.dart';

class UserProfileSliverAppBar extends StatelessWidget {
  final VoidCallback onLeadingPressed;
  final Future<void> Function() onPressed;

  const UserProfileSliverAppBar({
    super.key,
    required this.onLeadingPressed,
    required this.onPressed,
  });

  static final _isExpanded = ValueNotifier<bool>(true);

  static const _foodlyLogo = Asset(FoodlyAssets.isoFoodly, height: 22);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        final vm = state.vm;
        final cubit = context.read<UserProfileCubit>();

        return ValueListenableBuilder(
            valueListenable: _isExpanded,
            builder: (_, isExpandedValue, __) {
              return SliverAppBar(
                centerTitle: true,
                toolbarHeight: 70,
                leadingWidth: 76,
                expandedHeight: vm.edition.isEditingName ? 360 : 290,
                collapsedHeight: vm.edition.isEditingName ? 170 : 80,
                shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
                pinned: true,
                floating: true,
                title: Stack(
                  alignment: Alignment.center,
                  children: [
                    SliverAppBarAnimatedTitleText(
                      visible: !isExpandedValue,
                      key: ValueKey(vm.userSessionDM.loggedUserFullName),
                      text: vm.userSessionDM.loggedUserFullName,
                    ),
                    SliverAppBarAnimatedTitleText(
                      text: '@${vm.currentUserName}',
                      key: const ValueKey('User Profile'),
                      visible: isExpandedValue,
                      style: SliverTitleTextStyle.decorated,
                      onTitlePressed: vm.loggedUserCanEdit
                          ? () {
                              cubit.updateEditMode(ProfileEditing.nickName);
                              di<DialogService>().showCustomDialog(
                                EditUserNameDialog(
                                  onSavePressed: () async {
                                    await cubit.callToUpdateProfile();
                                    if (context.mounted) Navigator.pop(context);
                                  },
                                  vm: vm,
                                ),
                                2,
                                onDialogClose: () => cubit.updateEditMode(ProfileEditing.none),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
                leading: Row(
                  children: [
                    const SizedBox(width: 6),
                    Flexible(
                      child: CustomRoundedNeumorphicButton(
                        shape: ui.NeumorphicShape.concave,
                        iconSize: 24,
                        iconData: Bootstrap.caret_left_fill,
                        onPressed: onLeadingPressed,
                      ).paddingAll(12),
                    ),
                  ],
                ),
                actions: [
                  SliverAppBarActionWidgets(
                    imageUrl: vm.userSessionDM.loggedUserAvatar,
                    isExpanded: isExpandedValue,
                    placeholder: _foodlyLogo,
                  ),
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    var top = constraints.biggest.height;
                    WidgetsBinding.instance.addPostFrameCallback((_) => _isExpanded.value = top >= 150);

                    return FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      collapseMode: CollapseMode.pin,
                      titlePadding: EdgeInsets.zero,
                      centerTitle: true,
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocConsumer<MainDrawerCubit, MainDrawerState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                updatingAvatar: (_) => di<DialogService>().showLoading(),
                                loaded: (_) => di<DialogService>().hideLoading(),
                                error: (e, vm) {
                                  di<DialogService>().hideLoading();
                                  FoodlySnackbars.errorGeneric(context, e);
                                },
                              );
                            },
                            builder: (context, state) {
                              return EditableAvatarWdg(
                                onPressed: onPressed,
                                size: UIDimens.AVATAR_BIG_SIZE_MOB,
                                paddingAll: 10,
                                imagePath: vm.imagePath,
                                avatarType: AvatarType.user,
                                iconSize: 28,
                                buttonDiameter: 34,
                                imageUrl: vm.loggedUserCanEdit
                                    ? di<AuthSessionService>().userSessionDM?.loggedUserAvatar
                                    : vm.currentUser?.avatarUrl,
                              );
                            },
                          ),
                          ProfileNameWdg(
                            userDM: vm.loggedUserCanEdit ? vm.userSessionDM.user : vm.visitedUser ?? const UserDM(),
                            vm: vm,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
