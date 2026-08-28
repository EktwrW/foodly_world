// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_session_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActiveSessionDM {
  String get id;

  /// La sesión desde la que se está mirando la lista. No se puede cerrar
  /// desde aquí: para eso está cerrar sesión.
  bool get current;

  /// `ios`, `android`, `web` o `desktop`. Decide el icono y el título.
  String? get platform;

  /// El modelo CRUDO que devuelve el aparato: `iPhone16,1`, `SM-G991B`.
  /// No es un nombre comercial y no se traduce a uno — esa tabla envejece
  /// con cada dispositivo que sale. Va en la línea de detalle, no de título.
  String? get model;
  @JsonKey(name: 'os_version')
  String? get osVersion;
  @JsonKey(name: 'app_version')
  String? get appVersion;

  /// Cuándo se abrió la sesión. Es lo ÚNICO que se sabe de las anteriores a
  /// esta versión, así que para ellas es el dato que se muestra.
  @JsonKey(name: 'started_at')
  DateTime? get startedAt;

  /// Última actividad. Es el dato con el que uno reconoce una sesión propia
  /// ("sí, ese soy yo esta mañana") o ajena.
  @JsonKey(name: 'last_used_at')
  DateTime? get lastUsedAt;

  /// Create a copy of ActiveSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveSessionDMCopyWith<ActiveSessionDM> get copyWith =>
      _$ActiveSessionDMCopyWithImpl<ActiveSessionDM>(
          this as ActiveSessionDM, _$identity);

  /// Serializes this ActiveSessionDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveSessionDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, current, platform, model,
      osVersion, appVersion, startedAt, lastUsedAt);

  @override
  String toString() {
    return 'ActiveSessionDM(id: $id, current: $current, platform: $platform, model: $model, osVersion: $osVersion, appVersion: $appVersion, startedAt: $startedAt, lastUsedAt: $lastUsedAt)';
  }
}

/// @nodoc
abstract mixin class $ActiveSessionDMCopyWith<$Res> {
  factory $ActiveSessionDMCopyWith(
          ActiveSessionDM value, $Res Function(ActiveSessionDM) _then) =
      _$ActiveSessionDMCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      bool current,
      String? platform,
      String? model,
      @JsonKey(name: 'os_version') String? osVersion,
      @JsonKey(name: 'app_version') String? appVersion,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      @JsonKey(name: 'last_used_at') DateTime? lastUsedAt});
}

/// @nodoc
class _$ActiveSessionDMCopyWithImpl<$Res>
    implements $ActiveSessionDMCopyWith<$Res> {
  _$ActiveSessionDMCopyWithImpl(this._self, this._then);

  final ActiveSessionDM _self;
  final $Res Function(ActiveSessionDM) _then;

  /// Create a copy of ActiveSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? current = null,
    Object? platform = freezed,
    Object? model = freezed,
    Object? osVersion = freezed,
    Object? appVersion = freezed,
    Object? startedAt = freezed,
    Object? lastUsedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _self.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActiveSessionDM].
