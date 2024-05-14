import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_business_form.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_business_tooltip.dart';
import 'package:foodly_world/ui/views/starting/widgets/login_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class SignUpBusinessPage extends StatefulWidget {
  const SignUpBusinessPage({super.key});

  @override
  State<SignUpBusinessPage> createState() => _SignUpBusinessPageState();
}

class _SignUpBusinessPageState extends State<SignUpBusinessPage> {
  final GlobalKey _tooltipKey = GlobalKey();
  late dynamic tooltip;
  final _authService = di<AuthSessionService>();

  TextSpan getBoldTextSpan(String text) => TextSpan(text: text, style: FoodlyTextStyles.actionsBodyBold);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tooltip = _tooltipKey.currentState;
      tooltip?.ensureTooltipVisible();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Scaffold(
      backgroundColor: ui.NeumorphicColors.decorationMaxWhiteColor,
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: (signUpVM) => di<DialogService>().showLoading(),
              loaded: (signUpVM) => di<DialogService>().hideLoading(),
              businessCreated: (vm) {
                context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
                di<DialogService>().hideLoading();

                context.goNamed(AppRoutes.foodlyMainPage.name,
                    pathParameters: {AppRoutes.routeIdParam: vm.userSessionDM.user.userId ?? ''});
              },
              error: (e, vm) {
                di<DialogService>().hideLoading();
                //TODO: hw - handle error / show snackbar
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: (signUpVM) => _buildContent(signUpVM, cubit),
              loaded: (signUpVM) => _buildContent(signUpVM, cubit),
              userCreated: (signUpVM) => _buildContent(signUpVM, cubit),
              businessCreated: (signUpVM) => _buildContent(signUpVM, cubit),
              orElse: () => const SizedBox.expand(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(SignUpVM vm, SignUpCubit cubit) {
    return GestureDetector(
      onTap: vm.tooltipActive
          ? () {
              Tooltip.dismissAllToolTips();
              cubit.hideTooltipInBusinessSignUp();
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: vm.tooltipActive ? Colors.black54 : Colors.transparent,
        child: NestedScrollView(
          physics: vm.tooltipActive ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: vm.tooltipActive ? Colors.transparent : null,
              toolbarHeight: 70,
              leadingWidth: 60,
              expandedHeight: 360,
              collapsedHeight: 140,
              shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
              pinned: true,
              floating: true,
              title: Text(
                S.current.businessRegister,
                style: FoodlyTextStyles.secondaryTitle,
              ),
              leading: Opacity(
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
                ),
              ),
              actions: [
                Opacity(
                  opacity: vm.tooltipActive ? 0.3 : 1,
                  child: RoundedButtonMobileFoodly(
                    shape: ui.NeumorphicShape.concave,
                    iconSize: 26,
                    depth: 2,
                    diameter: 30,
                    iconData: Bootstrap.door_open_fill,
                    onPressed: vm.tooltipActive
                        ? null
                        : () {
                            if (_authService.isLoggedIn) {
                              _authService.logout(context);
                            }
                          },
                  ).paddingOnly(right: 15),
                ),
              ],
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
                          color: FoodlyThemes.primaryFoodly.withOpacity(0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                opacity: vm.tooltipActive ? .3 : 1,
                                child: EditableAvatarWdg(
                                  onPressed: () async => await pickImageFile(context, ImageSource.gallery)
                                      .then((path) => cubit.processLogoPath(path)),
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
                      ).paddingOnly(top: 16),
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
              padding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
              child: Column(
                children: [
                  const SignUpBusinessForm(),
                  Text.rich(
                    TextSpan(
                      style: FoodlyTextStyles.actionsBody,
                      children: [
                        TextSpan(text: S.current.switchUserCategoryTextSpan1),
                        getBoldTextSpan(S.current.customer),
                        TextSpan(text: S.current.switchUserCategoryTextSpan2),
                        getBoldTextSpan(S.current.switchUserCategoryTextSpan3),
                        const TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(vertical: 25),
                  FoodlyLoginButton(
                    type: LoginButtonType.secondary,
                    margin: EdgeInsets.zero,
                    onPressed: () async {
                      cubit.setAutovalidateMode(AutovalidateMode.always);
                      if (vm.formKey?.currentState?.validate() ?? false) {
                        await cubit.signUpBusiness();
                      }
                    },
                    shape: ui.NeumorphicShape.convex,
                    text: S.current.completeSignUp,
                    disabled: false,
                  ).paddingOnly(top: 20, bottom: 26),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
