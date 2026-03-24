import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/phone_verification_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/phone_verification_modal.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_user_form.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/sign_up_user_sliver_app_bar_wdg.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/terms_privacy_wdg.dart';
import 'package:foodly_world/ui/views/sign_up/widgets/welcome_dialog.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:go_router/go_router.dart';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({super.key});

  @override
  State<SignUpUserPage> createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  late final SignUpCubit _signUpCubit;
  late final DialogService _dialogService;
  bool _isSnackBarVisible = false;
  final _controller = ScrollController();
  String? importedAvatar;

  TextSpan _getBoldTextSpan(String text) => TextSpan(text: text, style: FoodlyTextStyles.actionsBodyBold);

  @override
  void initState() {
    super.initState();
    _signUpCubit = context.read<SignUpCubit>();
    _dialogService = di<DialogService>();

    importedAvatar = di<AppRouter>().currentRoute.extra as String?;

    if (importedAvatar?.isNotEmpty ?? false) {
      _signUpCubit.processImportedAvatar(importedAvatar);
    }
  }

  void _showEnableFormSnackBar(BuildContext context) {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = false;
      return;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = true;
    }

    final snackBar = SnackBarWdg(
      onPressed: () => _isSnackBarVisible = false,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(text: '${S.current.userTypeSnackbarTextSpan1} '),
            _getBoldTextSpan(S.current.userTypeSnackbarTextSpan2),
            TextSpan(text: ' ${S.current.userTypeSnackbarTextSpan3}.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.getSnackBar(context))
        .closed
        .then((reason) => _isSnackBarVisible = false);
  }

  void _showUserRoleSnackBar(BuildContext context) {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = false;
      return;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _isSnackBarVisible = true;
    }

    final snackBar = SnackBarWdg(
      onPressed: () => _isSnackBarVisible = false,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            _getBoldTextSpan(S.current.owner),
            TextSpan(text: ' ${S.current.usersHaveTheAbilityToCreateAndManage} '),
            _getBoldTextSpan(S.current.businesses),
            const TextSpan(text: ', '),
            _getBoldTextSpan(S.current.brands),
            const TextSpan(text: ', '),
            _getBoldTextSpan(S.current.startups),
            TextSpan(text: ', ${S.current.andCreateContentToThese}.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.getSnackBar(context))
        .closed
        .then((reason) => _isSnackBarVisible = false);
  }

  void _showPhoneVerificationModal(
    BuildContext context, {
    String? phoneNumber,
    String? countryCode,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider(
        create: (_) => PhoneVerificationCubit(),
        child: PhoneVerificationModal(
          initialPhone: phoneNumber ?? '',
          countryCode: countryCode ?? '',
          onVerified: (idToken) {
            Navigator.of(context).pop();
            _signUpCubit.signUpUser(firebaseToken: idToken);
          },
          onClose: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui.NeumorphicColors.decorationMaxWhiteColor,
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (signUpVM) => _dialogService.showLoading(),
            loaded: (signUpVM) => _dialogService.hideLoading(),
            userCreated: (vm) {
              di<AuthSessionService>().updateForceToLogin(false);
              context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: vm.userSessionDM));
              _dialogService.hideLoading();
              final user = vm.userSessionDM.user;
              _dialogService.showCustomDialog(
                const WelcomeDialog(),
                2,
                onDialogClose: () => user.isManager
                    ? context.goNamed(AppRoutes.signUpBusiness.name)
                    : context.goNamed(AppRoutes.foodlyMainPage.name,
                        pathParameters: {AppRoutes.routeIdParam: user.uuid ?? ''}),
              );
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
            loading: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            loaded: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            userCreated: (signUpVM) => _buildSignUpScreen(signUpVM, context),
            error: (e, signUpVM) => _buildSignUpScreen(signUpVM, context),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildSignUpScreen(UserProfileVM vm, BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SignUpUserSliverAppBar(
          onLeadingPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            context.goNamed(AppRoutes.login.name);
            context.read<StartingCubit>().setView(StartingPageView.initial);
          },
          onPressedDisabled: () => _showEnableFormSnackBar(context),
          onPressed: () async => await pickImage(context).then((value) => _signUpCubit.processImagePath(value)),
          onTap: () => _showUserRoleSnackBar(context),
          enabled: vm.roleId != null,
          imagePath: vm.imagePath,
          imageUrl: importedAvatar ?? '',
        ),
        SliverToBoxAdapter(child: _buildSignUpContent(vm, context)),
      ],
    );
  }

  Widget _buildSignUpContent(UserProfileVM vm, BuildContext context) {
    final enabled = vm.roleId != null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      child: Form(
        key: vm.formKey,
        autovalidateMode: vm.autovalidateMode,
        child: Column(
          children: [
            GestureDetector(
              onTap: !enabled ? () => _showEnableFormSnackBar(context) : null,
              child: const SignUpUserForm(),
            ),
            TermsAndPrivacyPolicyWdg(enabled: enabled, vm: vm),
            CustomNeumorphicButton(
              margin: EdgeInsets.zero,
              onPressed: enabled && vm.termsAndContiditionsAccepted
                  ? () {
                      if (_signUpCubit.validateForm()) {
                        if (_signUpCubit.isGoogleSignIn) {
                          _signUpCubit.signUpUser();
                        } else {
                          // Prefer the complete international number (+XX...) stored via
                          // onChanged — avoids double-prefix bugs from raw controller text.
                          // Fall back to raw text only if the user never interacted with
                          // the phone field (edge case).
                          final phoneNumber = _signUpCubit.completePhone.isNotEmpty
                              ? _signUpCubit.completePhone
                              : vm.phoneNumberController?.controller?.text;
                          final countryCode = _signUpCubit.phoneIsoCode.isNotEmpty
                              ? _signUpCubit.phoneIsoCode
                              : vm.country?.countryCode.toUpperCase();

                          _showPhoneVerificationModal(
                            context,
                            phoneNumber: phoneNumber,
                            countryCode: countryCode,
                          );
                        }
                      }
                    }
                  : null,
              shape: enabled ? ui.NeumorphicShape.convex : ui.NeumorphicShape.flat,
              text: S.current.createUser,
              disabled: !enabled || !vm.termsAndContiditionsAccepted,
            ).paddingOnly(top: 36, bottom: 99),
          ],
        ),
      ),
    );
  }
}
