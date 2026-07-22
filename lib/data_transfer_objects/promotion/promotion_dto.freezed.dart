// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionDTO {
  @JsonKey(name: 'business_uuid')
  String? get businessUuid;
  String? get title;
  @JsonKey(name: 'sub_title')
  String? get subTitle;
  String? get description;
  @JsonKey(name: 'start_date')
  String? get startDate;
  @JsonKey(name: 'expire_date')
  String? get expireDate;
  List<Version> get versions;
  Prices? get prices;
  @JsonKey(name: 'promo_active_days')
  PromoDaysDM? get promoActiveDays;
  bool? get available;
  @JsonKey(name: 'media_link')
  String? get mediaLink;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionDTOCopyWith<PromotionDTO> get copyWith =>
      _$PromotionDTOCopyWithImpl<PromotionDTO>(
          this as PromotionDTO, _$identity);

  /// Serializes this PromotionDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionDTO &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            const DeepCollectionEquality().equals(other.versions, versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.promoActiveDays, promoActiveDays) ||
                other.promoActiveDays == promoActiveDays) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessUuid,
      title,
      subTitle,
      description,
      startDate,
      expireDate,
      const DeepCollectionEquality().hash(versions),
      prices,
      promoActiveDays,
      available,
      mediaLink);

  @override
  String toString() {
    return 'PromotionDTO(businessUuid: $businessUuid, title: $title, subTitle: $subTitle, description: $description, startDate: $startDate, expireDate: $expireDate, versions: $versions, prices: $prices, promoActiveDays: $promoActiveDays, available: $available, mediaLink: $mediaLink)';
  }
}

/// @nodoc
abstract mixin class $PromotionDTOCopyWith<$Res> {
  factory $PromotionDTOCopyWith(
          PromotionDTO value, $Res Function(PromotionDTO) _then) =
      _$PromotionDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String? businessUuid,
      String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'expire_date') String? expireDate,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
      bool? available,
      @JsonKey(name: 'media_link') String? mediaLink});

  $PricesCopyWith<$Res>? get prices;
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays;
}

/// @nodoc
class _$PromotionDTOCopyWithImpl<$Res> implements $PromotionDTOCopyWith<$Res> {
  _$PromotionDTOCopyWithImpl(this._self, this._then);

