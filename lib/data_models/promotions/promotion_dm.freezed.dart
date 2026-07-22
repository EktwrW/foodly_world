// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionsResponse {
  @JsonKey(name: 'business_promotions')
  List<PromotionDM> get promotions;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionsResponseCopyWith<PromotionsResponse> get copyWith =>
      _$PromotionsResponseCopyWithImpl<PromotionsResponse>(
          this as PromotionsResponse, _$identity);

  /// Serializes this PromotionsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionsResponse &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(promotions));

  @override
  String toString() {
    return 'PromotionsResponse(promotions: $promotions)';
  }
}

/// @nodoc
abstract mixin class $PromotionsResponseCopyWith<$Res> {
  factory $PromotionsResponseCopyWith(
          PromotionsResponse value, $Res Function(PromotionsResponse) _then) =
      _$PromotionsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promotions') List<PromotionDM> promotions});
}

/// @nodoc
class _$PromotionsResponseCopyWithImpl<$Res>
    implements $PromotionsResponseCopyWith<$Res> {
  _$PromotionsResponseCopyWithImpl(this._self, this._then);

  final PromotionsResponse _self;
  final $Res Function(PromotionsResponse) _then;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_self.copyWith(
      promotions: null == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromotionsResponse].
extension PromotionsResponsePatterns on PromotionsResponse {
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
    TResult Function(_PromotionsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse() when $default != null:
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
    TResult Function(_PromotionsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse():
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
    TResult? Function(_PromotionsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse() when $default != null:
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
            @JsonKey(name: 'business_promotions') List<PromotionDM> promotions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse() when $default != null:
        return $default(_that.promotions);
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
            @JsonKey(name: 'business_promotions') List<PromotionDM> promotions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse():
        return $default(_that.promotions);
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
            @JsonKey(name: 'business_promotions') List<PromotionDM> promotions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionsResponse() when $default != null:
        return $default(_that.promotions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionsResponse implements PromotionsResponse {
  const _PromotionsResponse(
      {@JsonKey(name: 'business_promotions')
      required final List<PromotionDM> promotions})
      : _promotions = promotions;
  factory _PromotionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PromotionsResponseFromJson(json);

  final List<PromotionDM> _promotions;
  @override
  @JsonKey(name: 'business_promotions')
  List<PromotionDM> get promotions {
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promotions);
  }

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionsResponseCopyWith<_PromotionsResponse> get copyWith =>
      __$PromotionsResponseCopyWithImpl<_PromotionsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionsResponse &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_promotions));

  @override
  String toString() {
    return 'PromotionsResponse(promotions: $promotions)';
  }
}

/// @nodoc
abstract mixin class _$PromotionsResponseCopyWith<$Res>
    implements $PromotionsResponseCopyWith<$Res> {
  factory _$PromotionsResponseCopyWith(
          _PromotionsResponse value, $Res Function(_PromotionsResponse) _then) =
      __$PromotionsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promotions') List<PromotionDM> promotions});
}

/// @nodoc
class __$PromotionsResponseCopyWithImpl<$Res>
    implements _$PromotionsResponseCopyWith<$Res> {
  __$PromotionsResponseCopyWithImpl(this._self, this._then);

  final _PromotionsResponse _self;
  final $Res Function(_PromotionsResponse) _then;

  /// Create a copy of PromotionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_PromotionsResponse(
      promotions: null == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionDM>,
    ));
  }
}

/// @nodoc
mixin _$PromotionDM {
  int get id;
  String get uuid;
  String get title;
  @JsonKey(name: 'sub_title')
  String get subTitle;
  String get description;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @JsonKey(name: 'expire_date')
  DateTime get expireDate;
  BusinessDM? get business;
  List<Version> get versions;
  Prices? get prices;
  @JsonKey(name: 'favorites_count')
  int get favoritesCount;
  @JsonKey(name: 'media_link')
  String? get mediaLink;
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia;
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM get promoDays;
  @JsonKey(name: 'followers_length')
  int get followersLength;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionDMCopyWith<PromotionDM> get copyWith =>
      _$PromotionDMCopyWithImpl<PromotionDM>(this as PromotionDM, _$identity);

  /// Serializes this PromotionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.business, business) ||
                other.business == business) &&
            const DeepCollectionEquality().equals(other.versions, versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            const DeepCollectionEquality()
                .equals(other.promoMedia, promoMedia) &&
            (identical(other.promoDays, promoDays) ||
                other.promoDays == promoDays) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      title,
      subTitle,
      description,
      createdAt,
      updatedAt,
      startDate,
      expireDate,
      business,
      const DeepCollectionEquality().hash(versions),
      prices,
      favoritesCount,
      mediaLink,
      const DeepCollectionEquality().hash(promoMedia),
      promoDays,
      followersLength);

  @override
  String toString() {
    return 'PromotionDM(id: $id, uuid: $uuid, title: $title, subTitle: $subTitle, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, expireDate: $expireDate, business: $business, versions: $versions, prices: $prices, favoritesCount: $favoritesCount, mediaLink: $mediaLink, promoMedia: $promoMedia, promoDays: $promoDays, followersLength: $followersLength)';
  }
}

