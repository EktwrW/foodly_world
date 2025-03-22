import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_businesses_response_dm.g.dart';

@JsonSerializable(createToJson: false)
class FavoriteBusinessesResponseDM {
  @JsonKey(name: 'favorite_businesses', defaultValue: [])
  final List<BusinessDM> favoriteBusinesses;

  const FavoriteBusinessesResponseDM({this.favoriteBusinesses = const []});

  factory FavoriteBusinessesResponseDM.fromJson(Map<String, dynamic> json) =>
      _$FavoriteBusinessesResponseDMFromJson(json);
}
