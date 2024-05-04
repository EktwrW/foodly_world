import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show GlobalKey, ScaffoldState;
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_drawer_cubit.freezed.dart';
part 'main_drawer_state.dart';

class MainDrawerCubit extends Cubit<MainDrawerState> {
  static final _meRepo = di<MeRepo>();
  MainDrawerVM _vm;

  MainDrawerCubit()
      : _vm = MainDrawerVM(
          avatarUrl: di<AuthSessionService>().userSessionDM?.user.avatarUrl ?? '',
          scaffoldKey: GlobalKey<ScaffoldState>(),
        ),
        super(const MainDrawerState.initial(MainDrawerVM())) {
    emit(_Loaded(_vm));
  }

  void updateProfilePhoto(String path) async {
    emit(_UpdatingAvatar(_vm));
    await _meRepo.updateProfilePhoto(filePath: path).then(
          (response) async => response.when(
            success: (_) async {
              await _meRepo.fetchLoggedUser().then(
                    (result) => result.when(
                      success: (userDM) {
                        final newUserSessionDM = di<AuthSessionService>().userSessionDM?.copyWith(user: userDM);
                        di<AuthSessionService>().setSession(newUserSessionDM);

                        _vm = _vm.copyWith(
                            avatarUrl:
                                userDM.avatarUrl ?? di<AuthSessionService>().userSessionDM?.user.avatarUrl ?? '');

                        emit(_Loaded(_vm));
                      },
                      failure: (e) => emit(_Error(e.errorMsg, _vm)),
                    ),
                  );
            },
            failure: (e) => emit(_Error(e.errorMsg, _vm)),
          ),
        );
  }
}
