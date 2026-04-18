// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailabilityVM {
  String? get businessUuid => throw _privateConstructorUsedError;
  DateTime? get dateFrom => throw _privateConstructorUsedError;
  DateTime? get dateTo => throw _privateConstructorUsedError;
  List<BusinessAvailabilityDM> get entries =>
      throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityVMCopyWith<AvailabilityVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityVMCopyWith<$Res> {
  factory $AvailabilityVMCopyWith(
          AvailabilityVM value, $Res Function(AvailabilityVM) then) =
      _$AvailabilityVMCopyWithImpl<$Res, AvailabilityVM>;
  @useResult
  $Res call(
      {String? businessUuid,
      DateTime? dateFrom,
      DateTime? dateTo,
      List<BusinessAvailabilityDM> entries,
      bool isSaving,
      bool isDeleting});
}

/// @nodoc
class _$AvailabilityVMCopyWithImpl<$Res, $Val extends AvailabilityVM>
    implements $AvailabilityVMCopyWith<$Res> {
  _$AvailabilityVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? entries = null,
    Object? isSaving = null,
    Object? isDeleting = null,
  }) {
    return _then(_value.copyWith(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityVMImplCopyWith<$Res>
    implements $AvailabilityVMCopyWith<$Res> {
  factory _$$AvailabilityVMImplCopyWith(_$AvailabilityVMImpl value,
          $Res Function(_$AvailabilityVMImpl) then) =
      __$$AvailabilityVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? businessUuid,
      DateTime? dateFrom,
      DateTime? dateTo,
      List<BusinessAvailabilityDM> entries,
      bool isSaving,
      bool isDeleting});
}

/// @nodoc
class __$$AvailabilityVMImplCopyWithImpl<$Res>
    extends _$AvailabilityVMCopyWithImpl<$Res, _$AvailabilityVMImpl>
    implements _$$AvailabilityVMImplCopyWith<$Res> {
  __$$AvailabilityVMImplCopyWithImpl(
      _$AvailabilityVMImpl _value, $Res Function(_$AvailabilityVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessUuid = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? entries = null,
    Object? isSaving = null,
    Object? isDeleting = null,
  }) {
    return _then(_$AvailabilityVMImpl(
      businessUuid: freezed == businessUuid
          ? _value.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AvailabilityVMImpl extends _AvailabilityVM {
  const _$AvailabilityVMImpl(
      {this.businessUuid,
      this.dateFrom,
      this.dateTo,
      final List<BusinessAvailabilityDM> entries = const [],
      this.isSaving = false,
      this.isDeleting = false})
      : _entries = entries,
        super._();

  @override
  final String? businessUuid;
  @override
  final DateTime? dateFrom;
  @override
  final DateTime? dateTo;
  final List<BusinessAvailabilityDM> _entries;
  @override
  @JsonKey()
  List<BusinessAvailabilityDM> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isDeleting;

  @override
  String toString() {
    return 'AvailabilityVM(businessUuid: $businessUuid, dateFrom: $dateFrom, dateTo: $dateTo, entries: $entries, isSaving: $isSaving, isDeleting: $isDeleting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityVMImpl &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, businessUuid, dateFrom, dateTo,
      const DeepCollectionEquality().hash(_entries), isSaving, isDeleting);

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityVMImplCopyWith<_$AvailabilityVMImpl> get copyWith =>
      __$$AvailabilityVMImplCopyWithImpl<_$AvailabilityVMImpl>(
          this, _$identity);
}

abstract class _AvailabilityVM extends AvailabilityVM {
  const factory _AvailabilityVM(
      {final String? businessUuid,
      final DateTime? dateFrom,
      final DateTime? dateTo,
      final List<BusinessAvailabilityDM> entries,
      final bool isSaving,
      final bool isDeleting}) = _$AvailabilityVMImpl;
  const _AvailabilityVM._() : super._();

  @override
  String? get businessUuid;
  @override
  DateTime? get dateFrom;
  @override
  DateTime? get dateTo;
  @override
  List<BusinessAvailabilityDM> get entries;
  @override
  bool get isSaving;
  @override
  bool get isDeleting;

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityVMImplCopyWith<_$AvailabilityVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
