// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsVM {
  BusinessOverviewDataDM? get overview => throw _privateConstructorUsedError;
  int get selectedDays => throw _privateConstructorUsedError;
  String? get businessUuid => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsVMCopyWith<AnalyticsVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsVMCopyWith<$Res> {
  factory $AnalyticsVMCopyWith(
          AnalyticsVM value, $Res Function(AnalyticsVM) then) =
      _$AnalyticsVMCopyWithImpl<$Res, AnalyticsVM>;
  @useResult
  $Res call(
      {BusinessOverviewDataDM? overview,
      int selectedDays,
      String? businessUuid});

  $BusinessOverviewDataDMCopyWith<$Res>? get overview;
}

/// @nodoc
class _$AnalyticsVMCopyWithImpl<$Res, $Val extends AnalyticsVM>
    implements $AnalyticsVMCopyWith<$Res> {
  _$AnalyticsVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = freezed,
    Object? selectedDays = null,
    Object? businessUuid = freezed,
  }) {
    return _then(_value.copyWith(
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessOverviewDataDMCopyWith<$Res>? get overview {
    if (_value.overview == null) {
      return null;
    }

    return $BusinessOverviewDataDMCopyWith<$Res>(_value.overview!, (value) {
      return _then(_value.copyWith(overview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsVMImplCopyWith<$Res>
    implements $AnalyticsVMCopyWith<$Res> {
  factory _$$AnalyticsVMImplCopyWith(
          _$AnalyticsVMImpl value, $Res Function(_$AnalyticsVMImpl) then) =
      __$$AnalyticsVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BusinessOverviewDataDM? overview,
      int selectedDays,
      String? businessUuid});

  @override
  $BusinessOverviewDataDMCopyWith<$Res>? get overview;
}

/// @nodoc
class __$$AnalyticsVMImplCopyWithImpl<$Res>
    extends _$AnalyticsVMCopyWithImpl<$Res, _$AnalyticsVMImpl>
    implements _$$AnalyticsVMImplCopyWith<$Res> {
  __$$AnalyticsVMImplCopyWithImpl(
      _$AnalyticsVMImpl _value, $Res Function(_$AnalyticsVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = freezed,
    Object? selectedDays = null,
    Object? businessUuid = freezed,
  }) {
    return _then(_$AnalyticsVMImpl(
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as BusinessOverviewDataDM?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AnalyticsVMImpl implements _AnalyticsVM {
  const _$AnalyticsVMImpl(
      {this.overview, this.selectedDays = 30, this.businessUuid});

  @override
  final BusinessOverviewDataDM? overview;
  @override
  @JsonKey()
  final int selectedDays;
  @override
  final String? businessUuid;

  @override
  String toString() {
    return 'AnalyticsVM(overview: $overview, selectedDays: $selectedDays, businessUuid: $businessUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsVMImpl &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.selectedDays, selectedDays) ||
                other.selectedDays == selectedDays) &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, overview, selectedDays, businessUuid);

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsVMImplCopyWith<_$AnalyticsVMImpl> get copyWith =>
      __$$AnalyticsVMImplCopyWithImpl<_$AnalyticsVMImpl>(this, _$identity);
}

abstract class _AnalyticsVM implements AnalyticsVM {
  const factory _AnalyticsVM(
      {final BusinessOverviewDataDM? overview,
      final int selectedDays,
      final String? businessUuid}) = _$AnalyticsVMImpl;

  @override
  BusinessOverviewDataDM? get overview;
  @override
  int get selectedDays;
  @override
  String? get businessUuid;

  /// Create a copy of AnalyticsVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsVMImplCopyWith<_$AnalyticsVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
