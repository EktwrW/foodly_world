// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_geometry_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceLatLngDM {
  double get lat;
  double get lng;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<PlaceLatLngDM> get copyWith =>
      _$PlaceLatLngDMCopyWithImpl<PlaceLatLngDM>(
          this as PlaceLatLngDM, _$identity);

  /// Serializes this PlaceLatLngDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceLatLngDM &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'PlaceLatLngDM(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $PlaceLatLngDMCopyWith<$Res> {
  factory $PlaceLatLngDMCopyWith(
          PlaceLatLngDM value, $Res Function(PlaceLatLngDM) _then) =
      _$PlaceLatLngDMCopyWithImpl;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PlaceLatLngDMCopyWithImpl<$Res>
    implements $PlaceLatLngDMCopyWith<$Res> {
  _$PlaceLatLngDMCopyWithImpl(this._self, this._then);

  final PlaceLatLngDM _self;
  final $Res Function(PlaceLatLngDM) _then;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceLatLngDM].
extension PlaceLatLngDMPatterns on PlaceLatLngDM {
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
    TResult Function(_PlaceLatLngDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM() when $default != null:
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
    TResult Function(_PlaceLatLngDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM():
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
    TResult? Function(_PlaceLatLngDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM() when $default != null:
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
    TResult Function(double lat, double lng)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM() when $default != null:
        return $default(_that.lat, _that.lng);
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
    TResult Function(double lat, double lng) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM():
        return $default(_that.lat, _that.lng);
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
    TResult? Function(double lat, double lng)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceLatLngDM() when $default != null:
        return $default(_that.lat, _that.lng);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceLatLngDM implements PlaceLatLngDM {
  const _PlaceLatLngDM({this.lat = 0.0, this.lng = 0.0});
  factory _PlaceLatLngDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceLatLngDMFromJson(json);

  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceLatLngDMCopyWith<_PlaceLatLngDM> get copyWith =>
      __$PlaceLatLngDMCopyWithImpl<_PlaceLatLngDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceLatLngDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceLatLngDM &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'PlaceLatLngDM(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$PlaceLatLngDMCopyWith<$Res>
    implements $PlaceLatLngDMCopyWith<$Res> {
  factory _$PlaceLatLngDMCopyWith(
          _PlaceLatLngDM value, $Res Function(_PlaceLatLngDM) _then) =
      __$PlaceLatLngDMCopyWithImpl;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$PlaceLatLngDMCopyWithImpl<$Res>
    implements _$PlaceLatLngDMCopyWith<$Res> {
  __$PlaceLatLngDMCopyWithImpl(this._self, this._then);

  final _PlaceLatLngDM _self;
  final $Res Function(_PlaceLatLngDM) _then;

  /// Create a copy of PlaceLatLngDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_PlaceLatLngDM(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$PlaceBoundsDM {
  PlaceLatLngDM? get northeast;
  PlaceLatLngDM? get southwest;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<PlaceBoundsDM> get copyWith =>
      _$PlaceBoundsDMCopyWithImpl<PlaceBoundsDM>(
          this as PlaceBoundsDM, _$identity);

  /// Serializes this PlaceBoundsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceBoundsDM &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  @override
  String toString() {
    return 'PlaceBoundsDM(northeast: $northeast, southwest: $southwest)';
  }
}

/// @nodoc
abstract mixin class $PlaceBoundsDMCopyWith<$Res> {
  factory $PlaceBoundsDMCopyWith(
          PlaceBoundsDM value, $Res Function(PlaceBoundsDM) _then) =
      _$PlaceBoundsDMCopyWithImpl;
  @useResult
  $Res call({PlaceLatLngDM? northeast, PlaceLatLngDM? southwest});

  $PlaceLatLngDMCopyWith<$Res>? get northeast;
  $PlaceLatLngDMCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$PlaceBoundsDMCopyWithImpl<$Res>
    implements $PlaceBoundsDMCopyWith<$Res> {
  _$PlaceBoundsDMCopyWithImpl(this._self, this._then);

  final PlaceBoundsDM _self;
  final $Res Function(PlaceBoundsDM) _then;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_self.copyWith(
      northeast: freezed == northeast
          ? _self.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
      southwest: freezed == southwest
          ? _self.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
    ));
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get northeast {
    if (_self.northeast == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_self.northeast!, (value) {
      return _then(_self.copyWith(northeast: value));
    });
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get southwest {
    if (_self.southwest == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_self.southwest!, (value) {
      return _then(_self.copyWith(southwest: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlaceBoundsDM].
extension PlaceBoundsDMPatterns on PlaceBoundsDM {
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
    TResult Function(_PlaceBoundsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM() when $default != null:
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
    TResult Function(_PlaceBoundsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM():
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
    TResult? Function(_PlaceBoundsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM() when $default != null:
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
    TResult Function(PlaceLatLngDM? northeast, PlaceLatLngDM? southwest)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM() when $default != null:
        return $default(_that.northeast, _that.southwest);
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
    TResult Function(PlaceLatLngDM? northeast, PlaceLatLngDM? southwest)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM():
        return $default(_that.northeast, _that.southwest);
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
    TResult? Function(PlaceLatLngDM? northeast, PlaceLatLngDM? southwest)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceBoundsDM() when $default != null:
        return $default(_that.northeast, _that.southwest);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceBoundsDM implements PlaceBoundsDM {
  const _PlaceBoundsDM({this.northeast, this.southwest});
  factory _PlaceBoundsDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceBoundsDMFromJson(json);

  @override
  final PlaceLatLngDM? northeast;
  @override
  final PlaceLatLngDM? southwest;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceBoundsDMCopyWith<_PlaceBoundsDM> get copyWith =>
      __$PlaceBoundsDMCopyWithImpl<_PlaceBoundsDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceBoundsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceBoundsDM &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  @override
  String toString() {
    return 'PlaceBoundsDM(northeast: $northeast, southwest: $southwest)';
  }
}

/// @nodoc
abstract mixin class _$PlaceBoundsDMCopyWith<$Res>
    implements $PlaceBoundsDMCopyWith<$Res> {
  factory _$PlaceBoundsDMCopyWith(
          _PlaceBoundsDM value, $Res Function(_PlaceBoundsDM) _then) =
      __$PlaceBoundsDMCopyWithImpl;
  @override
  @useResult
  $Res call({PlaceLatLngDM? northeast, PlaceLatLngDM? southwest});

  @override
  $PlaceLatLngDMCopyWith<$Res>? get northeast;
  @override
  $PlaceLatLngDMCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$PlaceBoundsDMCopyWithImpl<$Res>
    implements _$PlaceBoundsDMCopyWith<$Res> {
  __$PlaceBoundsDMCopyWithImpl(this._self, this._then);

  final _PlaceBoundsDM _self;
  final $Res Function(_PlaceBoundsDM) _then;

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_PlaceBoundsDM(
      northeast: freezed == northeast
          ? _self.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
      southwest: freezed == southwest
          ? _self.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM?,
    ));
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get northeast {
    if (_self.northeast == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_self.northeast!, (value) {
      return _then(_self.copyWith(northeast: value));
    });
  }

  /// Create a copy of PlaceBoundsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res>? get southwest {
    if (_self.southwest == null) {
      return null;
    }

    return $PlaceLatLngDMCopyWith<$Res>(_self.southwest!, (value) {
      return _then(_self.copyWith(southwest: value));
    });
  }
}

/// @nodoc
mixin _$PlaceGeometryDM {
  PlaceLatLngDM get location;
  PlaceBoundsDM? get viewport;
  PlaceBoundsDM? get bounds;
  @JsonKey(name: 'location_type')
  String? get locationType;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceGeometryDMCopyWith<PlaceGeometryDM> get copyWith =>
      _$PlaceGeometryDMCopyWithImpl<PlaceGeometryDM>(
          this as PlaceGeometryDM, _$identity);

  /// Serializes this PlaceGeometryDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceGeometryDM &&
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

  @override
  String toString() {
    return 'PlaceGeometryDM(location: $location, viewport: $viewport, bounds: $bounds, locationType: $locationType)';
  }
}

/// @nodoc
abstract mixin class $PlaceGeometryDMCopyWith<$Res> {
  factory $PlaceGeometryDMCopyWith(
          PlaceGeometryDM value, $Res Function(PlaceGeometryDM) _then) =
      _$PlaceGeometryDMCopyWithImpl;
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
class _$PlaceGeometryDMCopyWithImpl<$Res>
    implements $PlaceGeometryDMCopyWith<$Res> {
  _$PlaceGeometryDMCopyWithImpl(this._self, this._then);

  final PlaceGeometryDM _self;
  final $Res Function(PlaceGeometryDM) _then;

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
    return _then(_self.copyWith(
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM,
      viewport: freezed == viewport
          ? _self.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      bounds: freezed == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      locationType: freezed == locationType
          ? _self.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res> get location {
    return $PlaceLatLngDMCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get viewport {
    if (_self.viewport == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_self.viewport!, (value) {
      return _then(_self.copyWith(viewport: value));
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_self.bounds!, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlaceGeometryDM].
extension PlaceGeometryDMPatterns on PlaceGeometryDM {
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
    TResult Function(_PlaceGeometryDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM() when $default != null:
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
    TResult Function(_PlaceGeometryDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM():
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
    TResult? Function(_PlaceGeometryDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM() when $default != null:
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
            PlaceLatLngDM location,
            PlaceBoundsDM? viewport,
            PlaceBoundsDM? bounds,
            @JsonKey(name: 'location_type') String? locationType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM() when $default != null:
        return $default(
            _that.location, _that.viewport, _that.bounds, _that.locationType);
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
            PlaceLatLngDM location,
            PlaceBoundsDM? viewport,
            PlaceBoundsDM? bounds,
            @JsonKey(name: 'location_type') String? locationType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM():
        return $default(
            _that.location, _that.viewport, _that.bounds, _that.locationType);
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
            PlaceLatLngDM location,
            PlaceBoundsDM? viewport,
            PlaceBoundsDM? bounds,
            @JsonKey(name: 'location_type') String? locationType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceGeometryDM() when $default != null:
        return $default(
            _that.location, _that.viewport, _that.bounds, _that.locationType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceGeometryDM implements PlaceGeometryDM {
  const _PlaceGeometryDM(
      {required this.location,
      this.viewport,
      this.bounds,
      @JsonKey(name: 'location_type') this.locationType});
  factory _PlaceGeometryDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceGeometryDMFromJson(json);

  @override
  final PlaceLatLngDM location;
  @override
  final PlaceBoundsDM? viewport;
  @override
  final PlaceBoundsDM? bounds;
  @override
  @JsonKey(name: 'location_type')
  final String? locationType;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceGeometryDMCopyWith<_PlaceGeometryDM> get copyWith =>
      __$PlaceGeometryDMCopyWithImpl<_PlaceGeometryDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceGeometryDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceGeometryDM &&
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

  @override
  String toString() {
    return 'PlaceGeometryDM(location: $location, viewport: $viewport, bounds: $bounds, locationType: $locationType)';
  }
}

/// @nodoc
abstract mixin class _$PlaceGeometryDMCopyWith<$Res>
    implements $PlaceGeometryDMCopyWith<$Res> {
  factory _$PlaceGeometryDMCopyWith(
          _PlaceGeometryDM value, $Res Function(_PlaceGeometryDM) _then) =
      __$PlaceGeometryDMCopyWithImpl;
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
class __$PlaceGeometryDMCopyWithImpl<$Res>
    implements _$PlaceGeometryDMCopyWith<$Res> {
  __$PlaceGeometryDMCopyWithImpl(this._self, this._then);

  final _PlaceGeometryDM _self;
  final $Res Function(_PlaceGeometryDM) _then;

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = null,
    Object? viewport = freezed,
    Object? bounds = freezed,
    Object? locationType = freezed,
  }) {
    return _then(_PlaceGeometryDM(
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as PlaceLatLngDM,
      viewport: freezed == viewport
          ? _self.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      bounds: freezed == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as PlaceBoundsDM?,
      locationType: freezed == locationType
          ? _self.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceLatLngDMCopyWith<$Res> get location {
    return $PlaceLatLngDMCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get viewport {
    if (_self.viewport == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_self.viewport!, (value) {
      return _then(_self.copyWith(viewport: value));
    });
  }

  /// Create a copy of PlaceGeometryDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceBoundsDMCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
      return null;
    }

    return $PlaceBoundsDMCopyWith<$Res>(_self.bounds!, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }
}

// dart format on
