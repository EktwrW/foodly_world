// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDM _$UserDMFromJson(Map<String, dynamic> json) {
  return _UserDM.fromJson(json);
}

/// @nodoc
mixin _$UserDM {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone =>
      throw _privateConstructorUsedError; // ISO del país del teléfono (ej. 'AR'). Separado del número nacional en
// `phone` para poder reconstruir el internacional y re-renderar la bandera.
  @JsonKey(name: 'phone_country_code')
  String? get phoneCountryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get signUpDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  UserGender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  UserRole get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_role')
  String? get userRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_and_conditions')
  bool get termsAndConditions =>
      throw _privateConstructorUsedError; //@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
  @JsonKey(name: 'business')
  List<BusinessDM> get business => throw _privateConstructorUsedError;
  @JsonKey(name: 'user-prefs')
  UserPrefsDM? get userPrefs => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_provider')
  List<LoginProviderDM>? get socialProvider =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider')
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_id')
  String? get providerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_avatar')
  String? get providerAvatar =>
      throw _privateConstructorUsedError; // True when the user has an email/password credential set. False for
// social-only users (Google/FB). Drives the profile UI between "Set
// password" and "Change password". Nullable for backward-compat with
// older payloads that don't include the field.
  @JsonKey(name: 'has_password')
  bool? get hasPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'addresses')
  List<AddressDM> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_businesses')
  List<String> get favoriteBusiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_menus')
  List<String> get favoriteMenus => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_items')
  List<String> get favoriteItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_combos')
  List<String> get favoriteCombos => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved_promotions')
  List<String> get savedPromotions => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers')
  List<String> get followers => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_length')
  int get followersLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'following')
  List<String> get following => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_length')
  int get followingLength => throw _privateConstructorUsedError;

  /// Serializes this UserDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDMCopyWith<UserDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDMCopyWith<$Res> {
  factory $UserDMCopyWith(UserDM value, $Res Function(UserDM) then) =
      _$UserDMCopyWithImpl<$Res, UserDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'photo') String? avatar,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
      @JsonKey(name: 'created_at') DateTime? signUpDate,
      @JsonKey(name: 'updated_at') DateTime? lastUpdated,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
      @JsonKey(name: 'gender') UserGender? gender,
      @JsonKey(name: 'role_id') UserRole roleId,
      @JsonKey(name: 'user_role') String? userRole,
      @JsonKey(name: 'terms_and_conditions') bool termsAndConditions,
      @JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'user-prefs') UserPrefsDM? userPrefs,
      @JsonKey(name: 'social_provider') List<LoginProviderDM>? socialProvider,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'provider') String? provider,
      @JsonKey(name: 'provider_id') String? providerId,
      @JsonKey(name: 'provider_avatar') String? providerAvatar,
      @JsonKey(name: 'has_password') bool? hasPassword,
      @JsonKey(name: 'addresses') List<AddressDM> addresses,
      @JsonKey(name: 'favorite_businesses') List<String> favoriteBusiness,
      @JsonKey(name: 'favorite_menus') List<String> favoriteMenus,
      @JsonKey(name: 'favorite_items') List<String> favoriteItems,
      @JsonKey(name: 'favorite_combos') List<String> favoriteCombos,
      @JsonKey(name: 'saved_promotions') List<String> savedPromotions,
      @JsonKey(name: 'followers') List<String> followers,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'following') List<String> following,
      @JsonKey(name: 'following_length') int followingLength});

  $UserPrefsDMCopyWith<$Res>? get userPrefs;
}

