import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body_update_dto.freezed.dart';
part 'user_body_update_dto.g.dart';

@freezed
class UserBodyUpdateDTO with _$UserBodyUpdateDTO {
  const factory UserBodyUpdateDTO({
    @JsonKey(name: 'username') String? userName,
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'current_password') String? password,
    @JsonKey(name: 'new_password') String? newPassword,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'zip_code') String? zipCode,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'country') FoodlyCountries? country,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'role_id') UserRole? roleId,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
  }) = _UserBodyUpdateDTO;

  factory UserBodyUpdateDTO.fromJson(Map<String, dynamic> json) => _$UserBodyUpdateDTOFromJson(json);
}
