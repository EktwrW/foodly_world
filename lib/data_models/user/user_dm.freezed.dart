// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDM {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'uuid')
  String? get uuid;
  @JsonKey(name: 'email')
  String? get email;
  @JsonKey(name: 'username')
  String? get username;
  @JsonKey(name: 'name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'photo')
  String? get avatar;
  @JsonKey(name: 'phone')
  String?
      get phone; // ISO del país del teléfono (ej. 'AR'). Separado del número nacional en
// `phone` para poder reconstruir el internacional y re-renderar la bandera.
  @JsonKey(name: 'phone_country_code')
  String? get phoneCountryCode;
  @JsonKey(name: 'created_at')
  DateTime? get signUpDate;
  @JsonKey(name: 'updated_at')
  DateTime? get lastUpdated;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @JsonKey(name: 'gender')
  UserGender? get gender;
  @JsonKey(name: 'role_id')
  UserRole get roleId;
  @JsonKey(name: 'user_role')
  String? get userRole;
  @JsonKey(name: 'terms_and_conditions')
  bool
      get termsAndConditions; //@JsonKey(name: 'subscriptions') List<SuscriptionDM>? subscriptions, //TODO: hw crear esto
  @JsonKey(name: 'business')
  List<BusinessDM> get business;
  @JsonKey(name: 'user-prefs')
  UserPrefsDM? get userPrefs;
  @JsonKey(name: 'social_provider')
  List<LoginProviderDM>? get socialProvider;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @JsonKey(name: 'provider')
  String? get provider;
  @JsonKey(name: 'provider_id')
  String? get providerId;
  @JsonKey(name: 'provider_avatar')
  String?
      get providerAvatar; // True when the user has an email/password credential set. False for
// social-only users (Google/FB). Drives the profile UI between "Set
// password" and "Change password". Nullable for backward-compat with
// older payloads that don't include the field.
  @JsonKey(name: 'has_password')
  bool? get hasPassword;
  @JsonKey(name: 'addresses')
  List<AddressDM> get addresses;
  @JsonKey(name: 'favorite_businesses')
  List<String> get favoriteBusiness;
  @JsonKey(name: 'favorite_menus')
  List<String> get favoriteMenus;
  @JsonKey(name: 'favorite_items')
  List<String> get favoriteItems;
  @JsonKey(name: 'favorite_combos')
  List<String> get favoriteCombos;
  @JsonKey(name: 'saved_promotions')
  List<String> get savedPromotions;
  @JsonKey(name: 'followers')
  List<String> get followers;
  @JsonKey(name: 'followers_length')
  int get followersLength;
  @JsonKey(name: 'following')
  List<String> get following;
  @JsonKey(name: 'following_length')
  int get followingLength;

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDMCopyWith<UserDM> get copyWith =>
      _$UserDMCopyWithImpl<UserDM>(this as UserDM, _$identity);

  /// Serializes this UserDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDM &&
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
            const DeepCollectionEquality().equals(other.business, business) &&
            (identical(other.userPrefs, userPrefs) ||
                other.userPrefs == userPrefs) &&
            const DeepCollectionEquality()
                .equals(other.socialProvider, socialProvider) &&
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
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            const DeepCollectionEquality()
                .equals(other.favoriteBusiness, favoriteBusiness) &&
            const DeepCollectionEquality()
                .equals(other.favoriteMenus, favoriteMenus) &&
            const DeepCollectionEquality()
                .equals(other.favoriteItems, favoriteItems) &&
            const DeepCollectionEquality()
                .equals(other.favoriteCombos, favoriteCombos) &&
            const DeepCollectionEquality()
                .equals(other.savedPromotions, savedPromotions) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength) &&
            const DeepCollectionEquality().equals(other.following, following) &&
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
        const DeepCollectionEquality().hash(business),
        userPrefs,
        const DeepCollectionEquality().hash(socialProvider),
        emailVerifiedAt,
        provider,
        providerId,
        providerAvatar,
        hasPassword,
        const DeepCollectionEquality().hash(addresses),
        const DeepCollectionEquality().hash(favoriteBusiness),
        const DeepCollectionEquality().hash(favoriteMenus),
        const DeepCollectionEquality().hash(favoriteItems),
        const DeepCollectionEquality().hash(favoriteCombos),
        const DeepCollectionEquality().hash(savedPromotions),
        const DeepCollectionEquality().hash(followers),
        followersLength,
        const DeepCollectionEquality().hash(following),
        followingLength
      ]);

  @override
  String toString() {
    return 'UserDM(id: $id, uuid: $uuid, email: $email, username: $username, firstName: $firstName, lastName: $lastName, avatar: $avatar, phone: $phone, phoneCountryCode: $phoneCountryCode, signUpDate: $signUpDate, lastUpdated: $lastUpdated, deletedAt: $deletedAt, dateOfBirth: $dateOfBirth, gender: $gender, roleId: $roleId, userRole: $userRole, termsAndConditions: $termsAndConditions, business: $business, userPrefs: $userPrefs, socialProvider: $socialProvider, emailVerifiedAt: $emailVerifiedAt, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, hasPassword: $hasPassword, addresses: $addresses, favoriteBusiness: $favoriteBusiness, favoriteMenus: $favoriteMenus, favoriteItems: $favoriteItems, favoriteCombos: $favoriteCombos, savedPromotions: $savedPromotions, followers: $followers, followersLength: $followersLength, following: $following, followingLength: $followingLength)';
  }
}

