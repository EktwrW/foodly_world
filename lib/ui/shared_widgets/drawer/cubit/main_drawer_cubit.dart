import 'package:bloc/bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/view_model/main_drawer_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sidebarx/sidebarx.dart' show SidebarXController;

part 'main_drawer_cubit.freezed.dart';
part 'main_drawer_state.dart';

class MainDrawerCubit extends Cubit<MainDrawerState> {
  final _meRepo = di<MeRepo>();
  MainDrawerVM _vm;

  MainDrawerCubit()
      : _vm = MainDrawerVM(
          sidebarController: SidebarXController(selectedIndex: 0),
        ),
        super(_Loaded(MainDrawerVM(
          sidebarController: SidebarXController(selectedIndex: 0),
        ))) {
    emit(_Loaded(_vm));
  }

  void updateSelectedIndex(int newIndex) {
    final newHistory = [..._vm.indexHistory, newIndex];
    _vm.sidebarController.selectIndex(newIndex);
    _vm = _vm.copyWith(indexHistory: newHistory);
    emit(_Loaded(_vm));
  }

  void goToPreviousIndex() {
    if (_vm.canGoBack) {
      final newHistory = _vm.indexHistory.take(_vm.indexHistory.length - 1).toList();
      final previousIndex = newHistory.last;
      _vm.sidebarController.selectIndex(previousIndex);
      _vm = _vm.copyWith(indexHistory: newHistory);
      emit(_Loaded(_vm));
    }
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
