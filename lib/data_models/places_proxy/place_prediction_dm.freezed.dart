// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_prediction_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlacePredictionDM {
  @JsonKey(name: 'place_id')
  String get placeId;
  String get description;
  @JsonKey(name: 'structured_formatting')
  PlaceStructuredFormattingDM? get structuredFormatting;
  List<String> get types;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlacePredictionDMCopyWith<PlacePredictionDM> get copyWith =>
      _$PlacePredictionDMCopyWithImpl<PlacePredictionDM>(
          this as PlacePredictionDM, _$identity);

  /// Serializes this PlacePredictionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlacePredictionDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.structuredFormatting, structuredFormatting) ||
                other.structuredFormatting == structuredFormatting) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, description,
      structuredFormatting, const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'PlacePredictionDM(placeId: $placeId, description: $description, structuredFormatting: $structuredFormatting, types: $types)';
  }
}

/// @nodoc
abstract mixin class $PlacePredictionDMCopyWith<$Res> {
  factory $PlacePredictionDMCopyWith(
          PlacePredictionDM value, $Res Function(PlacePredictionDM) _then) =
      _$PlacePredictionDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      String description,
      @JsonKey(name: 'structured_formatting')
      PlaceStructuredFormattingDM? structuredFormatting,
      List<String> types});

  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class _$PlacePredictionDMCopyWithImpl<$Res>
    implements $PlacePredictionDMCopyWith<$Res> {
  _$PlacePredictionDMCopyWithImpl(this._self, this._then);

  final PlacePredictionDM _self;
  final $Res Function(PlacePredictionDM) _then;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? structuredFormatting = freezed,
    Object? types = null,
  }) {
    return _then(_self.copyWith(
      placeId: null == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormatting: freezed == structuredFormatting
          ? _self.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as PlaceStructuredFormattingDM?,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting {
    if (_self.structuredFormatting == null) {
      return null;
    }

    return $PlaceStructuredFormattingDMCopyWith<$Res>(
        _self.structuredFormatting!, (value) {
      return _then(_self.copyWith(structuredFormatting: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlacePredictionDM].
extension PlacePredictionDMPatterns on PlacePredictionDM {
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
    TResult Function(_PlacePredictionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM() when $default != null:
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
    TResult Function(_PlacePredictionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM():
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
    TResult? Function(_PlacePredictionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM() when $default != null:
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
            @JsonKey(name: 'place_id') String placeId,
            String description,
            @JsonKey(name: 'structured_formatting')
            PlaceStructuredFormattingDM? structuredFormatting,
            List<String> types)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM() when $default != null:
        return $default(_that.placeId, _that.description,
            _that.structuredFormatting, _that.types);
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
            @JsonKey(name: 'place_id') String placeId,
            String description,
            @JsonKey(name: 'structured_formatting')
            PlaceStructuredFormattingDM? structuredFormatting,
            List<String> types)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM():
        return $default(_that.placeId, _that.description,
            _that.structuredFormatting, _that.types);
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
            @JsonKey(name: 'place_id') String placeId,
            String description,
            @JsonKey(name: 'structured_formatting')
            PlaceStructuredFormattingDM? structuredFormatting,
            List<String> types)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlacePredictionDM() when $default != null:
        return $default(_that.placeId, _that.description,
            _that.structuredFormatting, _that.types);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlacePredictionDM implements PlacePredictionDM {
  const _PlacePredictionDM(
      {@JsonKey(name: 'place_id') required this.placeId,
      required this.description,
      @JsonKey(name: 'structured_formatting') this.structuredFormatting,
      final List<String> types = const <String>[]})
      : _types = types;
  factory _PlacePredictionDM.fromJson(Map<String, dynamic> json) =>
      _$PlacePredictionDMFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  final String description;
  @override
  @JsonKey(name: 'structured_formatting')
  final PlaceStructuredFormattingDM? structuredFormatting;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlacePredictionDMCopyWith<_PlacePredictionDM> get copyWith =>
      __$PlacePredictionDMCopyWithImpl<_PlacePredictionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlacePredictionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlacePredictionDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.structuredFormatting, structuredFormatting) ||
                other.structuredFormatting == structuredFormatting) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, description,
      structuredFormatting, const DeepCollectionEquality().hash(_types));

  @override
  String toString() {
    return 'PlacePredictionDM(placeId: $placeId, description: $description, structuredFormatting: $structuredFormatting, types: $types)';
  }
}

/// @nodoc
abstract mixin class _$PlacePredictionDMCopyWith<$Res>
    implements $PlacePredictionDMCopyWith<$Res> {
  factory _$PlacePredictionDMCopyWith(
          _PlacePredictionDM value, $Res Function(_PlacePredictionDM) _then) =
      __$PlacePredictionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      String description,
      @JsonKey(name: 'structured_formatting')
      PlaceStructuredFormattingDM? structuredFormatting,
      List<String> types});

  @override
  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class __$PlacePredictionDMCopyWithImpl<$Res>
    implements _$PlacePredictionDMCopyWith<$Res> {
  __$PlacePredictionDMCopyWithImpl(this._self, this._then);

  final _PlacePredictionDM _self;
  final $Res Function(_PlacePredictionDM) _then;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? structuredFormatting = freezed,
    Object? types = null,
  }) {
    return _then(_PlacePredictionDM(
      placeId: null == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormatting: freezed == structuredFormatting
          ? _self.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as PlaceStructuredFormattingDM?,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting {
    if (_self.structuredFormatting == null) {
      return null;
    }

    return $PlaceStructuredFormattingDMCopyWith<$Res>(
        _self.structuredFormatting!, (value) {
      return _then(_self.copyWith(structuredFormatting: value));
    });
  }
}

/// @nodoc
mixin _$PlaceStructuredFormattingDM {
  @JsonKey(name: 'main_text')
  String? get mainText;
  @JsonKey(name: 'secondary_text')
  String? get secondaryText;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceStructuredFormattingDMCopyWith<PlaceStructuredFormattingDM>
      get copyWith => _$PlaceStructuredFormattingDMCopyWithImpl<
              PlaceStructuredFormattingDM>(
          this as PlaceStructuredFormattingDM, _$identity);

  /// Serializes this PlaceStructuredFormattingDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceStructuredFormattingDM &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText, secondaryText);

  @override
  String toString() {
    return 'PlaceStructuredFormattingDM(mainText: $mainText, secondaryText: $secondaryText)';
  }
}

/// @nodoc
abstract mixin class $PlaceStructuredFormattingDMCopyWith<$Res> {
  factory $PlaceStructuredFormattingDMCopyWith(
          PlaceStructuredFormattingDM value,
          $Res Function(PlaceStructuredFormattingDM) _then) =
      _$PlaceStructuredFormattingDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'main_text') String? mainText,
      @JsonKey(name: 'secondary_text') String? secondaryText});
}

/// @nodoc
class _$PlaceStructuredFormattingDMCopyWithImpl<$Res>
    implements $PlaceStructuredFormattingDMCopyWith<$Res> {
  _$PlaceStructuredFormattingDMCopyWithImpl(this._self, this._then);

  final PlaceStructuredFormattingDM _self;
  final $Res Function(PlaceStructuredFormattingDM) _then;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_self.copyWith(
      mainText: freezed == mainText
          ? _self.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _self.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceStructuredFormattingDM].
extension PlaceStructuredFormattingDMPatterns on PlaceStructuredFormattingDM {
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
    TResult Function(_PlaceStructuredFormattingDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM() when $default != null:
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
    TResult Function(_PlaceStructuredFormattingDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM():
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
    TResult? Function(_PlaceStructuredFormattingDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'main_text') String? mainText,
            @JsonKey(name: 'secondary_text') String? secondaryText)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM() when $default != null:
        return $default(_that.mainText, _that.secondaryText);
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
    TResult Function(@JsonKey(name: 'main_text') String? mainText,
            @JsonKey(name: 'secondary_text') String? secondaryText)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM():
        return $default(_that.mainText, _that.secondaryText);
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
    TResult? Function(@JsonKey(name: 'main_text') String? mainText,
            @JsonKey(name: 'secondary_text') String? secondaryText)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceStructuredFormattingDM() when $default != null:
        return $default(_that.mainText, _that.secondaryText);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceStructuredFormattingDM implements PlaceStructuredFormattingDM {
  const _PlaceStructuredFormattingDM(
      {@JsonKey(name: 'main_text') this.mainText,
      @JsonKey(name: 'secondary_text') this.secondaryText});
  factory _PlaceStructuredFormattingDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceStructuredFormattingDMFromJson(json);

  @override
  @JsonKey(name: 'main_text')
  final String? mainText;
  @override
  @JsonKey(name: 'secondary_text')
  final String? secondaryText;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceStructuredFormattingDMCopyWith<_PlaceStructuredFormattingDM>
      get copyWith => __$PlaceStructuredFormattingDMCopyWithImpl<
          _PlaceStructuredFormattingDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceStructuredFormattingDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceStructuredFormattingDM &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText, secondaryText);

  @override
  String toString() {
    return 'PlaceStructuredFormattingDM(mainText: $mainText, secondaryText: $secondaryText)';
  }
}

/// @nodoc
abstract mixin class _$PlaceStructuredFormattingDMCopyWith<$Res>
    implements $PlaceStructuredFormattingDMCopyWith<$Res> {
  factory _$PlaceStructuredFormattingDMCopyWith(
          _PlaceStructuredFormattingDM value,
          $Res Function(_PlaceStructuredFormattingDM) _then) =
      __$PlaceStructuredFormattingDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'main_text') String? mainText,
      @JsonKey(name: 'secondary_text') String? secondaryText});
}

/// @nodoc
class __$PlaceStructuredFormattingDMCopyWithImpl<$Res>
    implements _$PlaceStructuredFormattingDMCopyWith<$Res> {
  __$PlaceStructuredFormattingDMCopyWithImpl(this._self, this._then);

  final _PlaceStructuredFormattingDM _self;
  final $Res Function(_PlaceStructuredFormattingDM) _then;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_PlaceStructuredFormattingDM(
      mainText: freezed == mainText
          ? _self.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _self.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
