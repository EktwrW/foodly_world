import 'package:json_annotation/json_annotation.dart';

part 'category_register_dto.g.dart';

@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: 'business_menu_id', includeIfNull: false)
  final int? businessMenuId;
  final String name;

  const CategoryDTO({
    this.businessMenuId,
    required this.name,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$CategoryDTOToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
