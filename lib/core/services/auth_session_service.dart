// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/cubit/local_auth_cubit.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/permission_guarded_resource_enum.dart';
import 'package:foodly_world/core/network/base/app_api_provider.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/local_storage_service.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/logout/logout_dialog_content.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class AuthSessionService {
  final BaseConfig _config;
  final LocalStorageService _localStorageService;
  final FoodlyApiProvider _appApiProvider;
  final MeRepo _meRepo;

  AuthSessionService({
    required BaseConfig config,
    required MeRepo meRepo,
    required LocalStorageService localStorageService,
    required FoodlyApiProvider appApiProvider,
  })  : _config = config,
        _appApiProvider = appApiProvider,
        _meRepo = meRepo,
        _localStorageService = localStorageService;

  UserSessionDM? userSessionDM;
  Map<String, String>? _authHeader;
  bool requestBiometricAuth = false;
  bool forceToLogin = false;
  bool get isLoggedIn => userSessionDM != null && (userSessionDM?.user.userId?.isNotEmpty ?? false);
  bool get userIsManager => userSessionDM?.user.isManager ?? false;
  String get userId => userSessionDM?.user.userId ?? '';
  Map<String, String>? get authHeader => _authHeader;
  String get lang => Intl.getCurrentLocale().substring(0, 2);
  // bool get isAccessTokenExpired => isLoggedIn && (userSessionDM?.user.authToken?.isTokenExpired ?? true); //TODO: HW - define the logic to get this value
  bool get isAccessTokenExpired => false; //TODO: HW - define the logic to get this value
  bool get mustCompleteProfile => false; //TODO: HW - define the logic to get this value

  void updateBiometricAuth(bool newValue) => requestBiometricAuth = newValue;

  void updateForceToLogin(bool newValue) => forceToLogin = newValue;

  void setSession(UserSessionDM? newUserSessionDM) {
    userSessionDM = newUserSessionDM;
    _authHeader = {FoodlyStrings.AUTHORIZATION: '${newUserSessionDM?.tokenType} ${newUserSessionDM?.token}'};
    di<FoodlyApiProvider>().setAuthToken('${newUserSessionDM?.tokenType} ${newUserSessionDM?.token}');
  }

  void setBusinesses(List<BusinessDM> businesses) => userSessionDM != null
      ? userSessionDM = userSessionDM?.copyWith(user: userSessionDM!.user.copyWith(business: businesses))
      : null;

  void logout(BuildContext context) {
    if (context.read<LocalAuthCubit>().biometricAuthEnabled) {
      di<DialogService>().showCustomDialog(const LogoutDialog(), 2);
    } else {
      endSession(context);
    }
  }

  void endSession(BuildContext context) async {
    di<DialogService>().showLoading();
    final authToken = userSessionDM?.token ?? '';

    if (isLoggedIn && authToken.isNotEmpty) {
      await _meRepo.logout().then((value) {
        return value.when(
          success: (_) => clearSession(context),
          failure: (e) {
            di<Logger>().e('$e');
            clearSession(context);
          },
        );
      });
    } else {
      clearSession(context);
    }
    di<DialogService>().hideLoading();
  }

  void clearSession(BuildContext context) {
    userSessionDM = null;
    _authHeader = null;
    _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
    context.read<RootBloc>().add(const RootEvent.userLogout());
    exit(context);
  }

  void exit(BuildContext context) {
    context.goNamed(AppRoutes.login.name);
    context.read<StartingCubit>().setView(StartingPageView.initial);
    updateForceToLogin(false);
  }

  //TODO: HW
  Future<void> refreshToken({bool shouldNotifyTokenExpired = true}) async {
    await Future.wait([]);
  }

  Future<void> validateAccessToken() async {
    //TODO: create this logic
  }

  void notifyTokenExpired() {
    //TODO: use here rootNavigatorKey to trigger a toast
  }

  void notifyInternalServerError(DioException dioException) {
    //TODO: use here rootNavigatorKey to trigger a toast
  }

  bool hasAccessToModule(ModuleGuardType module) {
    switch (module) {
      case ModuleGuardType.home:
        return [UserRole.admin, UserRole.owner, UserRole.customer].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.businessPanel:
        return [UserRole.admin, UserRole.owner].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.accountSettings:
        return [UserRole.admin, UserRole.owner, UserRole.customer].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.unknown:
        return false;

      default:
        return true;
    }
  }
}
