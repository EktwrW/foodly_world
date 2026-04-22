// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_features_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppFeaturesDM _$AppFeaturesDMFromJson(Map<String, dynamic> json) {
  return _AppFeaturesDM.fromJson(json);
}

/// @nodoc
mixin _$AppFeaturesDM {
  /// Controla si la app usa el backend Foodly Places Proxy
  /// (true → nuestro proxy; false → nova_places_api directo).
  /// Default true — asumimos proxy activo; si el backend jamás
  /// respondió (cold start fallido) caemos a modo proxy de todas formas
  /// y, si el proxy falla, el interceptor del repo genera failure que
  /// el caller puede manejar.
  @JsonKey(name: 'places_proxy_enabled')
  bool get placesProxyEnabled => throw _privateConstructorUsedError;

  /// Serializes this AppFeaturesDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppFeaturesDMCopyWith<AppFeaturesDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFeaturesDMCopyWith<$Res> {
  factory $AppFeaturesDMCopyWith(
          AppFeaturesDM value, $Res Function(AppFeaturesDM) then) =
      _$AppFeaturesDMCopyWithImpl<$Res, AppFeaturesDM>;
  @useResult
  $Res call({@JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled});
}

/// @nodoc
class _$AppFeaturesDMCopyWithImpl<$Res, $Val extends AppFeaturesDM>
    implements $AppFeaturesDMCopyWith<$Res> {
  _$AppFeaturesDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placesProxyEnabled = null,
  }) {
    return _then(_value.copyWith(
      placesProxyEnabled: null == placesProxyEnabled
          ? _value.placesProxyEnabled
          : placesProxyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppFeaturesDMImplCopyWith<$Res>
    implements $AppFeaturesDMCopyWith<$Res> {
  factory _$$AppFeaturesDMImplCopyWith(
          _$AppFeaturesDMImpl value, $Res Function(_$AppFeaturesDMImpl) then) =
      __$$AppFeaturesDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'places_proxy_enabled') bool placesProxyEnabled});
}

/// @nodoc
class __$$AppFeaturesDMImplCopyWithImpl<$Res>
    extends _$AppFeaturesDMCopyWithImpl<$Res, _$AppFeaturesDMImpl>
    implements _$$AppFeaturesDMImplCopyWith<$Res> {
  __$$AppFeaturesDMImplCopyWithImpl(
      _$AppFeaturesDMImpl _value, $Res Function(_$AppFeaturesDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placesProxyEnabled = null,
  }) {
    return _then(_$AppFeaturesDMImpl(
      placesProxyEnabled: null == placesProxyEnabled
          ? _value.placesProxyEnabled
          : placesProxyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppFeaturesDMImpl implements _AppFeaturesDM {
  const _$AppFeaturesDMImpl(
      {@JsonKey(name: 'places_proxy_enabled') this.placesProxyEnabled = true});

  factory _$AppFeaturesDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppFeaturesDMImplFromJson(json);

  /// Controla si la app usa el backend Foodly Places Proxy
  /// (true → nuestro proxy; false → nova_places_api directo).
  /// Default true — asumimos proxy activo; si el backend jamás
  /// respondió (cold start fallido) caemos a modo proxy de todas formas
  /// y, si el proxy falla, el interceptor del repo genera failure que
  /// el caller puede manejar.
  @override
  @JsonKey(name: 'places_proxy_enabled')
  final bool placesProxyEnabled;

  @override
  String toString() {
    return 'AppFeaturesDM(placesProxyEnabled: $placesProxyEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppFeaturesDMImpl &&
            (identical(other.placesProxyEnabled, placesProxyEnabled) ||
                other.placesProxyEnabled == placesProxyEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placesProxyEnabled);

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppFeaturesDMImplCopyWith<_$AppFeaturesDMImpl> get copyWith =>
      __$$AppFeaturesDMImplCopyWithImpl<_$AppFeaturesDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppFeaturesDMImplToJson(
      this,
    );
  }
}

abstract class _AppFeaturesDM implements AppFeaturesDM {
  const factory _AppFeaturesDM(
      {@JsonKey(name: 'places_proxy_enabled')
      final bool placesProxyEnabled}) = _$AppFeaturesDMImpl;

  factory _AppFeaturesDM.fromJson(Map<String, dynamic> json) =
      _$AppFeaturesDMImpl.fromJson;

  /// Controla si la app usa el backend Foodly Places Proxy
  /// (true → nuestro proxy; false → nova_places_api directo).
  /// Default true — asumimos proxy activo; si el backend jamás
  /// respondió (cold start fallido) caemos a modo proxy de todas formas
  /// y, si el proxy falla, el interceptor del repo genera failure que
  /// el caller puede manejar.
  @override
  @JsonKey(name: 'places_proxy_enabled')
  bool get placesProxyEnabled;

  /// Create a copy of AppFeaturesDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppFeaturesDMImplCopyWith<_$AppFeaturesDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
