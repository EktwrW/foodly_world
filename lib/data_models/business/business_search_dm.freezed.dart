// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_search_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessSearchDM {
  @JsonKey(name: 'business')
  List<BusinessDM> get business;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessSearchDMCopyWith<BusinessSearchDM> get copyWith =>
      _$BusinessSearchDMCopyWithImpl<BusinessSearchDM>(
          this as BusinessSearchDM, _$identity);

  /// Serializes this BusinessSearchDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessSearchDM &&
            const DeepCollectionEquality().equals(other.business, business));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(business));

  @override
  String toString() {
    return 'BusinessSearchDM(business: $business)';
  }
}

/// @nodoc
abstract mixin class $BusinessSearchDMCopyWith<$Res> {
  factory $BusinessSearchDMCopyWith(
          BusinessSearchDM value, $Res Function(BusinessSearchDM) _then) =
      _$BusinessSearchDMCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'business') List<BusinessDM> business});
}

/// @nodoc
class _$BusinessSearchDMCopyWithImpl<$Res>
    implements $BusinessSearchDMCopyWith<$Res> {
  _$BusinessSearchDMCopyWithImpl(this._self, this._then);

  final BusinessSearchDM _self;
  final $Res Function(BusinessSearchDM) _then;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
  }) {
    return _then(_self.copyWith(
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessSearchDM].
extension BusinessSearchDMPatterns on BusinessSearchDM {
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
    TResult Function(_BusinessSearchDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM() when $default != null:
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
    TResult Function(_BusinessSearchDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM():
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
    TResult? Function(_BusinessSearchDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'business') List<BusinessDM> business)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM() when $default != null:
        return $default(_that.business);
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
    TResult Function(@JsonKey(name: 'business') List<BusinessDM> business)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM():
        return $default(_that.business);
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
    TResult? Function(@JsonKey(name: 'business') List<BusinessDM> business)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessSearchDM() when $default != null:
        return $default(_that.business);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessSearchDM implements BusinessSearchDM {
  const _BusinessSearchDM(
      {@JsonKey(name: 'business') required final List<BusinessDM> business})
      : _business = business;
  factory _BusinessSearchDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessSearchDMFromJson(json);

  final List<BusinessDM> _business;
  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business {
    if (_business is EqualUnmodifiableListView) return _business;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_business);
  }

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessSearchDMCopyWith<_BusinessSearchDM> get copyWith =>
      __$BusinessSearchDMCopyWithImpl<_BusinessSearchDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessSearchDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessSearchDM &&
            const DeepCollectionEquality().equals(other._business, _business));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_business));

  @override
  String toString() {
    return 'BusinessSearchDM(business: $business)';
  }
}

/// @nodoc
abstract mixin class _$BusinessSearchDMCopyWith<$Res>
    implements $BusinessSearchDMCopyWith<$Res> {
  factory _$BusinessSearchDMCopyWith(
          _BusinessSearchDM value, $Res Function(_BusinessSearchDM) _then) =
      __$BusinessSearchDMCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'business') List<BusinessDM> business});
}

/// @nodoc
class __$BusinessSearchDMCopyWithImpl<$Res>
    implements _$BusinessSearchDMCopyWith<$Res> {
  __$BusinessSearchDMCopyWithImpl(this._self, this._then);

  final _BusinessSearchDM _self;
  final $Res Function(_BusinessSearchDM) _then;

  /// Create a copy of BusinessSearchDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? business = null,
  }) {
    return _then(_BusinessSearchDM(
      business: null == business
          ? _self._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
    ));
  }
}

// dart format on
