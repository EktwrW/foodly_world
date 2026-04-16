// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_packages_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServicePackagesVM {
  String? get businessUuid => throw _privateConstructorUsedError;
  ProfessionalProfileDM? get profile => throw _privateConstructorUsedError;
  List<ServicePackageDM> get packages => throw _privateConstructorUsedError;
  bool get isSavingProfile => throw _privateConstructorUsedError;
  bool get isSavingPackage => throw _privateConstructorUsedError;
  bool get isReordering => throw _privateConstructorUsedError;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicePackagesVMCopyWith<ServicePackagesVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicePackagesVMCopyWith<$Res> {
  factory $ServicePackagesVMCopyWith(
          ServicePackagesVM value, $Res Function(ServicePackagesVM) then) =
      _$ServicePackagesVMCopyWithImpl<$Res, ServicePackagesVM>;
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
class _$ServicePackagesVMCopyWithImpl<$Res, $Val extends ServicePackagesVM>
    implements $ServicePackagesVMCopyWith<$Res> {
  _$ServicePackagesVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
      isSavingProfile: null == isSavingProfile
          ? _value.isSavingProfile
          : isSavingProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingPackage: null == isSavingPackage
          ? _value.isSavingPackage
          : isSavingPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isReordering: null == isReordering
          ? _value.isReordering
          : isReordering // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalProfileDMCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfessionalProfileDMCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServicePackagesVMImplCopyWith<$Res>
    implements $ServicePackagesVMCopyWith<$Res> {
  factory _$$ServicePackagesVMImplCopyWith(_$ServicePackagesVMImpl value,
          $Res Function(_$ServicePackagesVMImpl) then) =
      __$$ServicePackagesVMImplCopyWithImpl<$Res>;
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
class __$$ServicePackagesVMImplCopyWithImpl<$Res>
    extends _$ServicePackagesVMCopyWithImpl<$Res, _$ServicePackagesVMImpl>
    implements _$$ServicePackagesVMImplCopyWith<$Res> {
  __$$ServicePackagesVMImplCopyWithImpl(_$ServicePackagesVMImpl _value,
      $Res Function(_$ServicePackagesVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServicePackagesVMImpl(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfessionalProfileDM?,
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
      isSavingProfile: null == isSavingProfile
          ? _value.isSavingProfile
          : isSavingProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingPackage: null == isSavingPackage
          ? _value.isSavingPackage
          : isSavingPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isReordering: null == isReordering
          ? _value.isReordering
          : isReordering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServicePackagesVMImpl implements _ServicePackagesVM {
  const _$ServicePackagesVMImpl(
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

  @override
  String toString() {
    return 'ServicePackagesVM(businessUuid: $businessUuid, profile: $profile, packages: $packages, isSavingProfile: $isSavingProfile, isSavingPackage: $isSavingPackage, isReordering: $isReordering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicePackagesVMImpl &&
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

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicePackagesVMImplCopyWith<_$ServicePackagesVMImpl> get copyWith =>
      __$$ServicePackagesVMImplCopyWithImpl<_$ServicePackagesVMImpl>(
          this, _$identity);
}

abstract class _ServicePackagesVM implements ServicePackagesVM {
  const factory _ServicePackagesVM(
      {final String? businessUuid,
      final ProfessionalProfileDM? profile,
      final List<ServicePackageDM> packages,
      final bool isSavingProfile,
      final bool isSavingPackage,
      final bool isReordering}) = _$ServicePackagesVMImpl;

  @override
  String? get businessUuid;
  @override
  ProfessionalProfileDM? get profile;
  @override
  List<ServicePackageDM> get packages;
  @override
  bool get isSavingProfile;
  @override
  bool get isSavingPackage;
  @override
  bool get isReordering;

  /// Create a copy of ServicePackagesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicePackagesVMImplCopyWith<_$ServicePackagesVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