/// @nodoc
class _$UserDMCopyWithImpl<$Res, $Val extends UserDM>
    implements $UserDMCopyWith<$Res> {
  _$UserDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? phone = freezed,
    Object? phoneCountryCode = freezed,
    Object? signUpDate = freezed,
    Object? lastUpdated = freezed,
    Object? deletedAt = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? roleId = null,
    Object? userRole = freezed,
    Object? termsAndConditions = null,
    Object? business = null,
    Object? userPrefs = freezed,
    Object? socialProvider = freezed,
    Object? emailVerifiedAt = freezed,
    Object? provider = freezed,
    Object? providerId = freezed,
    Object? providerAvatar = freezed,
    Object? hasPassword = freezed,
    Object? addresses = null,
    Object? favoriteBusiness = null,
    Object? favoriteMenus = null,
    Object? favoriteItems = null,
    Object? favoriteCombos = null,
    Object? savedPromotions = null,
    Object? followers = null,
    Object? followersLength = null,
    Object? following = null,
    Object? followingLength = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpDate: freezed == signUpDate
          ? _value.signUpDate
          : signUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      userPrefs: freezed == userPrefs
          ? _value.userPrefs
          : userPrefs // ignore: cast_nullable_to_non_nullable
              as UserPrefsDM?,
      socialProvider: freezed == socialProvider
          ? _value.socialProvider
          : socialProvider // ignore: cast_nullable_to_non_nullable
              as List<LoginProviderDM>?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerAvatar: freezed == providerAvatar
          ? _value.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPassword: freezed == hasPassword
          ? _value.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDM>,
      favoriteBusiness: null == favoriteBusiness
          ? _value.favoriteBusiness
          : favoriteBusiness // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteMenus: null == favoriteMenus
          ? _value.favoriteMenus
          : favoriteMenus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteItems: null == favoriteItems
          ? _value.favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCombos: null == favoriteCombos
          ? _value.favoriteCombos
          : favoriteCombos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedPromotions: null == savedPromotions
          ? _value.savedPromotions
          : savedPromotions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followingLength: null == followingLength
          ? _value.followingLength
          : followingLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPrefsDMCopyWith<$Res>? get userPrefs {
    if (_value.userPrefs == null) {
      return null;
    }

    return $UserPrefsDMCopyWith<$Res>(_value.userPrefs!, (value) {
      return _then(_value.copyWith(userPrefs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDMImplCopyWith<$Res> implements $UserDMCopyWith<$Res> {
  factory _$$UserDMImplCopyWith(
          _$UserDMImpl value, $Res Function(_$UserDMImpl) then) =
      __$$UserDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'photo') String? avatar,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'phone_country_code') String? phoneCountryCode,
      @JsonKey(name: 'created_at') DateTime? signUpDate,
      @JsonKey(name: 'updated_at') DateTime? lastUpdated,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
      @JsonKey(name: 'gender') UserGender? gender,
      @JsonKey(name: 'role_id') UserRole roleId,
      @JsonKey(name: 'user_role') String? userRole,
      @JsonKey(name: 'terms_and_conditions') bool termsAndConditions,
      @JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'user-prefs') UserPrefsDM? userPrefs,
      @JsonKey(name: 'social_provider') List<LoginProviderDM>? socialProvider,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'provider') String? provider,
      @JsonKey(name: 'provider_id') String? providerId,
      @JsonKey(name: 'provider_avatar') String? providerAvatar,
      @JsonKey(name: 'has_password') bool? hasPassword,
      @JsonKey(name: 'addresses') List<AddressDM> addresses,
      @JsonKey(name: 'favorite_businesses') List<String> favoriteBusiness,
      @JsonKey(name: 'favorite_menus') List<String> favoriteMenus,
      @JsonKey(name: 'favorite_items') List<String> favoriteItems,
      @JsonKey(name: 'favorite_combos') List<String> favoriteCombos,
      @JsonKey(name: 'saved_promotions') List<String> savedPromotions,
      @JsonKey(name: 'followers') List<String> followers,
      @JsonKey(name: 'followers_length') int followersLength,
      @JsonKey(name: 'following') List<String> following,
      @JsonKey(name: 'following_length') int followingLength});

  @override
  $UserPrefsDMCopyWith<$Res>? get userPrefs;
}

