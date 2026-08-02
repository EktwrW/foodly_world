// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_connect_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StripeConnectStatusDM {
  bool get success;
  bool get connected;
  @JsonKey(name: 'charges_enabled')
  bool get chargesEnabled;
  @JsonKey(name: 'payouts_enabled')
  bool get payoutsEnabled;
  @JsonKey(name: 'details_submitted')
  bool get detailsSubmitted;

  /// Create a copy of StripeConnectStatusDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StripeConnectStatusDMCopyWith<StripeConnectStatusDM> get copyWith =>
      _$StripeConnectStatusDMCopyWithImpl<StripeConnectStatusDM>(
          this as StripeConnectStatusDM, _$identity);

  /// Serializes this StripeConnectStatusDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StripeConnectStatusDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.connected, connected) ||
                other.connected == connected) &&
            (identical(other.chargesEnabled, chargesEnabled) ||
                other.chargesEnabled == chargesEnabled) &&
            (identical(other.payoutsEnabled, payoutsEnabled) ||
                other.payoutsEnabled == payoutsEnabled) &&
            (identical(other.detailsSubmitted, detailsSubmitted) ||
                other.detailsSubmitted == detailsSubmitted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, connected,
      chargesEnabled, payoutsEnabled, detailsSubmitted);

  @override
  String toString() {
    return 'StripeConnectStatusDM(success: $success, connected: $connected, chargesEnabled: $chargesEnabled, payoutsEnabled: $payoutsEnabled, detailsSubmitted: $detailsSubmitted)';
  }
}

/// @nodoc
abstract mixin class $StripeConnectStatusDMCopyWith<$Res> {
  factory $StripeConnectStatusDMCopyWith(StripeConnectStatusDM value,
          $Res Function(StripeConnectStatusDM) _then) =
      _$StripeConnectStatusDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      bool connected,
      @JsonKey(name: 'charges_enabled') bool chargesEnabled,
      @JsonKey(name: 'payouts_enabled') bool payoutsEnabled,
      @JsonKey(name: 'details_submitted') bool detailsSubmitted});
}

