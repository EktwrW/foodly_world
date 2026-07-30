// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_profile_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfessionalProfileResponseDM {
  bool get success;
  String get message;
  @JsonKey(name: 'professional_profile')
  ProfessionalProfileDM? get professionalProfile;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfessionalProfileResponseDMCopyWith<ProfessionalProfileResponseDM>
      get copyWith => _$ProfessionalProfileResponseDMCopyWithImpl<
              ProfessionalProfileResponseDM>(
          this as ProfessionalProfileResponseDM, _$identity);

  /// Serializes this ProfessionalProfileResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfessionalProfileResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.professionalProfile, professionalProfile) ||
                other.professionalProfile == professionalProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, professionalProfile);

  @override
  String toString() {
    return 'ProfessionalProfileResponseDM(success: $success, message: $message, professionalProfile: $professionalProfile)';
  }
}

/// @nodoc
abstract mixin class $ProfessionalProfileResponseDMCopyWith<$Res> {
  factory $ProfessionalProfileResponseDMCopyWith(
          ProfessionalProfileResponseDM value,
          $Res Function(ProfessionalProfileResponseDM) _then) =
      _$ProfessionalProfileResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'professional_profile')
      ProfessionalProfileDM? professionalProfile});

  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile;
}

/// @nodoc
class _$ProfessionalProfileResponseDMCopyWithImpl<$Res>
    implements $ProfessionalProfileResponseDMCopyWith<$Res> {
  _$ProfessionalProfileResponseDMCopyWithImpl(this._self, this._then);

  final ProfessionalProfileResponseDM _self;
  final $Res Function(ProfessionalProfileResponseDM) _then;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? professionalProfile = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      professionalProfile: freezed == professionalProfile
          ? _self.professionalProfile
          : professionalProfile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
    ));
  }

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile {
    if (_self.professionalProfile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_self.professionalProfile!,
        (value) {
      return _then(_self.copyWith(professionalProfile: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfessionalProfileResponseDM].
extension ProfessionalProfileResponseDMPatterns
    on ProfessionalProfileResponseDM {
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
    TResult Function(_ProfessionalProfileResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM() when $default != null:
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
    TResult Function(_ProfessionalProfileResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM():
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
    TResult? Function(_ProfessionalProfileResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM() when $default != null:
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
            bool success,
            String message,
            @JsonKey(name: 'professional_profile')
            ProfessionalProfileDM? professionalProfile)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM() when $default != null:
        return $default(
            _that.success, _that.message, _that.professionalProfile);
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
            bool success,
            String message,
            @JsonKey(name: 'professional_profile')
            ProfessionalProfileDM? professionalProfile)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM():
        return $default(
            _that.success, _that.message, _that.professionalProfile);
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
            bool success,
            String message,
            @JsonKey(name: 'professional_profile')
            ProfessionalProfileDM? professionalProfile)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileResponseDM() when $default != null:
        return $default(
            _that.success, _that.message, _that.professionalProfile);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfessionalProfileResponseDM implements ProfessionalProfileResponseDM {
  const _ProfessionalProfileResponseDM(
      {this.success = false,
      this.message = '',
      @JsonKey(name: 'professional_profile') this.professionalProfile});
  factory _ProfessionalProfileResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalProfileResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'professional_profile')
  final ProfessionalProfileDM? professionalProfile;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfessionalProfileResponseDMCopyWith<_ProfessionalProfileResponseDM>
      get copyWith => __$ProfessionalProfileResponseDMCopyWithImpl<
          _ProfessionalProfileResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfessionalProfileResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfessionalProfileResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.professionalProfile, professionalProfile) ||
                other.professionalProfile == professionalProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, professionalProfile);

  @override
  String toString() {
    return 'ProfessionalProfileResponseDM(success: $success, message: $message, professionalProfile: $professionalProfile)';
  }
}

/// @nodoc
abstract mixin class _$ProfessionalProfileResponseDMCopyWith<$Res>
    implements $ProfessionalProfileResponseDMCopyWith<$Res> {
  factory _$ProfessionalProfileResponseDMCopyWith(
          _ProfessionalProfileResponseDM value,
          $Res Function(_ProfessionalProfileResponseDM) _then) =
      __$ProfessionalProfileResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'professional_profile')
      ProfessionalProfileDM? professionalProfile});

  @override
  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile;
}

