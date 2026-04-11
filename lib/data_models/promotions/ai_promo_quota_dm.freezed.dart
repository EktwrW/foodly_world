// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_promo_quota_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiPromoQuotaResponse _$AiPromoQuotaResponseFromJson(Map<String, dynamic> json) {
  return _AiPromoQuotaResponse.fromJson(json);
}

/// @nodoc
mixin _$AiPromoQuotaResponse {
  bool get granted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_promo_monthly_limit')
  int get aiPromoMonthlyLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_promos_used_this_month')
  int get aiPromosUsedThisMonth => throw _privateConstructorUsedError;
  int get remaining => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this AiPromoQuotaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiPromoQuotaResponseCopyWith<AiPromoQuotaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiPromoQuotaResponseCopyWith<$Res> {
  factory $AiPromoQuotaResponseCopyWith(AiPromoQuotaResponse value,
          $Res Function(AiPromoQuotaResponse) then) =
      _$AiPromoQuotaResponseCopyWithImpl<$Res, AiPromoQuotaResponse>;
  @useResult
  $Res call(
      {bool granted,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      int remaining,
      String? message});
}

/// @nodoc
class _$AiPromoQuotaResponseCopyWithImpl<$Res,
        $Val extends AiPromoQuotaResponse>
    implements $AiPromoQuotaResponseCopyWith<$Res> {
  _$AiPromoQuotaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      granted: null == granted
          ? _value.granted
          : granted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _value.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _value.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiPromoQuotaResponseImplCopyWith<$Res>
    implements $AiPromoQuotaResponseCopyWith<$Res> {
  factory _$$AiPromoQuotaResponseImplCopyWith(_$AiPromoQuotaResponseImpl value,
          $Res Function(_$AiPromoQuotaResponseImpl) then) =
      __$$AiPromoQuotaResponseImplCopyWithImpl<$Res>;
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
class __$$AiPromoQuotaResponseImplCopyWithImpl<$Res>
    extends _$AiPromoQuotaResponseCopyWithImpl<$Res, _$AiPromoQuotaResponseImpl>
    implements _$$AiPromoQuotaResponseImplCopyWith<$Res> {
  __$$AiPromoQuotaResponseImplCopyWithImpl(_$AiPromoQuotaResponseImpl _value,
      $Res Function(_$AiPromoQuotaResponseImpl) _then)
      : super(_value, _then);

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
    return _then(_$AiPromoQuotaResponseImpl(
      granted: null == granted
          ? _value.granted
          : granted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiPromoMonthlyLimit: null == aiPromoMonthlyLimit
          ? _value.aiPromoMonthlyLimit
          : aiPromoMonthlyLimit // ignore: cast_nullable_to_non_nullable
              as int,
      aiPromosUsedThisMonth: null == aiPromosUsedThisMonth
          ? _value.aiPromosUsedThisMonth
          : aiPromosUsedThisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiPromoQuotaResponseImpl extends _AiPromoQuotaResponse {
  const _$AiPromoQuotaResponseImpl(
      {this.granted = false,
      @JsonKey(name: 'ai_promo_monthly_limit') this.aiPromoMonthlyLimit = 6,
      @JsonKey(name: 'ai_promos_used_this_month')
      this.aiPromosUsedThisMonth = 0,
      this.remaining = 0,
      this.message})
      : super._();

  factory _$AiPromoQuotaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiPromoQuotaResponseImplFromJson(json);

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

  @override
  String toString() {
    return 'AiPromoQuotaResponse(granted: $granted, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, remaining: $remaining, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiPromoQuotaResponseImpl &&
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

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiPromoQuotaResponseImplCopyWith<_$AiPromoQuotaResponseImpl>
      get copyWith =>
          __$$AiPromoQuotaResponseImplCopyWithImpl<_$AiPromoQuotaResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiPromoQuotaResponseImplToJson(
      this,
    );
  }
}

abstract class _AiPromoQuotaResponse extends AiPromoQuotaResponse {
  const factory _AiPromoQuotaResponse(
      {final bool granted,
      @JsonKey(name: 'ai_promo_monthly_limit') final int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month')
      final int aiPromosUsedThisMonth,
      final int remaining,
      final String? message}) = _$AiPromoQuotaResponseImpl;
  const _AiPromoQuotaResponse._() : super._();

  factory _AiPromoQuotaResponse.fromJson(Map<String, dynamic> json) =
      _$AiPromoQuotaResponseImpl.fromJson;

  @override
  bool get granted;
  @override
  @JsonKey(name: 'ai_promo_monthly_limit')
  int get aiPromoMonthlyLimit;
  @override
  @JsonKey(name: 'ai_promos_used_this_month')
  int get aiPromosUsedThisMonth;
  @override
  int get remaining;
  @override
  String? get message;

  /// Create a copy of AiPromoQuotaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiPromoQuotaResponseImplCopyWith<_$AiPromoQuotaResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