/// @nodoc
abstract mixin class $PromotionDMCopyWith<$Res> {
  factory $PromotionDMCopyWith(
          PromotionDM value, $Res Function(PromotionDM) _then) =
      _$PromotionDMCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      String description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'expire_date') DateTime expireDate,
      BusinessDM? business,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia,
      @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
      @JsonKey(name: 'followers_length') int followersLength});

  $BusinessDMCopyWith<$Res>? get business;
  $PricesCopyWith<$Res>? get prices;
  $PromoDaysDMCopyWith<$Res> get promoDays;
}

/// @nodoc
class _$PromotionDMCopyWithImpl<$Res> implements $PromotionDMCopyWith<$Res> {
  _$PromotionDMCopyWithImpl(this._self, this._then);

  final PromotionDM _self;
  final $Res Function(PromotionDM) _then;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? expireDate = null,
    Object? business = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? favoritesCount = null,
    Object? mediaLink = freezed,
    Object? promoMedia = null,
    Object? promoDays = null,
    Object? followersLength = null,
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
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      versions: null == versions
          ? _self.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: null == promoMedia
          ? _self.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
      promoDays: null == promoDays
          ? _self.promoDays
          : promoDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res>? get prices {
    if (_self.prices == null) {
      return null;
    }

    return $PricesCopyWith<$Res>(_self.prices!, (value) {
      return _then(_self.copyWith(prices: value));
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res> get promoDays {
    return $PromoDaysDMCopyWith<$Res>(_self.promoDays, (value) {
      return _then(_self.copyWith(promoDays: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PromotionDM].
extension PromotionDMPatterns on PromotionDM {
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
    TResult Function(_PromotionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionDM() when $default != null:
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
    TResult Function(_PromotionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDM():
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
    TResult? Function(_PromotionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDM() when $default != null:
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
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            String description,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'start_date') DateTime startDate,
            @JsonKey(name: 'expire_date') DateTime expireDate,
            BusinessDM? business,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia,
            @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
            @JsonKey(name: 'followers_length') int followersLength)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.expireDate,
            _that.business,
            _that.versions,
            _that.prices,
            _that.favoritesCount,
            _that.mediaLink,
            _that.promoMedia,
            _that.promoDays,
            _that.followersLength);
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
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            String description,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'start_date') DateTime startDate,
            @JsonKey(name: 'expire_date') DateTime expireDate,
            BusinessDM? business,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia,
            @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
            @JsonKey(name: 'followers_length') int followersLength)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.expireDate,
            _that.business,
            _that.versions,
            _that.prices,
            _that.favoritesCount,
            _that.mediaLink,
            _that.promoMedia,
            _that.promoDays,
            _that.followersLength);
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
            String title,
            @JsonKey(name: 'sub_title') String subTitle,
            String description,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'start_date') DateTime startDate,
            @JsonKey(name: 'expire_date') DateTime expireDate,
            BusinessDM? business,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'favorites_count') int favoritesCount,
            @JsonKey(name: 'media_link') String? mediaLink,
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia,
            @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
            @JsonKey(name: 'followers_length') int followersLength)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.createdAt,
            _that.updatedAt,
            _that.startDate,
            _that.expireDate,
            _that.business,
            _that.versions,
            _that.prices,
            _that.favoritesCount,
            _that.mediaLink,
            _that.promoMedia,
            _that.promoDays,
            _that.followersLength);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionDM extends PromotionDM {
  _PromotionDM(
      {required this.id,
      required this.uuid,
      required this.title,
      @JsonKey(name: 'sub_title') this.subTitle = '',
      required this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'expire_date') required this.expireDate,
      required this.business,
      final List<Version> versions = const [Version.regular],
      this.prices,
      @JsonKey(name: 'favorites_count') this.favoritesCount = 0,
      @JsonKey(name: 'media_link') this.mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      final List<PromoMediaDM> promoMedia = const [],
      @JsonKey(name: 'promo_active_days') required this.promoDays,
      @JsonKey(name: 'followers_length') this.followersLength = 0})
      : _versions = versions,
        _promoMedia = promoMedia,
        super._();
  factory _PromotionDM.fromJson(Map<String, dynamic> json) =>
      _$PromotionDMFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String title;
  @override
  @JsonKey(name: 'sub_title')
  final String subTitle;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'expire_date')
  final DateTime expireDate;
  @override
  final BusinessDM? business;
  final List<Version> _versions;
  @override
  @JsonKey()
  List<Version> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  final Prices? prices;
  @override
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;
  @override
  @JsonKey(name: 'media_link')
  final String? mediaLink;
  final List<PromoMediaDM> _promoMedia;
  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia {
    if (_promoMedia is EqualUnmodifiableListView) return _promoMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promoMedia);
  }

  @override
  @JsonKey(name: 'promo_active_days')
  final PromoDaysDM promoDays;
  @override
  @JsonKey(name: 'followers_length')
  final int followersLength;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionDMCopyWith<_PromotionDM> get copyWith =>
      __$PromotionDMCopyWithImpl<_PromotionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.business, business) ||
                other.business == business) &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink) &&
            const DeepCollectionEquality()
                .equals(other._promoMedia, _promoMedia) &&
            (identical(other.promoDays, promoDays) ||
                other.promoDays == promoDays) &&
            (identical(other.followersLength, followersLength) ||
                other.followersLength == followersLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      title,
      subTitle,
      description,
      createdAt,
      updatedAt,
      startDate,
      expireDate,
      business,
      const DeepCollectionEquality().hash(_versions),
      prices,
      favoritesCount,
      mediaLink,
      const DeepCollectionEquality().hash(_promoMedia),
      promoDays,
      followersLength);

  @override
  String toString() {
    return 'PromotionDM(id: $id, uuid: $uuid, title: $title, subTitle: $subTitle, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, expireDate: $expireDate, business: $business, versions: $versions, prices: $prices, favoritesCount: $favoritesCount, mediaLink: $mediaLink, promoMedia: $promoMedia, promoDays: $promoDays, followersLength: $followersLength)';
  }
}