/// @nodoc
class __$ProfessionalProfileResponseDMCopyWithImpl<$Res>
    implements _$ProfessionalProfileResponseDMCopyWith<$Res> {
  __$ProfessionalProfileResponseDMCopyWithImpl(this._self, this._then);

  final _ProfessionalProfileResponseDM _self;
  final $Res Function(_ProfessionalProfileResponseDM) _then;

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? professionalProfile = freezed,
  }) {
    return _then(_ProfessionalProfileResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      professionalProfile: freezed == professionalProfile
          ? _self.professionalProfile
          : professionalProfile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
    ));
  }

  /// Create a copy of ProfessionalProfileResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get professionalProfile {
    if (_self.professionalProfile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_self.professionalProfile!,
        (value) {
      return _then(_self.copyWith(professionalProfile: value));
    });
  }
}

/// @nodoc
mixin _$ProfessionalProfileDM {
  int? get id;
  String? get uuid;
  @JsonKey(name: 'business_id')
  int? get businessId;
  List<String> get specialties;
  List<String> get cuisines;
  @JsonKey(name: 'years_experience')
  int? get yearsExperience;
  List<String> get certifications;
  @JsonKey(name: 'languages_spoken')
  List<String> get languagesSpoken;
  @JsonKey(name: 'team_size')
  TeamSize? get teamSize;
  @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
  double? get serviceRadiusKm;
  @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
  double? get travelFeePerKm;
  @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
  double? get minBookingAmount;
  @JsonKey(name: 'min_booking_currency')
  String? get minBookingCurrency;
  @JsonKey(name: 'deposit_required')
  bool get depositRequired;
  @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
  double? get depositPercentage;
  @JsonKey(name: 'cancellation_policy')
  CancellationPolicy? get cancellationPolicy;
  @JsonKey(name: 'cancellation_policy_text')
  String? get cancellationPolicyText;
  @JsonKey(name: 'has_insurance')
  bool get hasInsurance;
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @JsonKey(name: 'portfolio_video_url')
  String? get portfolioVideoUrl;
  @JsonKey(name: 'press_mentions')
  List<String> get pressMentions;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<ProfessionalProfileDM> get copyWith =>
      _$ProfessionalProfileDMCopyWithImpl<ProfessionalProfileDM>(
          this as ProfessionalProfileDM, _$identity);

  /// Serializes this ProfessionalProfileDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfessionalProfileDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality()
                .equals(other.specialties, specialties) &&
            const DeepCollectionEquality().equals(other.cuisines, cuisines) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            const DeepCollectionEquality()
                .equals(other.certifications, certifications) &&
            const DeepCollectionEquality()
                .equals(other.languagesSpoken, languagesSpoken) &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            (identical(other.serviceRadiusKm, serviceRadiusKm) ||
                other.serviceRadiusKm == serviceRadiusKm) &&
            (identical(other.travelFeePerKm, travelFeePerKm) ||
                other.travelFeePerKm == travelFeePerKm) &&
            (identical(other.minBookingAmount, minBookingAmount) ||
                other.minBookingAmount == minBookingAmount) &&
            (identical(other.minBookingCurrency, minBookingCurrency) ||
                other.minBookingCurrency == minBookingCurrency) &&
            (identical(other.depositRequired, depositRequired) ||
                other.depositRequired == depositRequired) &&
            (identical(other.depositPercentage, depositPercentage) ||
                other.depositPercentage == depositPercentage) &&
            (identical(other.cancellationPolicy, cancellationPolicy) ||
                other.cancellationPolicy == cancellationPolicy) &&
            (identical(other.cancellationPolicyText, cancellationPolicyText) ||
                other.cancellationPolicyText == cancellationPolicyText) &&
            (identical(other.hasInsurance, hasInsurance) ||
                other.hasInsurance == hasInsurance) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.portfolioVideoUrl, portfolioVideoUrl) ||
                other.portfolioVideoUrl == portfolioVideoUrl) &&
            const DeepCollectionEquality()
                .equals(other.pressMentions, pressMentions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        businessId,
        const DeepCollectionEquality().hash(specialties),
        const DeepCollectionEquality().hash(cuisines),
        yearsExperience,
        const DeepCollectionEquality().hash(certifications),
        const DeepCollectionEquality().hash(languagesSpoken),
        teamSize,
        serviceRadiusKm,
        travelFeePerKm,
        minBookingAmount,
        minBookingCurrency,
        depositRequired,
        depositPercentage,
        cancellationPolicy,
        cancellationPolicyText,
        hasInsurance,
        isVerified,
        verifiedAt,
        portfolioVideoUrl,
        const DeepCollectionEquality().hash(pressMentions),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ProfessionalProfileDM(id: $id, uuid: $uuid, businessId: $businessId, specialties: $specialties, cuisines: $cuisines, yearsExperience: $yearsExperience, certifications: $certifications, languagesSpoken: $languagesSpoken, teamSize: $teamSize, serviceRadiusKm: $serviceRadiusKm, travelFeePerKm: $travelFeePerKm, minBookingAmount: $minBookingAmount, minBookingCurrency: $minBookingCurrency, depositRequired: $depositRequired, depositPercentage: $depositPercentage, cancellationPolicy: $cancellationPolicy, cancellationPolicyText: $cancellationPolicyText, hasInsurance: $hasInsurance, isVerified: $isVerified, verifiedAt: $verifiedAt, portfolioVideoUrl: $portfolioVideoUrl, pressMentions: $pressMentions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProfessionalProfileDMCopyWith<$Res> {
  factory $ProfessionalProfileDMCopyWith(ProfessionalProfileDM value,
          $Res Function(ProfessionalProfileDM) _then) =
      _$ProfessionalProfileDMCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      List<String> specialties,
      List<String> cuisines,
      @JsonKey(name: 'years_experience') int? yearsExperience,
      List<String> certifications,
      @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
      @JsonKey(name: 'team_size') TeamSize? teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      double? serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      double? travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      double? minBookingAmount,
      @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
      @JsonKey(name: 'deposit_required') bool depositRequired,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      double? depositPercentage,
      @JsonKey(name: 'cancellation_policy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') String? cancellationPolicyText,
      @JsonKey(name: 'has_insurance') bool hasInsurance,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
      @JsonKey(name: 'press_mentions') List<String> pressMentions,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ProfessionalProfileDMCopyWithImpl<$Res>
    implements $ProfessionalProfileDMCopyWith<$Res> {
  _$ProfessionalProfileDMCopyWithImpl(this._self, this._then);

  final ProfessionalProfileDM _self;
  final $Res Function(ProfessionalProfileDM) _then;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? specialties = null,
    Object? cuisines = null,
    Object? yearsExperience = freezed,
    Object? certifications = null,
    Object? languagesSpoken = null,
    Object? teamSize = freezed,
    Object? serviceRadiusKm = freezed,
    Object? travelFeePerKm = freezed,
    Object? minBookingAmount = freezed,
    Object? minBookingCurrency = freezed,
    Object? depositRequired = null,
    Object? depositPercentage = freezed,
    Object? cancellationPolicy = freezed,
    Object? cancellationPolicyText = freezed,
    Object? hasInsurance = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
    Object? portfolioVideoUrl = freezed,
    Object? pressMentions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      specialties: null == specialties
          ? _self.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisines: null == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      yearsExperience: freezed == yearsExperience
          ? _self.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      certifications: null == certifications
          ? _self.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languagesSpoken: null == languagesSpoken
          ? _self.languagesSpoken
          : languagesSpoken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamSize: freezed == teamSize
          ? _self.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as TeamSize?,
      serviceRadiusKm: freezed == serviceRadiusKm
          ? _self.serviceRadiusKm
          : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      travelFeePerKm: freezed == travelFeePerKm
          ? _self.travelFeePerKm
          : travelFeePerKm // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingAmount: freezed == minBookingAmount
          ? _self.minBookingAmount
          : minBookingAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingCurrency: freezed == minBookingCurrency
          ? _self.minBookingCurrency
          : minBookingCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      depositRequired: null == depositRequired
          ? _self.depositRequired
          : depositRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      depositPercentage: freezed == depositPercentage
          ? _self.depositPercentage
          : depositPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      cancellationPolicy: freezed == cancellationPolicy
          ? _self.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      cancellationPolicyText: freezed == cancellationPolicyText
          ? _self.cancellationPolicyText
          : cancellationPolicyText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasInsurance: null == hasInsurance
          ? _self.hasInsurance
          : hasInsurance // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      portfolioVideoUrl: freezed == portfolioVideoUrl
          ? _self.portfolioVideoUrl
          : portfolioVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pressMentions: null == pressMentions
          ? _self.pressMentions
          : pressMentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfessionalProfileDM].
extension ProfessionalProfileDMPatterns on ProfessionalProfileDM {
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
    TResult Function(_ProfessionalProfileDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM() when $default != null:
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
    TResult Function(_ProfessionalProfileDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM():
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
    TResult? Function(_ProfessionalProfileDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM() when $default != null:
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            List<String> specialties,
            List<String> cuisines,
            @JsonKey(name: 'years_experience') int? yearsExperience,
            List<String> certifications,
            @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
            @JsonKey(name: 'team_size') TeamSize? teamSize,
            @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
            double? serviceRadiusKm,
            @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
            double? travelFeePerKm,
            @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
            double? minBookingAmount,
            @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
            @JsonKey(name: 'deposit_required') bool depositRequired,
            @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
            double? depositPercentage,
            @JsonKey(name: 'cancellation_policy')
            CancellationPolicy? cancellationPolicy,
            @JsonKey(name: 'cancellation_policy_text')
            String? cancellationPolicyText,
            @JsonKey(name: 'has_insurance') bool hasInsurance,
            @JsonKey(name: 'is_verified') bool isVerified,
            @JsonKey(name: 'verified_at') DateTime? verifiedAt,
            @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
            @JsonKey(name: 'press_mentions') List<String> pressMentions,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.specialties,
            _that.cuisines,
            _that.yearsExperience,
            _that.certifications,
            _that.languagesSpoken,
            _that.teamSize,
            _that.serviceRadiusKm,
            _that.travelFeePerKm,
            _that.minBookingAmount,
            _that.minBookingCurrency,
            _that.depositRequired,
            _that.depositPercentage,
            _that.cancellationPolicy,
            _that.cancellationPolicyText,
            _that.hasInsurance,
            _that.isVerified,
            _that.verifiedAt,
            _that.portfolioVideoUrl,
            _that.pressMentions,
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            List<String> specialties,
            List<String> cuisines,
            @JsonKey(name: 'years_experience') int? yearsExperience,
            List<String> certifications,
            @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
            @JsonKey(name: 'team_size') TeamSize? teamSize,
            @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
            double? serviceRadiusKm,
            @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
            double? travelFeePerKm,
            @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
            double? minBookingAmount,
            @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
            @JsonKey(name: 'deposit_required') bool depositRequired,
            @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
            double? depositPercentage,
            @JsonKey(name: 'cancellation_policy')
            CancellationPolicy? cancellationPolicy,
            @JsonKey(name: 'cancellation_policy_text')
            String? cancellationPolicyText,
            @JsonKey(name: 'has_insurance') bool hasInsurance,
            @JsonKey(name: 'is_verified') bool isVerified,
            @JsonKey(name: 'verified_at') DateTime? verifiedAt,
            @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
            @JsonKey(name: 'press_mentions') List<String> pressMentions,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.specialties,
            _that.cuisines,
            _that.yearsExperience,
            _that.certifications,
            _that.languagesSpoken,
            _that.teamSize,
            _that.serviceRadiusKm,
            _that.travelFeePerKm,
            _that.minBookingAmount,
            _that.minBookingCurrency,
            _that.depositRequired,
            _that.depositPercentage,
            _that.cancellationPolicy,
            _that.cancellationPolicyText,
            _that.hasInsurance,
            _that.isVerified,
            _that.verifiedAt,
            _that.portfolioVideoUrl,
            _that.pressMentions,
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            List<String> specialties,
            List<String> cuisines,
            @JsonKey(name: 'years_experience') int? yearsExperience,
            List<String> certifications,
            @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
            @JsonKey(name: 'team_size') TeamSize? teamSize,
            @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
            double? serviceRadiusKm,
            @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
            double? travelFeePerKm,
            @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
            double? minBookingAmount,
            @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
            @JsonKey(name: 'deposit_required') bool depositRequired,
            @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
            double? depositPercentage,
            @JsonKey(name: 'cancellation_policy')
            CancellationPolicy? cancellationPolicy,
            @JsonKey(name: 'cancellation_policy_text')
            String? cancellationPolicyText,
            @JsonKey(name: 'has_insurance') bool hasInsurance,
            @JsonKey(name: 'is_verified') bool isVerified,
            @JsonKey(name: 'verified_at') DateTime? verifiedAt,
            @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
            @JsonKey(name: 'press_mentions') List<String> pressMentions,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfessionalProfileDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.specialties,
            _that.cuisines,
            _that.yearsExperience,
            _that.certifications,
            _that.languagesSpoken,
            _that.teamSize,
            _that.serviceRadiusKm,
            _that.travelFeePerKm,
            _that.minBookingAmount,
            _that.minBookingCurrency,
            _that.depositRequired,
            _that.depositPercentage,
            _that.cancellationPolicy,
            _that.cancellationPolicyText,
            _that.hasInsurance,
            _that.isVerified,
            _that.verifiedAt,
            _that.portfolioVideoUrl,
            _that.pressMentions,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfessionalProfileDM extends ProfessionalProfileDM {
  const _ProfessionalProfileDM(
      {this.id,
      this.uuid,
      @JsonKey(name: 'business_id') this.businessId,
      final List<String> specialties = const [],
      final List<String> cuisines = const [],
      @JsonKey(name: 'years_experience') this.yearsExperience,
      final List<String> certifications = const [],
      @JsonKey(name: 'languages_spoken')
      final List<String> languagesSpoken = const [],
      @JsonKey(name: 'team_size') this.teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      this.serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      this.travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      this.minBookingAmount,
      @JsonKey(name: 'min_booking_currency') this.minBookingCurrency,
      @JsonKey(name: 'deposit_required') this.depositRequired = false,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      this.depositPercentage,
      @JsonKey(name: 'cancellation_policy') this.cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') this.cancellationPolicyText,
      @JsonKey(name: 'has_insurance') this.hasInsurance = false,
      @JsonKey(name: 'is_verified') this.isVerified = false,
      @JsonKey(name: 'verified_at') this.verifiedAt,
      @JsonKey(name: 'portfolio_video_url') this.portfolioVideoUrl,
      @JsonKey(name: 'press_mentions')
      final List<String> pressMentions = const [],
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _specialties = specialties,
        _cuisines = cuisines,
        _certifications = certifications,
        _languagesSpoken = languagesSpoken,
        _pressMentions = pressMentions,
        super._();
  factory _ProfessionalProfileDM.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalProfileDMFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  final List<String> _cuisines;
  @override
  @JsonKey()
  List<String> get cuisines {
    if (_cuisines is EqualUnmodifiableListView) return _cuisines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cuisines);
  }

  @override
  @JsonKey(name: 'years_experience')
  final int? yearsExperience;
  final List<String> _certifications;
  @override
  @JsonKey()
  List<String> get certifications {
    if (_certifications is EqualUnmodifiableListView) return _certifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certifications);
  }

  final List<String> _languagesSpoken;
  @override
  @JsonKey(name: 'languages_spoken')
  List<String> get languagesSpoken {
    if (_languagesSpoken is EqualUnmodifiableListView) return _languagesSpoken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languagesSpoken);
  }

  @override
  @JsonKey(name: 'team_size')
  final TeamSize? teamSize;
  @override
  @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
  final double? serviceRadiusKm;
  @override
  @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
  final double? travelFeePerKm;
  @override
  @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
  final double? minBookingAmount;
  @override
  @JsonKey(name: 'min_booking_currency')
  final String? minBookingCurrency;
  @override
  @JsonKey(name: 'deposit_required')
  final bool depositRequired;
  @override
  @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
  final double? depositPercentage;
  @override
  @JsonKey(name: 'cancellation_policy')
  final CancellationPolicy? cancellationPolicy;
  @override
  @JsonKey(name: 'cancellation_policy_text')
  final String? cancellationPolicyText;
  @override
  @JsonKey(name: 'has_insurance')
  final bool hasInsurance;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;
  @override
  @JsonKey(name: 'portfolio_video_url')
  final String? portfolioVideoUrl;
  final List<String> _pressMentions;
  @override
  @JsonKey(name: 'press_mentions')
  List<String> get pressMentions {
    if (_pressMentions is EqualUnmodifiableListView) return _pressMentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pressMentions);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfessionalProfileDMCopyWith<_ProfessionalProfileDM> get copyWith =>
      __$ProfessionalProfileDMCopyWithImpl<_ProfessionalProfileDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfessionalProfileDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfessionalProfileDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            const DeepCollectionEquality().equals(other._cuisines, _cuisines) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            const DeepCollectionEquality()
                .equals(other._certifications, _certifications) &&
            const DeepCollectionEquality()
                .equals(other._languagesSpoken, _languagesSpoken) &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            (identical(other.serviceRadiusKm, serviceRadiusKm) ||
                other.serviceRadiusKm == serviceRadiusKm) &&
            (identical(other.travelFeePerKm, travelFeePerKm) ||
                other.travelFeePerKm == travelFeePerKm) &&
            (identical(other.minBookingAmount, minBookingAmount) ||
                other.minBookingAmount == minBookingAmount) &&
            (identical(other.minBookingCurrency, minBookingCurrency) ||
                other.minBookingCurrency == minBookingCurrency) &&
            (identical(other.depositRequired, depositRequired) ||
                other.depositRequired == depositRequired) &&
            (identical(other.depositPercentage, depositPercentage) ||
                other.depositPercentage == depositPercentage) &&
            (identical(other.cancellationPolicy, cancellationPolicy) ||
                other.cancellationPolicy == cancellationPolicy) &&
            (identical(other.cancellationPolicyText, cancellationPolicyText) ||
                other.cancellationPolicyText == cancellationPolicyText) &&
            (identical(other.hasInsurance, hasInsurance) ||
                other.hasInsurance == hasInsurance) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.portfolioVideoUrl, portfolioVideoUrl) ||
                other.portfolioVideoUrl == portfolioVideoUrl) &&
            const DeepCollectionEquality()
                .equals(other._pressMentions, _pressMentions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        businessId,
        const DeepCollectionEquality().hash(_specialties),
        const DeepCollectionEquality().hash(_cuisines),
        yearsExperience,
        const DeepCollectionEquality().hash(_certifications),
        const DeepCollectionEquality().hash(_languagesSpoken),
        teamSize,
        serviceRadiusKm,
        travelFeePerKm,
        minBookingAmount,
        minBookingCurrency,
        depositRequired,
        depositPercentage,
        cancellationPolicy,
        cancellationPolicyText,
        hasInsurance,
        isVerified,
        verifiedAt,
        portfolioVideoUrl,
        const DeepCollectionEquality().hash(_pressMentions),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ProfessionalProfileDM(id: $id, uuid: $uuid, businessId: $businessId, specialties: $specialties, cuisines: $cuisines, yearsExperience: $yearsExperience, certifications: $certifications, languagesSpoken: $languagesSpoken, teamSize: $teamSize, serviceRadiusKm: $serviceRadiusKm, travelFeePerKm: $travelFeePerKm, minBookingAmount: $minBookingAmount, minBookingCurrency: $minBookingCurrency, depositRequired: $depositRequired, depositPercentage: $depositPercentage, cancellationPolicy: $cancellationPolicy, cancellationPolicyText: $cancellationPolicyText, hasInsurance: $hasInsurance, isVerified: $isVerified, verifiedAt: $verifiedAt, portfolioVideoUrl: $portfolioVideoUrl, pressMentions: $pressMentions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProfessionalProfileDMCopyWith<$Res>
    implements $ProfessionalProfileDMCopyWith<$Res> {
  factory _$ProfessionalProfileDMCopyWith(_ProfessionalProfileDM value,
          $Res Function(_ProfessionalProfileDM) _then) =
      __$ProfessionalProfileDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      List<String> specialties,
      List<String> cuisines,
      @JsonKey(name: 'years_experience') int? yearsExperience,
      List<String> certifications,
      @JsonKey(name: 'languages_spoken') List<String> languagesSpoken,
      @JsonKey(name: 'team_size') TeamSize? teamSize,
      @JsonKey(name: 'service_radius_km', fromJson: _doubleFromJson)
      double? serviceRadiusKm,
      @JsonKey(name: 'travel_fee_per_km', fromJson: _doubleFromJson)
      double? travelFeePerKm,
      @JsonKey(name: 'min_booking_amount', fromJson: _doubleFromJson)
      double? minBookingAmount,
      @JsonKey(name: 'min_booking_currency') String? minBookingCurrency,
      @JsonKey(name: 'deposit_required') bool depositRequired,
      @JsonKey(name: 'deposit_percentage', fromJson: _doubleFromJson)
      double? depositPercentage,
      @JsonKey(name: 'cancellation_policy')
      CancellationPolicy? cancellationPolicy,
      @JsonKey(name: 'cancellation_policy_text') String? cancellationPolicyText,
      @JsonKey(name: 'has_insurance') bool hasInsurance,
      @JsonKey(name: 'is_verified') bool isVerified,
      @JsonKey(name: 'verified_at') DateTime? verifiedAt,
      @JsonKey(name: 'portfolio_video_url') String? portfolioVideoUrl,
      @JsonKey(name: 'press_mentions') List<String> pressMentions,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$ProfessionalProfileDMCopyWithImpl<$Res>
    implements _$ProfessionalProfileDMCopyWith<$Res> {
  __$ProfessionalProfileDMCopyWithImpl(this._self, this._then);

  final _ProfessionalProfileDM _self;
  final $Res Function(_ProfessionalProfileDM) _then;

  /// Create a copy of ProfessionalProfileDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? specialties = null,
    Object? cuisines = null,
    Object? yearsExperience = freezed,
    Object? certifications = null,
    Object? languagesSpoken = null,
    Object? teamSize = freezed,
    Object? serviceRadiusKm = freezed,
    Object? travelFeePerKm = freezed,
    Object? minBookingAmount = freezed,
    Object? minBookingCurrency = freezed,
    Object? depositRequired = null,
    Object? depositPercentage = freezed,
    Object? cancellationPolicy = freezed,
    Object? cancellationPolicyText = freezed,
    Object? hasInsurance = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
    Object? portfolioVideoUrl = freezed,
    Object? pressMentions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ProfessionalProfileDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      specialties: null == specialties
          ? _self._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cuisines: null == cuisines
          ? _self._cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      yearsExperience: freezed == yearsExperience
          ? _self.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      certifications: null == certifications
          ? _self._certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languagesSpoken: null == languagesSpoken
          ? _self._languagesSpoken
          : languagesSpoken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teamSize: freezed == teamSize
          ? _self.teamSize
          : teamSize // ignore: cast_nullable_to_non_nullable
              as TeamSize?,
      serviceRadiusKm: freezed == serviceRadiusKm
          ? _self.serviceRadiusKm
          : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      travelFeePerKm: freezed == travelFeePerKm
          ? _self.travelFeePerKm
          : travelFeePerKm // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingAmount: freezed == minBookingAmount
          ? _self.minBookingAmount
          : minBookingAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minBookingCurrency: freezed == minBookingCurrency
          ? _self.minBookingCurrency
          : minBookingCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      depositRequired: null == depositRequired
          ? _self.depositRequired
          : depositRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      depositPercentage: freezed == depositPercentage
          ? _self.depositPercentage
          : depositPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      cancellationPolicy: freezed == cancellationPolicy
          ? _self.cancellationPolicy
          : cancellationPolicy // ignore: cast_nullable_to_non_nullable
              as CancellationPolicy?,
      cancellationPolicyText: freezed == cancellationPolicyText
          ? _self.cancellationPolicyText
          : cancellationPolicyText // ignore: cast_nullable_to_non_nullable
              as String?,
      hasInsurance: null == hasInsurance
          ? _self.hasInsurance
          : hasInsurance // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      portfolioVideoUrl: freezed == portfolioVideoUrl
          ? _self.portfolioVideoUrl
          : portfolioVideoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pressMentions: null == pressMentions
          ? _self._pressMentions
          : pressMentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