/// @nodoc
class __$$UserDMImplCopyWithImpl<$Res>
    extends _$UserDMCopyWithImpl<$Res, _$UserDMImpl>
    implements _$$UserDMImplCopyWith<$Res> {
  __$$UserDMImplCopyWithImpl(
      _$UserDMImpl _value, $Res Function(_$UserDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? phone = freezed,
    Object? phoneCountryCode = freezed,
    Object? signUpDate = freezed,
    Object? lastUpdated = freezed,
    Object? deletedAt = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? roleId = null,
    Object? userRole = freezed,
    Object? termsAndConditions = null,
    Object? business = null,
    Object? userPrefs = freezed,
    Object? socialProvider = freezed,
    Object? emailVerifiedAt = freezed,
    Object? provider = freezed,
    Object? providerId = freezed,
    Object? providerAvatar = freezed,
    Object? hasPassword = freezed,
    Object? addresses = null,
    Object? favoriteBusiness = null,
    Object? favoriteMenus = null,
    Object? favoriteItems = null,
    Object? favoriteCombos = null,
    Object? savedPromotions = null,
    Object? followers = null,
    Object? followersLength = null,
    Object? following = null,
    Object? followingLength = null,
  }) {
    return _then(_$UserDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpDate: freezed == signUpDate
          ? _value.signUpDate
          : signUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      business: null == business
          ? _value._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      userPrefs: freezed == userPrefs
          ? _value.userPrefs
          : userPrefs // ignore: cast_nullable_to_non_nullable
              as UserPrefsDM?,
      socialProvider: freezed == socialProvider
          ? _value._socialProvider
          : socialProvider // ignore: cast_nullable_to_non_nullable
              as List<LoginProviderDM>?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerAvatar: freezed == providerAvatar
          ? _value.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPassword: freezed == hasPassword
          ? _value.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDM>,
      favoriteBusiness: null == favoriteBusiness
          ? _value._favoriteBusiness
          : favoriteBusiness // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteMenus: null == favoriteMenus
          ? _value._favoriteMenus
          : favoriteMenus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteItems: null == favoriteItems
          ? _value._favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCombos: null == favoriteCombos
          ? _value._favoriteCombos
          : favoriteCombos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedPromotions: null == savedPromotions
          ? _value._savedPromotions
          : savedPromotions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followersLength: null == followersLength
          ? _value.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followingLength: null == followingLength
          ? _value.followingLength
          : followingLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDMImpl extends _UserDM {
  const _$UserDMImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'photo')
      this.avatar = FoodlyStrings.USER_AVATAR_PLACEHOLDER,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'phone_country_code') this.phoneCountryCode,
      @JsonKey(name: 'created_at') this.signUpDate,
      @JsonKey(name: 'updated_at') this.lastUpdated,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'role_id') this.roleId = UserRole.visitor,
      @JsonKey(name: 'user_role') this.userRole,
      @JsonKey(name: 'terms_and_conditions') this.termsAndConditions = false,
      @JsonKey(name: 'business') final List<BusinessDM> business = const [],
      @JsonKey(name: 'user-prefs') this.userPrefs,
      @JsonKey(name: 'social_provider')
      final List<LoginProviderDM>? socialProvider,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'provider') this.provider,
      @JsonKey(name: 'provider_id') this.providerId,
      @JsonKey(name: 'provider_avatar') this.providerAvatar,
      @JsonKey(name: 'has_password') this.hasPassword,
      @JsonKey(name: 'addresses') final List<AddressDM> addresses = const [],
      @JsonKey(name: 'favorite_businesses')
      final List<String> favoriteBusiness = const [],
      @JsonKey(name: 'favorite_menus')
      final List<String> favoriteMenus = const [],
      @JsonKey(name: 'favorite_items')
      final List<String> favoriteItems = const [],
      @JsonKey(name: 'favorite_combos')
      final List<String> favoriteCombos = const [],
      @JsonKey(name: 'saved_promotions')
      final List<String> savedPromotions = const [],
      @JsonKey(name: 'followers') final List<String> followers = const [],
      @JsonKey(name: 'followers_length') this.followersLength = 0,
      @JsonKey(name: 'following') final List<String> following = const [],
      @JsonKey(name: 'following_length') this.followingLength = 0})
      : _business = business,
        _socialProvider = socialProvider,
        _addresses = addresses,
        _favoriteBusiness = favoriteBusiness,
        _favoriteMenus = favoriteMenus,
        _favoriteItems = favoriteItems,
        _favoriteCombos = favoriteCombos,
        _savedPromotions = savedPromotions,
        _followers = followers,
        _following = following,
        super._();

  factory _$UserDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDMImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'photo')
  final String? avatar;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
// ISO del país del teléfono (ej. 'AR'). Separado del número nacional en
// `phone` para poder reconstruir el internacional y re-renderar la bandera.
  @override
  @JsonKey(name: 'phone_country_code')
  final String? phoneCountryCode;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? signUpDate;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? lastUpdated;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  final UserGender? gender;
  @override
  @JsonKey(name: 'role_id')
  final UserRole roleId;
  @override
  @JsonKey(name: 'user_role')
  final String? userRole;
  @override
  @JsonKey(name: 'terms_and_conditions')
  final bool termsAndConditions;
//@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
  final List<BusinessDM> _business;
