// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_package_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicePackagesResponseDM {
  bool get success;
  @JsonKey(name: 'service_packages')
  List<ServicePackageDM> get servicePackages;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackagesResponseDMCopyWith<ServicePackagesResponseDM> get copyWith =>
      _$ServicePackagesResponseDMCopyWithImpl<ServicePackagesResponseDM>(
          this as ServicePackagesResponseDM, _$identity);

  /// Serializes this ServicePackagesResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackagesResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other.servicePackages, servicePackages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(servicePackages));

  @override
  String toString() {
    return 'ServicePackagesResponseDM(success: $success, servicePackages: $servicePackages)';
  }
}

/// @nodoc
abstract mixin class $ServicePackagesResponseDMCopyWith<$Res> {
  factory $ServicePackagesResponseDMCopyWith(ServicePackagesResponseDM value,
          $Res Function(ServicePackagesResponseDM) _then) =
      _$ServicePackagesResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'service_packages')
      List<ServicePackageDM> servicePackages});
}

/// @nodoc
class _$ServicePackagesResponseDMCopyWithImpl<$Res>
    implements $ServicePackagesResponseDMCopyWith<$Res> {
  _$ServicePackagesResponseDMCopyWithImpl(this._self, this._then);

  final ServicePackagesResponseDM _self;
  final $Res Function(ServicePackagesResponseDM) _then;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? servicePackages = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      servicePackages: null == servicePackages
          ? _self.servicePackages
          : servicePackages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServicePackagesResponseDM].
extension ServicePackagesResponseDMPatterns on ServicePackagesResponseDM {
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
    TResult Function(_ServicePackagesResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM() when $default != null:
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
    TResult Function(_ServicePackagesResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM():
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
    TResult? Function(_ServicePackagesResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM() when $default != null:
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
            bool success,
            @JsonKey(name: 'service_packages')
            List<ServicePackageDM> servicePackages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM() when $default != null:
        return $default(_that.success, _that.servicePackages);
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
            bool success,
            @JsonKey(name: 'service_packages')
            List<ServicePackageDM> servicePackages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM():
        return $default(_that.success, _that.servicePackages);
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
            bool success,
            @JsonKey(name: 'service_packages')
            List<ServicePackageDM> servicePackages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesResponseDM() when $default != null:
        return $default(_that.success, _that.servicePackages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServicePackagesResponseDM implements ServicePackagesResponseDM {
  const _ServicePackagesResponseDM(
      {this.success = false,
      @JsonKey(name: 'service_packages')
      final List<ServicePackageDM> servicePackages = const []})
      : _servicePackages = servicePackages;
  factory _ServicePackagesResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ServicePackagesResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<ServicePackageDM> _servicePackages;
  @override
  @JsonKey(name: 'service_packages')
  List<ServicePackageDM> get servicePackages {
    if (_servicePackages is EqualUnmodifiableListView) return _servicePackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicePackages);
  }

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicePackagesResponseDMCopyWith<_ServicePackagesResponseDM>
      get copyWith =>
          __$ServicePackagesResponseDMCopyWithImpl<_ServicePackagesResponseDM>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServicePackagesResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicePackagesResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._servicePackages, _servicePackages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_servicePackages));

  @override
  String toString() {
    return 'ServicePackagesResponseDM(success: $success, servicePackages: $servicePackages)';
  }
}

/// @nodoc
abstract mixin class _$ServicePackagesResponseDMCopyWith<$Res>
    implements $ServicePackagesResponseDMCopyWith<$Res> {
  factory _$ServicePackagesResponseDMCopyWith(_ServicePackagesResponseDM value,
          $Res Function(_ServicePackagesResponseDM) _then) =
      __$ServicePackagesResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'service_packages')
      List<ServicePackageDM> servicePackages});
}

/// @nodoc
class __$ServicePackagesResponseDMCopyWithImpl<$Res>
    implements _$ServicePackagesResponseDMCopyWith<$Res> {
  __$ServicePackagesResponseDMCopyWithImpl(this._self, this._then);

  final _ServicePackagesResponseDM _self;
  final $Res Function(_ServicePackagesResponseDM) _then;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? servicePackages = null,
  }) {
    return _then(_ServicePackagesResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      servicePackages: null == servicePackages
          ? _self._servicePackages
          : servicePackages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
    ));
  }
}

