// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nlp_search_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NlpSearchResponseDM _$NlpSearchResponseDMFromJson(Map<String, dynamic> json) {
  return _NlpSearchResponseDM.fromJson(json);
}

/// @nodoc
mixin _$NlpSearchResponseDM {
  @JsonKey(name: 'business')
  List<BusinessDM> get business => throw _privateConstructorUsedError;
  @JsonKey(name: 'nlp_info')
  NlpInfoDM? get nlpInfo => throw _privateConstructorUsedError;

  /// Serializes this NlpSearchResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NlpSearchResponseDMCopyWith<NlpSearchResponseDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NlpSearchResponseDMCopyWith<$Res> {
  factory $NlpSearchResponseDMCopyWith(
          NlpSearchResponseDM value, $Res Function(NlpSearchResponseDM) then) =
      _$NlpSearchResponseDMCopyWithImpl<$Res, NlpSearchResponseDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo});

  $NlpInfoDMCopyWith<$Res>? get nlpInfo;
}

/// @nodoc
class _$NlpSearchResponseDMCopyWithImpl<$Res, $Val extends NlpSearchResponseDM>
    implements $NlpSearchResponseDMCopyWith<$Res> {
  _$NlpSearchResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? nlpInfo = freezed,
  }) {
    return _then(_value.copyWith(
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      nlpInfo: freezed == nlpInfo
          ? _value.nlpInfo
          : nlpInfo // ignore: cast_nullable_to_non_nullable
              as NlpInfoDM?,
    ) as $Val);
  }

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NlpInfoDMCopyWith<$Res>? get nlpInfo {
    if (_value.nlpInfo == null) {
      return null;
    }

    return $NlpInfoDMCopyWith<$Res>(_value.nlpInfo!, (value) {
      return _then(_value.copyWith(nlpInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NlpSearchResponseDMImplCopyWith<$Res>
    implements $NlpSearchResponseDMCopyWith<$Res> {
  factory _$$NlpSearchResponseDMImplCopyWith(_$NlpSearchResponseDMImpl value,
          $Res Function(_$NlpSearchResponseDMImpl) then) =
      __$$NlpSearchResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo});

  @override
  $NlpInfoDMCopyWith<$Res>? get nlpInfo;
}

/// @nodoc
class __$$NlpSearchResponseDMImplCopyWithImpl<$Res>
    extends _$NlpSearchResponseDMCopyWithImpl<$Res, _$NlpSearchResponseDMImpl>
    implements _$$NlpSearchResponseDMImplCopyWith<$Res> {
  __$$NlpSearchResponseDMImplCopyWithImpl(_$NlpSearchResponseDMImpl _value,
      $Res Function(_$NlpSearchResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? nlpInfo = freezed,
  }) {
    return _then(_$NlpSearchResponseDMImpl(
      business: null == business
          ? _value._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      nlpInfo: freezed == nlpInfo
          ? _value.nlpInfo
          : nlpInfo // ignore: cast_nullable_to_non_nullable
              as NlpInfoDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NlpSearchResponseDMImpl implements _NlpSearchResponseDM {
  const _$NlpSearchResponseDMImpl(
      {@JsonKey(name: 'business') final List<BusinessDM> business = const [],
      @JsonKey(name: 'nlp_info') this.nlpInfo})
      : _business = business;

  factory _$NlpSearchResponseDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NlpSearchResponseDMImplFromJson(json);

  final List<BusinessDM> _business;
  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business {
    if (_business is EqualUnmodifiableListView) return _business;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_business);
  }

  @override
  @JsonKey(name: 'nlp_info')
  final NlpInfoDM? nlpInfo;

  @override
  String toString() {
    return 'NlpSearchResponseDM(business: $business, nlpInfo: $nlpInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NlpSearchResponseDMImpl &&
            const DeepCollectionEquality().equals(other._business, _business) &&
            (identical(other.nlpInfo, nlpInfo) || other.nlpInfo == nlpInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_business), nlpInfo);

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NlpSearchResponseDMImplCopyWith<_$NlpSearchResponseDMImpl> get copyWith =>
      __$$NlpSearchResponseDMImplCopyWithImpl<_$NlpSearchResponseDMImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NlpSearchResponseDMImplToJson(
      this,
    );
  }
}

abstract class _NlpSearchResponseDM implements NlpSearchResponseDM {
  const factory _NlpSearchResponseDM(
          {@JsonKey(name: 'business') final List<BusinessDM> business,
          @JsonKey(name: 'nlp_info') final NlpInfoDM? nlpInfo}) =
      _$NlpSearchResponseDMImpl;

  factory _NlpSearchResponseDM.fromJson(Map<String, dynamic> json) =
      _$NlpSearchResponseDMImpl.fromJson;

  @override
  @JsonKey(name: 'business')
  List<BusinessDM> get business;
  @override
  @JsonKey(name: 'nlp_info')
  NlpInfoDM? get nlpInfo;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NlpSearchResponseDMImplCopyWith<_$NlpSearchResponseDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NlpInfoDM _$NlpInfoDMFromJson(Map<String, dynamic> json) {
  return _NlpInfoDM.fromJson(json);
}

/// @nodoc
mixin _$NlpInfoDM {
  @JsonKey(name: 'detected_categories')
  List<int> get detectedCategories => throw _privateConstructorUsedError;
  @JsonKey(name: 'extracted_keywords')
  List<String> get extractedKeywords => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_filter')
  TimeFilterDM? get timeFilter => throw _privateConstructorUsedError;

  /// Serializes this NlpInfoDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NlpInfoDMCopyWith<NlpInfoDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NlpInfoDMCopyWith<$Res> {
  factory $NlpInfoDMCopyWith(NlpInfoDM value, $Res Function(NlpInfoDM) then) =
      _$NlpInfoDMCopyWithImpl<$Res, NlpInfoDM>;
  @useResult
  $Res call(
      {@JsonKey(name: 'detected_categories') List<int> detectedCategories,
      @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
      double confidence,
      @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter});

  $TimeFilterDMCopyWith<$Res>? get timeFilter;
}

/// @nodoc
class _$NlpInfoDMCopyWithImpl<$Res, $Val extends NlpInfoDM>
    implements $NlpInfoDMCopyWith<$Res> {
  _$NlpInfoDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectedCategories = null,
    Object? extractedKeywords = null,
    Object? confidence = null,
    Object? timeFilter = freezed,
  }) {
    return _then(_value.copyWith(
      detectedCategories: null == detectedCategories
          ? _value.detectedCategories
          : detectedCategories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extractedKeywords: null == extractedKeywords
          ? _value.extractedKeywords
          : extractedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timeFilter: freezed == timeFilter
          ? _value.timeFilter
          : timeFilter // ignore: cast_nullable_to_non_nullable
              as TimeFilterDM?,
    ) as $Val);
  }

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeFilterDMCopyWith<$Res>? get timeFilter {
    if (_value.timeFilter == null) {
      return null;
    }

    return $TimeFilterDMCopyWith<$Res>(_value.timeFilter!, (value) {
      return _then(_value.copyWith(timeFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NlpInfoDMImplCopyWith<$Res>
    implements $NlpInfoDMCopyWith<$Res> {
  factory _$$NlpInfoDMImplCopyWith(
          _$NlpInfoDMImpl value, $Res Function(_$NlpInfoDMImpl) then) =
      __$$NlpInfoDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'detected_categories') List<int> detectedCategories,
      @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
      double confidence,
      @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter});

  @override
  $TimeFilterDMCopyWith<$Res>? get timeFilter;
}

/// @nodoc
class __$$NlpInfoDMImplCopyWithImpl<$Res>
    extends _$NlpInfoDMCopyWithImpl<$Res, _$NlpInfoDMImpl>
    implements _$$NlpInfoDMImplCopyWith<$Res> {
  __$$NlpInfoDMImplCopyWithImpl(
      _$NlpInfoDMImpl _value, $Res Function(_$NlpInfoDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectedCategories = null,
    Object? extractedKeywords = null,
    Object? confidence = null,
    Object? timeFilter = freezed,
  }) {
    return _then(_$NlpInfoDMImpl(
      detectedCategories: null == detectedCategories
          ? _value._detectedCategories
          : detectedCategories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extractedKeywords: null == extractedKeywords
          ? _value._extractedKeywords
          : extractedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timeFilter: freezed == timeFilter
          ? _value.timeFilter
          : timeFilter // ignore: cast_nullable_to_non_nullable
              as TimeFilterDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NlpInfoDMImpl implements _NlpInfoDM {
  const _$NlpInfoDMImpl(
      {@JsonKey(name: 'detected_categories')
      final List<int> detectedCategories = const [],
      @JsonKey(name: 'extracted_keywords')
      final List<String> extractedKeywords = const [],
      this.confidence = 0.0,
      @JsonKey(name: 'time_filter') this.timeFilter})
      : _detectedCategories = detectedCategories,
        _extractedKeywords = extractedKeywords;

  factory _$NlpInfoDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$NlpInfoDMImplFromJson(json);

  final List<int> _detectedCategories;
  @override
  @JsonKey(name: 'detected_categories')
  List<int> get detectedCategories {
    if (_detectedCategories is EqualUnmodifiableListView)
      return _detectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedCategories);
  }

  final List<String> _extractedKeywords;
  @override
  @JsonKey(name: 'extracted_keywords')
  List<String> get extractedKeywords {
    if (_extractedKeywords is EqualUnmodifiableListView)
      return _extractedKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extractedKeywords);
  }

  @override
  @JsonKey()
  final double confidence;
  @override
  @JsonKey(name: 'time_filter')
  final TimeFilterDM? timeFilter;

  @override
  String toString() {
    return 'NlpInfoDM(detectedCategories: $detectedCategories, extractedKeywords: $extractedKeywords, confidence: $confidence, timeFilter: $timeFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NlpInfoDMImpl &&
            const DeepCollectionEquality()
                .equals(other._detectedCategories, _detectedCategories) &&
            const DeepCollectionEquality()
                .equals(other._extractedKeywords, _extractedKeywords) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.timeFilter, timeFilter) ||
                other.timeFilter == timeFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_detectedCategories),
      const DeepCollectionEquality().hash(_extractedKeywords),
      confidence,
      timeFilter);

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NlpInfoDMImplCopyWith<_$NlpInfoDMImpl> get copyWith =>
      __$$NlpInfoDMImplCopyWithImpl<_$NlpInfoDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NlpInfoDMImplToJson(
      this,
    );
  }
}

abstract class _NlpInfoDM implements NlpInfoDM {
  const factory _NlpInfoDM(
      {@JsonKey(name: 'detected_categories') final List<int> detectedCategories,
      @JsonKey(name: 'extracted_keywords') final List<String> extractedKeywords,
      final double confidence,
      @JsonKey(name: 'time_filter')
      final TimeFilterDM? timeFilter}) = _$NlpInfoDMImpl;

  factory _NlpInfoDM.fromJson(Map<String, dynamic> json) =
      _$NlpInfoDMImpl.fromJson;

  @override
  @JsonKey(name: 'detected_categories')
  List<int> get detectedCategories;
  @override
  @JsonKey(name: 'extracted_keywords')
  List<String> get extractedKeywords;
  @override
  double get confidence;
  @override
  @JsonKey(name: 'time_filter')
  TimeFilterDM? get timeFilter;

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NlpInfoDMImplCopyWith<_$NlpInfoDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeFilterDM _$TimeFilterDMFromJson(Map<String, dynamic> json) {
  return _TimeFilterDM.fromJson(json);
}

/// @nodoc
mixin _$TimeFilterDM {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'meal_time')
  String? get mealTime => throw _privateConstructorUsedError;

  /// Serializes this TimeFilterDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeFilterDMCopyWith<TimeFilterDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeFilterDMCopyWith<$Res> {
  factory $TimeFilterDMCopyWith(
          TimeFilterDM value, $Res Function(TimeFilterDM) then) =
      _$TimeFilterDMCopyWithImpl<$Res, TimeFilterDM>;
  @useResult
  $Res call(
      {String? from,
      String? to,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'meal_time') String? mealTime});
}

/// @nodoc
class _$TimeFilterDMCopyWithImpl<$Res, $Val extends TimeFilterDM>
    implements $TimeFilterDMCopyWith<$Res> {
  _$TimeFilterDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? dayOfWeek = freezed,
    Object? mealTime = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      mealTime: freezed == mealTime
          ? _value.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeFilterDMImplCopyWith<$Res>
    implements $TimeFilterDMCopyWith<$Res> {
  factory _$$TimeFilterDMImplCopyWith(
          _$TimeFilterDMImpl value, $Res Function(_$TimeFilterDMImpl) then) =
      __$$TimeFilterDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? from,
      String? to,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'meal_time') String? mealTime});
}

/// @nodoc
class __$$TimeFilterDMImplCopyWithImpl<$Res>
    extends _$TimeFilterDMCopyWithImpl<$Res, _$TimeFilterDMImpl>
    implements _$$TimeFilterDMImplCopyWith<$Res> {
  __$$TimeFilterDMImplCopyWithImpl(
      _$TimeFilterDMImpl _value, $Res Function(_$TimeFilterDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? dayOfWeek = freezed,
    Object? mealTime = freezed,
  }) {
    return _then(_$TimeFilterDMImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      mealTime: freezed == mealTime
          ? _value.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeFilterDMImpl implements _TimeFilterDM {
  const _$TimeFilterDMImpl(
      {this.from,
      this.to,
      @JsonKey(name: 'day_of_week') this.dayOfWeek,
      @JsonKey(name: 'meal_time') this.mealTime});

  factory _$TimeFilterDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeFilterDMImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  @override
  @JsonKey(name: 'meal_time')
  final String? mealTime;

  @override
  String toString() {
    return 'TimeFilterDM(from: $from, to: $to, dayOfWeek: $dayOfWeek, mealTime: $mealTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeFilterDMImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.mealTime, mealTime) ||
                other.mealTime == mealTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, dayOfWeek, mealTime);

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeFilterDMImplCopyWith<_$TimeFilterDMImpl> get copyWith =>
      __$$TimeFilterDMImplCopyWithImpl<_$TimeFilterDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeFilterDMImplToJson(
      this,
    );
  }
}

abstract class _TimeFilterDM implements TimeFilterDM {
  const factory _TimeFilterDM(
      {final String? from,
      final String? to,
      @JsonKey(name: 'day_of_week') final int? dayOfWeek,
      @JsonKey(name: 'meal_time') final String? mealTime}) = _$TimeFilterDMImpl;

  factory _TimeFilterDM.fromJson(Map<String, dynamic> json) =
      _$TimeFilterDMImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek;
  @override
  @JsonKey(name: 'meal_time')
  String? get mealTime;

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeFilterDMImplCopyWith<_$TimeFilterDMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