/// @nodoc
abstract mixin class _$PromotionDMCopyWith<$Res>
    implements $PromotionDMCopyWith<$Res> {
  factory _$PromotionDMCopyWith(
          _PromotionDM value, $Res Function(_PromotionDM) _then) =
      __$PromotionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String title,
      @JsonKey(name: 'sub_title') String subTitle,
      String description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'expire_date') DateTime expireDate,
      BusinessDM? business,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'favorites_count') int favoritesCount,
      @JsonKey(name: 'media_link') String? mediaLink,
      @JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia,
      @JsonKey(name: 'promo_active_days') PromoDaysDM promoDays,
      @JsonKey(name: 'followers_length') int followersLength});

  @override
  $BusinessDMCopyWith<$Res>? get business;
  @override
  $PricesCopyWith<$Res>? get prices;
  @override
  $PromoDaysDMCopyWith<$Res> get promoDays;
}

/// @nodoc
class __$PromotionDMCopyWithImpl<$Res> implements _$PromotionDMCopyWith<$Res> {
  __$PromotionDMCopyWithImpl(this._self, this._then);

  final _PromotionDM _self;
  final $Res Function(_PromotionDM) _then;

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? subTitle = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? startDate = null,
    Object? expireDate = null,
    Object? business = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? favoritesCount = null,
    Object? mediaLink = freezed,
    Object? promoMedia = null,
    Object? promoDays = null,
    Object? followersLength = null,
  }) {
    return _then(_PromotionDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      business: freezed == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM?,
      versions: null == versions
          ? _self._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoMedia: null == promoMedia
          ? _self._promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
      promoDays: null == promoDays
          ? _self.promoDays
          : promoDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM,
      followersLength: null == followersLength
          ? _self.followersLength
          : followersLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res>? get business {
    if (_self.business == null) {
      return null;
    }

    return $BusinessDMCopyWith<$Res>(_self.business!, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PricesCopyWith<$Res>? get prices {
    if (_self.prices == null) {
      return null;
    }

    return $PricesCopyWith<$Res>(_self.prices!, (value) {
      return _then(_self.copyWith(prices: value));
    });
  }

  /// Create a copy of PromotionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res> get promoDays {
    return $PromoDaysDMCopyWith<$Res>(_self.promoDays, (value) {
      return _then(_self.copyWith(promoDays: value));
    });
  }
}

/// @nodoc
mixin _$PromoMediaDM {
  int get id;
  String get uuid;
  @JsonKey(name: 'business_promo_media_url')
  String get mediaUrl;
  @JsonKey(name: 'business_promo_item_id')
  int get promoItemId;
  @JsonKey(name: 'media_type')
  MediaType get mediaType;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoMediaDMCopyWith<PromoMediaDM> get copyWith =>
      _$PromoMediaDMCopyWithImpl<PromoMediaDM>(
          this as PromoMediaDM, _$identity);

  /// Serializes this PromoMediaDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoMediaDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.promoItemId, promoItemId) ||
                other.promoItemId == promoItemId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, mediaUrl, promoItemId, mediaType);

  @override
  String toString() {
    return 'PromoMediaDM(id: $id, uuid: $uuid, mediaUrl: $mediaUrl, promoItemId: $promoItemId, mediaType: $mediaType)';
  }
}

/// @nodoc
abstract mixin class $PromoMediaDMCopyWith<$Res> {
  factory $PromoMediaDMCopyWith(
          PromoMediaDM value, $Res Function(PromoMediaDM) _then) =
      _$PromoMediaDMCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'business_promo_item_id') int promoItemId,
      @JsonKey(name: 'media_type') MediaType mediaType});
}

