// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceDetailsResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  PlaceDM? get result;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceDetailsResponseDMCopyWith<PlaceDetailsResponseDM> get copyWith =>
      _$PlaceDetailsResponseDMCopyWithImpl<PlaceDetailsResponseDM>(
          this as PlaceDetailsResponseDM, _$identity);

  /// Serializes this PlaceDetailsResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceDetailsResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, result);

  @override
  String toString() {
    return 'PlaceDetailsResponseDM(status: $status, result: $result)';
  }
}

/// @nodoc
abstract mixin class $PlaceDetailsResponseDMCopyWith<$Res> {
  factory $PlaceDetailsResponseDMCopyWith(PlaceDetailsResponseDM value,
          $Res Function(PlaceDetailsResponseDM) _then) =
      _$PlaceDetailsResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      PlaceDM? result});

  $PlaceDMCopyWith<$Res>? get result;
}

/// @nodoc
class _$PlaceDetailsResponseDMCopyWithImpl<$Res>
    implements $PlaceDetailsResponseDMCopyWith<$Res> {
  _$PlaceDetailsResponseDMCopyWithImpl(this._self, this._then);

  final PlaceDetailsResponseDM _self;
  final $Res Function(PlaceDetailsResponseDM) _then;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as PlaceDM?,
    ));
  }

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceDMCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $PlaceDMCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlaceDetailsResponseDM].
extension PlaceDetailsResponseDMPatterns on PlaceDetailsResponseDM {
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
    TResult Function(_PlaceDetailsResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM() when $default != null:
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
    TResult Function(_PlaceDetailsResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM():
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
    TResult? Function(_PlaceDetailsResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM() when $default != null:
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
            @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
            ProxyStatusEnum status,
            PlaceDM? result)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM() when $default != null:
        return $default(_that.status, _that.result);
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
            @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
            ProxyStatusEnum status,
            PlaceDM? result)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM():
        return $default(_that.status, _that.result);
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
            @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
            ProxyStatusEnum status,
            PlaceDM? result)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDetailsResponseDM() when $default != null:
        return $default(_that.status, _that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceDetailsResponseDM implements PlaceDetailsResponseDM {
  const _PlaceDetailsResponseDM(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      this.result});
  factory _PlaceDetailsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseDMFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  @override
  final PlaceDM? result;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceDetailsResponseDMCopyWith<_PlaceDetailsResponseDM> get copyWith =>
      __$PlaceDetailsResponseDMCopyWithImpl<_PlaceDetailsResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceDetailsResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceDetailsResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, result);

  @override
  String toString() {
    return 'PlaceDetailsResponseDM(status: $status, result: $result)';
  }
}

/// @nodoc
abstract mixin class _$PlaceDetailsResponseDMCopyWith<$Res>
    implements $PlaceDetailsResponseDMCopyWith<$Res> {
  factory _$PlaceDetailsResponseDMCopyWith(_PlaceDetailsResponseDM value,
          $Res Function(_PlaceDetailsResponseDM) _then) =
      __$PlaceDetailsResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      PlaceDM? result});

  @override
  $PlaceDMCopyWith<$Res>? get result;
}

/// @nodoc
class __$PlaceDetailsResponseDMCopyWithImpl<$Res>
    implements _$PlaceDetailsResponseDMCopyWith<$Res> {
  __$PlaceDetailsResponseDMCopyWithImpl(this._self, this._then);

  final _PlaceDetailsResponseDM _self;
  final $Res Function(_PlaceDetailsResponseDM) _then;

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_PlaceDetailsResponseDM(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as PlaceDM?,
    ));
  }

  /// Create a copy of PlaceDetailsResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceDMCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $PlaceDMCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

// dart format on
