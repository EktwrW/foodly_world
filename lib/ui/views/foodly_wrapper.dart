import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/local_auth/local_auth_cubit.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/views/foodly_location_wrapper.dart';

/// Wrapper class to handler local auth (biometric) & location management + incoming (next) global handlers
class FoodlyWrapper extends StatelessWidget {
  final Widget child;

  const FoodlyWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => false,
      child: Scaffold(
        body: BlocConsumer<LocalAuthCubit, LocalAuthState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: (_) => di<DialogService>().showLoading(),
              needAuthentication: (localAuthDTO) {
                di<DialogService>().showLoading();
                context.read<LocalAuthCubit>().authenticate().then((value) => di<DialogService>().hideLoading());
              },
              authenticated: (localAuthDTO) {
                di<AuthSessionService>().updateForceToLogin(false);
                context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
              },
              error: (msg, localAuthDTO) {
                di<AuthSessionService>().updateForceToLogin(true);
                di<AuthSessionService>().exit(context);
              },
            );
          },
          builder: (context, state) {
            return FoodlyLocationWrapper(childWidget: child);
          },
        ),
      ),
    );
  }
}
