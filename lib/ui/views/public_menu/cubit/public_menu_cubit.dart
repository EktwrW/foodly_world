import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_repo.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_state.dart';

class PublicMenuCubit extends Cubit<PublicMenuState> {
  final PublicMenuRepo _repo;

  PublicMenuCubit({required PublicMenuRepo repo})
      : _repo = repo,
        super(const PublicMenuState.initial());

  Future<void> load(String businessUuid) async {
    emit(const PublicMenuState.loading());
    final result = await _repo.fetchPublicMenu(businessUuid);
    result.when(
      success: (data) => emit(PublicMenuState.loaded(
        business: data.business,
        menu: data.menu,
      )),
      failure: (e) => emit(PublicMenuState.error(e.toString())),
    );
  }
}
