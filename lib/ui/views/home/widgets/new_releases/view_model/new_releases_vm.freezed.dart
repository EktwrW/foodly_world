// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_releases_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewReleasesVM {
  List<BusinessDM> get businesses => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewReleasesVMCopyWith<NewReleasesVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReleasesVMCopyWith<$Res> {
  factory $NewReleasesVMCopyWith(
          NewReleasesVM value, $Res Function(NewReleasesVM) then) =
      _$NewReleasesVMCopyWithImpl<$Res, NewReleasesVM>;
  @useResult
  $Res call({List<BusinessDM> businesses, bool isLoading, String? error});
}

/// @nodoc
class _$NewReleasesVMCopyWithImpl<$Res, $Val extends NewReleasesVM>
    implements $NewReleasesVMCopyWith<$Res> {
  _$NewReleasesVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      businesses: null == businesses
          ? _value.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewReleasesVMImplCopyWith<$Res>
    implements $NewReleasesVMCopyWith<$Res> {
  factory _$$NewReleasesVMImplCopyWith(
          _$NewReleasesVMImpl value, $Res Function(_$NewReleasesVMImpl) then) =
      __$$NewReleasesVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BusinessDM> businesses, bool isLoading, String? error});
}

/// @nodoc
class __$$NewReleasesVMImplCopyWithImpl<$Res>
    extends _$NewReleasesVMCopyWithImpl<$Res, _$NewReleasesVMImpl>
    implements _$$NewReleasesVMImplCopyWith<$Res> {
  __$$NewReleasesVMImplCopyWithImpl(
      _$NewReleasesVMImpl _value, $Res Function(_$NewReleasesVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$NewReleasesVMImpl(
      businesses: null == businesses
          ? _value._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NewReleasesVMImpl implements _NewReleasesVM {
  const _$NewReleasesVMImpl(
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

  @override
  String toString() {
    return 'NewReleasesVM(businesses: $businesses, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewReleasesVMImpl &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_businesses), isLoading, error);

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewReleasesVMImplCopyWith<_$NewReleasesVMImpl> get copyWith =>
      __$$NewReleasesVMImplCopyWithImpl<_$NewReleasesVMImpl>(this, _$identity);
}

abstract class _NewReleasesVM implements NewReleasesVM {
  const factory _NewReleasesVM(
      {final List<BusinessDM> businesses,
      final bool isLoading,
      final String? error}) = _$NewReleasesVMImpl;

  @override
  List<BusinessDM> get businesses;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of NewReleasesVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewReleasesVMImplCopyWith<_$NewReleasesVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
