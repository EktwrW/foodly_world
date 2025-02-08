import 'package:json_annotation/json_annotation.dart';

part 'menu_register_dto.g.dart';

@JsonSerializable()
class MenuRegisterDTO {
  @JsonKey(name: 'business_id')
  final int businessId;

  const MenuRegisterDTO({
    required this.businessId,
  });

  factory MenuRegisterDTO.fromJson(Map<String, dynamic> json) => _$MenuRegisterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MenuRegisterDTOToJson(this);
}
