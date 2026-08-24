// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_promo_generation_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiPromoImageOption {
  /// `product` | `people`. Sólo para telemetría y para el label — el FE no
  /// debería ramificar lógica sobre esto.
  String get look;
  @JsonKey(name: 'image_base64')
  String get imageBase64;

  /// Create a copy of AiPromoImageOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiPromoImageOptionCopyWith<AiPromoImageOption> get copyWith =>
      _$AiPromoImageOptionCopyWithImpl<AiPromoImageOption>(
          this as AiPromoImageOption, _$identity);

  /// Serializes this AiPromoImageOption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiPromoImageOption &&
            (identical(other.look, look) || other.look == look) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, look, imageBase64);

  @override
  String toString() {
    return 'AiPromoImageOption(look: $look, imageBase64: $imageBase64)';
  }
}

/// @nodoc
abstract mixin class $AiPromoImageOptionCopyWith<$Res> {
  factory $AiPromoImageOptionCopyWith(
          AiPromoImageOption value, $Res Function(AiPromoImageOption) _then) =
      _$AiPromoImageOptionCopyWithImpl;
  @useResult
  $Res call({String look, @JsonKey(name: 'image_base64') String imageBase64});
}

/// @nodoc
class _$AiPromoImageOptionCopyWithImpl<$Res>
    implements $AiPromoImageOptionCopyWith<$Res> {
  _$AiPromoImageOptionCopyWithImpl(this._self, this._then);

  final AiPromoImageOption _self;
  final $Res Function(AiPromoImageOption) _then;

  /// Create a copy of AiPromoImageOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? look = null,
    Object? imageBase64 = null,
  }) {
    return _then(_self.copyWith(
      look: null == look
          ? _self.look
          : look // ignore: cast_nullable_to_non_nullable
              as String,
      imageBase64: null == imageBase64
          ? _self.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AiPromoImageOption].
extension AiPromoImageOptionPatterns on AiPromoImageOption {
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
    TResult Function(_AiPromoImageOption value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption() when $default != null:
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
    TResult Function(_AiPromoImageOption value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption():
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
    TResult? Function(_AiPromoImageOption value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption() when $default != null:
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
            String look, @JsonKey(name: 'image_base64') String imageBase64)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption() when $default != null:
        return $default(_that.look, _that.imageBase64);
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
            String look, @JsonKey(name: 'image_base64') String imageBase64)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption():
        return $default(_that.look, _that.imageBase64);
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
            String look, @JsonKey(name: 'image_base64') String imageBase64)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoImageOption() when $default != null:
        return $default(_that.look, _that.imageBase64);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AiPromoImageOption extends AiPromoImageOption {
  const _AiPromoImageOption(
      {this.look = '', @JsonKey(name: 'image_base64') this.imageBase64 = ''})
      : super._();
  factory _AiPromoImageOption.fromJson(Map<String, dynamic> json) =>
      _$AiPromoImageOptionFromJson(json);

  /// `product` | `people`. Sólo para telemetría y para el label — el FE no
  /// debería ramificar lógica sobre esto.
  @override
  @JsonKey()
  final String look;
  @override
  @JsonKey(name: 'image_base64')
  final String imageBase64;

  /// Create a copy of AiPromoImageOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiPromoImageOptionCopyWith<_AiPromoImageOption> get copyWith =>
      __$AiPromoImageOptionCopyWithImpl<_AiPromoImageOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiPromoImageOptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiPromoImageOption &&
            (identical(other.look, look) || other.look == look) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, look, imageBase64);

  @override
  String toString() {
    return 'AiPromoImageOption(look: $look, imageBase64: $imageBase64)';
  }
}

/// @nodoc
abstract mixin class _$AiPromoImageOptionCopyWith<$Res>
    implements $AiPromoImageOptionCopyWith<$Res> {
  factory _$AiPromoImageOptionCopyWith(
          _AiPromoImageOption value, $Res Function(_AiPromoImageOption) _then) =
      __$AiPromoImageOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String look, @JsonKey(name: 'image_base64') String imageBase64});
}

