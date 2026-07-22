// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_packages_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicePackagesVM {
  String? get businessUuid;
  ProfessionalProfileDM? get profile;
  List<ServicePackageDM> get packages;
  bool get isSavingProfile;
  bool get isSavingPackage;
  bool get isReordering;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicePackagesVMCopyWith<ServicePackagesVM> get copyWith =>
      _$ServicePackagesVMCopyWithImpl<ServicePackagesVM>(
          this as ServicePackagesVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicePackagesVM &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other.packages, packages) &&
            (identical(other.isSavingProfile, isSavingProfile) ||
                other.isSavingProfile == isSavingProfile) &&
            (identical(other.isSavingPackage, isSavingPackage) ||
                other.isSavingPackage == isSavingPackage) &&
            (identical(other.isReordering, isReordering) ||
                other.isReordering == isReordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessUuid,
      profile,
      const DeepCollectionEquality().hash(packages),
      isSavingProfile,
      isSavingPackage,
      isReordering);

  @override
  String toString() {
    return 'ServicePackagesVM(businessUuid: $businessUuid, profile: $profile, packages: $packages, isSavingProfile: $isSavingProfile, isSavingPackage: $isSavingPackage, isReordering: $isReordering)';
  }
}

/// @nodoc
abstract mixin class $ServicePackagesVMCopyWith<$Res> {
  factory $ServicePackagesVMCopyWith(
          ServicePackagesVM value, $Res Function(ServicePackagesVM) _then) =
      _$ServicePackagesVMCopyWithImpl;
  @useResult
  $Res call(
      {String? businessUuid,
      ProfessionalProfileDM? profile,
      List<ServicePackageDM> packages,
      bool isSavingProfile,
      bool isSavingPackage,
      bool isReordering});

  $ProfessionalProfileDMCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ServicePackagesVMCopyWithImpl<$Res>
    implements $ServicePackagesVMCopyWith<$Res> {
  _$ServicePackagesVMCopyWithImpl(this._self, this._then);

  final ServicePackagesVM _self;
  final $Res Function(ServicePackagesVM) _then;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? profile = freezed,
    Object? packages = null,
    Object? isSavingProfile = null,
    Object? isSavingPackage = null,
    Object? isReordering = null,
  }) {
    return _then(_self.copyWith(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
      packages: null == packages
          ? _self.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
      isSavingProfile: null == isSavingProfile
          ? _self.isSavingProfile
          : isSavingProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingPackage: null == isSavingPackage
          ? _self.isSavingPackage
          : isSavingPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isReordering: null == isReordering
          ? _self.isReordering
          : isReordering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ServicePackagesVM].
extension ServicePackagesVMPatterns on ServicePackagesVM {
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
    TResult Function(_ServicePackagesVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM() when $default != null:
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
    TResult Function(_ServicePackagesVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM():
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
    TResult? Function(_ServicePackagesVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM() when $default != null:
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
            String? businessUuid,
            ProfessionalProfileDM? profile,
            List<ServicePackageDM> packages,
            bool isSavingProfile,
            bool isSavingPackage,
            bool isReordering)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM() when $default != null:
        return $default(_that.businessUuid, _that.profile, _that.packages,
            _that.isSavingProfile, _that.isSavingPackage, _that.isReordering);
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
            String? businessUuid,
            ProfessionalProfileDM? profile,
            List<ServicePackageDM> packages,
            bool isSavingProfile,
            bool isSavingPackage,
            bool isReordering)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM():
        return $default(_that.businessUuid, _that.profile, _that.packages,
            _that.isSavingProfile, _that.isSavingPackage, _that.isReordering);
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
            String? businessUuid,
            ProfessionalProfileDM? profile,
            List<ServicePackageDM> packages,
            bool isSavingProfile,
            bool isSavingPackage,
            bool isReordering)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServicePackagesVM() when $default != null:
        return $default(_that.businessUuid, _that.profile, _that.packages,
            _that.isSavingProfile, _that.isSavingPackage, _that.isReordering);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ServicePackagesVM implements ServicePackagesVM {
  const _ServicePackagesVM(
      {this.businessUuid,
      this.profile,
      final List<ServicePackageDM> packages = const [],
      this.isSavingProfile = false,
      this.isSavingPackage = false,
      this.isReordering = false})
      : _packages = packages;

  @override
  final String? businessUuid;
  @override
  final ProfessionalProfileDM? profile;
  final List<ServicePackageDM> _packages;
  @override
  @JsonKey()
  List<ServicePackageDM> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  @override
  @JsonKey()
  final bool isSavingProfile;
  @override
  @JsonKey()
  final bool isSavingPackage;
  @override
  @JsonKey()
  final bool isReordering;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServicePackagesVMCopyWith<_ServicePackagesVM> get copyWith =>
      __$ServicePackagesVMCopyWithImpl<_ServicePackagesVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicePackagesVM &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            (identical(other.isSavingProfile, isSavingProfile) ||
                other.isSavingProfile == isSavingProfile) &&
            (identical(other.isSavingPackage, isSavingPackage) ||
                other.isSavingPackage == isSavingPackage) &&
            (identical(other.isReordering, isReordering) ||
                other.isReordering == isReordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessUuid,
      profile,
      const DeepCollectionEquality().hash(_packages),
      isSavingProfile,
      isSavingPackage,
      isReordering);

  @override
  String toString() {
    return 'ServicePackagesVM(businessUuid: $businessUuid, profile: $profile, packages: $packages, isSavingProfile: $isSavingProfile, isSavingPackage: $isSavingPackage, isReordering: $isReordering)';
  }
}

/// @nodoc
abstract mixin class _$ServicePackagesVMCopyWith<$Res>
    implements $ServicePackagesVMCopyWith<$Res> {
  factory _$ServicePackagesVMCopyWith(
          _ServicePackagesVM value, $Res Function(_ServicePackagesVM) _then) =
      __$ServicePackagesVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? businessUuid,
      ProfessionalProfileDM? profile,
      List<ServicePackageDM> packages,
      bool isSavingProfile,
      bool isSavingPackage,
      bool isReordering});

  @override
  $ProfessionalProfileDMCopyWith<$Res>? get profile;
}

/// @nodoc
class __$ServicePackagesVMCopyWithImpl<$Res>
    implements _$ServicePackagesVMCopyWith<$Res> {
  __$ServicePackagesVMCopyWithImpl(this._self, this._then);

  final _ServicePackagesVM _self;
  final $Res Function(_ServicePackagesVM) _then;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessUuid = freezed,
    Object? profile = freezed,
    Object? packages = null,
    Object? isSavingProfile = null,
    Object? isSavingPackage = null,
    Object? isReordering = null,
  }) {
    return _then(_ServicePackagesVM(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
      packages: null == packages
          ? _self._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
      isSavingProfile: null == isSavingProfile
          ? _self.isSavingProfile
          : isSavingProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingPackage: null == isSavingPackage
          ? _self.isSavingPackage
          : isSavingPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isReordering: null == isReordering
          ? _self.isReordering
          : isReordering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
