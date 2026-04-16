// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_package_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServicePackagesResponseDM _$ServicePackagesResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ServicePackagesResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ServicePackagesResponseDM {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_packages')
  List<ServicePackageDM> get servicePackages =>
      throw _privateConstructorUsedError;

  /// Serializes this ServicePackagesResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicePackagesResponseDMCopyWith<ServicePackagesResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicePackagesResponseDMCopyWith<$Res> {
  factory $ServicePackagesResponseDMCopyWith(ServicePackagesResponseDM value,
          $Res Function(ServicePackagesResponseDM) then) =
      _$ServicePackagesResponseDMCopyWithImpl<$Res, ServicePackagesResponseDM>;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'service_packages')
      List<ServicePackageDM> servicePackages});
}

/// @nodoc
class _$ServicePackagesResponseDMCopyWithImpl<$Res,
        $Val extends ServicePackagesResponseDM>
    implements $ServicePackagesResponseDMCopyWith<$Res> {
  _$ServicePackagesResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? servicePackages = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      servicePackages: null == servicePackages
          ? _value.servicePackages
          : servicePackages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicePackagesResponseDMImplCopyWith<$Res>
    implements $ServicePackagesResponseDMCopyWith<$Res> {
  factory _$$ServicePackagesResponseDMImplCopyWith(
          _$ServicePackagesResponseDMImpl value,
          $Res Function(_$ServicePackagesResponseDMImpl) then) =
      __$$ServicePackagesResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'service_packages')
      List<ServicePackageDM> servicePackages});
}

/// @nodoc
class __$$ServicePackagesResponseDMImplCopyWithImpl<$Res>
    extends _$ServicePackagesResponseDMCopyWithImpl<$Res,
        _$ServicePackagesResponseDMImpl>
    implements _$$ServicePackagesResponseDMImplCopyWith<$Res> {
  __$$ServicePackagesResponseDMImplCopyWithImpl(
      _$ServicePackagesResponseDMImpl _value,
      $Res Function(_$ServicePackagesResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? servicePackages = null,
  }) {
    return _then(_$ServicePackagesResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      servicePackages: null == servicePackages
          ? _value._servicePackages
          : servicePackages // ignore: cast_nullable_to_non_nullable
              as List<ServicePackageDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicePackagesResponseDMImpl implements _ServicePackagesResponseDM {
  const _$ServicePackagesResponseDMImpl(
      {this.success = false,
      @JsonKey(name: 'service_packages')
      final List<ServicePackageDM> servicePackages = const []})
      : _servicePackages = servicePackages;

  factory _$ServicePackagesResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicePackagesResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServicePackagesResponseDM(success: $success, servicePackages: $servicePackages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicePackagesResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._servicePackages, _servicePackages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_servicePackages));

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicePackagesResponseDMImplCopyWith<_$ServicePackagesResponseDMImpl>
      get copyWith => __$$ServicePackagesResponseDMImplCopyWithImpl<
          _$ServicePackagesResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicePackagesResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ServicePackagesResponseDM implements ServicePackagesResponseDM {
  const factory _ServicePackagesResponseDM(
          {final bool success,
          @JsonKey(name: 'service_packages')
          final List<ServicePackageDM> servicePackages}) =
      _$ServicePackagesResponseDMImpl;

  factory _ServicePackagesResponseDM.fromJson(Map<String, dynamic> json) =
      _$ServicePackagesResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(name: 'service_packages')
  List<ServicePackageDM> get servicePackages;

  /// Create a copy of ServicePackagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicePackagesResponseDMImplCopyWith<_$ServicePackagesResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServicePackageActionResponseDM _$ServicePackageActionResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ServicePackageActionResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ServicePackageActionResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_package')
  ServicePackageDM? get servicePackage => throw _privateConstructorUsedError;

  /// Serializes this ServicePackageActionResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicePackageActionResponseDMCopyWith<ServicePackageActionResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicePackageActionResponseDMCopyWith<$Res> {
  factory $ServicePackageActionResponseDMCopyWith(
          ServicePackageActionResponseDM value,
          $Res Function(ServicePackageActionResponseDM) then) =
      _$ServicePackageActionResponseDMCopyWithImpl<$Res,
          ServicePackageActionResponseDM>;
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'service_package') ServicePackageDM? servicePackage});

  $ServicePackageDMCopyWith<$Res>? get servicePackage;
}