extension ActiveSessionDMPatterns on ActiveSessionDM {
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
    TResult Function(_ActiveSessionDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM() when $default != null:
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
    TResult Function(_ActiveSessionDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM():
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
    TResult? Function(_ActiveSessionDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM() when $default != null:
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
            String id,
            bool current,
            String? platform,
            String? model,
            @JsonKey(name: 'os_version') String? osVersion,
            @JsonKey(name: 'app_version') String? appVersion,
            @JsonKey(name: 'started_at') DateTime? startedAt,
            @JsonKey(name: 'last_used_at') DateTime? lastUsedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM() when $default != null:
        return $default(
            _that.id,
            _that.current,
            _that.platform,
            _that.model,
            _that.osVersion,
            _that.appVersion,
            _that.startedAt,
            _that.lastUsedAt);
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
            String id,
            bool current,
            String? platform,
            String? model,
            @JsonKey(name: 'os_version') String? osVersion,
            @JsonKey(name: 'app_version') String? appVersion,
            @JsonKey(name: 'started_at') DateTime? startedAt,
            @JsonKey(name: 'last_used_at') DateTime? lastUsedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM():
        return $default(
            _that.id,
            _that.current,
            _that.platform,
            _that.model,
            _that.osVersion,
            _that.appVersion,
            _that.startedAt,
            _that.lastUsedAt);
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
            String id,
            bool current,
            String? platform,
            String? model,
            @JsonKey(name: 'os_version') String? osVersion,
            @JsonKey(name: 'app_version') String? appVersion,
            @JsonKey(name: 'started_at') DateTime? startedAt,
            @JsonKey(name: 'last_used_at') DateTime? lastUsedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionDM() when $default != null:
        return $default(
            _that.id,
            _that.current,
            _that.platform,
            _that.model,
            _that.osVersion,
            _that.appVersion,
            _that.startedAt,
            _that.lastUsedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActiveSessionDM extends ActiveSessionDM {
  const _ActiveSessionDM(
      {required this.id,
      this.current = false,
      this.platform,
      this.model,
      @JsonKey(name: 'os_version') this.osVersion,
      @JsonKey(name: 'app_version') this.appVersion,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'last_used_at') this.lastUsedAt})
      : super._();
  factory _ActiveSessionDM.fromJson(Map<String, dynamic> json) =>
      _$ActiveSessionDMFromJson(json);

  @override
  final String id;

  /// La sesión desde la que se está mirando la lista. No se puede cerrar
  /// desde aquí: para eso está cerrar sesión.
  @override
  @JsonKey()
  final bool current;

  /// `ios`, `android`, `web` o `desktop`. Decide el icono y el título.
  @override
  final String? platform;

  /// El modelo CRUDO que devuelve el aparato: `iPhone16,1`, `SM-G991B`.
  /// No es un nombre comercial y no se traduce a uno — esa tabla envejece
  /// con cada dispositivo que sale. Va en la línea de detalle, no de título.
  @override
  final String? model;
  @override
  @JsonKey(name: 'os_version')
  final String? osVersion;
  @override
  @JsonKey(name: 'app_version')
  final String? appVersion;

  /// Cuándo se abrió la sesión. Es lo ÚNICO que se sabe de las anteriores a
  /// esta versión, así que para ellas es el dato que se muestra.
  @override
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;

  /// Última actividad. Es el dato con el que uno reconoce una sesión propia
  /// ("sí, ese soy yo esta mañana") o ajena.
  @override
  @JsonKey(name: 'last_used_at')
  final DateTime? lastUsedAt;

  /// Create a copy of ActiveSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActiveSessionDMCopyWith<_ActiveSessionDM> get copyWith =>
      __$ActiveSessionDMCopyWithImpl<_ActiveSessionDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActiveSessionDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveSessionDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, current, platform, model,
      osVersion, appVersion, startedAt, lastUsedAt);

  @override
  String toString() {
    return 'ActiveSessionDM(id: $id, current: $current, platform: $platform, model: $model, osVersion: $osVersion, appVersion: $appVersion, startedAt: $startedAt, lastUsedAt: $lastUsedAt)';
  }
}

/// @nodoc
abstract mixin class _$ActiveSessionDMCopyWith<$Res>
    implements $ActiveSessionDMCopyWith<$Res> {
  factory _$ActiveSessionDMCopyWith(
          _ActiveSessionDM value, $Res Function(_ActiveSessionDM) _then) =
      __$ActiveSessionDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      bool current,
      String? platform,
      String? model,
      @JsonKey(name: 'os_version') String? osVersion,
      @JsonKey(name: 'app_version') String? appVersion,
      @JsonKey(name: 'started_at') DateTime? startedAt,
      @JsonKey(name: 'last_used_at') DateTime? lastUsedAt});
}

/// @nodoc
class __$ActiveSessionDMCopyWithImpl<$Res>
    implements _$ActiveSessionDMCopyWith<$Res> {
  __$ActiveSessionDMCopyWithImpl(this._self, this._then);

  final _ActiveSessionDM _self;
  final $Res Function(_ActiveSessionDM) _then;

  /// Create a copy of ActiveSessionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? current = null,
    Object? platform = freezed,
    Object? model = freezed,
    Object? osVersion = freezed,
    Object? appVersion = freezed,
    Object? startedAt = freezed,
    Object? lastUsedAt = freezed,
  }) {
    return _then(_ActiveSessionDM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: freezed == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _self.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ActiveSessionsDM {
  List<ActiveSessionDM> get sessions;
  int get max;

  /// Create a copy of ActiveSessionsDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveSessionsDMCopyWith<ActiveSessionsDM> get copyWith =>
      _$ActiveSessionsDMCopyWithImpl<ActiveSessionsDM>(
          this as ActiveSessionsDM, _$identity);

  /// Serializes this ActiveSessionsDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveSessionsDM &&
            const DeepCollectionEquality().equals(other.sessions, sessions) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(sessions), max);

  @override
  String toString() {
    return 'ActiveSessionsDM(sessions: $sessions, max: $max)';
  }
}

/// @nodoc
abstract mixin class $ActiveSessionsDMCopyWith<$Res> {
  factory $ActiveSessionsDMCopyWith(
          ActiveSessionsDM value, $Res Function(ActiveSessionsDM) _then) =
      _$ActiveSessionsDMCopyWithImpl;
  @useResult
  $Res call({List<ActiveSessionDM> sessions, int max});
}

/// @nodoc
class _$ActiveSessionsDMCopyWithImpl<$Res>
    implements $ActiveSessionsDMCopyWith<$Res> {
  _$ActiveSessionsDMCopyWithImpl(this._self, this._then);

  final ActiveSessionsDM _self;
  final $Res Function(ActiveSessionsDM) _then;

  /// Create a copy of ActiveSessionsDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? max = null,
  }) {
    return _then(_self.copyWith(
      sessions: null == sessions
          ? _self.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<ActiveSessionDM>,
      max: null == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActiveSessionsDM].
extension ActiveSessionsDMPatterns on ActiveSessionsDM {
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
    TResult Function(_ActiveSessionsDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM() when $default != null:
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
    TResult Function(_ActiveSessionsDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM():
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
    TResult? Function(_ActiveSessionsDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM() when $default != null:
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
    TResult Function(List<ActiveSessionDM> sessions, int max)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM() when $default != null:
        return $default(_that.sessions, _that.max);
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
    TResult Function(List<ActiveSessionDM> sessions, int max) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM():
        return $default(_that.sessions, _that.max);
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
    TResult? Function(List<ActiveSessionDM> sessions, int max)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActiveSessionsDM() when $default != null:
        return $default(_that.sessions, _that.max);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActiveSessionsDM implements ActiveSessionsDM {
  const _ActiveSessionsDM(
      {final List<ActiveSessionDM> sessions = const <ActiveSessionDM>[],
      this.max = 6})
      : _sessions = sessions;
  factory _ActiveSessionsDM.fromJson(Map<String, dynamic> json) =>
      _$ActiveSessionsDMFromJson(json);

  final List<ActiveSessionDM> _sessions;
  @override
  @JsonKey()
  List<ActiveSessionDM> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  @JsonKey()
  final int max;

  /// Create a copy of ActiveSessionsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActiveSessionsDMCopyWith<_ActiveSessionsDM> get copyWith =>
      __$ActiveSessionsDMCopyWithImpl<_ActiveSessionsDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActiveSessionsDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveSessionsDM &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sessions), max);

  @override
  String toString() {
    return 'ActiveSessionsDM(sessions: $sessions, max: $max)';
  }
}

/// @nodoc
abstract mixin class _$ActiveSessionsDMCopyWith<$Res>
    implements $ActiveSessionsDMCopyWith<$Res> {
  factory _$ActiveSessionsDMCopyWith(
          _ActiveSessionsDM value, $Res Function(_ActiveSessionsDM) _then) =
      __$ActiveSessionsDMCopyWithImpl;
  @override
  @useResult
  $Res call({List<ActiveSessionDM> sessions, int max});
}

/// @nodoc
class __$ActiveSessionsDMCopyWithImpl<$Res>
    implements _$ActiveSessionsDMCopyWith<$Res> {
  __$ActiveSessionsDMCopyWithImpl(this._self, this._then);

  final _ActiveSessionsDM _self;
  final $Res Function(_ActiveSessionsDM) _then;

  /// Create a copy of ActiveSessionsDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessions = null,
    Object? max = null,
  }) {
    return _then(_ActiveSessionsDM(
      sessions: null == sessions
          ? _self._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<ActiveSessionDM>,
      max: null == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
