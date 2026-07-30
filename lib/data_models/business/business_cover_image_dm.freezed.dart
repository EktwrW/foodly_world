// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_cover_image_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessCoverImageDM {
  @JsonKey(name: 'id', fromJson: _intFromJson)
  int? get intId;
  @JsonKey(name: 'business_image_uuid')
  String? get imageId;
  @JsonKey(name: 'business_image_path')
  String? get url;
  @JsonKey(name: 'business_id', fromJson: _intFromJson)
  int? get businessId;
  @JsonKey(name: 'created_at')
  DateTime? get dateCreated;
  @JsonKey(name: 'updated_at')
  DateTime? get dateUpdated;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessCoverImageDMCopyWith<BusinessCoverImageDM> get copyWith =>
      _$BusinessCoverImageDMCopyWithImpl<BusinessCoverImageDM>(
          this as BusinessCoverImageDM, _$identity);

  /// Serializes this BusinessCoverImageDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessCoverImageDM &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, intId, imageId, url, businessId, dateCreated, dateUpdated);

  @override
  String toString() {
    return 'BusinessCoverImageDM(intId: $intId, imageId: $imageId, url: $url, businessId: $businessId, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }
}

/// @nodoc
abstract mixin class $BusinessCoverImageDMCopyWith<$Res> {
  factory $BusinessCoverImageDMCopyWith(BusinessCoverImageDM value,
          $Res Function(BusinessCoverImageDM) _then) =
      _$BusinessCoverImageDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
      @JsonKey(name: 'business_image_uuid') String? imageId,
      @JsonKey(name: 'business_image_path') String? url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) int? businessId,
      @JsonKey(name: 'created_at') DateTime? dateCreated,
      @JsonKey(name: 'updated_at') DateTime? dateUpdated});
}

/// @nodoc
class _$BusinessCoverImageDMCopyWithImpl<$Res>
    implements $BusinessCoverImageDMCopyWith<$Res> {
  _$BusinessCoverImageDMCopyWithImpl(this._self, this._then);

  final BusinessCoverImageDM _self;
  final $Res Function(BusinessCoverImageDM) _then;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
    Object? businessId = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_self.copyWith(
      intId: freezed == intId
          ? _self.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _self.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BusinessCoverImageDM].
extension BusinessCoverImageDMPatterns on BusinessCoverImageDM {
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
    TResult Function(_BusinessCoverImageDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM() when $default != null:
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
    TResult Function(_BusinessCoverImageDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM():
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
    TResult? Function(_BusinessCoverImageDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM() when $default != null:
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
            @JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
            @JsonKey(name: 'business_image_uuid') String? imageId,
            @JsonKey(name: 'business_image_path') String? url,
            @JsonKey(name: 'business_id', fromJson: _intFromJson)
            int? businessId,
            @JsonKey(name: 'created_at') DateTime? dateCreated,
            @JsonKey(name: 'updated_at') DateTime? dateUpdated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM() when $default != null:
        return $default(_that.intId, _that.imageId, _that.url, _that.businessId,
            _that.dateCreated, _that.dateUpdated);
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
            @JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
            @JsonKey(name: 'business_image_uuid') String? imageId,
            @JsonKey(name: 'business_image_path') String? url,
            @JsonKey(name: 'business_id', fromJson: _intFromJson)
            int? businessId,
            @JsonKey(name: 'created_at') DateTime? dateCreated,
            @JsonKey(name: 'updated_at') DateTime? dateUpdated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM():
        return $default(_that.intId, _that.imageId, _that.url, _that.businessId,
            _that.dateCreated, _that.dateUpdated);
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
            @JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
            @JsonKey(name: 'business_image_uuid') String? imageId,
            @JsonKey(name: 'business_image_path') String? url,
            @JsonKey(name: 'business_id', fromJson: _intFromJson)
            int? businessId,
            @JsonKey(name: 'created_at') DateTime? dateCreated,
            @JsonKey(name: 'updated_at') DateTime? dateUpdated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BusinessCoverImageDM() when $default != null:
        return $default(_that.intId, _that.imageId, _that.url, _that.businessId,
            _that.dateCreated, _that.dateUpdated);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessCoverImageDM extends BusinessCoverImageDM {
  const _BusinessCoverImageDM(
      {@JsonKey(name: 'id', fromJson: _intFromJson) this.intId,
      @JsonKey(name: 'business_image_uuid') this.imageId,
      @JsonKey(name: 'business_image_path') this.url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) this.businessId,
      @JsonKey(name: 'created_at') this.dateCreated,
      @JsonKey(name: 'updated_at') this.dateUpdated})
      : super._();
  factory _BusinessCoverImageDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessCoverImageDMFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: _intFromJson)
  final int? intId;
  @override
  @JsonKey(name: 'business_image_uuid')
  final String? imageId;
  @override
  @JsonKey(name: 'business_image_path')
  final String? url;
  @override
  @JsonKey(name: 'business_id', fromJson: _intFromJson)
  final int? businessId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? dateCreated;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? dateUpdated;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessCoverImageDMCopyWith<_BusinessCoverImageDM> get copyWith =>
      __$BusinessCoverImageDMCopyWithImpl<_BusinessCoverImageDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessCoverImageDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessCoverImageDM &&
            (identical(other.intId, intId) || other.intId == intId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, intId, imageId, url, businessId, dateCreated, dateUpdated);

  @override
  String toString() {
    return 'BusinessCoverImageDM(intId: $intId, imageId: $imageId, url: $url, businessId: $businessId, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }
}

/// @nodoc
abstract mixin class _$BusinessCoverImageDMCopyWith<$Res>
    implements $BusinessCoverImageDMCopyWith<$Res> {
  factory _$BusinessCoverImageDMCopyWith(_BusinessCoverImageDM value,
          $Res Function(_BusinessCoverImageDM) _then) =
      __$BusinessCoverImageDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _intFromJson) int? intId,
      @JsonKey(name: 'business_image_uuid') String? imageId,
      @JsonKey(name: 'business_image_path') String? url,
      @JsonKey(name: 'business_id', fromJson: _intFromJson) int? businessId,
      @JsonKey(name: 'created_at') DateTime? dateCreated,
      @JsonKey(name: 'updated_at') DateTime? dateUpdated});
}

/// @nodoc
class __$BusinessCoverImageDMCopyWithImpl<$Res>
    implements _$BusinessCoverImageDMCopyWith<$Res> {
  __$BusinessCoverImageDMCopyWithImpl(this._self, this._then);

  final _BusinessCoverImageDM _self;
  final $Res Function(_BusinessCoverImageDM) _then;

  /// Create a copy of BusinessCoverImageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? intId = freezed,
    Object? imageId = freezed,
    Object? url = freezed,
    Object? businessId = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_BusinessCoverImageDM(
      intId: freezed == intId
          ? _self.intId
          : intId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _self.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _self.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: freezed == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