/// @nodoc
class _$ServicePackageActionResponseDMCopyWithImpl<$Res,
        $Val extends ServicePackageActionResponseDM>
    implements $ServicePackageActionResponseDMCopyWith<$Res> {
  _$ServicePackageActionResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? servicePackage = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      servicePackage: freezed == servicePackage
          ? _value.servicePackage
          : servicePackage // ignore: cast_nullable_to_non_nullable
              as ServicePackageDM?,
    ) as $Val);
  }

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicePackageDMCopyWith<$Res>? get servicePackage {
    if (_value.servicePackage == null) {
      return null;
    }

    return $ServicePackageDMCopyWith<$Res>(_value.servicePackage!, (value) {
      return _then(_value.copyWith(servicePackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServicePackageActionResponseDMImplCopyWith<$Res>
    implements $ServicePackageActionResponseDMCopyWith<$Res> {
  factory _$$ServicePackageActionResponseDMImplCopyWith(
          _$ServicePackageActionResponseDMImpl value,
          $Res Function(_$ServicePackageActionResponseDMImpl) then) =
      __$$ServicePackageActionResponseDMImplCopyWithImpl<$Res>;
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
class __$$ServicePackageActionResponseDMImplCopyWithImpl<$Res>
    extends _$ServicePackageActionResponseDMCopyWithImpl<$Res,
        _$ServicePackageActionResponseDMImpl>
    implements _$$ServicePackageActionResponseDMImplCopyWith<$Res> {
  __$$ServicePackageActionResponseDMImplCopyWithImpl(
      _$ServicePackageActionResponseDMImpl _value,
      $Res Function(_$ServicePackageActionResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? servicePackage = freezed,
  }) {
    return _then(_$ServicePackageActionResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      servicePackage: freezed == servicePackage
          ? _value.servicePackage
          : servicePackage // ignore: cast_nullable_to_non_nullable
              as ServicePackageDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicePackageActionResponseDMImpl
    implements _ServicePackageActionResponseDM {
  const _$ServicePackageActionResponseDMImpl(
      {this.success = false,
      this.message = '',
      @JsonKey(name: 'service_package') this.servicePackage});

  factory _$ServicePackageActionResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServicePackageActionResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'service_package')
  final ServicePackageDM? servicePackage;

  @override
  String toString() {
    return 'ServicePackageActionResponseDM(success: $success, message: $message, servicePackage: $servicePackage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicePackageActionResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.servicePackage, servicePackage) ||
                other.servicePackage == servicePackage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, servicePackage);

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicePackageActionResponseDMImplCopyWith<
          _$ServicePackageActionResponseDMImpl>
      get copyWith => __$$ServicePackageActionResponseDMImplCopyWithImpl<
          _$ServicePackageActionResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicePackageActionResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ServicePackageActionResponseDM
    implements ServicePackageActionResponseDM {
  const factory _ServicePackageActionResponseDM(
          {final bool success,
          final String message,
          @JsonKey(name: 'service_package')
          final ServicePackageDM? servicePackage}) =
      _$ServicePackageActionResponseDMImpl;

  factory _ServicePackageActionResponseDM.fromJson(Map<String, dynamic> json) =
      _$ServicePackageActionResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  @JsonKey(name: 'service_package')
  ServicePackageDM? get servicePackage;

  /// Create a copy of ServicePackageActionResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicePackageActionResponseDMImplCopyWith<
          _$ServicePackageActionResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenericSuccessResponseDM _$GenericSuccessResponseDMFromJson(
    Map<String, dynamic> json) {
  return _GenericSuccessResponseDM.fromJson(json);
}

/// @nodoc
mixin _$GenericSuccessResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this GenericSuccessResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenericSuccessResponseDMCopyWith<GenericSuccessResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericSuccessResponseDMCopyWith<$Res> {
  factory $GenericSuccessResponseDMCopyWith(GenericSuccessResponseDM value,
          $Res Function(GenericSuccessResponseDM) then) =
      _$GenericSuccessResponseDMCopyWithImpl<$Res, GenericSuccessResponseDM>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$GenericSuccessResponseDMCopyWithImpl<$Res,
        $Val extends GenericSuccessResponseDM>
    implements $GenericSuccessResponseDMCopyWith<$Res> {
  _$GenericSuccessResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericSuccessResponseDMImplCopyWith<$Res>
    implements $GenericSuccessResponseDMCopyWith<$Res> {
  factory _$$GenericSuccessResponseDMImplCopyWith(
          _$GenericSuccessResponseDMImpl value,
          $Res Function(_$GenericSuccessResponseDMImpl) then) =
      __$$GenericSuccessResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$GenericSuccessResponseDMImplCopyWithImpl<$Res>
    extends _$GenericSuccessResponseDMCopyWithImpl<$Res,
        _$GenericSuccessResponseDMImpl>
    implements _$$GenericSuccessResponseDMImplCopyWith<$Res> {
  __$$GenericSuccessResponseDMImplCopyWithImpl(
      _$GenericSuccessResponseDMImpl _value,
      $Res Function(_$GenericSuccessResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$GenericSuccessResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericSuccessResponseDMImpl implements _GenericSuccessResponseDM {
  const _$GenericSuccessResponseDMImpl(
      {this.success = false, this.message = ''});

  factory _$GenericSuccessResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericSuccessResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'GenericSuccessResponseDM(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericSuccessResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericSuccessResponseDMImplCopyWith<_$GenericSuccessResponseDMImpl>
      get copyWith => __$$GenericSuccessResponseDMImplCopyWithImpl<
          _$GenericSuccessResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericSuccessResponseDMImplToJson(
      this,
    );
  }
}

abstract class _GenericSuccessResponseDM implements GenericSuccessResponseDM {
  const factory _GenericSuccessResponseDM(
      {final bool success,
      final String message}) = _$GenericSuccessResponseDMImpl;

  factory _GenericSuccessResponseDM.fromJson(Map<String, dynamic> json) =
      _$GenericSuccessResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;

  /// Create a copy of GenericSuccessResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericSuccessResponseDMImplCopyWith<_$GenericSuccessResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PhotoUploadResponseDM _$PhotoUploadResponseDMFromJson(
    Map<String, dynamic> json) {
  return _PhotoUploadResponseDM.fromJson(json);
}

/// @nodoc
mixin _$PhotoUploadResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ServicePackagePhotoDM> get photos => throw _privateConstructorUsedError;

  /// Serializes this PhotoUploadResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoUploadResponseDMCopyWith<PhotoUploadResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUploadResponseDMCopyWith<$Res> {
  factory $PhotoUploadResponseDMCopyWith(PhotoUploadResponseDM value,
          $Res Function(PhotoUploadResponseDM) then) =
      _$PhotoUploadResponseDMCopyWithImpl<$Res, PhotoUploadResponseDM>;
  @useResult
  $Res call({bool success, String message, List<ServicePackagePhotoDM> photos});
}

/// @nodoc
class _$PhotoUploadResponseDMCopyWithImpl<$Res,
        $Val extends PhotoUploadResponseDM>
    implements $PhotoUploadResponseDMCopyWith<$Res> {
  _$PhotoUploadResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUploadResponseDMImplCopyWith<$Res>
    implements $PhotoUploadResponseDMCopyWith<$Res> {
  factory _$$PhotoUploadResponseDMImplCopyWith(
          _$PhotoUploadResponseDMImpl value,
          $Res Function(_$PhotoUploadResponseDMImpl) then) =
      __$$PhotoUploadResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<ServicePackagePhotoDM> photos});
}

/// @nodoc
class __$$PhotoUploadResponseDMImplCopyWithImpl<$Res>
    extends _$PhotoUploadResponseDMCopyWithImpl<$Res,
        _$PhotoUploadResponseDMImpl>
    implements _$$PhotoUploadResponseDMImplCopyWith<$Res> {
  __$$PhotoUploadResponseDMImplCopyWithImpl(_$PhotoUploadResponseDMImpl _value,
      $Res Function(_$PhotoUploadResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? photos = null,
  }) {
    return _then(_$PhotoUploadResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoUploadResponseDMImpl implements _PhotoUploadResponseDM {
  const _$PhotoUploadResponseDMImpl(
      {this.success = false,
      this.message = '',
      final List<ServicePackagePhotoDM> photos = const []})
      : _photos = photos;

  factory _$PhotoUploadResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoUploadResponseDMImplFromJson(json);

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

  @override
  String toString() {
    return 'PhotoUploadResponseDM(success: $success, message: $message, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUploadResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_photos));

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUploadResponseDMImplCopyWith<_$PhotoUploadResponseDMImpl>
      get copyWith => __$$PhotoUploadResponseDMImplCopyWithImpl<
          _$PhotoUploadResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoUploadResponseDMImplToJson(
      this,
    );
  }
}

abstract class _PhotoUploadResponseDM implements PhotoUploadResponseDM {
  const factory _PhotoUploadResponseDM(
      {final bool success,
      final String message,
      final List<ServicePackagePhotoDM> photos}) = _$PhotoUploadResponseDMImpl;

  factory _PhotoUploadResponseDM.fromJson(Map<String, dynamic> json) =
      _$PhotoUploadResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<ServicePackagePhotoDM> get photos;

  /// Create a copy of PhotoUploadResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoUploadResponseDMImplCopyWith<_$PhotoUploadResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServicePackageDM _$ServicePackageDMFromJson(Map<String, dynamic> json) {
  return _ServicePackageDM.fromJson(json);
}

/// @nodoc
mixin _$ServicePackageDM {
  int? get id => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id')
  int? get businessId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_type')
  ServiceType get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_type')
  PriceType get priceType => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_guests')
  int? get minGuests => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_guests')
  int? get maxGuests => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_hours')
  double? get durationHours => throw _privateConstructorUsedError;
  List<String> get includes => throw _privateConstructorUsedError;
  @JsonKey(name: 'add_ons')
  List<String> get addOns => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  List<ServicePackagePhotoDM> get photos => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ServicePackageDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicePackageDMCopyWith<ServicePackageDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicePackageDMCopyWith<$Res> {
  factory $ServicePackageDMCopyWith(
          ServicePackageDM value, $Res Function(ServicePackageDM) then) =
      _$ServicePackageDMCopyWithImpl<$Res, ServicePackageDM>;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'business_id') int? businessId,
      String title,
      String? description,
      @JsonKey(name: 'service_type') ServiceType serviceType,
      @JsonKey(name: 'price_type') PriceType priceType,
      double? price,
      String? currency,
      @JsonKey(name: 'min_guests') int? minGuests,
      @JsonKey(name: 'max_guests') int? maxGuests,
      @JsonKey(name: 'duration_hours') double? durationHours,
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
class _$ServicePackageDMCopyWithImpl<$Res, $Val extends ServicePackageDM>
    implements $ServicePackageDMCopyWith<$Res> {
  _$ServicePackageDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      minGuests: freezed == minGuests
          ? _value.minGuests
          : minGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      maxGuests: freezed == maxGuests
          ? _value.maxGuests
          : maxGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      includes: null == includes
          ? _value.includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOns: null == addOns
          ? _value.addOns
          : addOns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicePackageDMImplCopyWith<$Res>
    implements $ServicePackageDMCopyWith<$Res> {
  factory _$$ServicePackageDMImplCopyWith(_$ServicePackageDMImpl value,
          $Res Function(_$ServicePackageDMImpl) then) =
      __$$ServicePackageDMImplCopyWithImpl<$Res>;
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
      double? price,
      String? currency,
      @JsonKey(name: 'min_guests') int? minGuests,
      @JsonKey(name: 'max_guests') int? maxGuests,
      @JsonKey(name: 'duration_hours') double? durationHours,
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
class __$$ServicePackageDMImplCopyWithImpl<$Res>
    extends _$ServicePackageDMCopyWithImpl<$Res, _$ServicePackageDMImpl>
    implements _$$ServicePackageDMImplCopyWith<$Res> {
  __$$ServicePackageDMImplCopyWithImpl(_$ServicePackageDMImpl _value,
      $Res Function(_$ServicePackageDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServicePackageDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as PriceType,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      minGuests: freezed == minGuests
          ? _value.minGuests
          : minGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      maxGuests: freezed == maxGuests
          ? _value.maxGuests
          : maxGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      durationHours: freezed == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      includes: null == includes
          ? _value._includes
          : includes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOns: null == addOns
          ? _value._addOns
          : addOns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ServicePackagePhotoDM>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicePackageDMImpl extends _ServicePackageDM {
  const _$ServicePackageDMImpl(
      {this.id,
      this.uuid,
      @JsonKey(name: 'business_id') this.businessId,
      this.title = '',
      this.description,
      @JsonKey(name: 'service_type') this.serviceType = ServiceType.custom,
      @JsonKey(name: 'price_type') this.priceType = PriceType.onQuote,
      this.price,
      this.currency,
      @JsonKey(name: 'min_guests') this.minGuests,
      @JsonKey(name: 'max_guests') this.maxGuests,
      @JsonKey(name: 'duration_hours') this.durationHours,
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

  factory _$ServicePackageDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicePackageDMImplFromJson(json);

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
  @JsonKey(name: 'duration_hours')
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

  @override
  String toString() {
    return 'ServicePackageDM(id: $id, uuid: $uuid, businessId: $businessId, title: $title, description: $description, serviceType: $serviceType, priceType: $priceType, price: $price, currency: $currency, minGuests: $minGuests, maxGuests: $maxGuests, durationHours: $durationHours, includes: $includes, addOns: $addOns, isFeatured: $isFeatured, isActive: $isActive, sortOrder: $sortOrder, photos: $photos, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicePackageDMImpl &&
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

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicePackageDMImplCopyWith<_$ServicePackageDMImpl> get copyWith =>
      __$$ServicePackageDMImplCopyWithImpl<_$ServicePackageDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicePackageDMImplToJson(
      this,
    );
  }
}

abstract class _ServicePackageDM extends ServicePackageDM {
  const factory _ServicePackageDM(
          {final int? id,
          final String? uuid,
          @JsonKey(name: 'business_id') final int? businessId,
          final String title,
          final String? description,
          @JsonKey(name: 'service_type') final ServiceType serviceType,
          @JsonKey(name: 'price_type') final PriceType priceType,
          final double? price,
          final String? currency,
          @JsonKey(name: 'min_guests') final int? minGuests,
          @JsonKey(name: 'max_guests') final int? maxGuests,
          @JsonKey(name: 'duration_hours') final double? durationHours,
          final List<String> includes,
          @JsonKey(name: 'add_ons') final List<String> addOns,
          @JsonKey(name: 'is_featured') final bool isFeatured,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'sort_order') final int sortOrder,
          final List<ServicePackagePhotoDM> photos,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$ServicePackageDMImpl;
  const _ServicePackageDM._() : super._();

  factory _ServicePackageDM.fromJson(Map<String, dynamic> json) =
      _$ServicePackageDMImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uuid;
  @override
  @JsonKey(name: 'business_id')
  int? get businessId;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'service_type')
  ServiceType get serviceType;
  @override
  @JsonKey(name: 'price_type')
  PriceType get priceType;
  @override
  double? get price;
  @override
  String? get currency;
  @override
  @JsonKey(name: 'min_guests')
  int? get minGuests;
  @override
  @JsonKey(name: 'max_guests')
  int? get maxGuests;
  @override
  @JsonKey(name: 'duration_hours')
  double? get durationHours;
  @override
  List<String> get includes;
  @override
  @JsonKey(name: 'add_ons')
  List<String> get addOns;
  @override
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  List<ServicePackagePhotoDM> get photos;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of ServicePackageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicePackageDMImplCopyWith<_$ServicePackageDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServicePackagePhotoDM _$ServicePackagePhotoDMFromJson(
    Map<String, dynamic> json) {
  return _ServicePackagePhotoDM.fromJson(json);
}

/// @nodoc
mixin _$ServicePackagePhotoDM {
  int? get id => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_package_id')
  int? get servicePackageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_path')
  String? get photoPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this ServicePackagePhotoDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicePackagePhotoDMCopyWith<ServicePackagePhotoDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicePackagePhotoDMCopyWith<$Res> {
  factory $ServicePackagePhotoDMCopyWith(ServicePackagePhotoDM value,
          $Res Function(ServicePackagePhotoDM) then) =
      _$ServicePackagePhotoDMCopyWithImpl<$Res, ServicePackagePhotoDM>;
  @useResult
  $Res call(
      {int? id,
      String? uuid,
      @JsonKey(name: 'service_package_id') int? servicePackageId,
      @JsonKey(name: 'photo_path') String? photoPath,
      @JsonKey(name: 'sort_order') int sortOrder});
}

/// @nodoc
class _$ServicePackagePhotoDMCopyWithImpl<$Res,
        $Val extends ServicePackagePhotoDM>
    implements $ServicePackagePhotoDMCopyWith<$Res> {
  _$ServicePackagePhotoDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageId: freezed == servicePackageId
          ? _value.servicePackageId
          : servicePackageId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicePackagePhotoDMImplCopyWith<$Res>
    implements $ServicePackagePhotoDMCopyWith<$Res> {
  factory _$$ServicePackagePhotoDMImplCopyWith(
          _$ServicePackagePhotoDMImpl value,
          $Res Function(_$ServicePackagePhotoDMImpl) then) =
      __$$ServicePackagePhotoDMImplCopyWithImpl<$Res>;
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
class __$$ServicePackagePhotoDMImplCopyWithImpl<$Res>
    extends _$ServicePackagePhotoDMCopyWithImpl<$Res,
        _$ServicePackagePhotoDMImpl>
    implements _$$ServicePackagePhotoDMImplCopyWith<$Res> {
  __$$ServicePackagePhotoDMImplCopyWithImpl(_$ServicePackagePhotoDMImpl _value,
      $Res Function(_$ServicePackagePhotoDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ServicePackagePhotoDMImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePackageId: freezed == servicePackageId
          ? _value.servicePackageId
          : servicePackageId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicePackagePhotoDMImpl implements _ServicePackagePhotoDM {
  const _$ServicePackagePhotoDMImpl(
      {this.id,
      this.uuid,
      @JsonKey(name: 'service_package_id') this.servicePackageId,
      @JsonKey(name: 'photo_path') this.photoPath,
      @JsonKey(name: 'sort_order') this.sortOrder = 0});

  factory _$ServicePackagePhotoDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicePackagePhotoDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ServicePackagePhotoDM(id: $id, uuid: $uuid, servicePackageId: $servicePackageId, photoPath: $photoPath, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicePackagePhotoDMImpl &&
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

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicePackagePhotoDMImplCopyWith<_$ServicePackagePhotoDMImpl>
      get copyWith => __$$ServicePackagePhotoDMImplCopyWithImpl<
          _$ServicePackagePhotoDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicePackagePhotoDMImplToJson(
      this,
    );
  }
}

abstract class _ServicePackagePhotoDM implements ServicePackagePhotoDM {
  const factory _ServicePackagePhotoDM(
          {final int? id,
          final String? uuid,
          @JsonKey(name: 'service_package_id') final int? servicePackageId,
          @JsonKey(name: 'photo_path') final String? photoPath,
          @JsonKey(name: 'sort_order') final int sortOrder}) =
      _$ServicePackagePhotoDMImpl;

  factory _ServicePackagePhotoDM.fromJson(Map<String, dynamic> json) =
      _$ServicePackagePhotoDMImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uuid;
  @override
  @JsonKey(name: 'service_package_id')
  int? get servicePackageId;
  @override
  @JsonKey(name: 'photo_path')
  String? get photoPath;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;

  /// Create a copy of ServicePackagePhotoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicePackagePhotoDMImplCopyWith<_$ServicePackagePhotoDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