//@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business {
    if (_business is EqualUnmodifiableListView) return _business;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_business);
  }

  @override
  @JsonKey(name: 'user-prefs')
  final UserPrefsDM? userPrefs;
  final List<LoginProviderDM>? _socialProvider;
  @override
  @JsonKey(name: 'social_provider')
  List<LoginProviderDM>? get socialProvider {
    final value = _socialProvider;
    if (value == null) return null;
    if (_socialProvider is EqualUnmodifiableListView) return _socialProvider;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'provider')
  final String? provider;
  @override
  @JsonKey(name: 'provider_id')
  final String? providerId;
  @override
  @JsonKey(name: 'provider_avatar')
  final String? providerAvatar;
// True when the user has an email/password credential set. False for
// social-only users (Google/FB). Drives the profile UI between "Set
// password" and "Change password". Nullable for backward-compat with
// older payloads that don't include the field.
  @override
  @JsonKey(name: 'has_password')
  final bool? hasPassword;
  final List<AddressDM> _addresses;
  @override
  @JsonKey(name: 'addresses')
  List<AddressDM> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<String> _favoriteBusiness;
  @override
  @JsonKey(name: 'favorite_businesses')
  List<String> get favoriteBusiness {
    if (_favoriteBusiness is EqualUnmodifiableListView)
      return _favoriteBusiness;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteBusiness);
  }

  final List<String> _favoriteMenus;
  @override
  @JsonKey(name: 'favorite_menus')
  List<String> get favoriteMenus {
    if (_favoriteMenus is EqualUnmodifiableListView) return _favoriteMenus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteMenus);
  }

  final List<String> _favoriteItems;
  @override
  @JsonKey(name: 'favorite_items')
  List<String> get favoriteItems {
    if (_favoriteItems is EqualUnmodifiableListView) return _favoriteItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteItems);
  }

  final List<String> _favoriteCombos;
  @override
  @JsonKey(name: 'favorite_combos')
  List<String> get favoriteCombos {
    if (_favoriteCombos is EqualUnmodifiableListView) return _favoriteCombos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCombos);
  }

  final List<String> _savedPromotions;
  @override
  @JsonKey(name: 'saved_promotions')
  List<String> get savedPromotions {
    if (_savedPromotions is EqualUnmodifiableListView) return _savedPromotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedPromotions);
  }

  final List<String> _followers;
  @override
  @JsonKey(name: 'followers')
  List<String> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;
  final List<String> _following;
  @override
  @JsonKey(name: 'following')
  List<String> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  @JsonKey(name: 'following_length')
  final int followingLength;

  @override
  String toString() {
    return 'UserDM(id: $id, uuid: $uuid, email: $email, username: $username, firstName: $firstName, lastName: $lastName, avatar: $avatar, phone: $phone, phoneCountryCode: $phoneCountryCode, signUpDate: $signUpDate, lastUpdated: $lastUpdated, deletedAt: $deletedAt, dateOfBirth: $dateOfBirth, gender: $gender, roleId: $roleId, userRole: $userRole, termsAndConditions: $termsAndConditions, business: $business, userPrefs: $userPrefs, socialProvider: $socialProvider, emailVerifiedAt: $emailVerifiedAt, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, hasPassword: $hasPassword, addresses: $addresses, favoriteBusiness: $favoriteBusiness, favoriteMenus: $favoriteMenus, favoriteItems: $favoriteItems, favoriteCombos: $favoriteCombos, savedPromotions: $savedPromotions, followers: $followers, followersLength: $followersLength, following: $following, followingLength: $followingLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
            (identical(other.signUpDate, signUpDate) ||
                other.signUpDate == signUpDate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            const DeepCollectionEquality().equals(other._business, _business) &&
            (identical(other.userPrefs, userPrefs) ||
                other.userPrefs == userPrefs) &&
            const DeepCollectionEquality()
                .equals(other._socialProvider, _socialProvider) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerAvatar, providerAvatar) ||
                other.providerAvatar == providerAvatar) &&
            (identical(other.hasPassword, hasPassword) ||
                other.hasPassword == hasPassword) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other._favoriteBusiness, _favoriteBusiness) &&
            const DeepCollectionEquality()
                .equals(other._favoriteMenus, _favoriteMenus) &&
            const DeepCollectionEquality()
                .equals(other._favoriteItems, _favoriteItems) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCombos, _favoriteCombos) &&
            const DeepCollectionEquality()
                .equals(other._savedPromotions, _savedPromotions) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            (identical(other.followingLength, followingLength) ||
                other.followingLength == followingLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        email,
        username,
        firstName,
        lastName,
        avatar,
        phone,
        phoneCountryCode,
        signUpDate,
        lastUpdated,
        deletedAt,
        dateOfBirth,
        gender,
        roleId,
        userRole,
        termsAndConditions,
        const DeepCollectionEquality().hash(_business),
        userPrefs,
        const DeepCollectionEquality().hash(_socialProvider),
        emailVerifiedAt,
        provider,
        providerId,
        providerAvatar,
        hasPassword,
        const DeepCollectionEquality().hash(_addresses),
        const DeepCollectionEquality().hash(_favoriteBusiness),
        const DeepCollectionEquality().hash(_favoriteMenus),
        const DeepCollectionEquality().hash(_favoriteItems),
        const DeepCollectionEquality().hash(_favoriteCombos),
        const DeepCollectionEquality().hash(_savedPromotions),
        const DeepCollectionEquality().hash(_followers),
        followersLength,
        const DeepCollectionEquality().hash(_following),
        followingLength
      ]);

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDMImplCopyWith<_$UserDMImpl> get copyWith =>
      __$$UserDMImplCopyWithImpl<_$UserDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDMImplToJson(
      this,
    );
  }
}

