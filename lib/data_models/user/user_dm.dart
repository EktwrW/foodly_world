import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/user/user_prefs_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dm.freezed.dart';
part 'user_dm.g.dart';

@freezed
class UserDM with _$UserDM {
  const UserDM._();

  const factory UserDM({
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'country') FoodlyCountries? country,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'zip_code') String? zipCode,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'photo') @Default(FoodlyStrings.USER_AVATAR_PLACEHOLDER) String? avatar,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'created_at') DateTime? signUpDate,
    @JsonKey(name: 'updated_at') DateTime? lastUpdated,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'gender') UserGender? gender,
    @JsonKey(name: 'role_id') @Default(UserRole.visitor) UserRole roleId,
    @JsonKey(name: 'user_role') String? userRole,
    //@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
    @JsonKey(name: 'business') @Default([]) List<BusinessDM> business,
    @JsonKey(name: 'user-prefs') UserPrefsDM? userPrefs,
    @JsonKey(name: 'social_provider') List<LoginProviderDM>? socialProvider,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'provider') String? provider,
    @JsonKey(name: 'provider_id') String? providerId,
    @JsonKey(name: 'provider_avatar') String? providerAvatar,
    @JsonKey(name: 'favorite_businesses') @Default([]) List<String> favoriteBusiness,
    @JsonKey(name: 'favorite_menus') @Default([]) List<String> favoriteMenus,
    @JsonKey(name: 'favorite_items') @Default([]) List<String> favoriteItems,
    @JsonKey(name: 'saved_promotions') @Default([]) List<String> savedPromotions,
  }) = _UserDM;

  factory UserDM.fromJson(Map<String, dynamic> json) => _$UserDMFromJson(json);

  bool get isManager => userRole == 'Manager' || roleId == UserRole.owner;
  bool get isClient => userRole == 'Client' || roleId == UserRole.customer;

  String get fullName => '$firstName $lastName';
  String get fullAddress {
    return [
      address,
      city,
      zipCode,
      country?.value,
    ].where((element) => element != null && element.isNotEmpty).join(', ');
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
