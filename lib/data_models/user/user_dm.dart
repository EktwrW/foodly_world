import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/user/user_prefs_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dm.freezed.dart';
part 'user_dm.g.dart';

// Conversor personalizado para FoodlyCountries
class FoodlyCountriesConverter implements JsonConverter<FoodlyCountries?, String?> {
  const FoodlyCountriesConverter();

  @override
  FoodlyCountries? fromJson(String? json) {
    if (json == null) return null;
    try {
      return FoodlyCountries.values.firstWhere(
        (country) => country.value == json,
        orElse: () => throw ArgumentError('Unknown country: $json'),
      );
    } catch (e) {
      // Si no se encuentra el país, retorna null o un valor por defecto
      return null;
    }
  }

  @override
  String? toJson(FoodlyCountries? object) => object?.value;
}

@freezed
class UserDM with _$UserDM {
  const UserDM._();

  const factory UserDM({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'photo') @Default(FoodlyStrings.USER_AVATAR_PLACEHOLDER) String? avatar,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'created_at') DateTime? signUpDate,
    @JsonKey(name: 'updated_at') DateTime? lastUpdated,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'gender') UserGender? gender,
    @JsonKey(name: 'role_id') @Default(UserRole.visitor) UserRole roleId,
    @JsonKey(name: 'user_role') String? userRole,
    @JsonKey(name: 'terms_and_conditions') @Default(false) bool termsAndConditions,
    //@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
    @JsonKey(name: 'business') @Default([]) List<BusinessDM> business,
    @JsonKey(name: 'user-prefs') UserPrefsDM? userPrefs,
    @JsonKey(name: 'social_provider') List<LoginProviderDM>? socialProvider,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'provider') String? provider,
    @JsonKey(name: 'provider_id') String? providerId,
    @JsonKey(name: 'provider_avatar') String? providerAvatar,
    @JsonKey(name: 'addresses') @Default([]) List<AddressDM> addresses,
    @JsonKey(name: 'favorite_businesses') @Default([]) List<String> favoriteBusiness,
    @JsonKey(name: 'favorite_menus') @Default([]) List<String> favoriteMenus,
    @JsonKey(name: 'favorite_items') @Default([]) List<String> favoriteItems,
    @JsonKey(name: 'favorite_combos') @Default([]) List<String> favoriteCombos,
    @JsonKey(name: 'saved_promotions') @Default([]) List<String> savedPromotions,
    @JsonKey(name: 'followers') @Default([]) List<String> followers,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,
    @JsonKey(name: 'following') @Default([]) List<String> following,
    @JsonKey(name: 'following_length') @Default(0) int followingLength,
  }) = _UserDM;

  factory UserDM.fromJson(Map<String, dynamic> json) => _$UserDMFromJson(json);

  bool get isManager => userRole == 'Manager' || roleId == UserRole.owner;
  bool get isClient => userRole == 'Client' || roleId == UserRole.customer;

  String get fullName => '$firstName $lastName';

  /// Retorna la dirección "Home" por defecto, o la primera dirección si no hay Home, o vacío si no hay direcciones
  String get fullAddress {
    if (addresses.isEmpty) return '';

    // Buscar dirección "Home" primero
    final homeAddress = addresses.firstWhereOrNull((addr) => addr.isHome);
    if (homeAddress != null) {
      return homeAddress.fullAddress;
    }

    // Si no hay dirección Home, buscar la principal
    final principalAddress = addresses.firstWhereOrNull((addr) => addr.principal);
    if (principalAddress != null) {
      return principalAddress.fullAddress;
    }

    // Si no hay principal, retornar la primera
    return addresses.first.fullAddress;
  }

  /// Retorna la dirección "Home" o null si no existe
  AddressDM? get homeAddress {
    return addresses.firstWhereOrNull((addr) => addr.isHome);
  }

  /// Retorna la dirección principal o null si no existe
  AddressDM? get principalAddress {
    return addresses.firstWhereOrNull((addr) => addr.principal);
  }

  /// Retorna una dirección específica por su UUID
  AddressDM? getAddressByUuid(String uuid) {
    return addresses.firstWhereOrNull((addr) => addr.uuid == uuid);
  }

  /// Retorna todas las direcciones excepto la especificada por UUID
  List<AddressDM> getOtherAddresses(String excludeUuid) {
    return addresses.where((addr) => addr.uuid != excludeUuid).toList();
  }

  /// Retorna todas las direcciones que no son "Home"
  List<AddressDM> get nonHomeAddresses {
    return addresses.where((addr) => !addr.isHome).toList();
  }

  bool get _userHasNoAvatar => avatar == null || (avatar?.contains('ui-avatars.com') ?? false);
  String get avatarUrl {
    if (_userHasNoAvatar) {
      final photoFromProvider =
          providerAvatar ?? socialProvider?.firstWhereOrNull((sp) => sp.providerAvatar.isNotEmpty)?.providerAvatar;

      return photoFromProvider ?? '';
    }
    return avatar ?? '';
  }

  bool get isVisitor => roleId == UserRole.visitor;
  bool get mustSignInFromProvider =>
      (provider?.isNotEmpty ?? false) || (socialProvider?.any((p) => p.provider.isNotEmpty) ?? false);

  String get getFirstNameForSignUp => mustSignInFromProvider ? firstName ?? '' : '';
  String get getLastNameForSignUp => mustSignInFromProvider ? lastName ?? '' : '';
  String get getEmailForSignUp => mustSignInFromProvider ? email ?? '' : '';
  String? get getAvatarForSignUp => mustSignInFromProvider ? providerAvatar : null;

  /// Verifica si el usuario tiene al menos una dirección
  bool get hasAddresses => addresses.isNotEmpty;

  /// Verifica si el usuario ha aceptado términos y condiciones
  bool get hasAcceptedTerms => termsAndConditions;
}

