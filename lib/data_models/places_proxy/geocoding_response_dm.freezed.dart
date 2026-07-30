// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeocodingResponseDM {
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  ProxyStatusEnum get status;
  List<GeocodingResultDM> get results;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeocodingResponseDMCopyWith<GeocodingResponseDM> get copyWith =>
      _$GeocodingResponseDMCopyWithImpl<GeocodingResponseDM>(
          this as GeocodingResponseDM, _$identity);

  /// Serializes this GeocodingResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeocodingResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(results));

  @override
  String toString() {
    return 'GeocodingResponseDM(status: $status, results: $results)';
  }
}

/// @nodoc
abstract mixin class $GeocodingResponseDMCopyWith<$Res> {
  factory $GeocodingResponseDMCopyWith(
          GeocodingResponseDM value, $Res Function(GeocodingResponseDM) _then) =
      _$GeocodingResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<GeocodingResultDM> results});
}

/// @nodoc
class _$GeocodingResponseDMCopyWithImpl<$Res>
    implements $GeocodingResponseDMCopyWith<$Res> {
  _$GeocodingResponseDMCopyWithImpl(this._self, this._then);

  final GeocodingResponseDM _self;
  final $Res Function(GeocodingResponseDM) _then;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? results = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResultDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [GeocodingResponseDM].
extension GeocodingResponseDMPatterns on GeocodingResponseDM {
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
    TResult Function(_GeocodingResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM() when $default != null:
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
    TResult Function(_GeocodingResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM():
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
    TResult? Function(_GeocodingResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM() when $default != null:
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
            List<GeocodingResultDM> results)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM() when $default != null:
        return $default(_that.status, _that.results);
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
            List<GeocodingResultDM> results)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM():
        return $default(_that.status, _that.results);
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
            List<GeocodingResultDM> results)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeocodingResponseDM() when $default != null:
        return $default(_that.status, _that.results);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GeocodingResponseDM implements GeocodingResponseDM {
  const _GeocodingResponseDM(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required this.status,
      final List<GeocodingResultDM> results = const <GeocodingResultDM>[]})
      : _results = results;
  factory _GeocodingResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResponseDMFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
  final ProxyStatusEnum status;
  final List<GeocodingResultDM> _results;
  @override
  @JsonKey()
  List<GeocodingResultDM> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeocodingResponseDMCopyWith<_GeocodingResponseDM> get copyWith =>
      __$GeocodingResponseDMCopyWithImpl<_GeocodingResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeocodingResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeocodingResponseDM &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_results));

  @override
  String toString() {
    return 'GeocodingResponseDM(status: $status, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$GeocodingResponseDMCopyWith<$Res>
    implements $GeocodingResponseDMCopyWith<$Res> {
  factory _$GeocodingResponseDMCopyWith(_GeocodingResponseDM value,
          $Res Function(_GeocodingResponseDM) _then) =
      __$GeocodingResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ProxyStatusEnum.unknown)
      ProxyStatusEnum status,
      List<GeocodingResultDM> results});
}

/// @nodoc
class __$GeocodingResponseDMCopyWithImpl<$Res>
    implements _$GeocodingResponseDMCopyWith<$Res> {
  __$GeocodingResponseDMCopyWithImpl(this._self, this._then);

  final _GeocodingResponseDM _self;
  final $Res Function(_GeocodingResponseDM) _then;

  /// Create a copy of GeocodingResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? results = null,
  }) {
    return _then(_GeocodingResponseDM(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProxyStatusEnum,
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResultDM>,
    ));
  }
}

// dart format on
