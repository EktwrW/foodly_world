// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_result_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeocodingResultDM {
  @JsonKey(name: 'place_id')
  String? get placeId;
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress;
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents;
  PlaceGeometryDM? get geometry;
  List<String> get types;

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeocodingResultDMCopyWith<GeocodingResultDM> get copyWith =>
      _$GeocodingResultDMCopyWithImpl<GeocodingResultDM>(
          this as GeocodingResultDM, _$identity);

  /// Serializes this GeocodingResultDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeocodingResultDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality()
                .equals(other.addressComponents, addressComponents) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      formattedAddress,
      const DeepCollectionEquality().hash(addressComponents),
      geometry,
      const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'GeocodingResultDM(placeId: $placeId, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, types: $types)';
  }
}

/// @nodoc
abstract mixin class $GeocodingResultDMCopyWith<$Res> {
  factory $GeocodingResultDMCopyWith(
          GeocodingResultDM value, $Res Function(GeocodingResultDM) _then) =
      _$GeocodingResultDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      @JsonKey(name: 'formatted_address') String? formattedAddress,
      @JsonKey(name: 'address_components')
      List<PlaceAddressComponentDM> addressComponents,
      PlaceGeometryDM? geometry,
      List<String> types});

  $PlaceGeometryDMCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$GeocodingResultDMCopyWithImpl<$Res>
    implements $GeocodingResultDMCopyWith<$Res> {
  _$GeocodingResultDMCopyWithImpl(this._self, this._then);

  final GeocodingResultDM _self;
  final $Res Function(GeocodingResultDM) _then;

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? geometry = freezed,
    Object? types = null,
  }) {
    return _then(_self.copyWith(
      placeId: freezed == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _self.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _self.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<PlaceAddressComponentDM>,
      geometry: freezed == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PlaceGeometryDM?,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceGeometryDMCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
      return null;
    }

    return $PlaceGeometryDMCopyWith<$Res>(_self.geometry!, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GeocodingResultDM].
extension GeocodingResultDMPatterns on GeocodingResultDM {
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
    TResult Function(_GeocodingResultDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM() when $default != null:
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
    TResult Function(_GeocodingResultDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM():
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
    TResult? Function(_GeocodingResultDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM() when $default != null:
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
            @JsonKey(name: 'place_id') String? placeId,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            List<String> types)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM() when $default != null:
        return $default(_that.placeId, _that.formattedAddress,
            _that.addressComponents, _that.geometry, _that.types);
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
            @JsonKey(name: 'place_id') String? placeId,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            List<String> types)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM():
        return $default(_that.placeId, _that.formattedAddress,
            _that.addressComponents, _that.geometry, _that.types);
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
            @JsonKey(name: 'place_id') String? placeId,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            List<String> types)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResultDM() when $default != null:
        return $default(_that.placeId, _that.formattedAddress,
            _that.addressComponents, _that.geometry, _that.types);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GeocodingResultDM implements GeocodingResultDM {
  const _GeocodingResultDM(
      {@JsonKey(name: 'place_id') this.placeId,
      @JsonKey(name: 'formatted_address') this.formattedAddress,
      @JsonKey(name: 'address_components')
      final List<PlaceAddressComponentDM> addressComponents =
          const <PlaceAddressComponentDM>[],
      this.geometry,
      final List<String> types = const <String>[]})
      : _addressComponents = addressComponents,
        _types = types;
  factory _GeocodingResultDM.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultDMFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String? placeId;
  @override
  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;
  final List<PlaceAddressComponentDM> _addressComponents;
  @override
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents {
    if (_addressComponents is EqualUnmodifiableListView)
      return _addressComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressComponents);
  }

  @override
  final PlaceGeometryDM? geometry;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeocodingResultDMCopyWith<_GeocodingResultDM> get copyWith =>
      __$GeocodingResultDMCopyWithImpl<_GeocodingResultDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeocodingResultDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeocodingResultDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      formattedAddress,
      const DeepCollectionEquality().hash(_addressComponents),
      geometry,
      const DeepCollectionEquality().hash(_types));

  @override
  String toString() {
    return 'GeocodingResultDM(placeId: $placeId, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, types: $types)';
  }
}

/// @nodoc
abstract mixin class _$GeocodingResultDMCopyWith<$Res>
    implements $GeocodingResultDMCopyWith<$Res> {
  factory _$GeocodingResultDMCopyWith(
          _GeocodingResultDM value, $Res Function(_GeocodingResultDM) _then) =
      __$GeocodingResultDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      @JsonKey(name: 'formatted_address') String? formattedAddress,
      @JsonKey(name: 'address_components')
      List<PlaceAddressComponentDM> addressComponents,
      PlaceGeometryDM? geometry,
      List<String> types});

  @override
  $PlaceGeometryDMCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$GeocodingResultDMCopyWithImpl<$Res>
    implements _$GeocodingResultDMCopyWith<$Res> {
  __$GeocodingResultDMCopyWithImpl(this._self, this._then);

  final _GeocodingResultDM _self;
  final $Res Function(_GeocodingResultDM) _then;

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placeId = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? geometry = freezed,
    Object? types = null,
  }) {
    return _then(_GeocodingResultDM(
      placeId: freezed == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _self.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _self._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<PlaceAddressComponentDM>,
      geometry: freezed == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PlaceGeometryDM?,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceGeometryDMCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
      return null;
    }

    return $PlaceGeometryDMCopyWith<$Res>(_self.geometry!, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

// dart format on
