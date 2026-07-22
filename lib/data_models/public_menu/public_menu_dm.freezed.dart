// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_menu_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicMenuResponseDM {
  BusinessDM get business;
  MenuDM get menu;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublicMenuResponseDMCopyWith<PublicMenuResponseDM> get copyWith =>
      _$PublicMenuResponseDMCopyWithImpl<PublicMenuResponseDM>(
          this as PublicMenuResponseDM, _$identity);

  /// Serializes this PublicMenuResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicMenuResponseDM &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, business, menu);

  @override
  String toString() {
    return 'PublicMenuResponseDM(business: $business, menu: $menu)';
  }
}

/// @nodoc
abstract mixin class $PublicMenuResponseDMCopyWith<$Res> {
  factory $PublicMenuResponseDMCopyWith(PublicMenuResponseDM value,
          $Res Function(PublicMenuResponseDM) _then) =
      _$PublicMenuResponseDMCopyWithImpl;
  @useResult
  $Res call({BusinessDM business, MenuDM menu});

  $BusinessDMCopyWith<$Res> get business;
  $MenuDMCopyWith<$Res> get menu;
}

/// @nodoc
class _$PublicMenuResponseDMCopyWithImpl<$Res>
    implements $PublicMenuResponseDMCopyWith<$Res> {
  _$PublicMenuResponseDMCopyWithImpl(this._self, this._then);

  final PublicMenuResponseDM _self;
  final $Res Function(PublicMenuResponseDM) _then;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? menu = null,
  }) {
    return _then(_self.copyWith(
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM,
      menu: null == menu
          ? _self.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res> get business {
    return $BusinessDMCopyWith<$Res>(_self.business, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menu {
    return $MenuDMCopyWith<$Res>(_self.menu, (value) {
      return _then(_self.copyWith(menu: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PublicMenuResponseDM].
extension PublicMenuResponseDMPatterns on PublicMenuResponseDM {
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
    TResult Function(_PublicMenuResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM() when $default != null:
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
    TResult Function(_PublicMenuResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM():
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
    TResult? Function(_PublicMenuResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM() when $default != null:
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
    TResult Function(BusinessDM business, MenuDM menu)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM() when $default != null:
        return $default(_that.business, _that.menu);
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
    TResult Function(BusinessDM business, MenuDM menu) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM():
        return $default(_that.business, _that.menu);
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
    TResult? Function(BusinessDM business, MenuDM menu)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PublicMenuResponseDM() when $default != null:
        return $default(_that.business, _that.menu);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PublicMenuResponseDM implements PublicMenuResponseDM {
  _PublicMenuResponseDM({required this.business, required this.menu});
  factory _PublicMenuResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PublicMenuResponseDMFromJson(json);

  @override
  final BusinessDM business;
  @override
  final MenuDM menu;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublicMenuResponseDMCopyWith<_PublicMenuResponseDM> get copyWith =>
      __$PublicMenuResponseDMCopyWithImpl<_PublicMenuResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublicMenuResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublicMenuResponseDM &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, business, menu);

  @override
  String toString() {
    return 'PublicMenuResponseDM(business: $business, menu: $menu)';
  }
}

/// @nodoc
abstract mixin class _$PublicMenuResponseDMCopyWith<$Res>
    implements $PublicMenuResponseDMCopyWith<$Res> {
  factory _$PublicMenuResponseDMCopyWith(_PublicMenuResponseDM value,
          $Res Function(_PublicMenuResponseDM) _then) =
      __$PublicMenuResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessDM business, MenuDM menu});

  @override
  $BusinessDMCopyWith<$Res> get business;
  @override
  $MenuDMCopyWith<$Res> get menu;
}

/// @nodoc
class __$PublicMenuResponseDMCopyWithImpl<$Res>
    implements _$PublicMenuResponseDMCopyWith<$Res> {
  __$PublicMenuResponseDMCopyWithImpl(this._self, this._then);

  final _PublicMenuResponseDM _self;
  final $Res Function(_PublicMenuResponseDM) _then;

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? business = null,
    Object? menu = null,
  }) {
    return _then(_PublicMenuResponseDM(
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessDM,
      menu: null == menu
          ? _self.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDM,
    ));
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDMCopyWith<$Res> get business {
    return $BusinessDMCopyWith<$Res>(_self.business, (value) {
      return _then(_self.copyWith(business: value));
    });
  }

  /// Create a copy of PublicMenuResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDMCopyWith<$Res> get menu {
    return $MenuDMCopyWith<$Res>(_self.menu, (value) {
      return _then(_self.copyWith(menu: value));
    });
  }
}

// dart format on