@freezed
class AddressLabelDM with _$AddressLabelDM {
  factory AddressLabelDM({
    int? id,
    String? uuid,
    required String name,
    String? description,
    String? icon,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _AddressLabelDM;

  factory AddressLabelDM.fromJson(Map<String, dynamic> json) => _$AddressLabelDMFromJson(json);
}

@freezed
class AddressDM with _$AddressDM {
  const AddressDM._();

  factory AddressDM({
    required int id,
    required String uuid,
    required String address,
    required String city,
    // MANTENER el enum pero con conversor personalizado
    @FoodlyCountriesConverter() FoodlyCountries? country,
    @JsonKey(name: 'zip_code') required String zipCode,
    required double latitude,
    required double longitude,
    // CORREGIDO: Cambiar el mapeo para que coincida con el JSON response
    @JsonKey(name: 'label') required AddressLabelDM addressLabel,
    @Default(false) bool principal,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _AddressDM;

  factory AddressDM.fromJson(Map<String, dynamic> json) => _$AddressDMFromJson(json);

  String get fullAddress {
    return [
      address,
      city,
      zipCode,
      country?.value ?? '',
    ].where((element) => element.isNotEmpty).join(', ');
  }

  bool get isHome => addressLabel.name.toLowerCase() == 'home';
}

enum UserGender {
  @JsonValue('male')
  male('male'),
  @JsonValue('female')
  female('female'),
  @JsonValue('other')
  other('other'),
  @JsonValue('prefer_not_to_say')
  preferNotToSay('prefer_not_to_say');

  final String key;
  const UserGender(this.key);

  String get text => switch (this) {
        male => S.current.male,
        female => S.current.female,
        other => S.current.other,
        preferNotToSay => S.current.preferNotToSay,
      };
}

enum UserRole {
  @JsonValue(null)
  visitor,

  @JsonValue(1)
  superAdmin,

  @JsonValue(2)
  owner,

  @JsonValue(3)
  admin,

  @JsonValue(4)
  customer;

  String get renderText => switch (this) {
        customer => S.current.customer,
        owner => S.current.owner,
        admin => S.current.admin,
        _ => S.current.visitor,
      };
}

@freezed
class LoginProviderDM with _$LoginProviderDM {
  factory LoginProviderDM({
    required int id,
    required String uuid,
    required String provider,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'provider_avatar') required String providerAvatar,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _LoginProviderDM;

  factory LoginProviderDM.fromJson(Map<String, dynamic> json) => _$LoginProviderDMFromJson(json);
}