/// @nodoc
class _$PromoMediaDMCopyWithImpl<$Res> implements $PromoMediaDMCopyWith<$Res> {
  _$PromoMediaDMCopyWithImpl(this._self, this._then);

  final PromoMediaDM _self;
  final $Res Function(PromoMediaDM) _then;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? promoItemId = null,
    Object? mediaType = null,
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
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoItemId: null == promoItemId
          ? _self.promoItemId
          : promoItemId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromoMediaDM].
extension PromoMediaDMPatterns on PromoMediaDM {
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
    TResult Function(_PromoMediaDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM() when $default != null:
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
    TResult Function(_PromoMediaDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM():
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
    TResult? Function(_PromoMediaDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM() when $default != null:
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
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'business_promo_item_id') int promoItemId,
            @JsonKey(name: 'media_type') MediaType mediaType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.mediaUrl, _that.promoItemId,
            _that.mediaType);
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
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'business_promo_item_id') int promoItemId,
            @JsonKey(name: 'media_type') MediaType mediaType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM():
        return $default(_that.id, _that.uuid, _that.mediaUrl, _that.promoItemId,
            _that.mediaType);
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
            @JsonKey(name: 'business_promo_media_url') String mediaUrl,
            @JsonKey(name: 'business_promo_item_id') int promoItemId,
            @JsonKey(name: 'media_type') MediaType mediaType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.mediaUrl, _that.promoItemId,
            _that.mediaType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoMediaDM extends PromoMediaDM {
  const _PromoMediaDM(
      {required this.id,
      required this.uuid,
      @JsonKey(name: 'business_promo_media_url') required this.mediaUrl,
      @JsonKey(name: 'business_promo_item_id') required this.promoItemId,
      @JsonKey(name: 'media_type') required this.mediaType})
      : super._();
  factory _PromoMediaDM.fromJson(Map<String, dynamic> json) =>
      _$PromoMediaDMFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  @JsonKey(name: 'business_promo_media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'business_promo_item_id')
  final int promoItemId;
  @override
  @JsonKey(name: 'media_type')
  final MediaType mediaType;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoMediaDMCopyWith<_PromoMediaDM> get copyWith =>
      __$PromoMediaDMCopyWithImpl<_PromoMediaDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoMediaDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoMediaDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.promoItemId, promoItemId) ||
                other.promoItemId == promoItemId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, mediaUrl, promoItemId, mediaType);

  @override
  String toString() {
    return 'PromoMediaDM(id: $id, uuid: $uuid, mediaUrl: $mediaUrl, promoItemId: $promoItemId, mediaType: $mediaType)';
  }
}

