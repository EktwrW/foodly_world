import 'package:foodly_world/core/enums/foodly_countries.dart';
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

  /// ISO del país del teléfono (ej. 'AR'), separado del número nacional.
  @JsonKey(name: 'phone_country_code')
  final String? phoneCountryCode;

  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'zip_code')
  final String zipCode;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'country')
  final FoodlyCountries country;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'role_id')
  final UserRole? roleId;

  @JsonKey(name: 'terms_and_conditions')
  final bool termsAndContiditionsAccepted;

  @JsonKey(name: 'latitude')
  final double? latitude;

  @JsonKey(name: 'longitude')
  final double? longitude;

  @JsonKey(name: 'addresses')
  final List<AddressDM>? addresses;

  @JsonKey(name: 'firebase_phone_token')
  final String? firebasePhoneToken;

  /// When set, tells the backend that this sign-up originated from a verified
  /// social provider (Google, etc.) and the password requirement is waived.
  @JsonKey(name: 'provider')
  final String? provider;

  /// Stable user id issued by the social provider.
  @JsonKey(name: 'provider_id')
  final String? providerId;

  const UserBodyRegisterDTO({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    this.phoneCountryCode,
    required this.dateOfBirth,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.gender,
    required this.roleId,
    required this.termsAndContiditionsAccepted,
    required this.latitude,
    required this.longitude,
    this.addresses,
    this.firebasePhoneToken,
    this.provider,
    this.providerId,
  });

  factory UserBodyRegisterDTO.fromJson(Map<String, dynamic> json) => _$UserBodyRegisterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserBodyRegisterDTOToJson(this);
}