/// @nodoc
class _$StripeConnectStatusDMCopyWithImpl<$Res>
    implements $StripeConnectStatusDMCopyWith<$Res> {
  _$StripeConnectStatusDMCopyWithImpl(this._self, this._then);

  final StripeConnectStatusDM _self;
  final $Res Function(StripeConnectStatusDM) _then;

  /// Create a copy of StripeConnectStatusDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? connected = null,
    Object? chargesEnabled = null,
    Object? payoutsEnabled = null,
    Object? detailsSubmitted = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _self.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      chargesEnabled: null == chargesEnabled
          ? _self.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      payoutsEnabled: null == payoutsEnabled
          ? _self.payoutsEnabled
          : payoutsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      detailsSubmitted: null == detailsSubmitted
          ? _self.detailsSubmitted
          : detailsSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [StripeConnectStatusDM].
extension StripeConnectStatusDMPatterns on StripeConnectStatusDM {
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
    TResult Function(_StripeConnectStatusDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM() when $default != null:
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
    TResult Function(_StripeConnectStatusDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM():
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
    TResult? Function(_StripeConnectStatusDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM() when $default != null:
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
            bool connected,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled,
            @JsonKey(name: 'payouts_enabled') bool payoutsEnabled,
            @JsonKey(name: 'details_submitted') bool detailsSubmitted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM() when $default != null:
        return $default(_that.success, _that.connected, _that.chargesEnabled,
            _that.payoutsEnabled, _that.detailsSubmitted);
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
            bool connected,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled,
            @JsonKey(name: 'payouts_enabled') bool payoutsEnabled,
            @JsonKey(name: 'details_submitted') bool detailsSubmitted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM():
        return $default(_that.success, _that.connected, _that.chargesEnabled,
            _that.payoutsEnabled, _that.detailsSubmitted);
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
            bool connected,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled,
            @JsonKey(name: 'payouts_enabled') bool payoutsEnabled,
            @JsonKey(name: 'details_submitted') bool detailsSubmitted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeConnectStatusDM() when $default != null:
        return $default(_that.success, _that.connected, _that.chargesEnabled,
            _that.payoutsEnabled, _that.detailsSubmitted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StripeConnectStatusDM implements StripeConnectStatusDM {
  const _StripeConnectStatusDM(
      {this.success = true,
      this.connected = false,
      @JsonKey(name: 'charges_enabled') this.chargesEnabled = false,
      @JsonKey(name: 'payouts_enabled') this.payoutsEnabled = false,
      @JsonKey(name: 'details_submitted') this.detailsSubmitted = false});
  factory _StripeConnectStatusDM.fromJson(Map<String, dynamic> json) =>
      _$StripeConnectStatusDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final bool connected;
  @override
  @JsonKey(name: 'charges_enabled')
  final bool chargesEnabled;
  @override
  @JsonKey(name: 'payouts_enabled')
  final bool payoutsEnabled;
  @override
  @JsonKey(name: 'details_submitted')
  final bool detailsSubmitted;

  /// Create a copy of StripeConnectStatusDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StripeConnectStatusDMCopyWith<_StripeConnectStatusDM> get copyWith =>
      __$StripeConnectStatusDMCopyWithImpl<_StripeConnectStatusDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StripeConnectStatusDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StripeConnectStatusDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.connected, connected) ||
                other.connected == connected) &&
            (identical(other.chargesEnabled, chargesEnabled) ||
                other.chargesEnabled == chargesEnabled) &&
            (identical(other.payoutsEnabled, payoutsEnabled) ||
                other.payoutsEnabled == payoutsEnabled) &&
            (identical(other.detailsSubmitted, detailsSubmitted) ||
                other.detailsSubmitted == detailsSubmitted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, connected,
      chargesEnabled, payoutsEnabled, detailsSubmitted);

  @override
  String toString() {
    return 'StripeConnectStatusDM(success: $success, connected: $connected, chargesEnabled: $chargesEnabled, payoutsEnabled: $payoutsEnabled, detailsSubmitted: $detailsSubmitted)';
  }
}

/// @nodoc
abstract mixin class _$StripeConnectStatusDMCopyWith<$Res>
    implements $StripeConnectStatusDMCopyWith<$Res> {
  factory _$StripeConnectStatusDMCopyWith(_StripeConnectStatusDM value,
          $Res Function(_StripeConnectStatusDM) _then) =
      __$StripeConnectStatusDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      bool connected,
      @JsonKey(name: 'charges_enabled') bool chargesEnabled,
      @JsonKey(name: 'payouts_enabled') bool payoutsEnabled,
      @JsonKey(name: 'details_submitted') bool detailsSubmitted});
}

/// @nodoc
class __$StripeConnectStatusDMCopyWithImpl<$Res>
    implements _$StripeConnectStatusDMCopyWith<$Res> {
  __$StripeConnectStatusDMCopyWithImpl(this._self, this._then);

  final _StripeConnectStatusDM _self;
  final $Res Function(_StripeConnectStatusDM) _then;

  /// Create a copy of StripeConnectStatusDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? connected = null,
    Object? chargesEnabled = null,
    Object? payoutsEnabled = null,
    Object? detailsSubmitted = null,
  }) {
    return _then(_StripeConnectStatusDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _self.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      chargesEnabled: null == chargesEnabled
          ? _self.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      payoutsEnabled: null == payoutsEnabled
          ? _self.payoutsEnabled
          : payoutsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      detailsSubmitted: null == detailsSubmitted
          ? _self.detailsSubmitted
          : detailsSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$StripeOnboardResponseDM {
  bool get success;
  @JsonKey(name: 'onboarding_url')
  String? get onboardingUrl;
  @JsonKey(name: 'charges_enabled')
  bool get chargesEnabled;

  /// Create a copy of StripeOnboardResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StripeOnboardResponseDMCopyWith<StripeOnboardResponseDM> get copyWith =>
      _$StripeOnboardResponseDMCopyWithImpl<StripeOnboardResponseDM>(
          this as StripeOnboardResponseDM, _$identity);

  /// Serializes this StripeOnboardResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StripeOnboardResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.onboardingUrl, onboardingUrl) ||
                other.onboardingUrl == onboardingUrl) &&
            (identical(other.chargesEnabled, chargesEnabled) ||
                other.chargesEnabled == chargesEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, onboardingUrl, chargesEnabled);

  @override
  String toString() {
    return 'StripeOnboardResponseDM(success: $success, onboardingUrl: $onboardingUrl, chargesEnabled: $chargesEnabled)';
  }
}

/// @nodoc
abstract mixin class $StripeOnboardResponseDMCopyWith<$Res> {
  factory $StripeOnboardResponseDMCopyWith(StripeOnboardResponseDM value,
          $Res Function(StripeOnboardResponseDM) _then) =
      _$StripeOnboardResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'onboarding_url') String? onboardingUrl,
      @JsonKey(name: 'charges_enabled') bool chargesEnabled});
}

