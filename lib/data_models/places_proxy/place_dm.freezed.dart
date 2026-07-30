// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceDM {
  @JsonKey(name: 'place_id')
  String? get placeId;
  String? get name;
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress;
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents;
  PlaceGeometryDM? get geometry;
  @JsonKey(name: 'formatted_phone_number')
  String? get formattedPhoneNumber;
  @JsonKey(name: 'international_phone_number')
  String?
      get internationalPhoneNumber; // `types` top-level del Place (ej. `["locality", "political"]`). Lo
// pedimos en el field mask del backend porque algunos consumers
// (p.ej. distinguir street_address de route) lo necesitan. Default
// a lista vacía para que los consumers puedan hacer `.contains(...)`
// sin null-checks.
  List<String> get types;

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceDMCopyWith<PlaceDM> get copyWith =>
      _$PlaceDMCopyWithImpl<PlaceDM>(this as PlaceDM, _$identity);

  /// Serializes this PlaceDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality()
                .equals(other.addressComponents, addressComponents) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber) &&
            (identical(
                    other.internationalPhoneNumber, internationalPhoneNumber) ||
                other.internationalPhoneNumber == internationalPhoneNumber) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      name,
      formattedAddress,
      const DeepCollectionEquality().hash(addressComponents),
      geometry,
      formattedPhoneNumber,
      internationalPhoneNumber,
      const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'PlaceDM(placeId: $placeId, name: $name, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, formattedPhoneNumber: $formattedPhoneNumber, internationalPhoneNumber: $internationalPhoneNumber, types: $types)';
  }
}