abstract class _UserDM extends UserDM {
  const factory _UserDM(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'photo') final String? avatar,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'phone_country_code') final String? phoneCountryCode,
      @JsonKey(name: 'created_at') final DateTime? signUpDate,
      @JsonKey(name: 'updated_at') final DateTime? lastUpdated,
      @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
      @JsonKey(name: 'date_of_birth') final DateTime? dateOfBirth,
      @JsonKey(name: 'gender') final UserGender? gender,
      @JsonKey(name: 'role_id') final UserRole roleId,
      @JsonKey(name: 'user_role') final String? userRole,
      @JsonKey(name: 'terms_and_conditions') final bool termsAndConditions,
      @JsonKey(name: 'business') final List<BusinessDM> business,
      @JsonKey(name: 'user-prefs') final UserPrefsDM? userPrefs,
      @JsonKey(name: 'social_provider')
      final List<LoginProviderDM>? socialProvider,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'provider') final String? provider,
      @JsonKey(name: 'provider_id') final String? providerId,
      @JsonKey(name: 'provider_avatar') final String? providerAvatar,
      @JsonKey(name: 'has_password') final bool? hasPassword,
      @JsonKey(name: 'addresses') final List<AddressDM> addresses,
      @JsonKey(name: 'favorite_businesses') final List<String> favoriteBusiness,
      @JsonKey(name: 'favorite_menus') final List<String> favoriteMenus,
      @JsonKey(name: 'favorite_items') final List<String> favoriteItems,
      @JsonKey(name: 'favorite_combos') final List<String> favoriteCombos,
      @JsonKey(name: 'saved_promotions') final List<String> savedPromotions,
      @JsonKey(name: 'followers') final List<String> followers,
      @JsonKey(name: 'followers_length') final int followersLength,
      @JsonKey(name: 'following') final List<String> following,
      @JsonKey(name: 'following_length')
      final int followingLength}) = _$UserDMImpl;
  const _UserDM._() : super._();

  factory _UserDM.fromJson(Map<String, dynamic> json) = _$UserDMImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'photo')
  String? get avatar;
  @override
  @JsonKey(name: 'phone')
  String?
      get phone; // ISO del país del teléfono (ej. 'AR'). Separado del número nacional en
// `phone` para poder reconstruir el internacional y re-renderar la bandera.
  @override
  @JsonKey(name: 'phone_country_code')
  String? get phoneCountryCode;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get signUpDate;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdated;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: 'gender')
  UserGender? get gender;
  @override
  @JsonKey(name: 'role_id')
  UserRole get roleId;
  @override
  @JsonKey(name: 'user_role')
  String? get userRole;
  @override
  @JsonKey(name: 'terms_and_conditions')
  bool
      get termsAndConditions; //@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business;
  @override
  @JsonKey(name: 'user-prefs')
  UserPrefsDM? get userPrefs;
  @override
  @JsonKey(name: 'social_provider')
  List<LoginProviderDM>? get socialProvider;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'provider')
  String? get provider;
  @override
  @JsonKey(name: 'provider_id')
  String? get providerId;
  @override
  @JsonKey(name: 'provider_avatar')
  String?
      get providerAvatar; // True when the user has an email/password credential set. False for
