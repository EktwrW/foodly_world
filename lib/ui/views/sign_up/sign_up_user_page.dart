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
import 'package:foodly_world/ui/views/sign_up/social_sign_up_data.dart';
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

    // `extra` is [SocialSignUpData] for social sign-ups (Google/FB). A plain
    // String? is still accepted for backward compat with any call site that
    // only carries the avatar URL.
    final extra = di<AppRouter>().currentRoute.extra;
    if (extra is SocialSignUpData) {
      importedAvatar = extra.avatar;
      _signUpCubit.processSocialSignUpData(
        avatar: extra.avatar,
        provider: extra.provider,
        providerId: extra.providerId,
      );
    } else if (extra is String) {
      importedAvatar = extra;
      if (importedAvatar?.isNotEmpty ?? false) {
        _signUpCubit.processImportedAvatar(importedAvatar);
      }
    }

    // Pre-fill country/address/city/zipCode/coords desde el GPS del device.
    //
    // `SignUpUserPage` vive FUERA de `FoodlyLocationWrapper` (es ruta pública,
    // pre-login), por lo que el bootstrap normal de ubicación nunca corre
    // para usuarios anónimos y `LocationService` queda virgen → el cubit
    // arranca el form con defaults USA + campos vacíos (ver constructor).
    //
    // Tres caminos posibles al llegar acá:
    //   1) State ya es `_LocationChecked` (usuario volvió a sign-up después de
    //      haber concedido permiso en una sesión previa): aplicamos sync acá
    //      mismo — el listener en el build no se dispara porque no hay
    //      transición de estado.
    //   2) State es otro pero `LocationService.hasLocationData` ya es true
    //      (wrapper lo escribió en una sesión anterior): aplicamos sync
    //      construyendo un DM desde `currentLocation`.
    //   3) Service virgen → disparamos `checkLocation`; el `BlocListener`
    //      en el build va a atrapar el `_LocationChecked` resultante.
    //
    // El guard `mustFetchLocation` evita volver a pedir permiso/GPS si ya
    // se inicializó (incluso si fue denegado — no queremos volver a meter
    // presión permission-dialog cada vez que se abre sign-up).
    final locationService = di<LocationService>();
    final locationBloc = context.read<LocationBloc>();
    final currentState = locationBloc.state;
    final handledFromBloc = currentState.maybeWhen(
      locationChecked: (dm) {
        _signUpCubit.applyDeviceLocation(dm);
        return true;
      },
      orElse: () => false,
    );
    if (!handledFromBloc && locationService.hasLocationData) {
      _signUpCubit.applyDeviceLocation(locationService.currentLocation);
    } else if (!handledFromBloc && locationService.mustFetchLocation) {
      locationBloc.add(const LocationEvent.checkLocation());
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
            if (context.mounted) Navigator.of(context).pop();
            _signUpCubit.signUpUser(firebaseToken: idToken);
          },
          onClose: () {
            if (context.mounted) Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui.NeumorphicColors.decorationMaxWhiteColor,
      // BlocListener externo: escucha el `LocationBloc` GLOBAL (registrado en
      // main.dart, vive por encima del router) y delega el DM recibido al
      // cubit del sign-up cuando llega `_LocationChecked`.
      //
      // Por qué NO un BlocConsumer con overlay del logo acá:
      // - El loading full-screen del logo vive en `FoodlyLocationWrapper` y
      //   tiene sentido en el bootstrap post-login donde el home está
      //   esperando location para cargar feeds. En sign-up el usuario está
      //   viendo un form listo para tocar; taparlo arruinaría la percepción
      //   de "quick signup".
      // - `applyDeviceLocation` es idempotente y guarda typing del usuario
      //   (solo pre-fillea campos vacíos), así que si la respuesta llega
      //   después de que el user empezó a escribir, no lo pisa.
      //
      // Por qué no tocamos otros estados (`serviceDisabled`, `permissionDenied`,
      // etc.):
      // - Esos estados ya son manejados por `FoodlyLocationWrapper` post-login
      //   (diálogo de rationale + Open Settings). En sign-up pre-login,
      //   pedir permiso con un modal bloquearía el flow — aceptamos el
      //   fallback silencioso (form sin pre-fill si no hay permiso), que
      //   es exactamente el comportamiento previo a este fix.
      body: BlocListener<LocationBloc, LocationState>(
        listener: (context, locationState) {
          locationState.whenOrNull(
            locationChecked: (dm) => _signUpCubit.applyDeviceLocation(dm),
          );
        },
        child: BlocConsumer<SignUpCubit, SignUpState>(
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
          imageUrl: vm.imagePath.isNotEmpty ? '' : (importedAvatar ?? ''),
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
