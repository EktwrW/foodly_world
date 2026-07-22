// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_releases_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewReleasesVM {
  List<BusinessDM> get businesses;
  bool get isLoading;
  String? get error;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewReleasesVMCopyWith<NewReleasesVM> get copyWith =>
      _$NewReleasesVMCopyWithImpl<NewReleasesVM>(
          this as NewReleasesVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewReleasesVM &&
            const DeepCollectionEquality()
                .equals(other.businesses, businesses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(businesses), isLoading, error);

  @override
  String toString() {
    return 'NewReleasesVM(businesses: $businesses, isLoading: $isLoading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $NewReleasesVMCopyWith<$Res> {
  factory $NewReleasesVMCopyWith(
          NewReleasesVM value, $Res Function(NewReleasesVM) _then) =
      _$NewReleasesVMCopyWithImpl;
  @useResult
  $Res call({List<BusinessDM> businesses, bool isLoading, String? error});
}

/// @nodoc
class _$NewReleasesVMCopyWithImpl<$Res>
    implements $NewReleasesVMCopyWith<$Res> {
  _$NewReleasesVMCopyWithImpl(this._self, this._then);

  final NewReleasesVM _self;
  final $Res Function(NewReleasesVM) _then;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      businesses: null == businesses
          ? _self.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewReleasesVM].
extension NewReleasesVMPatterns on NewReleasesVM {
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
    TResult Function(_NewReleasesVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM() when $default != null:
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
    TResult Function(_NewReleasesVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM():
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
    TResult? Function(_NewReleasesVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM() when $default != null:
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
            List<BusinessDM> businesses, bool isLoading, String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM() when $default != null:
        return $default(_that.businesses, _that.isLoading, _that.error);
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
    TResult Function(List<BusinessDM> businesses, bool isLoading, String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM():
        return $default(_that.businesses, _that.isLoading, _that.error);
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
            List<BusinessDM> businesses, bool isLoading, String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewReleasesVM() when $default != null:
        return $default(_that.businesses, _that.isLoading, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewReleasesVM implements NewReleasesVM {
  const _NewReleasesVM(
      {final List<BusinessDM> businesses = const [],
      this.isLoading = false,
      this.error})
      : _businesses = businesses;

  final List<BusinessDM> _businesses;
  @override
  @JsonKey()
  List<BusinessDM> get businesses {
    if (_businesses is EqualUnmodifiableListView) return _businesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businesses);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewReleasesVMCopyWith<_NewReleasesVM> get copyWith =>
      __$NewReleasesVMCopyWithImpl<_NewReleasesVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewReleasesVM &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_businesses), isLoading, error);

  @override
  String toString() {
    return 'NewReleasesVM(businesses: $businesses, isLoading: $isLoading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$NewReleasesVMCopyWith<$Res>
    implements $NewReleasesVMCopyWith<$Res> {
  factory _$NewReleasesVMCopyWith(
          _NewReleasesVM value, $Res Function(_NewReleasesVM) _then) =
      __$NewReleasesVMCopyWithImpl;
  @override
  @useResult
  $Res call({List<BusinessDM> businesses, bool isLoading, String? error});
}

/// @nodoc
class __$NewReleasesVMCopyWithImpl<$Res>
    implements _$NewReleasesVMCopyWith<$Res> {
  __$NewReleasesVMCopyWithImpl(this._self, this._then);

  final _NewReleasesVM _self;
  final $Res Function(_NewReleasesVM) _then;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_NewReleasesVM(
      businesses: null == businesses
          ? _self._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
