// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailabilityVM {
  String? get businessUuid;
  DateTime? get dateFrom;
  DateTime? get dateTo;
  List<BusinessAvailabilityDM> get entries;
  bool get isSaving;
  bool get isDeleting;

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailabilityVMCopyWith<AvailabilityVM> get copyWith =>
      _$AvailabilityVMCopyWithImpl<AvailabilityVM>(
          this as AvailabilityVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailabilityVM &&
            (identical(other.businessUuid, businessUuid) ||
                other.businessUuid == businessUuid) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            const DeepCollectionEquality().equals(other.entries, entries) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, businessUuid, dateFrom, dateTo,
      const DeepCollectionEquality().hash(entries), isSaving, isDeleting);

  @override
  String toString() {
    return 'AvailabilityVM(businessUuid: $businessUuid, dateFrom: $dateFrom, dateTo: $dateTo, entries: $entries, isSaving: $isSaving, isDeleting: $isDeleting)';
  }
}

/// @nodoc
abstract mixin class $AvailabilityVMCopyWith<$Res> {
  factory $AvailabilityVMCopyWith(
          AvailabilityVM value, $Res Function(AvailabilityVM) _then) =
      _$AvailabilityVMCopyWithImpl;
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
class _$AvailabilityVMCopyWithImpl<$Res>
    implements $AvailabilityVMCopyWith<$Res> {
  _$AvailabilityVMCopyWithImpl(this._self, this._then);

  final AvailabilityVM _self;
  final $Res Function(AvailabilityVM) _then;

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
    return _then(_self.copyWith(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AvailabilityVM].
extension AvailabilityVMPatterns on AvailabilityVM {
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
    TResult Function(_AvailabilityVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM() when $default != null:
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
    TResult Function(_AvailabilityVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM():
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
    TResult? Function(_AvailabilityVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM() when $default != null:
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
            DateTime? dateFrom,
            DateTime? dateTo,
            List<BusinessAvailabilityDM> entries,
            bool isSaving,
            bool isDeleting)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM() when $default != null:
        return $default(_that.businessUuid, _that.dateFrom, _that.dateTo,
            _that.entries, _that.isSaving, _that.isDeleting);
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
            DateTime? dateFrom,
            DateTime? dateTo,
            List<BusinessAvailabilityDM> entries,
            bool isSaving,
            bool isDeleting)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM():
        return $default(_that.businessUuid, _that.dateFrom, _that.dateTo,
            _that.entries, _that.isSaving, _that.isDeleting);
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
            DateTime? dateFrom,
            DateTime? dateTo,
            List<BusinessAvailabilityDM> entries,
            bool isSaving,
            bool isDeleting)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailabilityVM() when $default != null:
        return $default(_that.businessUuid, _that.dateFrom, _that.dateTo,
            _that.entries, _that.isSaving, _that.isDeleting);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AvailabilityVM extends AvailabilityVM {
  const _AvailabilityVM(
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

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AvailabilityVMCopyWith<_AvailabilityVM> get copyWith =>
      __$AvailabilityVMCopyWithImpl<_AvailabilityVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvailabilityVM &&
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

  @override
  String toString() {
    return 'AvailabilityVM(businessUuid: $businessUuid, dateFrom: $dateFrom, dateTo: $dateTo, entries: $entries, isSaving: $isSaving, isDeleting: $isDeleting)';
  }
}

/// @nodoc
abstract mixin class _$AvailabilityVMCopyWith<$Res>
    implements $AvailabilityVMCopyWith<$Res> {
  factory _$AvailabilityVMCopyWith(
          _AvailabilityVM value, $Res Function(_AvailabilityVM) _then) =
      __$AvailabilityVMCopyWithImpl;
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
class __$AvailabilityVMCopyWithImpl<$Res>
    implements _$AvailabilityVMCopyWith<$Res> {
  __$AvailabilityVMCopyWithImpl(this._self, this._then);

  final _AvailabilityVM _self;
  final $Res Function(_AvailabilityVM) _then;

  /// Create a copy of AvailabilityVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? businessUuid = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? entries = null,
    Object? isSaving = null,
    Object? isDeleting = null,
  }) {
    return _then(_AvailabilityVM(
      businessUuid: freezed == businessUuid
          ? _self.businessUuid
          : businessUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<BusinessAvailabilityDM>,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _self.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
