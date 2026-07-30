// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_autocomplete_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceAutocompleteResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  List<PlacePredictionDM> get predictions;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceAutocompleteResponseDMCopyWith<PlaceAutocompleteResponseDM>
      get copyWith => _$PlaceAutocompleteResponseDMCopyWithImpl<
              PlaceAutocompleteResponseDM>(
          this as PlaceAutocompleteResponseDM, _$identity);

  /// Serializes this PlaceAutocompleteResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceAutocompleteResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.predictions, predictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(predictions));

  @override
  String toString() {
    return 'PlaceAutocompleteResponseDM(status: $status, predictions: $predictions)';
  }
}

/// @nodoc
abstract mixin class $PlaceAutocompleteResponseDMCopyWith<$Res> {
  factory $PlaceAutocompleteResponseDMCopyWith(
          PlaceAutocompleteResponseDM value,
          $Res Function(PlaceAutocompleteResponseDM) _then) =
      _$PlaceAutocompleteResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<PlacePredictionDM> predictions});
}

/// @nodoc
class _$PlaceAutocompleteResponseDMCopyWithImpl<$Res>
    implements $PlaceAutocompleteResponseDMCopyWith<$Res> {
  _$PlaceAutocompleteResponseDMCopyWithImpl(this._self, this._then);

  final PlaceAutocompleteResponseDM _self;
  final $Res Function(PlaceAutocompleteResponseDM) _then;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? predictions = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      predictions: null == predictions
          ? _self.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePredictionDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceAutocompleteResponseDM].
extension PlaceAutocompleteResponseDMPatterns on PlaceAutocompleteResponseDM {
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
    TResult Function(_PlaceAutocompleteResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM() when $default != null:
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
    TResult Function(_PlaceAutocompleteResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM():
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
    TResult? Function(_PlaceAutocompleteResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM() when $default != null:
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
            List<PlacePredictionDM> predictions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM() when $default != null:
        return $default(_that.status, _that.predictions);
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
            List<PlacePredictionDM> predictions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM():
        return $default(_that.status, _that.predictions);
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
            List<PlacePredictionDM> predictions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAutocompleteResponseDM() when $default != null:
        return $default(_that.status, _that.predictions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceAutocompleteResponseDM implements PlaceAutocompleteResponseDM {
  const _PlaceAutocompleteResponseDM(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      final List<PlacePredictionDM> predictions = const <PlacePredictionDM>[]})
      : _predictions = predictions;
  factory _PlaceAutocompleteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteResponseDMFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  final List<PlacePredictionDM> _predictions;
  @override
  @JsonKey()
  List<PlacePredictionDM> get predictions {
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predictions);
  }

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceAutocompleteResponseDMCopyWith<_PlaceAutocompleteResponseDM>
      get copyWith => __$PlaceAutocompleteResponseDMCopyWithImpl<
          _PlaceAutocompleteResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceAutocompleteResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceAutocompleteResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_predictions));

  @override
  String toString() {
    return 'PlaceAutocompleteResponseDM(status: $status, predictions: $predictions)';
  }
}

/// @nodoc
abstract mixin class _$PlaceAutocompleteResponseDMCopyWith<$Res>
    implements $PlaceAutocompleteResponseDMCopyWith<$Res> {
  factory _$PlaceAutocompleteResponseDMCopyWith(
          _PlaceAutocompleteResponseDM value,
          $Res Function(_PlaceAutocompleteResponseDM) _then) =
      __$PlaceAutocompleteResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<PlacePredictionDM> predictions});
}

/// @nodoc
class __$PlaceAutocompleteResponseDMCopyWithImpl<$Res>
    implements _$PlaceAutocompleteResponseDMCopyWith<$Res> {
  __$PlaceAutocompleteResponseDMCopyWithImpl(this._self, this._then);

  final _PlaceAutocompleteResponseDM _self;
  final $Res Function(_PlaceAutocompleteResponseDM) _then;

  /// Create a copy of PlaceAutocompleteResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? predictions = null,
  }) {
    return _then(_PlaceAutocompleteResponseDM(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      predictions: null == predictions
          ? _self._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePredictionDM>,
    ));
  }
}

// dart format on