/// @nodoc
abstract mixin class _$PromoMediaDMCopyWith<$Res>
    implements $PromoMediaDMCopyWith<$Res> {
  factory _$PromoMediaDMCopyWith(
          _PromoMediaDM value, $Res Function(_PromoMediaDM) _then) =
      __$PromoMediaDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      @JsonKey(name: 'business_promo_media_url') String mediaUrl,
      @JsonKey(name: 'business_promo_item_id') int promoItemId,
      @JsonKey(name: 'media_type') MediaType mediaType});
}

/// @nodoc
class __$PromoMediaDMCopyWithImpl<$Res>
    implements _$PromoMediaDMCopyWith<$Res> {
  __$PromoMediaDMCopyWithImpl(this._self, this._then);

  final _PromoMediaDM _self;
  final $Res Function(_PromoMediaDM) _then;

  /// Create a copy of PromoMediaDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? mediaUrl = null,
    Object? promoItemId = null,
    Object? mediaType = null,
  }) {
    return _then(_PromoMediaDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoItemId: null == promoItemId
          ? _self.promoItemId
          : promoItemId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
    ));
  }
}

/// @nodoc
mixin _$PromoDaysDM {
  @JsonKey(name: 'day_0')
  bool get sunday;
  @JsonKey(name: 'day_1')
  bool get monday;
  @JsonKey(name: 'day_2')
  bool get tuesday;
  @JsonKey(name: 'day_3')
  bool get wednesday;
  @JsonKey(name: 'day_4')
  bool get thursday;
  @JsonKey(name: 'day_5')
  bool get friday;
  @JsonKey(name: 'day_6')
  bool get saturday;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<PromoDaysDM> get copyWith =>
      _$PromoDaysDMCopyWithImpl<PromoDaysDM>(this as PromoDaysDM, _$identity);

  /// Serializes this PromoDaysDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoDaysDM &&
            (identical(other.sunday, sunday) || other.sunday == sunday) &&
            (identical(other.monday, monday) || other.monday == monday) &&
            (identical(other.tuesday, tuesday) || other.tuesday == tuesday) &&
            (identical(other.wednesday, wednesday) ||
                other.wednesday == wednesday) &&
            (identical(other.thursday, thursday) ||
                other.thursday == thursday) &&
            (identical(other.friday, friday) || other.friday == friday) &&
            (identical(other.saturday, saturday) ||
                other.saturday == saturday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sunday, monday, tuesday,
      wednesday, thursday, friday, saturday);

  @override
  String toString() {
    return 'PromoDaysDM(sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday)';
  }
}

/// @nodoc
abstract mixin class $PromoDaysDMCopyWith<$Res> {
  factory $PromoDaysDMCopyWith(
          PromoDaysDM value, $Res Function(PromoDaysDM) _then) =
      _$PromoDaysDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'day_0') bool sunday,
      @JsonKey(name: 'day_1') bool monday,
      @JsonKey(name: 'day_2') bool tuesday,
      @JsonKey(name: 'day_3') bool wednesday,
      @JsonKey(name: 'day_4') bool thursday,
      @JsonKey(name: 'day_5') bool friday,
      @JsonKey(name: 'day_6') bool saturday});
}

/// @nodoc
class _$PromoDaysDMCopyWithImpl<$Res> implements $PromoDaysDMCopyWith<$Res> {
  _$PromoDaysDMCopyWithImpl(this._self, this._then);

