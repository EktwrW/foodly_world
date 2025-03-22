import 'package:json_annotation/json_annotation.dart';

part 'set_favorite_body_dto.g.dart';

@JsonSerializable()
class SetFavoriteBodyDTO {
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  const SetFavoriteBodyDTO({
    required this.isFavorite,
  });

  factory SetFavoriteBodyDTO.fromJson(Map<String, dynamic> json) => _$SetFavoriteBodyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SetFavoriteBodyDTOToJson(this);
}