/// @nodoc
class __$AiPromoImageOptionCopyWithImpl<$Res>
    implements _$AiPromoImageOptionCopyWith<$Res> {
  __$AiPromoImageOptionCopyWithImpl(this._self, this._then);

  final _AiPromoImageOption _self;
  final $Res Function(_AiPromoImageOption) _then;

  /// Create a copy of AiPromoImageOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? look = null,
    Object? imageBase64 = null,
  }) {
    return _then(_AiPromoImageOption(
      look: null == look
          ? _self.look
          : look // ignore: cast_nullable_to_non_nullable
              as String,
      imageBase64: null == imageBase64
          ? _self.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AiPromoGenerationResponse {
  bool get granted;
  String get title;
  String get subtitle;
  String get description;

  /// Hasta dos artes. Puede venir con una —o vacía— sin que la generación
  /// se considere fallida: el BE entrega el copy igual porque es lo caro de
  /// rehacer a mano, y una imagen es mejor que un error.
  List<AiPromoImageOption> get images;
  @JsonKey(name: 'ai_promo_monthly_limit')
  int get aiPromoMonthlyLimit;
  @JsonKey(name: 'ai_promos_used_this_month')
  int get aiPromosUsedThisMonth;
  int get remaining;
  String? get message;

  /// Create a copy of AiPromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiPromoGenerationResponseCopyWith<AiPromoGenerationResponse> get copyWith =>
      _$AiPromoGenerationResponseCopyWithImpl<AiPromoGenerationResponse>(
          this as AiPromoGenerationResponse, _$identity);

  /// Serializes this AiPromoGenerationResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiPromoGenerationResponse &&
            (identical(other.granted, granted) || other.granted == granted) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.images, images) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      granted,
      title,
      subtitle,
      description,
      const DeepCollectionEquality().hash(images),
      aiPromoMonthlyLimit,
      aiPromosUsedThisMonth,
      remaining,
      message);

  @override
  String toString() {
    return 'AiPromoGenerationResponse(granted: $granted, title: $title, subtitle: $subtitle, description: $description, images: $images, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, remaining: $remaining, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AiPromoGenerationResponseCopyWith<$Res> {
  factory $AiPromoGenerationResponseCopyWith(AiPromoGenerationResponse value,
          $Res Function(AiPromoGenerationResponse) _then) =
      _$AiPromoGenerationResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool granted,
      String title,
      String subtitle,
      String description,
      List<AiPromoImageOption> images,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      int remaining,
      String? message});
}

