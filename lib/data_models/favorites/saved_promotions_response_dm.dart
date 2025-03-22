import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_promotions_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class SavedPromotionsResponseDM {
  @JsonKey(name: 'saved_promotions', defaultValue: [])
  final List<PromotionDM> savedPromotions;

  const SavedPromotionsResponseDM({this.savedPromotions = const []});

  factory SavedPromotionsResponseDM.fromJson(Map<String, dynamic> json) => _$SavedPromotionsResponseDMFromJson(json);
}
