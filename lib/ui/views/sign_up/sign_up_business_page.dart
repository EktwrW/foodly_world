import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_business_form.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_business_tooltip.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpBusinessPage extends StatefulWidget {
  const SignUpBusinessPage({super.key});

  @override
  State<SignUpBusinessPage> createState() => _SignUpBusinessPageState();
}

class _SignUpBusinessPageState extends State<SignUpBusinessPage> {
  final GlobalKey _tooltipKey = GlobalKey();
  late dynamic tooltip;
  late final LocalStorageService _localStorageService;
  late final AuthSessionService _authService;
  late final DialogService _dialogService;
  bool _userIsMigratingToManager = false;
  late final SignUpCubit _signUpcubit;

  TextSpan _getBoldTextSpan(String text) => TextSpan(text: text, style: FoodlyTextStyles.actionsBodyBold);

  @override
  void initState() {
    super.initState();
    _localStorageService = di<LocalStorageService>();
    _authService = di<AuthSessionService>();
    _dialogService = di<DialogService>();
    _signUpcubit = context.read<SignUpCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _userIsMigratingToManager = await _localStorageService.getBool('user-migration') ?? false;
      tooltip = _tooltipKey.currentState;
      tooltip?.ensureTooltipVisible();
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_userIsMigratingToManager) {
      _localStorageService.saveBool('user-migration', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui.NeumoColors.decorationMaxWhiteColor,
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: (signUpVM) => _dialogService.showLoading(),
              loaded: (signUpVM) => _dialogService.hideLoading(),
              businessCreationFinished: (vm) {
                context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
                _dialogService.hideLoading();

                context.goNamed(AppRoutes.foodlyMainPage.name,
                    pathParameters: {AppRoutes.routeIdParam: vm.userSessionDM.user.uuid ?? ''});
              },
              error: (e, vm) async {
                _dialogService.hideLoading();
                await Future.delayed(Durations.long1)
                    .then((_) => context.mounted ? FoodlySnackbars.errorGeneric(context, e) : null);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: (signUpVM) => _buildContent(signUpVM),
              loaded: (signUpVM) => _buildContent(signUpVM),
              userCreated: (signUpVM) => _buildContent(signUpVM),
              businessCreationFinished: (signUpVM) => _buildContent(signUpVM),
              error: (e, signUpVM) => _buildContent(signUpVM),
              orElse: () => const SizedBox.expand(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(UserProfileVM vm) {
    return GestureDetector(
      onTap: vm.tooltipActive
          ? () {
              Tooltip.dismissAllToolTips();
              _signUpcubit.hideTooltipInBusinessSignUp();
            }
          : () {
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
              }
            },
      child: AnimatedContainer(
        duration: Durations.medium4,
        color: vm.tooltipActive ? Colors.black54 : Colors.transparent,
        child: NestedScrollView(
          physics: vm.tooltipActive ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: vm.tooltipActive ? Colors.transparent : null,
              toolbarHeight: 70,
              leadingWidth: 76,
              expandedHeight: 339,
              collapsedHeight: 150,
              shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
              pinned: true,
              floating: true,
              title: Text(
                S.current.businessRegister,
                style: FoodlyTextStyles.secondaryTitle,
              ),
              actions: [
                AnimatedOpacity(
                  duration: Durations.medium1,
                  opacity: vm.tooltipActive ? 0.3 : 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AvatarWidget(
                          avatarUrl: _authService.userSessionDM?.user.avatarUrl,
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ).paddingRight(UIDimens.SCREEN_PADDING_MOB),
                )
              ],
              leading: AnimatedOpacity(
                  duration: Durations.medium1,
                  opacity: vm.tooltipActive ? 0.3 : 1,
                  child: Row(
                    children: [
                      const SizedBox(width: 6),
                      Flexible(
                        child: (_userIsMigratingToManager
                                ? CustomRoundedNeumorphicButton(
                                    shape: ui.NeumoShape.concave,
                                    iconSize: 24,
                                    iconData: Bootstrap.caret_left_fill,
                                    onPressed: () {
                                      final router = di<AppRouter>();

                                      if (context.canPop()) {
                                        context.pop();
                                        router.removeLastRouteHistory();
                                      } else {
                                        Navigator.of(context).pop();
                                        router.removeLastRouteHistory();
                                      }
                                    },
                                  )
                                : CustomRoundedNeumorphicButton(
                                    shape: ui.NeumoShape.concave,
                                    iconSize: 24,
                                    iconData: Bootstrap.door_open_fill,
                                    onPressed: vm.tooltipActive
                                        ? null
                                        : () {
                                            if (_authService.isLoggedIn) {
                                              _authService.logout(context);
                                            }
                                          },
                                  ))
                            .paddingAll(12),
                      ),
                    ],
                  )),
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: SignUpBusinessTooltip(tooltipKey: _tooltipKey),
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ColoredBox(
                          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                duration: Durations.medium4,
                                opacity: vm.tooltipActive ? .3 : 1,
                                child: EditableAvatarWdg(
                                  onPressed: () async => await pickImageFile(context, ImageSource.gallery)
                                      .then((path) => _signUpcubit.processLogoPath(path)),
                                  avatarType: AvatarType.business,
                                  size: const Size(130, 130),
                                  paddingAll: 0,
                                  imagePath: vm.logoPath,
                                  enabled: !vm.tooltipActive,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).paddingOnly(top: 36),
                    ),
                  ],
                ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
              ),
            ),
          ],
          body: Form(
            key: vm.formKey,
            autovalidateMode: vm.autovalidateMode,
            child: SingleChildScrollView(
              physics: vm.tooltipActive ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  right: UIDimens.SCREEN_PADDING_MOB, left: UIDimens.SCREEN_PADDING_MOB, top: 12, bottom: 36),
              child: Column(
                children: [
                  const SignUpBusinessForm(),
                  vm.userSessionDM.user.isManager
                      ? TextButton(
                          onPressed: () => _signUpcubit.changeUserRoleToClient(),
                          child: Text.rich(
                            TextSpan(
                              style: FoodlyTextStyles.actionsBody,
                              children: [
                                TextSpan(text: '${S.current.switchUserCategoryTextSpan1} '),
                                _getBoldTextSpan(S.current.customer),
                                TextSpan(text: ', ${S.current.switchUserCategoryTextSpan2} '),
                                _getBoldTextSpan(S.current.switchUserCategoryTextSpan3),
                                const TextSpan(text: '.'),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ).paddingSymmetric(vertical: 25)
                      : const SizedBox(height: 25),
                  CustomNeumorphicButton(
                    margin: EdgeInsets.zero,
                    onPressed: () async {
                      _signUpcubit.setAutovalidateMode(AutovalidateMode.always);
                      if (vm.formKey?.currentState?.validate() ?? false) {
                        await _signUpcubit.signUpBusiness();
                      }
                    },
                    shape: ui.NeumoShape.convex,
                    text: S.current.completeSignUp,
                    disabled: false,
                  ).paddingOnly(top: 20, bottom: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
