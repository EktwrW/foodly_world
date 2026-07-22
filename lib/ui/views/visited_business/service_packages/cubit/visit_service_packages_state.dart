part of 'visit_service_packages_cubit.dart';

@freezed
sealed class VisitServicePackagesState with _$VisitServicePackagesState {
  const factory VisitServicePackagesState.initial() = _Initial;
  const factory VisitServicePackagesState.loading() = _Loading;
  const factory VisitServicePackagesState.loaded({
    ProfessionalProfileDM? profile,
    @Default([]) List<ServicePackageDM> packages,
    // Whether the business currently accepts incoming service requests.
    // Mirrors the dashboard switch `allow_reservations` — when false the
    // CTA to request a booking must be disabled on this page. Defaults to
    // true so deep-links that land on the packages page without an
    // attached BusinessDM don't force-close the CTA (the BE guard in
    // ReservationController::storeServiceBooking is the ultimate source
    // of truth; this field is just a UX hint).
    @Default(true) bool allowReservations,
  }) = _Loaded;
  const factory VisitServicePackagesState.error(String message) = _Error;
}
