// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_address_component_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceAddressComponentDM {
  @JsonKey(name: 'long_name')
  String get longName;
  @JsonKey(name: 'short_name')
  String get shortName;
  List<String> get types;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceAddressComponentDMCopyWith<PlaceAddressComponentDM> get copyWith =>
      _$PlaceAddressComponentDMCopyWithImpl<PlaceAddressComponentDM>(
          this as PlaceAddressComponentDM, _$identity);

  /// Serializes this PlaceAddressComponentDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceAddressComponentDM &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longName, shortName,
      const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'PlaceAddressComponentDM(longName: $longName, shortName: $shortName, types: $types)';
  }
}

/// @nodoc
abstract mixin class $PlaceAddressComponentDMCopyWith<$Res> {
  factory $PlaceAddressComponentDMCopyWith(PlaceAddressComponentDM value,
          $Res Function(PlaceAddressComponentDM) _then) =
      _$PlaceAddressComponentDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String longName,
      @JsonKey(name: 'short_name') String shortName,
      List<String> types});
}

/// @nodoc
class _$PlaceAddressComponentDMCopyWithImpl<$Res>
    implements $PlaceAddressComponentDMCopyWith<$Res> {
  _$PlaceAddressComponentDMCopyWithImpl(this._self, this._then);

  final PlaceAddressComponentDM _self;
  final $Res Function(PlaceAddressComponentDM) _then;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = null,
    Object? shortName = null,
    Object? types = null,
  }) {
    return _then(_self.copyWith(
      longName: null == longName
          ? _self.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceAddressComponentDM].
extension PlaceAddressComponentDMPatterns on PlaceAddressComponentDM {
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
    TResult Function(_PlaceAddressComponentDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM() when $default != null:
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
    TResult Function(_PlaceAddressComponentDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM():
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
    TResult? Function(_PlaceAddressComponentDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'long_name') String longName,
            @JsonKey(name: 'short_name') String shortName, List<String> types)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM() when $default != null:
        return $default(_that.longName, _that.shortName, _that.types);
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
    TResult Function(@JsonKey(name: 'long_name') String longName,
            @JsonKey(name: 'short_name') String shortName, List<String> types)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM():
        return $default(_that.longName, _that.shortName, _that.types);
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
    TResult? Function(@JsonKey(name: 'long_name') String longName,
            @JsonKey(name: 'short_name') String shortName, List<String> types)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAddressComponentDM() when $default != null:
        return $default(_that.longName, _that.shortName, _that.types);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceAddressComponentDM implements PlaceAddressComponentDM {
  const _PlaceAddressComponentDM(
      {@JsonKey(name: 'long_name') required this.longName,
      @JsonKey(name: 'short_name') required this.shortName,
      final List<String> types = const <String>[]})
      : _types = types;
  factory _PlaceAddressComponentDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceAddressComponentDMFromJson(json);

  @override
  @JsonKey(name: 'long_name')
  final String longName;
  @override
  @JsonKey(name: 'short_name')
  final String shortName;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceAddressComponentDMCopyWith<_PlaceAddressComponentDM> get copyWith =>
      __$PlaceAddressComponentDMCopyWithImpl<_PlaceAddressComponentDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceAddressComponentDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceAddressComponentDM &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longName, shortName,
      const DeepCollectionEquality().hash(_types));

  @override
  String toString() {
    return 'PlaceAddressComponentDM(longName: $longName, shortName: $shortName, types: $types)';
  }
}

/// @nodoc
abstract mixin class _$PlaceAddressComponentDMCopyWith<$Res>
    implements $PlaceAddressComponentDMCopyWith<$Res> {
  factory _$PlaceAddressComponentDMCopyWith(_PlaceAddressComponentDM value,
          $Res Function(_PlaceAddressComponentDM) _then) =
      __$PlaceAddressComponentDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String longName,
      @JsonKey(name: 'short_name') String shortName,
      List<String> types});
}

/// @nodoc
class __$PlaceAddressComponentDMCopyWithImpl<$Res>
    implements _$PlaceAddressComponentDMCopyWith<$Res> {
  __$PlaceAddressComponentDMCopyWithImpl(this._self, this._then);

  final _PlaceAddressComponentDM _self;
  final $Res Function(_PlaceAddressComponentDM) _then;

  /// Create a copy of PlaceAddressComponentDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? longName = null,
    Object? shortName = null,
    Object? types = null,
  }) {
    return _then(_PlaceAddressComponentDM(
      longName: null == longName
          ? _self.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
