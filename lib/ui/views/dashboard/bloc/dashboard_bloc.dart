import 'package:bloc/bloc.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  static final _authService = di<AuthSessionService>();
  static final _businessRepo = di<BusinessRepo>();
  DashboardVM _vm;

  DashboardBloc()
      : _vm = DashboardVM(
          myBusinessesses: _authService.userSessionDM?.user.business ?? [],
          currentBusiness: _authService.userSessionDM?.user.business.first,
        ),
        super(const _Initial(DashboardVM())) {
    on<DashboardEvent>((events, emit) async {
      events.map(started: (_Started value) async {
        fetchAllBusinesses(emit);
      });
    });
  }

  void fetchAllBusinesses(Emitter emit) async {
    emit(_Loading(_vm));
    final businesses = <BusinessDM>[];

    for (final business in _vm.myBusinessesses) {
      if (business.id?.isNotEmpty ?? false) {
        await _businessRepo.fetchBusinessById(business.id!).then(
              (response) => response.when(
                success: (business) => businesses.add(business),
                failure: (error) {
                  di<Logger>().e(error);
                  emit(_Error('$error', _vm));
                },
              ),
            );
      }
    }

    _vm = _vm.copyWith(
      myBusinessesses: businesses,
      currentBusiness: businesses.firstWhereOrNull((e) => e.id == _vm.currentBusiness?.id),
    );
    emit(_Loaded(_vm));
  }
}