/// @nodoc
abstract mixin class $UserDMCopyWith<$Res> {
  factory $UserDMCopyWith(UserDM value, $Res Function(UserDM) _then) =
      _$UserDMCopyWithImpl;
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
class _$UserDMCopyWithImpl<$Res> implements $UserDMCopyWith<$Res> {
  _$UserDMCopyWithImpl(this._self, this._then);

  final UserDM _self;
  final $Res Function(UserDM) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpDate: freezed == signUpDate
          ? _self.signUpDate
          : signUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userRole: freezed == userRole
          ? _self.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: null == termsAndConditions
          ? _self.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      userPrefs: freezed == userPrefs
          ? _self.userPrefs
          : userPrefs // ignore: cast_nullable_to_non_nullable
              as UserPrefsDM?,
      socialProvider: freezed == socialProvider
          ? _self.socialProvider
          : socialProvider // ignore: cast_nullable_to_non_nullable
              as List<LoginProviderDM>?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerAvatar: freezed == providerAvatar
          ? _self.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPassword: freezed == hasPassword
          ? _self.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: null == addresses
          ? _self.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDM>,
      favoriteBusiness: null == favoriteBusiness
          ? _self.favoriteBusiness
          : favoriteBusiness // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteMenus: null == favoriteMenus
          ? _self.favoriteMenus
          : favoriteMenus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteItems: null == favoriteItems
          ? _self.favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCombos: null == favoriteCombos
          ? _self.favoriteCombos
          : favoriteCombos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedPromotions: null == savedPromotions
          ? _self.savedPromotions
          : savedPromotions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _self.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _self.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followingLength: null == followingLength
          ? _self.followingLength
          : followingLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPrefsDMCopyWith<$Res>? get userPrefs {
    if (_self.userPrefs == null) {
      return null;
    }

    return $UserPrefsDMCopyWith<$Res>(_self.userPrefs!, (value) {
      return _then(_self.copyWith(userPrefs: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserDM].
extension UserDMPatterns on UserDM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id') int? id,
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
            @JsonKey(name: 'social_provider')
            List<LoginProviderDM>? socialProvider,
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
            @JsonKey(name: 'following_length') int followingLength)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.email,
            _that.username,
            _that.firstName,
            _that.lastName,
            _that.avatar,
            _that.phone,
            _that.phoneCountryCode,
            _that.signUpDate,
            _that.lastUpdated,
            _that.deletedAt,
            _that.dateOfBirth,
            _that.gender,
            _that.roleId,
            _that.userRole,
            _that.termsAndConditions,
            _that.business,
            _that.userPrefs,
            _that.socialProvider,
            _that.emailVerifiedAt,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.hasPassword,
            _that.addresses,
            _that.favoriteBusiness,
            _that.favoriteMenus,
            _that.favoriteItems,
            _that.favoriteCombos,
            _that.savedPromotions,
            _that.followers,
            _that.followersLength,
            _that.following,
            _that.followingLength);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id') int? id,
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
            @JsonKey(name: 'social_provider')
            List<LoginProviderDM>? socialProvider,
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
            @JsonKey(name: 'following_length') int followingLength)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.email,
            _that.username,
            _that.firstName,
            _that.lastName,
            _that.avatar,
            _that.phone,
            _that.phoneCountryCode,
            _that.signUpDate,
            _that.lastUpdated,
            _that.deletedAt,
            _that.dateOfBirth,
            _that.gender,
            _that.roleId,
            _that.userRole,
            _that.termsAndConditions,
            _that.business,
            _that.userPrefs,
            _that.socialProvider,
            _that.emailVerifiedAt,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.hasPassword,
            _that.addresses,
            _that.favoriteBusiness,
            _that.favoriteMenus,
            _that.favoriteItems,
            _that.favoriteCombos,
            _that.savedPromotions,
            _that.followers,
            _that.followersLength,
            _that.following,
            _that.followingLength);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'id') int? id,
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
            @JsonKey(name: 'social_provider')
            List<LoginProviderDM>? socialProvider,
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
            @JsonKey(name: 'following_length') int followingLength)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.email,
            _that.username,
            _that.firstName,
            _that.lastName,
            _that.avatar,
            _that.phone,
            _that.phoneCountryCode,
            _that.signUpDate,
            _that.lastUpdated,
            _that.deletedAt,
            _that.dateOfBirth,
            _that.gender,
            _that.roleId,
            _that.userRole,
            _that.termsAndConditions,
            _that.business,
            _that.userPrefs,
            _that.socialProvider,
            _that.emailVerifiedAt,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.hasPassword,
            _that.addresses,
            _that.favoriteBusiness,
            _that.favoriteMenus,
            _that.favoriteItems,
            _that.favoriteCombos,
            _that.savedPromotions,
            _that.followers,
            _that.followersLength,
            _that.following,
            _that.followingLength);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserDM extends UserDM {
  const _UserDM(
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
  factory _UserDM.fromJson(Map<String, dynamic> json) => _$UserDMFromJson(json);

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

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDMCopyWith<_UserDM> get copyWith =>
      __$UserDMCopyWithImpl<_UserDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDM &&
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

  @override
  String toString() {
    return 'UserDM(id: $id, uuid: $uuid, email: $email, username: $username, firstName: $firstName, lastName: $lastName, avatar: $avatar, phone: $phone, phoneCountryCode: $phoneCountryCode, signUpDate: $signUpDate, lastUpdated: $lastUpdated, deletedAt: $deletedAt, dateOfBirth: $dateOfBirth, gender: $gender, roleId: $roleId, userRole: $userRole, termsAndConditions: $termsAndConditions, business: $business, userPrefs: $userPrefs, socialProvider: $socialProvider, emailVerifiedAt: $emailVerifiedAt, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, hasPassword: $hasPassword, addresses: $addresses, favoriteBusiness: $favoriteBusiness, favoriteMenus: $favoriteMenus, favoriteItems: $favoriteItems, favoriteCombos: $favoriteCombos, savedPromotions: $savedPromotions, followers: $followers, followersLength: $followersLength, following: $following, followingLength: $followingLength)';
  }
}

/// @nodoc
abstract mixin class _$UserDMCopyWith<$Res> implements $UserDMCopyWith<$Res> {
  factory _$UserDMCopyWith(_UserDM value, $Res Function(_UserDM) _then) =
      __$UserDMCopyWithImpl;
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
class __$UserDMCopyWithImpl<$Res> implements _$UserDMCopyWith<$Res> {
  __$UserDMCopyWithImpl(this._self, this._then);

  final _UserDM _self;
  final $Res Function(_UserDM) _then;

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UserDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signUpDate: freezed == signUpDate
          ? _self.signUpDate
          : signUpDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userRole: freezed == userRole
          ? _self.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: null == termsAndConditions
          ? _self.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      business: null == business
          ? _self._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      userPrefs: freezed == userPrefs
          ? _self.userPrefs
          : userPrefs // ignore: cast_nullable_to_non_nullable
              as UserPrefsDM?,
      socialProvider: freezed == socialProvider
          ? _self._socialProvider
          : socialProvider // ignore: cast_nullable_to_non_nullable
              as List<LoginProviderDM>?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerAvatar: freezed == providerAvatar
          ? _self.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPassword: freezed == hasPassword
          ? _self.hasPassword
          : hasPassword // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: null == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDM>,
      favoriteBusiness: null == favoriteBusiness
          ? _self._favoriteBusiness
          : favoriteBusiness // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteMenus: null == favoriteMenus
          ? _self._favoriteMenus
          : favoriteMenus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteItems: null == favoriteItems
          ? _self._favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCombos: null == favoriteCombos
          ? _self._favoriteCombos
          : favoriteCombos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedPromotions: null == savedPromotions
          ? _self._savedPromotions
          : savedPromotions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _self._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _self._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followingLength: null == followingLength
          ? _self.followingLength
          : followingLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of UserDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPrefsDMCopyWith<$Res>? get userPrefs {
    if (_self.userPrefs == null) {
      return null;
    }

    return $UserPrefsDMCopyWith<$Res>(_self.userPrefs!, (value) {
      return _then(_self.copyWith(userPrefs: value));
    });
  }
}

/// @nodoc
mixin _$AddressLabelDM {
  int? get id;
  String? get uuid;
  String get name;
  String? get description;
  String? get icon;
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressLabelDMCopyWith<AddressLabelDM> get copyWith =>
      _$AddressLabelDMCopyWithImpl<AddressLabelDM>(
          this as AddressLabelDM, _$identity);

  /// Serializes this AddressLabelDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressLabelDM &&
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

  @override
  String toString() {
    return 'AddressLabelDM(id: $id, uuid: $uuid, name: $name, description: $description, icon: $icon, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $AddressLabelDMCopyWith<$Res> {
  factory $AddressLabelDMCopyWith(
          AddressLabelDM value, $Res Function(AddressLabelDM) _then) =
      _$AddressLabelDMCopyWithImpl;
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
class _$AddressLabelDMCopyWithImpl<$Res>
    implements $AddressLabelDMCopyWith<$Res> {
  _$AddressLabelDMCopyWithImpl(this._self, this._then);

  final AddressLabelDM _self;
  final $Res Function(AddressLabelDM) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddressLabelDM].
extension AddressLabelDMPatterns on AddressLabelDM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AddressLabelDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AddressLabelDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AddressLabelDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? id, String? uuid, String name, String? description,
            String? icon, @JsonKey(name: 'is_active') bool isActive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.name, _that.description,
            _that.icon, _that.isActive);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? id, String? uuid, String name, String? description,
            String? icon, @JsonKey(name: 'is_active') bool isActive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM():
        return $default(_that.id, _that.uuid, _that.name, _that.description,
            _that.icon, _that.isActive);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? id, String? uuid, String name, String? description,
            String? icon, @JsonKey(name: 'is_active') bool isActive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressLabelDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.name, _that.description,
            _that.icon, _that.isActive);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AddressLabelDM implements AddressLabelDM {
  _AddressLabelDM(
      {this.id,
      this.uuid,
      required this.name,
      this.description,
      this.icon,
      @JsonKey(name: 'is_active') this.isActive = true});
  factory _AddressLabelDM.fromJson(Map<String, dynamic> json) =>
      _$AddressLabelDMFromJson(json);

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

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressLabelDMCopyWith<_AddressLabelDM> get copyWith =>
      __$AddressLabelDMCopyWithImpl<_AddressLabelDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressLabelDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressLabelDM &&
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

  @override
  String toString() {
    return 'AddressLabelDM(id: $id, uuid: $uuid, name: $name, description: $description, icon: $icon, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$AddressLabelDMCopyWith<$Res>
    implements $AddressLabelDMCopyWith<$Res> {
  factory _$AddressLabelDMCopyWith(
          _AddressLabelDM value, $Res Function(_AddressLabelDM) _then) =
      __$AddressLabelDMCopyWithImpl;
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
class __$AddressLabelDMCopyWithImpl<$Res>
    implements _$AddressLabelDMCopyWith<$Res> {
  __$AddressLabelDMCopyWithImpl(this._self, this._then);

  final _AddressLabelDM _self;
  final $Res Function(_AddressLabelDM) _then;

  /// Create a copy of AddressLabelDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? isActive = null,
  }) {
    return _then(_AddressLabelDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$AddressDM {
  int get id;
  String get uuid;
  String get address;
  String get city; // MANTENER el enum pero con conversor personalizado
  @FoodlyCountriesConverter()
  FoodlyCountries? get country;
  @JsonKey(name: 'zip_code')
  String get zipCode;
  double get latitude;
  double
      get longitude; // CORREGIDO: Cambiar el mapeo para que coincida con el JSON response
  @JsonKey(name: 'label')
  AddressLabelDM get addressLabel;
  bool get principal;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressDMCopyWith<AddressDM> get copyWith =>
      _$AddressDMCopyWithImpl<AddressDM>(this as AddressDM, _$identity);

  /// Serializes this AddressDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressDM &&
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

  @override
  String toString() {
    return 'AddressDM(id: $id, uuid: $uuid, address: $address, city: $city, country: $country, zipCode: $zipCode, latitude: $latitude, longitude: $longitude, addressLabel: $addressLabel, principal: $principal, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AddressDMCopyWith<$Res> {
  factory $AddressDMCopyWith(AddressDM value, $Res Function(AddressDM) _then) =
      _$AddressDMCopyWithImpl;
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
class _$AddressDMCopyWithImpl<$Res> implements $AddressDMCopyWith<$Res> {
  _$AddressDMCopyWithImpl(this._self, this._then);

  final AddressDM _self;
  final $Res Function(AddressDM) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      zipCode: null == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressLabel: null == addressLabel
          ? _self.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as AddressLabelDM,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressLabelDMCopyWith<$Res> get addressLabel {
    return $AddressLabelDMCopyWith<$Res>(_self.addressLabel, (value) {
      return _then(_self.copyWith(addressLabel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AddressDM].
extension AddressDMPatterns on AddressDM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AddressDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressDM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AddressDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressDM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AddressDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressDM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
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
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.address,
            _that.city,
            _that.country,
            _that.zipCode,
            _that.latitude,
            _that.longitude,
            _that.addressLabel,
            _that.principal,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
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
            @JsonKey(name: 'updated_at') DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.address,
            _that.city,
            _that.country,
            _that.zipCode,
            _that.latitude,
            _that.longitude,
            _that.addressLabel,
            _that.principal,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
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
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.address,
            _that.city,
            _that.country,
            _that.zipCode,
            _that.latitude,
            _that.longitude,
            _that.addressLabel,
            _that.principal,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AddressDM extends AddressDM {
  _AddressDM(
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
  factory _AddressDM.fromJson(Map<String, dynamic> json) =>
      _$AddressDMFromJson(json);

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

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressDMCopyWith<_AddressDM> get copyWith =>
      __$AddressDMCopyWithImpl<_AddressDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressDM &&
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

  @override
  String toString() {
    return 'AddressDM(id: $id, uuid: $uuid, address: $address, city: $city, country: $country, zipCode: $zipCode, latitude: $latitude, longitude: $longitude, addressLabel: $addressLabel, principal: $principal, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AddressDMCopyWith<$Res>
    implements $AddressDMCopyWith<$Res> {
  factory _$AddressDMCopyWith(
          _AddressDM value, $Res Function(_AddressDM) _then) =
      __$AddressDMCopyWithImpl;
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
class __$AddressDMCopyWithImpl<$Res> implements _$AddressDMCopyWith<$Res> {
  __$AddressDMCopyWithImpl(this._self, this._then);

  final _AddressDM _self;
  final $Res Function(_AddressDM) _then;

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AddressDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries?,
      zipCode: null == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressLabel: null == addressLabel
          ? _self.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as AddressLabelDM,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of AddressDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressLabelDMCopyWith<$Res> get addressLabel {
    return $AddressLabelDMCopyWith<$Res>(_self.addressLabel, (value) {
      return _then(_self.copyWith(addressLabel: value));
    });
  }
}

/// @nodoc
mixin _$LoginProviderDM {
  int get id;
  String get uuid;
  String get provider;
  @JsonKey(name: 'provider_id')
  String get providerId;
  @JsonKey(name: 'provider_avatar')
  String get providerAvatar;
  @JsonKey(name: 'user_id')
  int get userId;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginProviderDMCopyWith<LoginProviderDM> get copyWith =>
      _$LoginProviderDMCopyWithImpl<LoginProviderDM>(
          this as LoginProviderDM, _$identity);

  /// Serializes this LoginProviderDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginProviderDM &&
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

  @override
  String toString() {
    return 'LoginProviderDM(id: $id, uuid: $uuid, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $LoginProviderDMCopyWith<$Res> {
  factory $LoginProviderDMCopyWith(
          LoginProviderDM value, $Res Function(LoginProviderDM) _then) =
      _$LoginProviderDMCopyWithImpl;
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
class _$LoginProviderDMCopyWithImpl<$Res>
    implements $LoginProviderDMCopyWith<$Res> {
  _$LoginProviderDMCopyWithImpl(this._self, this._then);

  final LoginProviderDM _self;
  final $Res Function(LoginProviderDM) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatar: null == providerAvatar
          ? _self.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginProviderDM].
extension LoginProviderDMPatterns on LoginProviderDM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginProviderDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoginProviderDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LoginProviderDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String uuid,
            String provider,
            @JsonKey(name: 'provider_id') String providerId,
            @JsonKey(name: 'provider_avatar') String providerAvatar,
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.userId,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String uuid,
            String provider,
            @JsonKey(name: 'provider_id') String providerId,
            @JsonKey(name: 'provider_avatar') String providerAvatar,
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.userId,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String uuid,
            String provider,
            @JsonKey(name: 'provider_id') String providerId,
            @JsonKey(name: 'provider_avatar') String providerAvatar,
            @JsonKey(name: 'user_id') int userId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginProviderDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.provider,
            _that.providerId,
            _that.providerAvatar,
            _that.userId,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginProviderDM implements LoginProviderDM {
  _LoginProviderDM(
      {required this.id,
      required this.uuid,
      required this.provider,
      @JsonKey(name: 'provider_id') required this.providerId,
      @JsonKey(name: 'provider_avatar') required this.providerAvatar,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _LoginProviderDM.fromJson(Map<String, dynamic> json) =>
      _$LoginProviderDMFromJson(json);

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

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginProviderDMCopyWith<_LoginProviderDM> get copyWith =>
      __$LoginProviderDMCopyWithImpl<_LoginProviderDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginProviderDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginProviderDM &&
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

  @override
  String toString() {
    return 'LoginProviderDM(id: $id, uuid: $uuid, provider: $provider, providerId: $providerId, providerAvatar: $providerAvatar, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$LoginProviderDMCopyWith<$Res>
    implements $LoginProviderDMCopyWith<$Res> {
  factory _$LoginProviderDMCopyWith(
          _LoginProviderDM value, $Res Function(_LoginProviderDM) _then) =
      __$LoginProviderDMCopyWithImpl;
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
class __$LoginProviderDMCopyWithImpl<$Res>
    implements _$LoginProviderDMCopyWith<$Res> {
  __$LoginProviderDMCopyWithImpl(this._self, this._then);

  final _LoginProviderDM _self;
  final $Res Function(_LoginProviderDM) _then;

  /// Create a copy of LoginProviderDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_LoginProviderDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerAvatar: null == providerAvatar
          ? _self.providerAvatar
          : providerAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