  final PromotionDTO _self;
  final $Res Function(PromotionDTO) _then;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? promoActiveDays = freezed,
    Object? available = freezed,
    Object? mediaLink = freezed,
  }) {
    return _then(_self.copyWith(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _self.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      promoActiveDays: freezed == promoActiveDays
          ? _self.promoActiveDays
          : promoActiveDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PromotionDTO
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

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays {
    if (_self.promoActiveDays == null) {
      return null;
    }

    return $PromoDaysDMCopyWith<$Res>(_self.promoActiveDays!, (value) {
      return _then(_self.copyWith(promoActiveDays: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PromotionDTO].
extension PromotionDTOPatterns on PromotionDTO {
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
    TResult Function(_PromotionDTO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO() when $default != null:
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
    TResult Function(_PromotionDTO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO():
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
    TResult? Function(_PromotionDTO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO() when $default != null:
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
            @JsonKey(name: 'business_uuid') String? businessUuid,
            String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            String? description,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'expire_date') String? expireDate,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
            bool? available,
            @JsonKey(name: 'media_link') String? mediaLink)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO() when $default != null:
        return $default(
            _that.businessUuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.startDate,
            _that.expireDate,
            _that.versions,
            _that.prices,
            _that.promoActiveDays,
            _that.available,
            _that.mediaLink);
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
            @JsonKey(name: 'business_uuid') String? businessUuid,
            String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            String? description,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'expire_date') String? expireDate,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
            bool? available,
            @JsonKey(name: 'media_link') String? mediaLink)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO():
        return $default(
            _that.businessUuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.startDate,
            _that.expireDate,
            _that.versions,
            _that.prices,
            _that.promoActiveDays,
            _that.available,
            _that.mediaLink);
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
            @JsonKey(name: 'business_uuid') String? businessUuid,
            String? title,
            @JsonKey(name: 'sub_title') String? subTitle,
            String? description,
            @JsonKey(name: 'start_date') String? startDate,
            @JsonKey(name: 'expire_date') String? expireDate,
            List<Version> versions,
            Prices? prices,
            @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
            bool? available,
            @JsonKey(name: 'media_link') String? mediaLink)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromotionDTO() when $default != null:
        return $default(
            _that.businessUuid,
            _that.title,
            _that.subTitle,
            _that.description,
            _that.startDate,
            _that.expireDate,
            _that.versions,
            _that.prices,
            _that.promoActiveDays,
            _that.available,
            _that.mediaLink);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionDTO implements PromotionDTO {
  const _PromotionDTO(
      {@JsonKey(name: 'business_uuid') this.businessUuid,
      this.title,
      @JsonKey(name: 'sub_title') this.subTitle,
      this.description,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'expire_date') this.expireDate,
      final List<Version> versions = const [Version.regular],
      this.prices,
      @JsonKey(name: 'promo_active_days') this.promoActiveDays,
      this.available,
      @JsonKey(name: 'media_link') this.mediaLink})
      : _versions = versions;
  factory _PromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$PromotionDTOFromJson(json);

  @override
  @JsonKey(name: 'business_uuid')
  final String? businessUuid;
  @override
  final String? title;
  @override
  @JsonKey(name: 'sub_title')
  final String? subTitle;
  @override
  final String? description;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'expire_date')
  final String? expireDate;
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
  @JsonKey(name: 'promo_active_days')
  final PromoDaysDM? promoActiveDays;
  @override
  final bool? available;
  @override
  @JsonKey(name: 'media_link')
  final String? mediaLink;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionDTOCopyWith<_PromotionDTO> get copyWith =>
      __$PromotionDTOCopyWithImpl<_PromotionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionDTO &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.prices, prices) || other.prices == prices) &&
            (identical(other.promoActiveDays, promoActiveDays) ||
                other.promoActiveDays == promoActiveDays) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.mediaLink, mediaLink) ||
                other.mediaLink == mediaLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessUuid,
      title,
      subTitle,
      description,
      startDate,
      expireDate,
      const DeepCollectionEquality().hash(_versions),
      prices,
      promoActiveDays,
      available,
      mediaLink);

  @override
  String toString() {
    return 'PromotionDTO(businessUuid: $businessUuid, title: $title, subTitle: $subTitle, description: $description, startDate: $startDate, expireDate: $expireDate, versions: $versions, prices: $prices, promoActiveDays: $promoActiveDays, available: $available, mediaLink: $mediaLink)';
  }
}

/// @nodoc
abstract mixin class _$PromotionDTOCopyWith<$Res>
    implements $PromotionDTOCopyWith<$Res> {
  factory _$PromotionDTOCopyWith(
          _PromotionDTO value, $Res Function(_PromotionDTO) _then) =
      __$PromotionDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_uuid') String? businessUuid,
      String? title,
      @JsonKey(name: 'sub_title') String? subTitle,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'expire_date') String? expireDate,
      List<Version> versions,
      Prices? prices,
      @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
      bool? available,
      @JsonKey(name: 'media_link') String? mediaLink});

  @override
  $PricesCopyWith<$Res>? get prices;
  @override
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays;
}

/// @nodoc
class __$PromotionDTOCopyWithImpl<$Res>
    implements _$PromotionDTOCopyWith<$Res> {
  __$PromotionDTOCopyWithImpl(this._self, this._then);

  final _PromotionDTO _self;
  final $Res Function(_PromotionDTO) _then;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessUuid = freezed,
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? expireDate = freezed,
    Object? versions = null,
    Object? prices = freezed,
    Object? promoActiveDays = freezed,
    Object? available = freezed,
    Object? mediaLink = freezed,
  }) {
    return _then(_PromotionDTO(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expireDate: freezed == expireDate
          ? _self.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: null == versions
          ? _self._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      prices: freezed == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Prices?,
      promoActiveDays: freezed == promoActiveDays
          ? _self.promoActiveDays
          : promoActiveDays // ignore: cast_nullable_to_non_nullable
              as PromoDaysDM?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLink: freezed == mediaLink
          ? _self.mediaLink
          : mediaLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PromotionDTO
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

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoDaysDMCopyWith<$Res>? get promoActiveDays {
    if (_self.promoActiveDays == null) {
      return null;
    }

    return $PromoDaysDMCopyWith<$Res>(_self.promoActiveDays!, (value) {
      return _then(_self.copyWith(promoActiveDays: value));
    });
  }
}

// dart format on
