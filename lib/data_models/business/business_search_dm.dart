import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_search_dm.freezed.dart';
part 'business_search_dm.g.dart';

@freezed
class BusinessSearchDM with _$BusinessSearchDM {
  const factory BusinessSearchDM({
    @JsonKey(name: 'business') required List<BusinessDM> business,
  }) = _BusinessSearchDM;

  factory BusinessSearchDM.fromJson(Map<String, dynamic> json) => _$BusinessSearchDMFromJson(json);
}
