import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_body_register_dto.g.dart';

@JsonSerializable()
class UserBodyRegisterDTO {
  @JsonKey(name: 'username')
  final String userName;

  @JsonKey(name: 'name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'zip_code')
  final String zipCode;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'country')
  final String country;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'role_id')
  final UserRole? roleId;

  const UserBodyRegisterDTO({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.gender,
    required this.roleId,
  });

  factory UserBodyRegisterDTO.fromJson(Map<String, dynamic> json) => _$UserBodyRegisterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserBodyRegisterDTOToJson(this);
}
