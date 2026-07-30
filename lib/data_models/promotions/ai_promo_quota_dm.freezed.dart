// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_promo_quota_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiPromoQuotaResponse {
  bool get granted;
  @JsonKey(name: 'ai_promo_monthly_limit')
  int get aiPromoMonthlyLimit;
  @JsonKey(name: 'ai_promos_used_this_month')
  int get aiPromosUsedThisMonth;
  int get remaining;
  String? get message;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiPromoQuotaResponseCopyWith<AiPromoQuotaResponse> get copyWith =>
      _$AiPromoQuotaResponseCopyWithImpl<AiPromoQuotaResponse>(
          this as AiPromoQuotaResponse, _$identity);

  /// Serializes this AiPromoQuotaResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiPromoQuotaResponse &&
            (identical(other.granted, granted) || other.granted == granted) &&
            (identical(other.aiPromoMonthlyLimit, aiPromoMonthlyLimit) ||
                other.aiPromoMonthlyLimit == aiPromoMonthlyLimit) &&
            (identical(other.aiPromosUsedThisMonth, aiPromosUsedThisMonth) ||
                other.aiPromosUsedThisMonth == aiPromosUsedThisMonth) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, granted, aiPromoMonthlyLimit,
      aiPromosUsedThisMonth, remaining, message);

  @override
  String toString() {
    return 'AiPromoQuotaResponse(granted: $granted, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, remaining: $remaining, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AiPromoQuotaResponseCopyWith<$Res> {
  factory $AiPromoQuotaResponseCopyWith(AiPromoQuotaResponse value,
          $Res Function(AiPromoQuotaResponse) _then) =
      _$AiPromoQuotaResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool granted,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      int remaining,
      String? message});
}

/// @nodoc
class _$AiPromoQuotaResponseCopyWithImpl<$Res>
    implements $AiPromoQuotaResponseCopyWith<$Res> {
  _$AiPromoQuotaResponseCopyWithImpl(this._self, this._then);

  final AiPromoQuotaResponse _self;
  final $Res Function(AiPromoQuotaResponse) _then;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? granted = null,
    Object? aiPromoMonthlyLimit = null,
    Object? aiPromosUsedThisMonth = null,
    Object? remaining = null,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      granted: null == granted
          ? _self.granted
          : granted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _self.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _self.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AiPromoQuotaResponse].
extension AiPromoQuotaResponsePatterns on AiPromoQuotaResponse {
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
    TResult Function(_AiPromoQuotaResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse() when $default != null:
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
    TResult Function(_AiPromoQuotaResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse():
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
    TResult? Function(_AiPromoQuotaResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse() when $default != null:
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
            bool granted,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            int remaining,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse() when $default != null:
        return $default(_that.granted, _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth, _that.remaining, _that.message);
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
            bool granted,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            int remaining,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse():
        return $default(_that.granted, _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth, _that.remaining, _that.message);
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
            bool granted,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            int remaining,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoQuotaResponse() when $default != null:
        return $default(_that.granted, _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth, _that.remaining, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AiPromoQuotaResponse extends AiPromoQuotaResponse {
  const _AiPromoQuotaResponse(
      {this.granted = false,
      @JsonKey(name: 'ai_promo_monthly_limit') this.aiPromoMonthlyLimit = 6,
      @JsonKey(name: 'ai_promos_used_this_month')
      this.aiPromosUsedThisMonth = 0,
      this.remaining = 0,
      this.message})
      : super._();
  factory _AiPromoQuotaResponse.fromJson(Map<String, dynamic> json) =>
      _$AiPromoQuotaResponseFromJson(json);

  @override
  @JsonKey()
  final bool granted;
  @override
  @JsonKey(name: 'ai_promo_monthly_limit')
  final int aiPromoMonthlyLimit;
  @override
  @JsonKey(name: 'ai_promos_used_this_month')
  final int aiPromosUsedThisMonth;
  @override
  @JsonKey()
  final int remaining;
  @override
  final String? message;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiPromoQuotaResponseCopyWith<_AiPromoQuotaResponse> get copyWith =>
      __$AiPromoQuotaResponseCopyWithImpl<_AiPromoQuotaResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiPromoQuotaResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiPromoQuotaResponse &&
            (identical(other.granted, granted) || other.granted == granted) &&
            (identical(other.aiPromoMonthlyLimit, aiPromoMonthlyLimit) ||
                other.aiPromoMonthlyLimit == aiPromoMonthlyLimit) &&
            (identical(other.aiPromosUsedThisMonth, aiPromosUsedThisMonth) ||
                other.aiPromosUsedThisMonth == aiPromosUsedThisMonth) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, granted, aiPromoMonthlyLimit,
      aiPromosUsedThisMonth, remaining, message);

  @override
  String toString() {
    return 'AiPromoQuotaResponse(granted: $granted, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, remaining: $remaining, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AiPromoQuotaResponseCopyWith<$Res>
    implements $AiPromoQuotaResponseCopyWith<$Res> {
  factory _$AiPromoQuotaResponseCopyWith(_AiPromoQuotaResponse value,
          $Res Function(_AiPromoQuotaResponse) _then) =
      __$AiPromoQuotaResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool granted,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      int remaining,
      String? message});
}

/// @nodoc
class __$AiPromoQuotaResponseCopyWithImpl<$Res>
    implements _$AiPromoQuotaResponseCopyWith<$Res> {
  __$AiPromoQuotaResponseCopyWithImpl(this._self, this._then);

  final _AiPromoQuotaResponse _self;
  final $Res Function(_AiPromoQuotaResponse) _then;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? granted = null,
    Object? aiPromoMonthlyLimit = null,
    Object? aiPromosUsedThisMonth = null,
    Object? remaining = null,
    Object? message = freezed,
  }) {
    return _then(_AiPromoQuotaResponse(
      granted: null == granted
          ? _self.granted
          : granted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _self.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _self.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
