part of 'dashboard_bloc.dart';

BusinessUpdateDTO getContactUsFields(BusinessUpdateDTO dto, DashboardVM vm) {
  if (vm.businessEmailCtrl?.text?.isNotEmpty ?? false) {
    dto = dto.copyWith(businessEmail: vm.businessEmailCtrl?.text);
  }

  if (vm.businessPhoneCtrl?.text?.isNotEmpty ?? false) {
    dto = dto.copyWith(businessPhone: vm.businessPhoneCtrl?.text);
  }
  return dto;
}