/// @nodoc
class _$AiPromoGenerationResponseCopyWithImpl<$Res>
    implements $AiPromoGenerationResponseCopyWith<$Res> {
  _$AiPromoGenerationResponseCopyWithImpl(this._self, this._then);

  final AiPromoGenerationResponse _self;
  final $Res Function(AiPromoGenerationResponse) _then;

  /// Create a copy of AiPromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? granted = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? images = null,
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
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AiPromoImageOption>,
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

/// Adds pattern-matching-related methods to [AiPromoGenerationResponse].
extension AiPromoGenerationResponsePatterns on AiPromoGenerationResponse {
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
    TResult Function(_AiPromoGenerationResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiPromoGenerationResponse() when $default != null:
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
    TResult Function(_AiPromoGenerationResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoGenerationResponse():
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
    TResult? Function(_AiPromoGenerationResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoGenerationResponse() when $default != null:
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
            String title,
            String subtitle,
            String description,
            List<AiPromoImageOption> images,
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
      case _AiPromoGenerationResponse() when $default != null:
        return $default(
            _that.granted,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.images,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.remaining,
            _that.message);
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
            String title,
            String subtitle,
            String description,
            List<AiPromoImageOption> images,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            int remaining,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoGenerationResponse():
        return $default(
            _that.granted,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.images,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.remaining,
            _that.message);
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
            String title,
            String subtitle,
            String description,
            List<AiPromoImageOption> images,
            @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
            @JsonKey(name: 'ai_promos_used_this_month')
            int aiPromosUsedThisMonth,
            int remaining,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiPromoGenerationResponse() when $default != null:
        return $default(
            _that.granted,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.images,
            _that.aiPromoMonthlyLimit,
            _that.aiPromosUsedThisMonth,
            _that.remaining,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AiPromoGenerationResponse extends AiPromoGenerationResponse {
  const _AiPromoGenerationResponse(
      {this.granted = false,
      this.title = '',
      this.subtitle = '',
      this.description = '',
      final List<AiPromoImageOption> images = const [],
      @JsonKey(name: 'ai_promo_monthly_limit') this.aiPromoMonthlyLimit = 3,
      @JsonKey(name: 'ai_promos_used_this_month')
      this.aiPromosUsedThisMonth = 0,
      this.remaining = 0,
      this.message})
      : _images = images,
        super._();
  factory _AiPromoGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$AiPromoGenerationResponseFromJson(json);

  @override
  @JsonKey()
  final bool granted;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String subtitle;
  @override
  @JsonKey()
  final String description;

  /// Hasta dos artes. Puede venir con una —o vacía— sin que la generación
  /// se considere fallida: el BE entrega el copy igual porque es lo caro de
  /// rehacer a mano, y una imagen es mejor que un error.
  final List<AiPromoImageOption> _images;

  /// Hasta dos artes. Puede venir con una —o vacía— sin que la generación
  /// se considere fallida: el BE entrega el copy igual porque es lo caro de
  /// rehacer a mano, y una imagen es mejor que un error.
  @override
  @JsonKey()
  List<AiPromoImageOption> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

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

  /// Create a copy of AiPromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiPromoGenerationResponseCopyWith<_AiPromoGenerationResponse>
      get copyWith =>
          __$AiPromoGenerationResponseCopyWithImpl<_AiPromoGenerationResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiPromoGenerationResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiPromoGenerationResponse &&
            (identical(other.granted, granted) || other.granted == granted) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      granted,
      title,
      subtitle,
      description,
      const DeepCollectionEquality().hash(_images),
      aiPromoMonthlyLimit,
      aiPromosUsedThisMonth,
      remaining,
      message);

  @override
  String toString() {
    return 'AiPromoGenerationResponse(granted: $granted, title: $title, subtitle: $subtitle, description: $description, images: $images, aiPromoMonthlyLimit: $aiPromoMonthlyLimit, aiPromosUsedThisMonth: $aiPromosUsedThisMonth, remaining: $remaining, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AiPromoGenerationResponseCopyWith<$Res>
    implements $AiPromoGenerationResponseCopyWith<$Res> {
  factory _$AiPromoGenerationResponseCopyWith(_AiPromoGenerationResponse value,
          $Res Function(_AiPromoGenerationResponse) _then) =
      __$AiPromoGenerationResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool granted,
      String title,
      String subtitle,
      String description,
      List<AiPromoImageOption> images,
      @JsonKey(name: 'ai_promo_monthly_limit') int aiPromoMonthlyLimit,
      @JsonKey(name: 'ai_promos_used_this_month') int aiPromosUsedThisMonth,
      int remaining,
      String? message});
}

/// @nodoc
class __$AiPromoGenerationResponseCopyWithImpl<$Res>
    implements _$AiPromoGenerationResponseCopyWith<$Res> {
  __$AiPromoGenerationResponseCopyWithImpl(this._self, this._then);

  final _AiPromoGenerationResponse _self;
  final $Res Function(_AiPromoGenerationResponse) _then;

  /// Create a copy of AiPromoGenerationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? granted = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? images = null,
    Object? aiPromoMonthlyLimit = null,
    Object? aiPromosUsedThisMonth = null,
    Object? remaining = null,
    Object? message = freezed,
  }) {
    return _then(_AiPromoGenerationResponse(
      granted: null == granted
          ? _self.granted
          : granted // ignore: cast_nullable_to_non_nullable
              as bool,
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
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AiPromoImageOption>,
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
