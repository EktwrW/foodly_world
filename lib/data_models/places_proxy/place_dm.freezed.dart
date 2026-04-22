// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceDM _$PlaceDMFromJson(Map<String, dynamic> json) {
  return _PlaceDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceDM {
  @JsonKey(name: 'place_id')
  String? get placeId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents =>
      throw _privateConstructorUsedError;
  PlaceGeometryDM? get geometry => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_phone_number')
  String? get formattedPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'international_phone_number')
  String? get internationalPhoneNumber =>
      throw _privateConstructorUsedError; // `types` top-level del Place (ej. `["locality", "political"]`). Lo
// pedimos en el field mask del backend porque algunos consumers
// (p.ej. distinguir street_address de route) lo necesitan. Default
// a lista vacía para que los consumers puedan hacer `.contains(...)`
// sin null-checks.
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this PlaceDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceDMCopyWith<PlaceDM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDMCopyWith<$Res> {
  factory $PlaceDMCopyWith(PlaceDM value, $Res Function(PlaceDM) then) =
      _$PlaceDMCopyWithImpl<$Res, PlaceDM>;
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
class _$PlaceDMCopyWithImpl<$Res, $Val extends PlaceDM>
    implements $PlaceDMCopyWith<$Res> {
  _$PlaceDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<PlaceAddressComponentDM>,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PlaceGeometryDM?,
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceGeometryDMCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $PlaceGeometryDMCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceDMImplCopyWith<$Res> implements $PlaceDMCopyWith<$Res> {
  factory _$$PlaceDMImplCopyWith(
          _$PlaceDMImpl value, $Res Function(_$PlaceDMImpl) then) =
      __$$PlaceDMImplCopyWithImpl<$Res>;
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
class __$$PlaceDMImplCopyWithImpl<$Res>
    extends _$PlaceDMCopyWithImpl<$Res, _$PlaceDMImpl>
    implements _$$PlaceDMImplCopyWith<$Res> {
  __$$PlaceDMImplCopyWithImpl(
      _$PlaceDMImpl _value, $Res Function(_$PlaceDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$PlaceDMImpl(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: null == addressComponents
          ? _value._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<PlaceAddressComponentDM>,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PlaceGeometryDM?,
      formattedPhoneNumber: freezed == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalPhoneNumber: freezed == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceDMImpl implements _PlaceDM {
  const _$PlaceDMImpl(
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

  factory _$PlaceDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceDMImplFromJson(json);

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

  @override
  String toString() {
    return 'PlaceDM(placeId: $placeId, name: $name, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, formattedPhoneNumber: $formattedPhoneNumber, internationalPhoneNumber: $internationalPhoneNumber, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDMImpl &&
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

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDMImplCopyWith<_$PlaceDMImpl> get copyWith =>
      __$$PlaceDMImplCopyWithImpl<_$PlaceDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceDM implements PlaceDM {
  const factory _PlaceDM(
      {@JsonKey(name: 'place_id') final String? placeId,
      final String? name,
      @JsonKey(name: 'formatted_address') final String? formattedAddress,
      @JsonKey(name: 'address_components')
      final List<PlaceAddressComponentDM> addressComponents,
      final PlaceGeometryDM? geometry,
      @JsonKey(name: 'formatted_phone_number')
      final String? formattedPhoneNumber,
      @JsonKey(name: 'international_phone_number')
      final String? internationalPhoneNumber,
      final List<String> types}) = _$PlaceDMImpl;

  factory _PlaceDM.fromJson(Map<String, dynamic> json) = _$PlaceDMImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String? get placeId;
  @override
  String? get name;
  @override
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress;
  @override
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents;
  @override
  PlaceGeometryDM? get geometry;
  @override
  @JsonKey(name: 'formatted_phone_number')
  String? get formattedPhoneNumber;
  @override
  @JsonKey(name: 'international_phone_number')
  String?
      get internationalPhoneNumber; // `types` top-level del Place (ej. `["locality", "political"]`). Lo
// pedimos en el field mask del backend porque algunos consumers
// (p.ej. distinguir street_address de route) lo necesitan. Default
// a lista vacía para que los consumers puedan hacer `.contains(...)`
// sin null-checks.
  @override
  List<String> get types;

  /// Create a copy of PlaceDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceDMImplCopyWith<_$PlaceDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