/// @nodoc
abstract mixin class $PlaceDMCopyWith<$Res> {
  factory $PlaceDMCopyWith(PlaceDM value, $Res Function(PlaceDM) _then) =
      _$PlaceDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      String? name,
      @JsonKey(name: 'formatted_address') String? formattedAddress,
      @JsonKey(name: 'address_components')
      List<PlaceAddressComponentDM> addressComponents,
      PlaceGeometryDM? geometry,
      @JsonKey(name: 'formatted_phone_number') String? formattedPhoneNumber,
      @JsonKey(name: 'international_phone_number')
      String? internationalPhoneNumber,
      List<String> types});

  $PlaceGeometryDMCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$PlaceDMCopyWithImpl<$Res> implements $PlaceDMCopyWith<$Res> {
  _$PlaceDMCopyWithImpl(this._self, this._then);

  final PlaceDM _self;
  final $Res Function(PlaceDM) _then;

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? name = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? geometry = freezed,
    Object? formattedPhoneNumber = freezed,
    Object? internationalPhoneNumber = freezed,
    Object? types = null,
  }) {
    return _then(_self.copyWith(
      placeId: freezed == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _self.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _self.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of PlaceDM
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

/// Adds pattern-matching-related methods to [PlaceDM].
extension PlaceDMPatterns on PlaceDM {
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
    TResult Function(_PlaceDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDM() when $default != null:
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
    TResult Function(_PlaceDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDM():
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
    TResult? Function(_PlaceDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDM() when $default != null:
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
            String? name,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            @JsonKey(name: 'formatted_phone_number')
            String? formattedPhoneNumber,
            @JsonKey(name: 'international_phone_number')
            String? internationalPhoneNumber,
            List<String> types)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDM() when $default != null:
        return $default(
            _that.placeId,
            _that.name,
            _that.formattedAddress,
            _that.addressComponents,
            _that.geometry,
            _that.formattedPhoneNumber,
            _that.internationalPhoneNumber,
            _that.types);
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
            String? name,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            @JsonKey(name: 'formatted_phone_number')
            String? formattedPhoneNumber,
            @JsonKey(name: 'international_phone_number')
            String? internationalPhoneNumber,
            List<String> types)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDM():
        return $default(
            _that.placeId,
            _that.name,
            _that.formattedAddress,
            _that.addressComponents,
            _that.geometry,
            _that.formattedPhoneNumber,
            _that.internationalPhoneNumber,
            _that.types);
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
            String? name,
            @JsonKey(name: 'formatted_address') String? formattedAddress,
            @JsonKey(name: 'address_components')
            List<PlaceAddressComponentDM> addressComponents,
            PlaceGeometryDM? geometry,
            @JsonKey(name: 'formatted_phone_number')
            String? formattedPhoneNumber,
            @JsonKey(name: 'international_phone_number')
            String? internationalPhoneNumber,
            List<String> types)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDM() when $default != null:
        return $default(
            _that.placeId,
            _that.name,
            _that.formattedAddress,
            _that.addressComponents,
            _that.geometry,
            _that.formattedPhoneNumber,
            _that.internationalPhoneNumber,
            _that.types);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceDM implements PlaceDM {
  const _PlaceDM(
      {@JsonKey(name: 'place_id') this.placeId,
      this.name,
      @JsonKey(name: 'formatted_address') this.formattedAddress,
      @JsonKey(name: 'address_components')
      final List<PlaceAddressComponentDM> addressComponents =
          const <PlaceAddressComponentDM>[],
      this.geometry,
      @JsonKey(name: 'formatted_phone_number') this.formattedPhoneNumber,
      @JsonKey(name: 'international_phone_number')
      this.internationalPhoneNumber,
      final List<String> types = const <String>[]})
      : _addressComponents = addressComponents,
        _types = types;
  factory _PlaceDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceDMFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String? placeId;
  @override
  final String? name;
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
  @override
  @JsonKey(name: 'formatted_phone_number')
  final String? formattedPhoneNumber;
  @override
  @JsonKey(name: 'international_phone_number')
  final String? internationalPhoneNumber;
// `types` top-level del Place (ej. `["locality", "political"]`). Lo
// pedimos en el field mask del backend porque algunos consumers
// (p.ej. distinguir street_address de route) lo necesitan. Default
// a lista vacía para que los consumers puedan hacer `.contains(...)`
// sin null-checks.
  final List<String> _types;
// `types` top-level del Place (ej. `["locality", "political"]`). Lo
// pedimos en el field mask del backend porque algunos consumers
// (p.ej. distinguir street_address de route) lo necesitan. Default
// a lista vacía para que los consumers puedan hacer `.contains(...)`
// sin null-checks.
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceDMCopyWith<_PlaceDM> get copyWith =>
      __$PlaceDMCopyWithImpl<_PlaceDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceDM &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber) &&
            (identical(
                    other.internationalPhoneNumber, internationalPhoneNumber) ||
                other.internationalPhoneNumber == internationalPhoneNumber) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      name,
      formattedAddress,
      const DeepCollectionEquality().hash(_addressComponents),
      geometry,
      formattedPhoneNumber,
      internationalPhoneNumber,
      const DeepCollectionEquality().hash(_types));

  @override
  String toString() {
    return 'PlaceDM(placeId: $placeId, name: $name, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, formattedPhoneNumber: $formattedPhoneNumber, internationalPhoneNumber: $internationalPhoneNumber, types: $types)';
  }
}

/// @nodoc
abstract mixin class _$PlaceDMCopyWith<$Res> implements $PlaceDMCopyWith<$Res> {
  factory _$PlaceDMCopyWith(_PlaceDM value, $Res Function(_PlaceDM) _then) =
      __$PlaceDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      String? name,
      @JsonKey(name: 'formatted_address') String? formattedAddress,
      @JsonKey(name: 'address_components')
      List<PlaceAddressComponentDM> addressComponents,
      PlaceGeometryDM? geometry,
      @JsonKey(name: 'formatted_phone_number') String? formattedPhoneNumber,
      @JsonKey(name: 'international_phone_number')
      String? internationalPhoneNumber,
      List<String> types});

  @override
  $PlaceGeometryDMCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$PlaceDMCopyWithImpl<$Res> implements _$PlaceDMCopyWith<$Res> {
  __$PlaceDMCopyWithImpl(this._self, this._then);

  final _PlaceDM _self;
  final $Res Function(_PlaceDM) _then;

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placeId = freezed,
    Object? name = freezed,
    Object? formattedAddress = freezed,
    Object? addressComponents = null,
    Object? geometry = freezed,
    Object? formattedPhoneNumber = freezed,
    Object? internationalPhoneNumber = freezed,
    Object? types = null,
  }) {
    return _then(_PlaceDM(
      placeId: freezed == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _self.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _self.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of PlaceDM
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
