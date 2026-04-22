// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_result_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeocodingResultDM _$GeocodingResultDMFromJson(Map<String, dynamic> json) {
  return _GeocodingResultDM.fromJson(json);
}

/// @nodoc
mixin _$GeocodingResultDM {
  @JsonKey(name: 'place_id')
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents =>
      throw _privateConstructorUsedError;
  PlaceGeometryDM? get geometry => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this GeocodingResultDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeocodingResultDMCopyWith<GeocodingResultDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodingResultDMCopyWith<$Res> {
  factory $GeocodingResultDMCopyWith(
          GeocodingResultDM value, $Res Function(GeocodingResultDM) then) =
      _$GeocodingResultDMCopyWithImpl<$Res, GeocodingResultDM>;
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
class _$GeocodingResultDMCopyWithImpl<$Res, $Val extends GeocodingResultDM>
    implements $GeocodingResultDMCopyWith<$Res> {
  _$GeocodingResultDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
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
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of GeocodingResultDM
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
abstract class _$$GeocodingResultDMImplCopyWith<$Res>
    implements $GeocodingResultDMCopyWith<$Res> {
  factory _$$GeocodingResultDMImplCopyWith(_$GeocodingResultDMImpl value,
          $Res Function(_$GeocodingResultDMImpl) then) =
      __$$GeocodingResultDMImplCopyWithImpl<$Res>;
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
class __$$GeocodingResultDMImplCopyWithImpl<$Res>
    extends _$GeocodingResultDMCopyWithImpl<$Res, _$GeocodingResultDMImpl>
    implements _$$GeocodingResultDMImplCopyWith<$Res> {
  __$$GeocodingResultDMImplCopyWithImpl(_$GeocodingResultDMImpl _value,
      $Res Function(_$GeocodingResultDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$GeocodingResultDMImpl(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
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
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodingResultDMImpl implements _GeocodingResultDM {
  const _$GeocodingResultDMImpl(
      {@JsonKey(name: 'place_id') this.placeId,
      @JsonKey(name: 'formatted_address') this.formattedAddress,
      @JsonKey(name: 'address_components')
      final List<PlaceAddressComponentDM> addressComponents =
          const <PlaceAddressComponentDM>[],
      this.geometry,
      final List<String> types = const <String>[]})
      : _addressComponents = addressComponents,
        _types = types;

  factory _$GeocodingResultDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodingResultDMImplFromJson(json);

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

  @override
  String toString() {
    return 'GeocodingResultDM(placeId: $placeId, formattedAddress: $formattedAddress, addressComponents: $addressComponents, geometry: $geometry, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodingResultDMImpl &&
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

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodingResultDMImplCopyWith<_$GeocodingResultDMImpl> get copyWith =>
      __$$GeocodingResultDMImplCopyWithImpl<_$GeocodingResultDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodingResultDMImplToJson(
      this,
    );
  }
}

abstract class _GeocodingResultDM implements GeocodingResultDM {
  const factory _GeocodingResultDM(
      {@JsonKey(name: 'place_id') final String? placeId,
      @JsonKey(name: 'formatted_address') final String? formattedAddress,
      @JsonKey(name: 'address_components')
      final List<PlaceAddressComponentDM> addressComponents,
      final PlaceGeometryDM? geometry,
      final List<String> types}) = _$GeocodingResultDMImpl;

  factory _GeocodingResultDM.fromJson(Map<String, dynamic> json) =
      _$GeocodingResultDMImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String? get placeId;
  @override
  @JsonKey(name: 'formatted_address')
  String? get formattedAddress;
  @override
  @JsonKey(name: 'address_components')
  List<PlaceAddressComponentDM> get addressComponents;
  @override
  PlaceGeometryDM? get geometry;
  @override
  List<String> get types;

  /// Create a copy of GeocodingResultDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeocodingResultDMImplCopyWith<_$GeocodingResultDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