  final PromoDaysDM _self;
  final $Res Function(PromoDaysDM) _then;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunday = null,
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
  }) {
    return _then(_self.copyWith(
      sunday: null == sunday
          ? _self.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as bool,
      monday: null == monday
          ? _self.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as bool,
      tuesday: null == tuesday
          ? _self.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as bool,
      wednesday: null == wednesday
          ? _self.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as bool,
      thursday: null == thursday
          ? _self.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as bool,
      friday: null == friday
          ? _self.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as bool,
      saturday: null == saturday
          ? _self.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromoDaysDM].
extension PromoDaysDMPatterns on PromoDaysDM {
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
    TResult Function(_PromoDaysDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM() when $default != null:
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
    TResult Function(_PromoDaysDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM():
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
    TResult? Function(_PromoDaysDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM() when $default != null:
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
            @JsonKey(name: 'day_0') bool sunday,
            @JsonKey(name: 'day_1') bool monday,
            @JsonKey(name: 'day_2') bool tuesday,
            @JsonKey(name: 'day_3') bool wednesday,
            @JsonKey(name: 'day_4') bool thursday,
            @JsonKey(name: 'day_5') bool friday,
            @JsonKey(name: 'day_6') bool saturday)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM() when $default != null:
        return $default(_that.sunday, _that.monday, _that.tuesday,
            _that.wednesday, _that.thursday, _that.friday, _that.saturday);
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
            @JsonKey(name: 'day_0') bool sunday,
            @JsonKey(name: 'day_1') bool monday,
            @JsonKey(name: 'day_2') bool tuesday,
            @JsonKey(name: 'day_3') bool wednesday,
            @JsonKey(name: 'day_4') bool thursday,
            @JsonKey(name: 'day_5') bool friday,
            @JsonKey(name: 'day_6') bool saturday)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM():
        return $default(_that.sunday, _that.monday, _that.tuesday,
            _that.wednesday, _that.thursday, _that.friday, _that.saturday);
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
            @JsonKey(name: 'day_0') bool sunday,
            @JsonKey(name: 'day_1') bool monday,
            @JsonKey(name: 'day_2') bool tuesday,
            @JsonKey(name: 'day_3') bool wednesday,
            @JsonKey(name: 'day_4') bool thursday,
            @JsonKey(name: 'day_5') bool friday,
            @JsonKey(name: 'day_6') bool saturday)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoDaysDM() when $default != null:
        return $default(_that.sunday, _that.monday, _that.tuesday,
            _that.wednesday, _that.thursday, _that.friday, _that.saturday);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoDaysDM extends PromoDaysDM {
  const _PromoDaysDM(
      {@JsonKey(name: 'day_0') this.sunday = false,
      @JsonKey(name: 'day_1') this.monday = false,
      @JsonKey(name: 'day_2') this.tuesday = false,
      @JsonKey(name: 'day_3') this.wednesday = false,
      @JsonKey(name: 'day_4') this.thursday = false,
      @JsonKey(name: 'day_5') this.friday = false,
      @JsonKey(name: 'day_6') this.saturday = false})
      : super._();
  factory _PromoDaysDM.fromJson(Map<String, dynamic> json) =>
      _$PromoDaysDMFromJson(json);

  @override
  @JsonKey(name: 'day_0')
  final bool sunday;
  @override
  @JsonKey(name: 'day_1')
  final bool monday;
  @override
  @JsonKey(name: 'day_2')
  final bool tuesday;
  @override
  @JsonKey(name: 'day_3')
  final bool wednesday;
  @override
  @JsonKey(name: 'day_4')
  final bool thursday;
  @override
  @JsonKey(name: 'day_5')
  final bool friday;
  @override
  @JsonKey(name: 'day_6')
  final bool saturday;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoDaysDMCopyWith<_PromoDaysDM> get copyWith =>
      __$PromoDaysDMCopyWithImpl<_PromoDaysDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoDaysDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoDaysDM &&
            (identical(other.sunday, sunday) || other.sunday == sunday) &&
            (identical(other.monday, monday) || other.monday == monday) &&
            (identical(other.tuesday, tuesday) || other.tuesday == tuesday) &&
            (identical(other.wednesday, wednesday) ||
                other.wednesday == wednesday) &&
            (identical(other.thursday, thursday) ||
                other.thursday == thursday) &&
            (identical(other.friday, friday) || other.friday == friday) &&
            (identical(other.saturday, saturday) ||
                other.saturday == saturday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sunday, monday, tuesday,
      wednesday, thursday, friday, saturday);

  @override
  String toString() {
    return 'PromoDaysDM(sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday)';
  }
}

/// @nodoc
abstract mixin class _$PromoDaysDMCopyWith<$Res>
    implements $PromoDaysDMCopyWith<$Res> {
  factory _$PromoDaysDMCopyWith(
          _PromoDaysDM value, $Res Function(_PromoDaysDM) _then) =
      __$PromoDaysDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day_0') bool sunday,
      @JsonKey(name: 'day_1') bool monday,
      @JsonKey(name: 'day_2') bool tuesday,
      @JsonKey(name: 'day_3') bool wednesday,
      @JsonKey(name: 'day_4') bool thursday,
      @JsonKey(name: 'day_5') bool friday,
      @JsonKey(name: 'day_6') bool saturday});
}

/// @nodoc
class __$PromoDaysDMCopyWithImpl<$Res> implements _$PromoDaysDMCopyWith<$Res> {
  __$PromoDaysDMCopyWithImpl(this._self, this._then);

  final _PromoDaysDM _self;
  final $Res Function(_PromoDaysDM) _then;

  /// Create a copy of PromoDaysDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sunday = null,
    Object? monday = null,
    Object? tuesday = null,
    Object? wednesday = null,
    Object? thursday = null,
    Object? friday = null,
    Object? saturday = null,
  }) {
    return _then(_PromoDaysDM(
      sunday: null == sunday
          ? _self.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as bool,
      monday: null == monday
          ? _self.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as bool,
      tuesday: null == tuesday
          ? _self.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as bool,
      wednesday: null == wednesday
          ? _self.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as bool,
      thursday: null == thursday
          ? _self.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as bool,
      friday: null == friday
          ? _self.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as bool,
      saturday: null == saturday
          ? _self.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PromoGenerationResponse {
  String get title;
  String get subtitle;
  String get description;
  @Base64Converter()
  Uint8List? get imageBytes;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoGenerationResponseCopyWith<PromoGenerationResponse> get copyWith =>
      _$PromoGenerationResponseCopyWithImpl<PromoGenerationResponse>(
          this as PromoGenerationResponse, _$identity);

  /// Serializes this PromoGenerationResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoGenerationResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, description,
      const DeepCollectionEquality().hash(imageBytes));

  @override
  String toString() {
    return 'PromoGenerationResponse(title: $title, subtitle: $subtitle, description: $description, imageBytes: $imageBytes)';
  }
}

/// @nodoc
abstract mixin class $PromoGenerationResponseCopyWith<$Res> {
  factory $PromoGenerationResponseCopyWith(PromoGenerationResponse value,
          $Res Function(PromoGenerationResponse) _then) =
      _$PromoGenerationResponseCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String description,
      @Base64Converter() Uint8List? imageBytes});
}