// social-only users (Google/FB). Drives the profile UI between "Set
// password" and "Change password". Nullable for backward-compat with
// older payloads that don't include the field.
  @override
  @JsonKey(name: 'has_password')
  bool? get hasPassword;
  @override
  @JsonKey(name: 'addresses')
  List<AddressDM> get addresses;
  @override
  @JsonKey(name: 'favorite_businesses')
  List<String> get favoriteBusiness;
  @override
  @JsonKey(name: 'favorite_menus')
  List<String> get favoriteMenus;
  @override
  @JsonKey(name: 'favorite_items')
  List<String> get favoriteItems;
  @override
  @JsonKey(name: 'favorite_combos')
  List<String> get favoriteCombos;
  @override
  @JsonKey(name: 'saved_promotions')
  List<String> get savedPromotions;
  @override
  @JsonKey(name: 'followers')
  List<String> get followers;
  @override
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @override
  @JsonKey(name: 'following')
  List<String> get following;
  @override
  @JsonKey(name: 'following_length')
  int get followingLength;

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDMImplCopyWith<_$UserDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressLabelDM _$AddressLabelDMFromJson(Map<String, dynamic> json) {
  return _AddressLabelDM.fromJson(json);
}

/// @nodoc
mixin _$AddressLabelDM {
  int? get id => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this AddressLabelDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressLabelDMCopyWith<AddressLabelDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressLabelDMCopyWith<$Res> {
  factory $AddressLabelDMCopyWith(
          AddressLabelDM value, $Res Function(AddressLabelDM) then) =
      _$AddressLabelDMCopyWithImpl<$Res, AddressLabelDM>;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      String name,
      String? description,
      String? icon,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$AddressLabelDMCopyWithImpl<$Res, $Val extends AddressLabelDM>
    implements $AddressLabelDMCopyWith<$Res> {
  _$AddressLabelDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressLabelDMImplCopyWith<$Res>
    implements $AddressLabelDMCopyWith<$Res> {
  factory _$$AddressLabelDMImplCopyWith(_$AddressLabelDMImpl value,
          $Res Function(_$AddressLabelDMImpl) then) =
      __$$AddressLabelDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      String name,
      String? description,
      String? icon,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$AddressLabelDMImplCopyWithImpl<$Res>
    extends _$AddressLabelDMCopyWithImpl<$Res, _$AddressLabelDMImpl>
    implements _$$AddressLabelDMImplCopyWith<$Res> {
  __$$AddressLabelDMImplCopyWithImpl(
      _$AddressLabelDMImpl _value, $Res Function(_$AddressLabelDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? isActive = null,
  }) {
    return _then(_$AddressLabelDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressLabelDMImpl implements _AddressLabelDM {
  _$AddressLabelDMImpl(
      {this.id,
      this.uuid,
      required this.name,
      this.description,
      this.icon,
      @JsonKey(name: 'is_active') this.isActive = true});

  factory _$AddressLabelDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressLabelDMImplFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'AddressLabelDM(id: $id, uuid: $uuid, name: $name, description: $description, icon: $icon, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressLabelDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, name, description, icon, isActive);

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressLabelDMImplCopyWith<_$AddressLabelDMImpl> get copyWith =>
      __$$AddressLabelDMImplCopyWithImpl<_$AddressLabelDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressLabelDMImplToJson(
      this,
    );
  }
}

abstract class _AddressLabelDM implements AddressLabelDM {
  factory _AddressLabelDM(
      {final int? id,
      final String? uuid,
      required final String name,
      final String? description,
      final String? icon,
      @JsonKey(name: 'is_active') final bool isActive}) = _$AddressLabelDMImpl;

  factory _AddressLabelDM.fromJson(Map<String, dynamic> json) =
      _$AddressLabelDMImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uuid;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressLabelDMImplCopyWith<_$AddressLabelDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressDM _$AddressDMFromJson(Map<String, dynamic> json) {
  return _AddressDM.fromJson(json);
}

/// @nodoc
mixin _$AddressDM {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city =>
      throw _privateConstructorUsedError; // MANTENER el enum pero con conversor personalizado
  @FoodlyCountriesConverter()
  FoodlyCountries? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_code')
  String get zipCode => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude =>
      throw _privateConstructorUsedError; // CORREGIDO: Cambiar el mapeo para que coincida con el JSON response
  @JsonKey(name: 'label')
  AddressLabelDM get addressLabel => throw _privateConstructorUsedError;
  bool get principal => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AddressDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressDMCopyWith<AddressDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDMCopyWith<$Res> {
  factory $AddressDMCopyWith(AddressDM value, $Res Function(AddressDM) then) =
      _$AddressDMCopyWithImpl<$Res, AddressDM>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String address,
      String city,
      @FoodlyCountriesConverter() FoodlyCountries? country,
      @JsonKey(name: 'zip_code') String zipCode,
      double latitude,
      double longitude,
      @JsonKey(name: 'label') AddressLabelDM addressLabel,
      bool principal,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $AddressLabelDMCopyWith<$Res> get addressLabel;
}

/// @nodoc
class _$AddressDMCopyWithImpl<$Res, $Val extends AddressDM>
    implements $AddressDMCopyWith<$Res> {
  _$AddressDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? address = null,
    Object? city = null,
    Object? country = freezed,
    Object? zipCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? addressLabel = null,
    Object? principal = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressLabel: null == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as AddressLabelDM,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressLabelDMCopyWith<$Res> get addressLabel {
    return $AddressLabelDMCopyWith<$Res>(_value.addressLabel, (value) {
      return _then(_value.copyWith(addressLabel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressDMImplCopyWith<$Res>
    implements $AddressDMCopyWith<$Res> {
  factory _$$AddressDMImplCopyWith(
          _$AddressDMImpl value, $Res Function(_$AddressDMImpl) then) =
      __$$AddressDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String address,
      String city,
      @FoodlyCountriesConverter() FoodlyCountries? country,
      @JsonKey(name: 'zip_code') String zipCode,
      double latitude,
      double longitude,
      @JsonKey(name: 'label') AddressLabelDM addressLabel,
      bool principal,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $AddressLabelDMCopyWith<$Res> get addressLabel;
}

/// @nodoc
class __$$AddressDMImplCopyWithImpl<$Res>
    extends _$AddressDMCopyWithImpl<$Res, _$AddressDMImpl>
    implements _$$AddressDMImplCopyWith<$Res> {
  __$$AddressDMImplCopyWithImpl(
      _$AddressDMImpl _value, $Res Function(_$AddressDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? address = null,
    Object? city = null,
    Object? country = freezed,
    Object? zipCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? addressLabel = null,
    Object? principal = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AddressDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressLabel: null == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as AddressLabelDM,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDMImpl extends _AddressDM {
  _$AddressDMImpl(
      {required this.id,
      required this.uuid,
      required this.address,
      required this.city,
      @FoodlyCountriesConverter() this.country,
      @JsonKey(name: 'zip_code') required this.zipCode,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'label') required this.addressLabel,
      this.principal = false,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : super._();

  factory _$AddressDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDMImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String address;
  @override
  final String city;
// MANTENER el enum pero con conversor personalizado
  @override
  @FoodlyCountriesConverter()
  final FoodlyCountries? country;
  @override
  @JsonKey(name: 'zip_code')
  final String zipCode;
  @override
  final double latitude;
  @override
  final double longitude;
// CORREGIDO: Cambiar el mapeo para que coincida con el JSON response
  @override
  @JsonKey(name: 'label')
  final AddressLabelDM addressLabel;
  @override
  @JsonKey()
  final bool principal;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AddressDM(id: $id, uuid: $uuid, address: $address, city: $city, country: $country, zipCode: $zipCode, latitude: $latitude, longitude: $longitude, addressLabel: $addressLabel, principal: $principal, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.addressLabel, addressLabel) ||
                other.addressLabel == addressLabel) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      address,
      city,
      country,
      zipCode,
      latitude,
      longitude,
      addressLabel,
      principal,
      createdAt,
      updatedAt);

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDMImplCopyWith<_$AddressDMImpl> get copyWith =>
      __$$AddressDMImplCopyWithImpl<_$AddressDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDMImplToJson(
      this,
    );
  }
}

abstract class _AddressDM extends AddressDM {
  factory _AddressDM(
          {required final int id,
          required final String uuid,
          required final String address,
          required final String city,
          @FoodlyCountriesConverter() final FoodlyCountries? country,
          @JsonKey(name: 'zip_code') required final String zipCode,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'label') required final AddressLabelDM addressLabel,
          final bool principal,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$AddressDMImpl;
  _AddressDM._() : super._();

  factory _AddressDM.fromJson(Map<String, dynamic> json) =
      _$AddressDMImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get address;
  @override
  String get city; // MANTENER el enum pero con conversor personalizado
  @override
  @FoodlyCountriesConverter()
  FoodlyCountries? get country;
  @override
  @JsonKey(name: 'zip_code')
  String get zipCode;
  @override
  double get latitude;
  @override
  double
      get longitude; // CORREGIDO: Cambiar el mapeo para que coincida con el JSON response
  @override
  @JsonKey(name: 'label')
  AddressLabelDM get addressLabel;
  @override
  bool get principal;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressDMImplCopyWith<_$AddressDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginProviderDM _$LoginProviderDMFromJson(Map<String, dynamic> json) {
  return _LoginProviderDM.fromJson(json);
}

/// @nodoc
mixin _$LoginProviderDM {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_id')
  String get providerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_avatar')
  String get providerAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this LoginProviderDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginProviderDMCopyWith<LoginProviderDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginProviderDMCopyWith<$Res> {
  factory $LoginProviderDMCopyWith(
          LoginProviderDM value, $Res Function(LoginProviderDM) then) =
      _$LoginProviderDMCopyWithImpl<$Res, LoginProviderDM>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String provider,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'provider_avatar') String providerAvatar,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$LoginProviderDMCopyWithImpl<$Res, $Val extends LoginProviderDM>
    implements $LoginProviderDMCopyWith<$Res> {
  _$LoginProviderDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? provider = null,
    Object? providerId = null,
    Object? providerAvatar = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatar: null == providerAvatar
          ? _value.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginProviderDMImplCopyWith<$Res>
    implements $LoginProviderDMCopyWith<$Res> {
  factory _$$LoginProviderDMImplCopyWith(_$LoginProviderDMImpl value,
          $Res Function(_$LoginProviderDMImpl) then) =
      __$$LoginProviderDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String provider,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'provider_avatar') String providerAvatar,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$LoginProviderDMImplCopyWithImpl<$Res>
    extends _$LoginProviderDMCopyWithImpl<$Res, _$LoginProviderDMImpl>
    implements _$$LoginProviderDMImplCopyWith<$Res> {
  __$$LoginProviderDMImplCopyWithImpl(
      _$LoginProviderDMImpl _value, $Res Function(_$LoginProviderDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? provider = null,
    Object? providerId = null,
    Object? providerAvatar = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$LoginProviderDMImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatar: null == providerAvatar
          ? _value.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginProviderDMImpl implements _LoginProviderDM {
  _$LoginProviderDMImpl(
      {required this.id,
      required this.uuid,
      required this.provider,
      @JsonKey(name: 'provider_id') required this.providerId,
      @JsonKey(name: 'provider_avatar') required this.providerAvatar,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$LoginProviderDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginProviderDMImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String provider;
  @override
  @JsonKey(name: 'provider_id')
  final String providerId;
  @override
  @JsonKey(name: 'provider_avatar')
  final String providerAvatar;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LoginProviderDM(id: $id, uuid: $uuid, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginProviderDMImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerAvatar, providerAvatar) ||
                other.providerAvatar == providerAvatar) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, provider, providerId,
      providerAvatar, userId, createdAt, updatedAt);

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginProviderDMImplCopyWith<_$LoginProviderDMImpl> get copyWith =>
      __$$LoginProviderDMImplCopyWithImpl<_$LoginProviderDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginProviderDMImplToJson(
      this,
    );
  }
}

abstract class _LoginProviderDM implements LoginProviderDM {
  factory _LoginProviderDM(
      {required final int id,
      required final String uuid,
      required final String provider,
      @JsonKey(name: 'provider_id') required final String providerId,
      @JsonKey(name: 'provider_avatar') required final String providerAvatar,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$LoginProviderDMImpl;

  factory _LoginProviderDM.fromJson(Map<String, dynamic> json) =
      _$LoginProviderDMImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get provider;
  @override
  @JsonKey(name: 'provider_id')
  String get providerId;
  @override
  @JsonKey(name: 'provider_avatar')
  String get providerAvatar;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginProviderDMImplCopyWith<_$LoginProviderDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
