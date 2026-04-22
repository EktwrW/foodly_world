// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_prediction_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlacePredictionDM _$PlacePredictionDMFromJson(Map<String, dynamic> json) {
  return _PlacePredictionDM.fromJson(json);
}

/// @nodoc
mixin _$PlacePredictionDM {
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'structured_formatting')
  PlaceStructuredFormattingDM? get structuredFormatting =>
      throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this PlacePredictionDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacePredictionDMCopyWith<PlacePredictionDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePredictionDMCopyWith<$Res> {
  factory $PlacePredictionDMCopyWith(
          PlacePredictionDM value, $Res Function(PlacePredictionDM) then) =
      _$PlacePredictionDMCopyWithImpl<$Res, PlacePredictionDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      String description,
      @JsonKey(name: 'structured_formatting')
      PlaceStructuredFormattingDM? structuredFormatting,
      List<String> types});

  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class _$PlacePredictionDMCopyWithImpl<$Res, $Val extends PlacePredictionDM>
    implements $PlacePredictionDMCopyWith<$Res> {
  _$PlacePredictionDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? structuredFormatting = freezed,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as PlaceStructuredFormattingDM?,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting {
    if (_value.structuredFormatting == null) {
      return null;
    }

    return $PlaceStructuredFormattingDMCopyWith<$Res>(
        _value.structuredFormatting!, (value) {
      return _then(_value.copyWith(structuredFormatting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlacePredictionDMImplCopyWith<$Res>
    implements $PlacePredictionDMCopyWith<$Res> {
  factory _$$PlacePredictionDMImplCopyWith(_$PlacePredictionDMImpl value,
          $Res Function(_$PlacePredictionDMImpl) then) =
      __$$PlacePredictionDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      String description,
      @JsonKey(name: 'structured_formatting')
      PlaceStructuredFormattingDM? structuredFormatting,
      List<String> types});

  @override
  $PlaceStructuredFormattingDMCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class __$$PlacePredictionDMImplCopyWithImpl<$Res>
    extends _$PlacePredictionDMCopyWithImpl<$Res, _$PlacePredictionDMImpl>
    implements _$$PlacePredictionDMImplCopyWith<$Res> {
  __$$PlacePredictionDMImplCopyWithImpl(_$PlacePredictionDMImpl _value,
      $Res Function(_$PlacePredictionDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? structuredFormatting = freezed,
    Object? types = null,
  }) {
    return _then(_$PlacePredictionDMImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as PlaceStructuredFormattingDM?,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacePredictionDMImpl implements _PlacePredictionDM {
  const _$PlacePredictionDMImpl(
      {@JsonKey(name: 'place_id') required this.placeId,
      required this.description,
      @JsonKey(name: 'structured_formatting') this.structuredFormatting,
      final List<String> types = const <String>[]})
      : _types = types;

  factory _$PlacePredictionDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacePredictionDMImplFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  final String description;
  @override
  @JsonKey(name: 'structured_formatting')
  final PlaceStructuredFormattingDM? structuredFormatting;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'PlacePredictionDM(placeId: $placeId, description: $description, structuredFormatting: $structuredFormatting, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePredictionDMImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.structuredFormatting, structuredFormatting) ||
                other.structuredFormatting == structuredFormatting) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, description,
      structuredFormatting, const DeepCollectionEquality().hash(_types));

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePredictionDMImplCopyWith<_$PlacePredictionDMImpl> get copyWith =>
      __$$PlacePredictionDMImplCopyWithImpl<_$PlacePredictionDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacePredictionDMImplToJson(
      this,
    );
  }
}

abstract class _PlacePredictionDM implements PlacePredictionDM {
  const factory _PlacePredictionDM(
      {@JsonKey(name: 'place_id') required final String placeId,
      required final String description,
      @JsonKey(name: 'structured_formatting')
      final PlaceStructuredFormattingDM? structuredFormatting,
      final List<String> types}) = _$PlacePredictionDMImpl;

  factory _PlacePredictionDM.fromJson(Map<String, dynamic> json) =
      _$PlacePredictionDMImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  String get description;
  @override
  @JsonKey(name: 'structured_formatting')
  PlaceStructuredFormattingDM? get structuredFormatting;
  @override
  List<String> get types;

  /// Create a copy of PlacePredictionDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacePredictionDMImplCopyWith<_$PlacePredictionDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceStructuredFormattingDM _$PlaceStructuredFormattingDMFromJson(
    Map<String, dynamic> json) {
  return _PlaceStructuredFormattingDM.fromJson(json);
}

/// @nodoc
mixin _$PlaceStructuredFormattingDM {
  @JsonKey(name: 'main_text')
  String? get mainText => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondary_text')
  String? get secondaryText => throw _privateConstructorUsedError;

  /// Serializes this PlaceStructuredFormattingDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceStructuredFormattingDMCopyWith<PlaceStructuredFormattingDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceStructuredFormattingDMCopyWith<$Res> {
  factory $PlaceStructuredFormattingDMCopyWith(
          PlaceStructuredFormattingDM value,
          $Res Function(PlaceStructuredFormattingDM) then) =
      _$PlaceStructuredFormattingDMCopyWithImpl<$Res,
          PlaceStructuredFormattingDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'main_text') String? mainText,
      @JsonKey(name: 'secondary_text') String? secondaryText});
}

/// @nodoc
class _$PlaceStructuredFormattingDMCopyWithImpl<$Res,
        $Val extends PlaceStructuredFormattingDM>
    implements $PlaceStructuredFormattingDMCopyWith<$Res> {
  _$PlaceStructuredFormattingDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_value.copyWith(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceStructuredFormattingDMImplCopyWith<$Res>
    implements $PlaceStructuredFormattingDMCopyWith<$Res> {
  factory _$$PlaceStructuredFormattingDMImplCopyWith(
          _$PlaceStructuredFormattingDMImpl value,
          $Res Function(_$PlaceStructuredFormattingDMImpl) then) =
      __$$PlaceStructuredFormattingDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'main_text') String? mainText,
      @JsonKey(name: 'secondary_text') String? secondaryText});
}

/// @nodoc
class __$$PlaceStructuredFormattingDMImplCopyWithImpl<$Res>
    extends _$PlaceStructuredFormattingDMCopyWithImpl<$Res,
        _$PlaceStructuredFormattingDMImpl>
    implements _$$PlaceStructuredFormattingDMImplCopyWith<$Res> {
  __$$PlaceStructuredFormattingDMImplCopyWithImpl(
      _$PlaceStructuredFormattingDMImpl _value,
      $Res Function(_$PlaceStructuredFormattingDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_$PlaceStructuredFormattingDMImpl(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceStructuredFormattingDMImpl
    implements _PlaceStructuredFormattingDM {
  const _$PlaceStructuredFormattingDMImpl(
      {@JsonKey(name: 'main_text') this.mainText,
      @JsonKey(name: 'secondary_text') this.secondaryText});

  factory _$PlaceStructuredFormattingDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlaceStructuredFormattingDMImplFromJson(json);

  @override
  @JsonKey(name: 'main_text')
  final String? mainText;
  @override
  @JsonKey(name: 'secondary_text')
  final String? secondaryText;

  @override
  String toString() {
    return 'PlaceStructuredFormattingDM(mainText: $mainText, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceStructuredFormattingDMImpl &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText, secondaryText);

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceStructuredFormattingDMImplCopyWith<_$PlaceStructuredFormattingDMImpl>
      get copyWith => __$$PlaceStructuredFormattingDMImplCopyWithImpl<
          _$PlaceStructuredFormattingDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceStructuredFormattingDMImplToJson(
      this,
    );
  }
}

abstract class _PlaceStructuredFormattingDM
    implements PlaceStructuredFormattingDM {
  const factory _PlaceStructuredFormattingDM(
          {@JsonKey(name: 'main_text') final String? mainText,
          @JsonKey(name: 'secondary_text') final String? secondaryText}) =
      _$PlaceStructuredFormattingDMImpl;

  factory _PlaceStructuredFormattingDM.fromJson(Map<String, dynamic> json) =
      _$PlaceStructuredFormattingDMImpl.fromJson;

  @override
  @JsonKey(name: 'main_text')
  String? get mainText;
  @override
  @JsonKey(name: 'secondary_text')
  String? get secondaryText;

  /// Create a copy of PlaceStructuredFormattingDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceStructuredFormattingDMImplCopyWith<_$PlaceStructuredFormattingDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