/// @nodoc
class _$PromoGenerationResponseCopyWithImpl<$Res>
    implements $PromoGenerationResponseCopyWith<$Res> {
  _$PromoGenerationResponseCopyWithImpl(this._self, this._then);

  final PromoGenerationResponse _self;
  final $Res Function(PromoGenerationResponse) _then;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _self.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromoGenerationResponse].
extension PromoGenerationResponsePatterns on PromoGenerationResponse {
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
    TResult Function(_PromoGenerationResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse() when $default != null:
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
    TResult Function(_PromoGenerationResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse():
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
    TResult? Function(_PromoGenerationResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse() when $default != null:
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
    TResult Function(String title, String subtitle, String description,
            @Base64Converter() Uint8List? imageBytes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse() when $default != null:
        return $default(
            _that.title, _that.subtitle, _that.description, _that.imageBytes);
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
    TResult Function(String title, String subtitle, String description,
            @Base64Converter() Uint8List? imageBytes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse():
        return $default(
            _that.title, _that.subtitle, _that.description, _that.imageBytes);
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
    TResult? Function(String title, String subtitle, String description,
            @Base64Converter() Uint8List? imageBytes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoGenerationResponse() when $default != null:
        return $default(
            _that.title, _that.subtitle, _that.description, _that.imageBytes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoGenerationResponse implements PromoGenerationResponse {
  const _PromoGenerationResponse(
      {required this.title,
      required this.subtitle,
      required this.description,
      @Base64Converter() this.imageBytes});
  factory _PromoGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoGenerationResponseFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;
  @override
  @Base64Converter()
  final Uint8List? imageBytes;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoGenerationResponseCopyWith<_PromoGenerationResponse> get copyWith =>
      __$PromoGenerationResponseCopyWithImpl<_PromoGenerationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoGenerationResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoGenerationResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, description,
      const DeepCollectionEquality().hash(imageBytes));

  @override
  String toString() {
    return 'PromoGenerationResponse(title: $title, subtitle: $subtitle, description: $description, imageBytes: $imageBytes)';
  }
}

/// @nodoc
abstract mixin class _$PromoGenerationResponseCopyWith<$Res>
    implements $PromoGenerationResponseCopyWith<$Res> {
  factory _$PromoGenerationResponseCopyWith(_PromoGenerationResponse value,
          $Res Function(_PromoGenerationResponse) _then) =
      __$PromoGenerationResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      String description,
      @Base64Converter() Uint8List? imageBytes});
}

/// @nodoc
class __$PromoGenerationResponseCopyWithImpl<$Res>
    implements _$PromoGenerationResponseCopyWith<$Res> {
  __$PromoGenerationResponseCopyWithImpl(this._self, this._then);

  final _PromoGenerationResponse _self;
  final $Res Function(_PromoGenerationResponse) _then;

  /// Create a copy of PromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_PromoGenerationResponse(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _self.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
mixin _$PromoMediaResponse {
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromoMediaResponseCopyWith<PromoMediaResponse> get copyWith =>
      _$PromoMediaResponseCopyWithImpl<PromoMediaResponse>(
          this as PromoMediaResponse, _$identity);

  /// Serializes this PromoMediaResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromoMediaResponse &&
            const DeepCollectionEquality()
                .equals(other.promoMedia, promoMedia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(promoMedia));

  @override
  String toString() {
    return 'PromoMediaResponse(promoMedia: $promoMedia)';
  }
}

/// @nodoc
abstract mixin class $PromoMediaResponseCopyWith<$Res> {
  factory $PromoMediaResponseCopyWith(
          PromoMediaResponse value, $Res Function(PromoMediaResponse) _then) =
      _$PromoMediaResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia});
}

/// @nodoc
class _$PromoMediaResponseCopyWithImpl<$Res>
    implements $PromoMediaResponseCopyWith<$Res> {
  _$PromoMediaResponseCopyWithImpl(this._self, this._then);

  final PromoMediaResponse _self;
  final $Res Function(PromoMediaResponse) _then;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoMedia = null,
  }) {
    return _then(_self.copyWith(
      promoMedia: null == promoMedia
          ? _self.promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromoMediaResponse].
extension PromoMediaResponsePatterns on PromoMediaResponse {
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
    TResult Function(_PromoMediaResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse() when $default != null:
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
    TResult Function(_PromoMediaResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse():
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
    TResult? Function(_PromoMediaResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse() when $default != null:
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
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse() when $default != null:
        return $default(_that.promoMedia);
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
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse():
        return $default(_that.promoMedia);
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
            @JsonKey(name: 'business_promo_reference_media')
            List<PromoMediaDM> promoMedia)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromoMediaResponse() when $default != null:
        return $default(_that.promoMedia);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromoMediaResponse implements PromoMediaResponse {
  const _PromoMediaResponse(
      {@JsonKey(name: 'business_promo_reference_media')
      required final List<PromoMediaDM> promoMedia})
      : _promoMedia = promoMedia;
  factory _PromoMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoMediaResponseFromJson(json);

  final List<PromoMediaDM> _promoMedia;
  @override
  @JsonKey(name: 'business_promo_reference_media')
  List<PromoMediaDM> get promoMedia {
    if (_promoMedia is EqualUnmodifiableListView) return _promoMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_promoMedia);
  }

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromoMediaResponseCopyWith<_PromoMediaResponse> get copyWith =>
      __$PromoMediaResponseCopyWithImpl<_PromoMediaResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromoMediaResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromoMediaResponse &&
            const DeepCollectionEquality()
                .equals(other._promoMedia, _promoMedia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_promoMedia));

  @override
  String toString() {
    return 'PromoMediaResponse(promoMedia: $promoMedia)';
  }
}

/// @nodoc
abstract mixin class _$PromoMediaResponseCopyWith<$Res>
    implements $PromoMediaResponseCopyWith<$Res> {
  factory _$PromoMediaResponseCopyWith(
          _PromoMediaResponse value, $Res Function(_PromoMediaResponse) _then) =
      __$PromoMediaResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_promo_reference_media')
      List<PromoMediaDM> promoMedia});
}

/// @nodoc
class __$PromoMediaResponseCopyWithImpl<$Res>
    implements _$PromoMediaResponseCopyWith<$Res> {
  __$PromoMediaResponseCopyWithImpl(this._self, this._then);

  final _PromoMediaResponse _self;
  final $Res Function(_PromoMediaResponse) _then;

  /// Create a copy of PromoMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promoMedia = null,
  }) {
    return _then(_PromoMediaResponse(
      promoMedia: null == promoMedia
          ? _self._promoMedia
          : promoMedia // ignore: cast_nullable_to_non_nullable
              as List<PromoMediaDM>,
    ));
  }
}

// dart format on