/// @nodoc
mixin _$ServicePackageActionResponseDM {
  bool get success;
  String get message;
  @JsonKey(name: 'service_package')
  ServicePackageDM? get servicePackage;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackageActionResponseDMCopyWith<ServicePackageActionResponseDM>
      get copyWith => _$ServicePackageActionResponseDMCopyWithImpl<
              ServicePackageActionResponseDM>(
          this as ServicePackageActionResponseDM, _$identity);

  /// Serializes this ServicePackageActionResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackageActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.servicePackage, servicePackage) ||
                other.servicePackage == servicePackage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, servicePackage);

  @override
  String toString() {
    return 'ServicePackageActionResponseDM(success: $success, message: $message, servicePackage: $servicePackage)';
  }
}

/// @nodoc
abstract mixin class $ServicePackageActionResponseDMCopyWith<$Res> {
  factory $ServicePackageActionResponseDMCopyWith(
          ServicePackageActionResponseDM value,
          $Res Function(ServicePackageActionResponseDM) _then) =
      _$ServicePackageActionResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'service_package') ServicePackageDM? servicePackage});

  $ServicePackageDMCopyWith<$Res>? get servicePackage;
}

/// @nodoc
class _$ServicePackageActionResponseDMCopyWithImpl<$Res>
    implements $ServicePackageActionResponseDMCopyWith<$Res> {
  _$ServicePackageActionResponseDMCopyWithImpl(this._self, this._then);

  final ServicePackageActionResponseDM _self;
  final $Res Function(ServicePackageActionResponseDM) _then;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? servicePackage = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      servicePackage: freezed == servicePackage
          ? _self.servicePackage
          : servicePackage // ignore: cast_nullable_to_non_nullable
              as ServicePackageDM?,
    ));
  }

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackageDMCopyWith<$Res>? get servicePackage {
    if (_self.servicePackage == null) {
      return null;
    }

    return $ServicePackageDMCopyWith<$Res>(_self.servicePackage!, (value) {
      return _then(_self.copyWith(servicePackage: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServicePackageActionResponseDM].
extension ServicePackageActionResponseDMPatterns
    on ServicePackageActionResponseDM {
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
    TResult Function(_ServicePackageActionResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM() when $default != null:
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
    TResult Function(_ServicePackageActionResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM():
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
    TResult? Function(_ServicePackageActionResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM() when $default != null:
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
    TResult Function(bool success, String message,
            @JsonKey(name: 'service_package') ServicePackageDM? servicePackage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.servicePackage);
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
    TResult Function(bool success, String message,
            @JsonKey(name: 'service_package') ServicePackageDM? servicePackage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM():
        return $default(_that.success, _that.message, _that.servicePackage);
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
    TResult? Function(bool success, String message,
            @JsonKey(name: 'service_package') ServicePackageDM? servicePackage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageActionResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.servicePackage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServicePackageActionResponseDM
    implements ServicePackageActionResponseDM {
  const _ServicePackageActionResponseDM(
      {this.success = false,
      this.message = '',
      @JsonKey(name: 'service_package') this.servicePackage});
  factory _ServicePackageActionResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ServicePackageActionResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'service_package')
  final ServicePackageDM? servicePackage;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicePackageActionResponseDMCopyWith<_ServicePackageActionResponseDM>
      get copyWith => __$ServicePackageActionResponseDMCopyWithImpl<
          _ServicePackageActionResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServicePackageActionResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicePackageActionResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.servicePackage, servicePackage) ||
                other.servicePackage == servicePackage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, servicePackage);

  @override
  String toString() {
    return 'ServicePackageActionResponseDM(success: $success, message: $message, servicePackage: $servicePackage)';
  }
}

/// @nodoc
abstract mixin class _$ServicePackageActionResponseDMCopyWith<$Res>
    implements $ServicePackageActionResponseDMCopyWith<$Res> {
  factory _$ServicePackageActionResponseDMCopyWith(
          _ServicePackageActionResponseDM value,
          $Res Function(_ServicePackageActionResponseDM) _then) =
      __$ServicePackageActionResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'service_package') ServicePackageDM? servicePackage});

  @override
  $ServicePackageDMCopyWith<$Res>? get servicePackage;
}

/// @nodoc
class __$ServicePackageActionResponseDMCopyWithImpl<$Res>
    implements _$ServicePackageActionResponseDMCopyWith<$Res> {
  __$ServicePackageActionResponseDMCopyWithImpl(this._self, this._then);

  final _ServicePackageActionResponseDM _self;
  final $Res Function(_ServicePackageActionResponseDM) _then;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? servicePackage = freezed,
  }) {
    return _then(_ServicePackageActionResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      servicePackage: freezed == servicePackage
          ? _self.servicePackage
          : servicePackage // ignore: cast_nullable_to_non_nullable
              as ServicePackageDM?,
    ));
  }

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackageDMCopyWith<$Res>? get servicePackage {
    if (_self.servicePackage == null) {
      return null;
    }

    return $ServicePackageDMCopyWith<$Res>(_self.servicePackage!, (value) {
      return _then(_self.copyWith(servicePackage: value));
    });
  }
}

/// @nodoc
mixin _$GenericSuccessResponseDM {
  bool get success;
  String get message;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenericSuccessResponseDMCopyWith<GenericSuccessResponseDM> get copyWith =>
      _$GenericSuccessResponseDMCopyWithImpl<GenericSuccessResponseDM>(
          this as GenericSuccessResponseDM, _$identity);

  /// Serializes this GenericSuccessResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenericSuccessResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  @override
  String toString() {
    return 'GenericSuccessResponseDM(success: $success, message: $message)';
  }
}

/// @nodoc
abstract mixin class $GenericSuccessResponseDMCopyWith<$Res> {
  factory $GenericSuccessResponseDMCopyWith(GenericSuccessResponseDM value,
          $Res Function(GenericSuccessResponseDM) _then) =
      _$GenericSuccessResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$GenericSuccessResponseDMCopyWithImpl<$Res>
    implements $GenericSuccessResponseDMCopyWith<$Res> {
  _$GenericSuccessResponseDMCopyWithImpl(this._self, this._then);

  final GenericSuccessResponseDM _self;
  final $Res Function(GenericSuccessResponseDM) _then;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [GenericSuccessResponseDM].
extension GenericSuccessResponseDMPatterns on GenericSuccessResponseDM {
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
    TResult Function(_GenericSuccessResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM() when $default != null:
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
    TResult Function(_GenericSuccessResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM():
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
    TResult? Function(_GenericSuccessResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM() when $default != null:
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
    TResult Function(bool success, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM() when $default != null:
        return $default(_that.success, _that.message);
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
    TResult Function(bool success, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM():
        return $default(_that.success, _that.message);
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
    TResult? Function(bool success, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenericSuccessResponseDM() when $default != null:
        return $default(_that.success, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GenericSuccessResponseDM implements GenericSuccessResponseDM {
  const _GenericSuccessResponseDM({this.success = false, this.message = ''});
  factory _GenericSuccessResponseDM.fromJson(Map<String, dynamic> json) =>
      _$GenericSuccessResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenericSuccessResponseDMCopyWith<_GenericSuccessResponseDM> get copyWith =>
      __$GenericSuccessResponseDMCopyWithImpl<_GenericSuccessResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenericSuccessResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenericSuccessResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  @override
  String toString() {
    return 'GenericSuccessResponseDM(success: $success, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$GenericSuccessResponseDMCopyWith<$Res>
    implements $GenericSuccessResponseDMCopyWith<$Res> {
  factory _$GenericSuccessResponseDMCopyWith(_GenericSuccessResponseDM value,
          $Res Function(_GenericSuccessResponseDM) _then) =
      __$GenericSuccessResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$GenericSuccessResponseDMCopyWithImpl<$Res>
    implements _$GenericSuccessResponseDMCopyWith<$Res> {
  __$GenericSuccessResponseDMCopyWithImpl(this._self, this._then);

  final _GenericSuccessResponseDM _self;
  final $Res Function(_GenericSuccessResponseDM) _then;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_GenericSuccessResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PhotoUploadResponseDM {
  bool get success;
  String get message;
  List<ServicePackagePhotoDM> get photos;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PhotoUploadResponseDMCopyWith<PhotoUploadResponseDM> get copyWith =>
      _$PhotoUploadResponseDMCopyWithImpl<PhotoUploadResponseDM>(
          this as PhotoUploadResponseDM, _$identity);

  /// Serializes this PhotoUploadResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhotoUploadResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.photos, photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(photos));

  @override
  String toString() {
    return 'PhotoUploadResponseDM(success: $success, message: $message, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class $PhotoUploadResponseDMCopyWith<$Res> {
  factory $PhotoUploadResponseDMCopyWith(PhotoUploadResponseDM value,
          $Res Function(PhotoUploadResponseDM) _then) =
      _$PhotoUploadResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, List<ServicePackagePhotoDM> photos});
}

/// @nodoc
class _$PhotoUploadResponseDMCopyWithImpl<$Res>
    implements $PhotoUploadResponseDMCopyWith<$Res> {
  _$PhotoUploadResponseDMCopyWithImpl(this._self, this._then);

  final PhotoUploadResponseDM _self;
  final $Res Function(PhotoUploadResponseDM) _then;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? photos = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PhotoUploadResponseDM].
extension PhotoUploadResponseDMPatterns on PhotoUploadResponseDM {
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
    TResult Function(_PhotoUploadResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM() when $default != null:
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
    TResult Function(_PhotoUploadResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM():
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
    TResult? Function(_PhotoUploadResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM() when $default != null:
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
            bool success, String message, List<ServicePackagePhotoDM> photos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.photos);
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
            bool success, String message, List<ServicePackagePhotoDM> photos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM():
        return $default(_that.success, _that.message, _that.photos);
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
            bool success, String message, List<ServicePackagePhotoDM> photos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PhotoUploadResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.photos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PhotoUploadResponseDM implements PhotoUploadResponseDM {
  const _PhotoUploadResponseDM(
      {this.success = false,
      this.message = '',
      final List<ServicePackagePhotoDM> photos = const []})
      : _photos = photos;
  factory _PhotoUploadResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PhotoUploadResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  final List<ServicePackagePhotoDM> _photos;
  @override
  @JsonKey()
  List<ServicePackagePhotoDM> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoUploadResponseDMCopyWith<_PhotoUploadResponseDM> get copyWith =>
      __$PhotoUploadResponseDMCopyWithImpl<_PhotoUploadResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PhotoUploadResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoUploadResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_photos));

  @override
  String toString() {
    return 'PhotoUploadResponseDM(success: $success, message: $message, photos: $photos)';
  }
}

/// @nodoc
abstract mixin class _$PhotoUploadResponseDMCopyWith<$Res>
    implements $PhotoUploadResponseDMCopyWith<$Res> {
  factory _$PhotoUploadResponseDMCopyWith(_PhotoUploadResponseDM value,
          $Res Function(_PhotoUploadResponseDM) _then) =
      __$PhotoUploadResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, List<ServicePackagePhotoDM> photos});
}

/// @nodoc
class __$PhotoUploadResponseDMCopyWithImpl<$Res>
    implements _$PhotoUploadResponseDMCopyWith<$Res> {
  __$PhotoUploadResponseDMCopyWithImpl(this._self, this._then);

  final _PhotoUploadResponseDM _self;
  final $Res Function(_PhotoUploadResponseDM) _then;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? photos = null,
  }) {
    return _then(_PhotoUploadResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
    ));
  }
}

/// @nodoc
mixin _$ServicePackageDM {
  int? get id;
  String? get uuid;
  @JsonKey(name: 'business_id')
  int? get businessId;
  String get title;
  String? get description;
  @JsonKey(name: 'service_type')
  ServiceType get serviceType;
  @JsonKey(name: 'price_type')
  PriceType get priceType;
  @JsonKey(fromJson: _doubleFromJson)
  double? get price;
  String? get currency;
  @JsonKey(name: 'min_guests')
  int? get minGuests;
  @JsonKey(name: 'max_guests')
  int? get maxGuests;
  @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
  double? get durationHours;
  List<String> get includes;
  @JsonKey(name: 'add_ons')
  List<String> get addOns;
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  List<ServicePackagePhotoDM> get photos;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackageDMCopyWith<ServicePackageDM> get copyWith =>
      _$ServicePackageDMCopyWithImpl<ServicePackageDM>(
          this as ServicePackageDM, _$identity);

  /// Serializes this ServicePackageDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackageDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minGuests, minGuests) ||
                other.minGuests == minGuests) &&
            (identical(other.maxGuests, maxGuests) ||
                other.maxGuests == maxGuests) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            const DeepCollectionEquality().equals(other.includes, includes) &&
            const DeepCollectionEquality().equals(other.addOns, addOns) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        businessId,
        title,
        description,
        serviceType,
        priceType,
        price,
        currency,
        minGuests,
        maxGuests,
        durationHours,
        const DeepCollectionEquality().hash(includes),
        const DeepCollectionEquality().hash(addOns),
        isFeatured,
        isActive,
        sortOrder,
        const DeepCollectionEquality().hash(photos),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ServicePackageDM(id: $id, uuid: $uuid, businessId: $businessId, title: $title, description: $description, serviceType: $serviceType, priceType: $priceType, price: $price, currency: $currency, minGuests: $minGuests, maxGuests: $maxGuests, durationHours: $durationHours, includes: $includes, addOns: $addOns, isFeatured: $isFeatured, isActive: $isActive, sortOrder: $sortOrder, photos: $photos, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ServicePackageDMCopyWith<$Res> {
  factory $ServicePackageDMCopyWith(
          ServicePackageDM value, $Res Function(ServicePackageDM) _then) =
      _$ServicePackageDMCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      String title,
      String? description,
      @JsonKey(name: 'service_type') ServiceType serviceType,
      @JsonKey(name: 'price_type') PriceType priceType,
      @JsonKey(fromJson: _doubleFromJson) double? price,
      String? currency,
      @JsonKey(name: 'min_guests') int? minGuests,
      @JsonKey(name: 'max_guests') int? maxGuests,
      @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
      double? durationHours,
      List<String> includes,
      @JsonKey(name: 'add_ons') List<String> addOns,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'sort_order') int sortOrder,
      List<ServicePackagePhotoDM> photos,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ServicePackageDMCopyWithImpl<$Res>
    implements $ServicePackageDMCopyWith<$Res> {
  _$ServicePackageDMCopyWithImpl(this._self, this._then);

  final ServicePackageDM _self;
  final $Res Function(ServicePackageDM) _then;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? serviceType = null,
    Object? priceType = null,
    Object? price = freezed,
    Object? currency = freezed,
    Object? minGuests = freezed,
    Object? maxGuests = freezed,
    Object? durationHours = freezed,
    Object? includes = null,
    Object? addOns = null,
    Object? isFeatured = null,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? photos = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      priceType: null == priceType
          ? _self.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      minGuests: freezed == minGuests
          ? _self.minGuests
          : minGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      maxGuests: freezed == maxGuests
          ? _self.maxGuests
          : maxGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      includes: null == includes
          ? _self.includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOns: null == addOns
          ? _self.addOns
          : addOns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServicePackageDM].
extension ServicePackageDMPatterns on ServicePackageDM {
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
    TResult Function(_ServicePackageDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM() when $default != null:
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
    TResult Function(_ServicePackageDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM():
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
    TResult? Function(_ServicePackageDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM() when $default != null:
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            String title,
            String? description,
            @JsonKey(name: 'service_type') ServiceType serviceType,
            @JsonKey(name: 'price_type') PriceType priceType,
            @JsonKey(fromJson: _doubleFromJson) double? price,
            String? currency,
            @JsonKey(name: 'min_guests') int? minGuests,
            @JsonKey(name: 'max_guests') int? maxGuests,
            @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
            double? durationHours,
            List<String> includes,
            @JsonKey(name: 'add_ons') List<String> addOns,
            @JsonKey(name: 'is_featured') bool isFeatured,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ServicePackagePhotoDM> photos,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.title,
            _that.description,
            _that.serviceType,
            _that.priceType,
            _that.price,
            _that.currency,
            _that.minGuests,
            _that.maxGuests,
            _that.durationHours,
            _that.includes,
            _that.addOns,
            _that.isFeatured,
            _that.isActive,
            _that.sortOrder,
            _that.photos,
            _that.createdAt,
            _that.updatedAt);
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            String title,
            String? description,
            @JsonKey(name: 'service_type') ServiceType serviceType,
            @JsonKey(name: 'price_type') PriceType priceType,
            @JsonKey(fromJson: _doubleFromJson) double? price,
            String? currency,
            @JsonKey(name: 'min_guests') int? minGuests,
            @JsonKey(name: 'max_guests') int? maxGuests,
            @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
            double? durationHours,
            List<String> includes,
            @JsonKey(name: 'add_ons') List<String> addOns,
            @JsonKey(name: 'is_featured') bool isFeatured,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ServicePackagePhotoDM> photos,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM():
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.title,
            _that.description,
            _that.serviceType,
            _that.priceType,
            _that.price,
            _that.currency,
            _that.minGuests,
            _that.maxGuests,
            _that.durationHours,
            _that.includes,
            _that.addOns,
            _that.isFeatured,
            _that.isActive,
            _that.sortOrder,
            _that.photos,
            _that.createdAt,
            _that.updatedAt);
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
            int? id,
            String? uuid,
            @JsonKey(name: 'business_id') int? businessId,
            String title,
            String? description,
            @JsonKey(name: 'service_type') ServiceType serviceType,
            @JsonKey(name: 'price_type') PriceType priceType,
            @JsonKey(fromJson: _doubleFromJson) double? price,
            String? currency,
            @JsonKey(name: 'min_guests') int? minGuests,
            @JsonKey(name: 'max_guests') int? maxGuests,
            @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
            double? durationHours,
            List<String> includes,
            @JsonKey(name: 'add_ons') List<String> addOns,
            @JsonKey(name: 'is_featured') bool isFeatured,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'sort_order') int sortOrder,
            List<ServicePackagePhotoDM> photos,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackageDM() when $default != null:
        return $default(
            _that.id,
            _that.uuid,
            _that.businessId,
            _that.title,
            _that.description,
            _that.serviceType,
            _that.priceType,
            _that.price,
            _that.currency,
            _that.minGuests,
            _that.maxGuests,
            _that.durationHours,
            _that.includes,
            _that.addOns,
            _that.isFeatured,
            _that.isActive,
            _that.sortOrder,
            _that.photos,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServicePackageDM extends ServicePackageDM {
  const _ServicePackageDM(
      {this.id,
      this.uuid,
      @JsonKey(name: 'business_id') this.businessId,
      this.title = '',
      this.description,
      @JsonKey(name: 'service_type') this.serviceType = ServiceType.custom,
      @JsonKey(name: 'price_type') this.priceType = PriceType.onQuote,
      @JsonKey(fromJson: _doubleFromJson) this.price,
      this.currency,
      @JsonKey(name: 'min_guests') this.minGuests,
      @JsonKey(name: 'max_guests') this.maxGuests,
      @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
      this.durationHours,
      final List<String> includes = const [],
      @JsonKey(name: 'add_ons') final List<String> addOns = const [],
      @JsonKey(name: 'is_featured') this.isFeatured = false,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'sort_order') this.sortOrder = 0,
      final List<ServicePackagePhotoDM> photos = const [],
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _includes = includes,
        _addOns = addOns,
        _photos = photos,
        super._();
  factory _ServicePackageDM.fromJson(Map<String, dynamic> json) =>
      _$ServicePackageDMFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  @JsonKey(name: 'business_id')
  final int? businessId;
  @override
  @JsonKey()
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'service_type')
  final ServiceType serviceType;
  @override
  @JsonKey(name: 'price_type')
  final PriceType priceType;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? price;
  @override
  final String? currency;
  @override
  @JsonKey(name: 'min_guests')
  final int? minGuests;
  @override
  @JsonKey(name: 'max_guests')
  final int? maxGuests;
  @override
  @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
  final double? durationHours;
  final List<String> _includes;
  @override
  @JsonKey()
  List<String> get includes {
    if (_includes is EqualUnmodifiableListView) return _includes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_includes);
  }

  final List<String> _addOns;
  @override
  @JsonKey(name: 'add_ons')
  List<String> get addOns {
    if (_addOns is EqualUnmodifiableListView) return _addOns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOns);
  }

  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  final List<ServicePackagePhotoDM> _photos;
  @override
  @JsonKey()
  List<ServicePackagePhotoDM> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicePackageDMCopyWith<_ServicePackageDM> get copyWith =>
      __$ServicePackageDMCopyWithImpl<_ServicePackageDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServicePackageDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicePackageDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minGuests, minGuests) ||
                other.minGuests == minGuests) &&
            (identical(other.maxGuests, maxGuests) ||
                other.maxGuests == maxGuests) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            const DeepCollectionEquality().equals(other._includes, _includes) &&
            const DeepCollectionEquality().equals(other._addOns, _addOns) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        businessId,
        title,
        description,
        serviceType,
        priceType,
        price,
        currency,
        minGuests,
        maxGuests,
        durationHours,
        const DeepCollectionEquality().hash(_includes),
        const DeepCollectionEquality().hash(_addOns),
        isFeatured,
        isActive,
        sortOrder,
        const DeepCollectionEquality().hash(_photos),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ServicePackageDM(id: $id, uuid: $uuid, businessId: $businessId, title: $title, description: $description, serviceType: $serviceType, priceType: $priceType, price: $price, currency: $currency, minGuests: $minGuests, maxGuests: $maxGuests, durationHours: $durationHours, includes: $includes, addOns: $addOns, isFeatured: $isFeatured, isActive: $isActive, sortOrder: $sortOrder, photos: $photos, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ServicePackageDMCopyWith<$Res>
    implements $ServicePackageDMCopyWith<$Res> {
  factory _$ServicePackageDMCopyWith(
          _ServicePackageDM value, $Res Function(_ServicePackageDM) _then) =
      __$ServicePackageDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      String title,
      String? description,
      @JsonKey(name: 'service_type') ServiceType serviceType,
      @JsonKey(name: 'price_type') PriceType priceType,
      @JsonKey(fromJson: _doubleFromJson) double? price,
      String? currency,
      @JsonKey(name: 'min_guests') int? minGuests,
      @JsonKey(name: 'max_guests') int? maxGuests,
      @JsonKey(name: 'duration_hours', fromJson: _doubleFromJson)
      double? durationHours,
      List<String> includes,
      @JsonKey(name: 'add_ons') List<String> addOns,
      @JsonKey(name: 'is_featured') bool isFeatured,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'sort_order') int sortOrder,
      List<ServicePackagePhotoDM> photos,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$ServicePackageDMCopyWithImpl<$Res>
    implements _$ServicePackageDMCopyWith<$Res> {
  __$ServicePackageDMCopyWithImpl(this._self, this._then);

  final _ServicePackageDM _self;
  final $Res Function(_ServicePackageDM) _then;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? businessId = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? serviceType = null,
    Object? priceType = null,
    Object? price = freezed,
    Object? currency = freezed,
    Object? minGuests = freezed,
    Object? maxGuests = freezed,
    Object? durationHours = freezed,
    Object? includes = null,
    Object? addOns = null,
    Object? isFeatured = null,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? photos = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ServicePackageDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      priceType: null == priceType
          ? _self.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      minGuests: freezed == minGuests
          ? _self.minGuests
          : minGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      maxGuests: freezed == maxGuests
          ? _self.maxGuests
          : maxGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      includes: null == includes
          ? _self._includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOns: null == addOns
          ? _self._addOns
          : addOns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ServicePackagePhotoDM {
  int? get id;
  String? get uuid;
  @JsonKey(name: 'service_package_id')
  int? get servicePackageId;
  @JsonKey(name: 'photo_path')
  String? get photoPath;
  @JsonKey(name: 'sort_order')
  int get sortOrder;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackagePhotoDMCopyWith<ServicePackagePhotoDM> get copyWith =>
      _$ServicePackagePhotoDMCopyWithImpl<ServicePackagePhotoDM>(
          this as ServicePackagePhotoDM, _$identity);

  /// Serializes this ServicePackagePhotoDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackagePhotoDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.servicePackageId, servicePackageId) ||
                other.servicePackageId == servicePackageId) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uuid, servicePackageId, photoPath, sortOrder);

  @override
  String toString() {
    return 'ServicePackagePhotoDM(id: $id, uuid: $uuid, servicePackageId: $servicePackageId, photoPath: $photoPath, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class $ServicePackagePhotoDMCopyWith<$Res> {
  factory $ServicePackagePhotoDMCopyWith(ServicePackagePhotoDM value,
          $Res Function(ServicePackagePhotoDM) _then) =
      _$ServicePackagePhotoDMCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'service_package_id') int? servicePackageId,
      @JsonKey(name: 'photo_path') String? photoPath,
      @JsonKey(name: 'sort_order') int sortOrder});
}

/// @nodoc
class _$ServicePackagePhotoDMCopyWithImpl<$Res>
    implements $ServicePackagePhotoDMCopyWith<$Res> {
  _$ServicePackagePhotoDMCopyWithImpl(this._self, this._then);

  final ServicePackagePhotoDM _self;
  final $Res Function(ServicePackagePhotoDM) _then;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? servicePackageId = freezed,
    Object? photoPath = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageId: freezed == servicePackageId
          ? _self.servicePackageId
          : servicePackageId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _self.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServicePackagePhotoDM].
extension ServicePackagePhotoDMPatterns on ServicePackagePhotoDM {
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
    TResult Function(_ServicePackagePhotoDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM() when $default != null:
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
    TResult Function(_ServicePackagePhotoDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM():
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
    TResult? Function(_ServicePackagePhotoDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM() when $default != null:
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
            int? id,
            String? uuid,
            @JsonKey(name: 'service_package_id') int? servicePackageId,
            @JsonKey(name: 'photo_path') String? photoPath,
            @JsonKey(name: 'sort_order') int sortOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.servicePackageId,
            _that.photoPath, _that.sortOrder);
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
            int? id,
            String? uuid,
            @JsonKey(name: 'service_package_id') int? servicePackageId,
            @JsonKey(name: 'photo_path') String? photoPath,
            @JsonKey(name: 'sort_order') int sortOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM():
        return $default(_that.id, _that.uuid, _that.servicePackageId,
            _that.photoPath, _that.sortOrder);
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
            int? id,
            String? uuid,
            @JsonKey(name: 'service_package_id') int? servicePackageId,
            @JsonKey(name: 'photo_path') String? photoPath,
            @JsonKey(name: 'sort_order') int sortOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagePhotoDM() when $default != null:
        return $default(_that.id, _that.uuid, _that.servicePackageId,
            _that.photoPath, _that.sortOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServicePackagePhotoDM implements ServicePackagePhotoDM {
  const _ServicePackagePhotoDM(
      {this.id,
      this.uuid,
      @JsonKey(name: 'service_package_id') this.servicePackageId,
      @JsonKey(name: 'photo_path') this.photoPath,
      @JsonKey(name: 'sort_order') this.sortOrder = 0});
  factory _ServicePackagePhotoDM.fromJson(Map<String, dynamic> json) =>
      _$ServicePackagePhotoDMFromJson(json);

  @override
  final int? id;
  @override
  final String? uuid;
  @override
  @JsonKey(name: 'service_package_id')
  final int? servicePackageId;
  @override
  @JsonKey(name: 'photo_path')
  final String? photoPath;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicePackagePhotoDMCopyWith<_ServicePackagePhotoDM> get copyWith =>
      __$ServicePackagePhotoDMCopyWithImpl<_ServicePackagePhotoDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServicePackagePhotoDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicePackagePhotoDM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.servicePackageId, servicePackageId) ||
                other.servicePackageId == servicePackageId) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uuid, servicePackageId, photoPath, sortOrder);

  @override
  String toString() {
    return 'ServicePackagePhotoDM(id: $id, uuid: $uuid, servicePackageId: $servicePackageId, photoPath: $photoPath, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class _$ServicePackagePhotoDMCopyWith<$Res>
    implements $ServicePackagePhotoDMCopyWith<$Res> {
  factory _$ServicePackagePhotoDMCopyWith(_ServicePackagePhotoDM value,
          $Res Function(_ServicePackagePhotoDM) _then) =
      __$ServicePackagePhotoDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'service_package_id') int? servicePackageId,
      @JsonKey(name: 'photo_path') String? photoPath,
      @JsonKey(name: 'sort_order') int sortOrder});
}

/// @nodoc
class __$ServicePackagePhotoDMCopyWithImpl<$Res>
    implements _$ServicePackagePhotoDMCopyWith<$Res> {
  __$ServicePackagePhotoDMCopyWithImpl(this._self, this._then);

  final _ServicePackagePhotoDM _self;
  final $Res Function(_ServicePackagePhotoDM) _then;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? servicePackageId = freezed,
    Object? photoPath = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_ServicePackagePhotoDM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageId: freezed == servicePackageId
          ? _self.servicePackageId
          : servicePackageId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _self.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
