// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_geometry_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceLatLngDM _$PlaceLatLngDMFromJson(Map<String, dynamic> json) {
  return _PlaceLatLngDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceLatLngDM {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this PlaceLatLngDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceLatLngDMCopyWith<PlaceLatLngDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceLatLngDMCopyWith<$Res> {
  factory $PlaceLatLngDMCopyWith(
          PlaceLatLngDM value, $Res Function(PlaceLatLngDM) then) =
      _$PlaceLatLngDMCopyWithImpl<$Res, PlaceLatLngDM>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PlaceLatLngDMCopyWithImpl<$Res, $Val extends PlaceLatLngDM>
    implements $PlaceLatLngDMCopyWith<$Res> {
  _$PlaceLatLngDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceLatLngDMImplCopyWith<$Res>
    implements $PlaceLatLngDMCopyWith<$Res> {
  factory _$$PlaceLatLngDMImplCopyWith(
          _$PlaceLatLngDMImpl value, $Res Function(_$PlaceLatLngDMImpl) then) =
      __$$PlaceLatLngDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$PlaceLatLngDMImplCopyWithImpl<$Res>
    extends _$PlaceLatLngDMCopyWithImpl<$Res, _$PlaceLatLngDMImpl>
    implements _$$PlaceLatLngDMImplCopyWith<$Res> {
  __$$PlaceLatLngDMImplCopyWithImpl(
      _$PlaceLatLngDMImpl _value, $Res Function(_$PlaceLatLngDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PlaceLatLngDMImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceLatLngDMImpl implements _PlaceLatLngDM {
  const _$PlaceLatLngDMImpl({this.lat = 0.0, this.lng = 0.0});

  factory _$PlaceLatLngDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceLatLngDMImplFromJson(json);

  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;

  @override
  String toString() {
    return 'PlaceLatLngDM(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceLatLngDMImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceLatLngDMImplCopyWith<_$PlaceLatLngDMImpl> get copyWith =>
      __$$PlaceLatLngDMImplCopyWithImpl<_$PlaceLatLngDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceLatLngDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceLatLngDM implements PlaceLatLngDM {
  const factory _PlaceLatLngDM({final double lat, final double lng}) =
      _$PlaceLatLngDMImpl;

  factory _PlaceLatLngDM.fromJson(Map<String, dynamic> json) =
      _$PlaceLatLngDMImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceLatLngDMImplCopyWith<_$PlaceLatLngDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceBoundsDM _$PlaceBoundsDMFromJson(Map<String, dynamic> json) {
  return _PlaceBoundsDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceBoundsDM {
  PlaceLatLngDM? get northeast => throw _privateConstructorUsedError;
  PlaceLatLngDM? get southwest => throw _privateConstructorUsedError;

  /// Serializes this PlaceBoundsDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceBoundsDMCopyWith<PlaceBoundsDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceBoundsDMCopyWith<$Res> {
  factory $PlaceBoundsDMCopyWith(
          PlaceBoundsDM value, $Res Function(PlaceBoundsDM) then) =
      _$PlaceBoundsDMCopyWithImpl<$Res, PlaceBoundsDM>;
  @useResult
  $Res call({PlaceLatLngDM? northeast, PlaceLatLngDM? southwest});

  $PlaceLatLngDMCopyWith<$Res>? get northeast;
  $PlaceLatLngDMCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$PlaceBoundsDMCopyWithImpl<$Res, $Val extends PlaceBoundsDM>
    implements $PlaceBoundsDMCopyWith<$Res> {
  _$PlaceBoundsDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_value.copyWith(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
    ) as $Val);
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get northeast {
    if (_value.northeast == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_value.northeast!, (value) {
      return _then(_value.copyWith(northeast: value) as $Val);
    });
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get southwest {
    if (_value.southwest == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_value.southwest!, (value) {
      return _then(_value.copyWith(southwest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceBoundsDMImplCopyWith<$Res>
    implements $PlaceBoundsDMCopyWith<$Res> {
  factory _$$PlaceBoundsDMImplCopyWith(
          _$PlaceBoundsDMImpl value, $Res Function(_$PlaceBoundsDMImpl) then) =
      __$$PlaceBoundsDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceLatLngDM? northeast, PlaceLatLngDM? southwest});

  @override
  $PlaceLatLngDMCopyWith<$Res>? get northeast;
  @override
  $PlaceLatLngDMCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$$PlaceBoundsDMImplCopyWithImpl<$Res>
    extends _$PlaceBoundsDMCopyWithImpl<$Res, _$PlaceBoundsDMImpl>
    implements _$$PlaceBoundsDMImplCopyWith<$Res> {
  __$$PlaceBoundsDMImplCopyWithImpl(
      _$PlaceBoundsDMImpl _value, $Res Function(_$PlaceBoundsDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_$PlaceBoundsDMImpl(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceBoundsDMImpl implements _PlaceBoundsDM {
  const _$PlaceBoundsDMImpl({this.northeast, this.southwest});

  factory _$PlaceBoundsDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceBoundsDMImplFromJson(json);

  @override
  final PlaceLatLngDM? northeast;
  @override
  final PlaceLatLngDM? southwest;

  @override
  String toString() {
    return 'PlaceBoundsDM(northeast: $northeast, southwest: $southwest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceBoundsDMImpl &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceBoundsDMImplCopyWith<_$PlaceBoundsDMImpl> get copyWith =>
      __$$PlaceBoundsDMImplCopyWithImpl<_$PlaceBoundsDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceBoundsDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceBoundsDM implements PlaceBoundsDM {
  const factory _PlaceBoundsDM(
      {final PlaceLatLngDM? northeast,
      final PlaceLatLngDM? southwest}) = _$PlaceBoundsDMImpl;

  factory _PlaceBoundsDM.fromJson(Map<String, dynamic> json) =
      _$PlaceBoundsDMImpl.fromJson;

  @override
  PlaceLatLngDM? get northeast;
  @override
  PlaceLatLngDM? get southwest;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceBoundsDMImplCopyWith<_$PlaceBoundsDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceGeometryDM _$PlaceGeometryDMFromJson(Map<String, dynamic> json) {
  return _PlaceGeometryDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceGeometryDM {
  PlaceLatLngDM get location => throw _privateConstructorUsedError;
  PlaceBoundsDM? get viewport => throw _privateConstructorUsedError;
  PlaceBoundsDM? get bounds => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_type')
  String? get locationType => throw _privateConstructorUsedError;

  /// Serializes this PlaceGeometryDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceGeometryDMCopyWith<PlaceGeometryDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceGeometryDMCopyWith<$Res> {
  factory $PlaceGeometryDMCopyWith(
          PlaceGeometryDM value, $Res Function(PlaceGeometryDM) then) =
      _$PlaceGeometryDMCopyWithImpl<$Res, PlaceGeometryDM>;
  @useResult
  $Res call(
      {PlaceLatLngDM location,
      PlaceBoundsDM? viewport,
      PlaceBoundsDM? bounds,
      @JsonKey(name: 'location_type') String? locationType});

  $PlaceLatLngDMCopyWith<$Res> get location;
  $PlaceBoundsDMCopyWith<$Res>? get viewport;
  $PlaceBoundsDMCopyWith<$Res>? get bounds;
}

/// @nodoc
class _$PlaceGeometryDMCopyWithImpl<$Res, $Val extends PlaceGeometryDM>
    implements $PlaceGeometryDMCopyWith<$Res> {
  _$PlaceGeometryDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? viewport = freezed,
    Object? bounds = freezed,
    Object? locationType = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res> get location {
    return $PlaceLatLngDMCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get viewport {
    if (_value.viewport == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_value.viewport!, (value) {
      return _then(_value.copyWith(viewport: value) as $Val);
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceGeometryDMImplCopyWith<$Res>
    implements $PlaceGeometryDMCopyWith<$Res> {
  factory _$$PlaceGeometryDMImplCopyWith(_$PlaceGeometryDMImpl value,
          $Res Function(_$PlaceGeometryDMImpl) then) =
      __$$PlaceGeometryDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlaceLatLngDM location,
      PlaceBoundsDM? viewport,
      PlaceBoundsDM? bounds,
      @JsonKey(name: 'location_type') String? locationType});

  @override
  $PlaceLatLngDMCopyWith<$Res> get location;
  @override
  $PlaceBoundsDMCopyWith<$Res>? get viewport;
  @override
  $PlaceBoundsDMCopyWith<$Res>? get bounds;
}

/// @nodoc
class __$$PlaceGeometryDMImplCopyWithImpl<$Res>
    extends _$PlaceGeometryDMCopyWithImpl<$Res, _$PlaceGeometryDMImpl>
    implements _$$PlaceGeometryDMImplCopyWith<$Res> {
  __$$PlaceGeometryDMImplCopyWithImpl(
      _$PlaceGeometryDMImpl _value, $Res Function(_$PlaceGeometryDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? viewport = freezed,
    Object? bounds = freezed,
    Object? locationType = freezed,
  }) {
    return _then(_$PlaceGeometryDMImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceGeometryDMImpl implements _PlaceGeometryDM {
  const _$PlaceGeometryDMImpl(
      {required this.location,
      this.viewport,
      this.bounds,
      @JsonKey(name: 'location_type') this.locationType});

  factory _$PlaceGeometryDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceGeometryDMImplFromJson(json);

  @override
  final PlaceLatLngDM location;
  @override
  final PlaceBoundsDM? viewport;
  @override
  final PlaceBoundsDM? bounds;
  @override
  @JsonKey(name: 'location_type')
  final String? locationType;

  @override
  String toString() {
    return 'PlaceGeometryDM(location: $location, viewport: $viewport, bounds: $bounds, locationType: $locationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceGeometryDMImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport) &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, location, viewport, bounds, locationType);

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceGeometryDMImplCopyWith<_$PlaceGeometryDMImpl> get copyWith =>
      __$$PlaceGeometryDMImplCopyWithImpl<_$PlaceGeometryDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceGeometryDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceGeometryDM implements PlaceGeometryDM {
  const factory _PlaceGeometryDM(
          {required final PlaceLatLngDM location,
          final PlaceBoundsDM? viewport,
          final PlaceBoundsDM? bounds,
          @JsonKey(name: 'location_type') final String? locationType}) =
      _$PlaceGeometryDMImpl;

  factory _PlaceGeometryDM.fromJson(Map<String, dynamic> json) =
      _$PlaceGeometryDMImpl.fromJson;

  @override
  PlaceLatLngDM get location;
  @override
  PlaceBoundsDM? get viewport;
  @override
  PlaceBoundsDM? get bounds;
  @override
  @JsonKey(name: 'location_type')
  String? get locationType;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceGeometryDMImplCopyWith<_$PlaceGeometryDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
