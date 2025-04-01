import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker, GoogleMapController;

export 'package:foodly_world/data_models/business/business_dm.dart';

part 'visit_business_vm.freezed.dart';

@freezed
class VisitBusinessVM with _$VisitBusinessVM {
  const VisitBusinessVM._();

  const factory VisitBusinessVM({
    BusinessDM? currentBusiness,
    @Default({}) Set<Marker> markers,
    GoogleMapController? mapController,
  }) = _VisitBusinessVM;
}
