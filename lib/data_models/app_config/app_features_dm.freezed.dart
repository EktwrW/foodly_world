// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_features_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFeaturesDM {
  /// Controla si la app usa el backend Foodly Places Proxy
  /// (true → nuestro proxy; false → nova_places_api directo).
  /// Default true — asumimos proxy activo; si el backend jamás
  /// respondió (cold start fallido) caemos a modo proxy de todas formas
  /// y, si el proxy falla, el interceptor del repo genera failure que
  /// el caller puede manejar.
  @JsonKey(name: 'places_proxy_enabled')
  bool get placesProxyEnabled;

  /// Kill-switch del feature Group Orders & Split Payments. Default false:
  /// el CTA "Ordenar en grupo" solo se muestra cuando el backend lo
  /// enciende (GROUP_ORDERS_ENABLED=true). Así los pagos in-app no se
  /// exponen antes de estar listos en cada mercado.
  @JsonKey(name: 'group_orders_enabled')
  bool get groupOrdersEnabled;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFeaturesDMCopyWith<AppFeaturesDM> get copyWith =>
      _$AppFeaturesDMCopyWithImpl<AppFeaturesDM>(
          this as AppFeaturesDM, _$identity);

  /// Serializes this AppFeaturesDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFeaturesDM &&
            (identical(other.placesProxyEnabled, placesProxyEnabled) ||
                other.placesProxyEnabled == placesProxyEnabled) &&
            (identical(other.groupOrdersEnabled, groupOrdersEnabled) ||
                other.groupOrdersEnabled == groupOrdersEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placesProxyEnabled, groupOrdersEnabled);

  @override
  String toString() {
    return 'AppFeaturesDM(placesProxyEnabled: $placesProxyEnabled, groupOrdersEnabled: $groupOrdersEnabled)';
  }
}

/// @nodoc
abstract mixin class $AppFeaturesDMCopyWith<$Res> {
  factory $AppFeaturesDMCopyWith(
          AppFeaturesDM value, $Res Function(AppFeaturesDM) _then) =
      _$AppFeaturesDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled,
      @JsonKey(name: 'group_orders_enabled') bool groupOrdersEnabled});
}

/// @nodoc
class _$AppFeaturesDMCopyWithImpl<$Res>
    implements $AppFeaturesDMCopyWith<$Res> {
  _$AppFeaturesDMCopyWithImpl(this._self, this._then);

  final AppFeaturesDM _self;
  final $Res Function(AppFeaturesDM) _then;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placesProxyEnabled = null,
    Object? groupOrdersEnabled = null,
  }) {
    return _then(_self.copyWith(
      placesProxyEnabled: null == placesProxyEnabled
          ? _self.placesProxyEnabled
          : placesProxyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrdersEnabled: null == groupOrdersEnabled
          ? _self.groupOrdersEnabled
          : groupOrdersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppFeaturesDM].
extension AppFeaturesDMPatterns on AppFeaturesDM {
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
    TResult Function(_AppFeaturesDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM() when $default != null:
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
    TResult Function(_AppFeaturesDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM():
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
    TResult? Function(_AppFeaturesDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM() when $default != null:
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
            @JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled,
            @JsonKey(name: 'group_orders_enabled') bool groupOrdersEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM() when $default != null:
        return $default(_that.placesProxyEnabled, _that.groupOrdersEnabled);
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
            @JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled,
            @JsonKey(name: 'group_orders_enabled') bool groupOrdersEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM():
        return $default(_that.placesProxyEnabled, _that.groupOrdersEnabled);
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
            @JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled,
            @JsonKey(name: 'group_orders_enabled') bool groupOrdersEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppFeaturesDM() when $default != null:
        return $default(_that.placesProxyEnabled, _that.groupOrdersEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppFeaturesDM implements AppFeaturesDM {
  const _AppFeaturesDM(
      {@JsonKey(name: 'places_proxy_enabled') this.placesProxyEnabled = true,
      @JsonKey(name: 'group_orders_enabled') this.groupOrdersEnabled = false});
  factory _AppFeaturesDM.fromJson(Map<String, dynamic> json) =>
      _$AppFeaturesDMFromJson(json);

  /// Controla si la app usa el backend Foodly Places Proxy
  /// (true → nuestro proxy; false → nova_places_api directo).
  /// Default true — asumimos proxy activo; si el backend jamás
  /// respondió (cold start fallido) caemos a modo proxy de todas formas
  /// y, si el proxy falla, el interceptor del repo genera failure que
  /// el caller puede manejar.
  @override
  @JsonKey(name: 'places_proxy_enabled')
  final bool placesProxyEnabled;

  /// Kill-switch del feature Group Orders & Split Payments. Default false:
  /// el CTA "Ordenar en grupo" solo se muestra cuando el backend lo
  /// enciende (GROUP_ORDERS_ENABLED=true). Así los pagos in-app no se
  /// exponen antes de estar listos en cada mercado.
  @override
  @JsonKey(name: 'group_orders_enabled')
  final bool groupOrdersEnabled;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFeaturesDMCopyWith<_AppFeaturesDM> get copyWith =>
      __$AppFeaturesDMCopyWithImpl<_AppFeaturesDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppFeaturesDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFeaturesDM &&
            (identical(other.placesProxyEnabled, placesProxyEnabled) ||
                other.placesProxyEnabled == placesProxyEnabled) &&
            (identical(other.groupOrdersEnabled, groupOrdersEnabled) ||
                other.groupOrdersEnabled == groupOrdersEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placesProxyEnabled, groupOrdersEnabled);

  @override
  String toString() {
    return 'AppFeaturesDM(placesProxyEnabled: $placesProxyEnabled, groupOrdersEnabled: $groupOrdersEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AppFeaturesDMCopyWith<$Res>
    implements $AppFeaturesDMCopyWith<$Res> {
  factory _$AppFeaturesDMCopyWith(
          _AppFeaturesDM value, $Res Function(_AppFeaturesDM) _then) =
      __$AppFeaturesDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled,
      @JsonKey(name: 'group_orders_enabled') bool groupOrdersEnabled});
}

/// @nodoc
class __$AppFeaturesDMCopyWithImpl<$Res>
    implements _$AppFeaturesDMCopyWith<$Res> {
  __$AppFeaturesDMCopyWithImpl(this._self, this._then);

  final _AppFeaturesDM _self;
  final $Res Function(_AppFeaturesDM) _then;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placesProxyEnabled = null,
    Object? groupOrdersEnabled = null,
  }) {
    return _then(_AppFeaturesDM(
      placesProxyEnabled: null == placesProxyEnabled
          ? _self.placesProxyEnabled
          : placesProxyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      groupOrdersEnabled: null == groupOrdersEnabled
          ? _self.groupOrdersEnabled
          : groupOrdersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