/// @nodoc
class _$StripeOnboardResponseDMCopyWithImpl<$Res>
    implements $StripeOnboardResponseDMCopyWith<$Res> {
  _$StripeOnboardResponseDMCopyWithImpl(this._self, this._then);

  final StripeOnboardResponseDM _self;
  final $Res Function(StripeOnboardResponseDM) _then;

  /// Create a copy of StripeOnboardResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? onboardingUrl = freezed,
    Object? chargesEnabled = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingUrl: freezed == onboardingUrl
          ? _self.onboardingUrl
          : onboardingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chargesEnabled: null == chargesEnabled
          ? _self.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [StripeOnboardResponseDM].
extension StripeOnboardResponseDMPatterns on StripeOnboardResponseDM {
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
    TResult Function(_StripeOnboardResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM() when $default != null:
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
    TResult Function(_StripeOnboardResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM():
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
    TResult? Function(_StripeOnboardResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM() when $default != null:
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
            @JsonKey(name: 'onboarding_url') String? onboardingUrl,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM() when $default != null:
        return $default(
            _that.success, _that.onboardingUrl, _that.chargesEnabled);
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
            @JsonKey(name: 'onboarding_url') String? onboardingUrl,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM():
        return $default(
            _that.success, _that.onboardingUrl, _that.chargesEnabled);
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
            @JsonKey(name: 'onboarding_url') String? onboardingUrl,
            @JsonKey(name: 'charges_enabled') bool chargesEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StripeOnboardResponseDM() when $default != null:
        return $default(
            _that.success, _that.onboardingUrl, _that.chargesEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StripeOnboardResponseDM implements StripeOnboardResponseDM {
  const _StripeOnboardResponseDM(
      {this.success = true,
      @JsonKey(name: 'onboarding_url') this.onboardingUrl,
      @JsonKey(name: 'charges_enabled') this.chargesEnabled = false});
  factory _StripeOnboardResponseDM.fromJson(Map<String, dynamic> json) =>
      _$StripeOnboardResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'onboarding_url')
  final String? onboardingUrl;
  @override
  @JsonKey(name: 'charges_enabled')
  final bool chargesEnabled;

  /// Create a copy of StripeOnboardResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StripeOnboardResponseDMCopyWith<_StripeOnboardResponseDM> get copyWith =>
      __$StripeOnboardResponseDMCopyWithImpl<_StripeOnboardResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StripeOnboardResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StripeOnboardResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.onboardingUrl, onboardingUrl) ||
                other.onboardingUrl == onboardingUrl) &&
            (identical(other.chargesEnabled, chargesEnabled) ||
                other.chargesEnabled == chargesEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, onboardingUrl, chargesEnabled);

  @override
  String toString() {
    return 'StripeOnboardResponseDM(success: $success, onboardingUrl: $onboardingUrl, chargesEnabled: $chargesEnabled)';
  }
}

/// @nodoc
abstract mixin class _$StripeOnboardResponseDMCopyWith<$Res>
    implements $StripeOnboardResponseDMCopyWith<$Res> {
  factory _$StripeOnboardResponseDMCopyWith(_StripeOnboardResponseDM value,
          $Res Function(_StripeOnboardResponseDM) _then) =
      __$StripeOnboardResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'onboarding_url') String? onboardingUrl,
      @JsonKey(name: 'charges_enabled') bool chargesEnabled});
}

/// @nodoc
class __$StripeOnboardResponseDMCopyWithImpl<$Res>
    implements _$StripeOnboardResponseDMCopyWith<$Res> {
  __$StripeOnboardResponseDMCopyWithImpl(this._self, this._then);

  final _StripeOnboardResponseDM _self;
  final $Res Function(_StripeOnboardResponseDM) _then;

  /// Create a copy of StripeOnboardResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? onboardingUrl = freezed,
    Object? chargesEnabled = null,
  }) {
    return _then(_StripeOnboardResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingUrl: freezed == onboardingUrl
          ? _self.onboardingUrl
          : onboardingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chargesEnabled: null == chargesEnabled
          ? _self.chargesEnabled
          : chargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
