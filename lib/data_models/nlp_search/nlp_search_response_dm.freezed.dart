// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nlp_search_response_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NlpSearchResponseDM {
  @JsonKey(name: 'business')
  List<BusinessDM> get business;
  @JsonKey(name: 'nlp_info')
  NlpInfoDM? get nlpInfo;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NlpSearchResponseDMCopyWith<NlpSearchResponseDM> get copyWith =>
      _$NlpSearchResponseDMCopyWithImpl<NlpSearchResponseDM>(
          this as NlpSearchResponseDM, _$identity);

  /// Serializes this NlpSearchResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NlpSearchResponseDM &&
            const DeepCollectionEquality().equals(other.business, business) &&
            (identical(other.nlpInfo, nlpInfo) || other.nlpInfo == nlpInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(business), nlpInfo);

  @override
  String toString() {
    return 'NlpSearchResponseDM(business: $business, nlpInfo: $nlpInfo)';
  }
}

/// @nodoc
abstract mixin class $NlpSearchResponseDMCopyWith<$Res> {
  factory $NlpSearchResponseDMCopyWith(
          NlpSearchResponseDM value, $Res Function(NlpSearchResponseDM) _then) =
      _$NlpSearchResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo});

  $NlpInfoDMCopyWith<$Res>? get nlpInfo;
}

/// @nodoc
class _$NlpSearchResponseDMCopyWithImpl<$Res>
    implements $NlpSearchResponseDMCopyWith<$Res> {
  _$NlpSearchResponseDMCopyWithImpl(this._self, this._then);

  final NlpSearchResponseDM _self;
  final $Res Function(NlpSearchResponseDM) _then;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? business = null,
    Object? nlpInfo = freezed,
  }) {
    return _then(_self.copyWith(
      business: null == business
          ? _self.business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      nlpInfo: freezed == nlpInfo
          ? _self.nlpInfo
          : nlpInfo // ignore: cast_nullable_to_non_nullable
              as NlpInfoDM?,
    ));
  }

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NlpInfoDMCopyWith<$Res>? get nlpInfo {
    if (_self.nlpInfo == null) {
      return null;
    }

    return $NlpInfoDMCopyWith<$Res>(_self.nlpInfo!, (value) {
      return _then(_self.copyWith(nlpInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NlpSearchResponseDM].
extension NlpSearchResponseDMPatterns on NlpSearchResponseDM {
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
    TResult Function(_NlpSearchResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM() when $default != null:
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
    TResult Function(_NlpSearchResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM():
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
    TResult? Function(_NlpSearchResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM() when $default != null:
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
    TResult Function(@JsonKey(name: 'business') List<BusinessDM> business,
            @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM() when $default != null:
        return $default(_that.business, _that.nlpInfo);
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
    TResult Function(@JsonKey(name: 'business') List<BusinessDM> business,
            @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM():
        return $default(_that.business, _that.nlpInfo);
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
    TResult? Function(@JsonKey(name: 'business') List<BusinessDM> business,
            @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpSearchResponseDM() when $default != null:
        return $default(_that.business, _that.nlpInfo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NlpSearchResponseDM implements NlpSearchResponseDM {
  const _NlpSearchResponseDM(
      {@JsonKey(name: 'business') final List<BusinessDM> business = const [],
      @JsonKey(name: 'nlp_info') this.nlpInfo})
      : _business = business;
  factory _NlpSearchResponseDM.fromJson(Map<String, dynamic> json) =>
      _$NlpSearchResponseDMFromJson(json);

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

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NlpSearchResponseDMCopyWith<_NlpSearchResponseDM> get copyWith =>
      __$NlpSearchResponseDMCopyWithImpl<_NlpSearchResponseDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NlpSearchResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NlpSearchResponseDM &&
            const DeepCollectionEquality().equals(other._business, _business) &&
            (identical(other.nlpInfo, nlpInfo) || other.nlpInfo == nlpInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_business), nlpInfo);

  @override
  String toString() {
    return 'NlpSearchResponseDM(business: $business, nlpInfo: $nlpInfo)';
  }
}

/// @nodoc
abstract mixin class _$NlpSearchResponseDMCopyWith<$Res>
    implements $NlpSearchResponseDMCopyWith<$Res> {
  factory _$NlpSearchResponseDMCopyWith(_NlpSearchResponseDM value,
          $Res Function(_NlpSearchResponseDM) _then) =
      __$NlpSearchResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business') List<BusinessDM> business,
      @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo});

  @override
  $NlpInfoDMCopyWith<$Res>? get nlpInfo;
}

/// @nodoc
class __$NlpSearchResponseDMCopyWithImpl<$Res>
    implements _$NlpSearchResponseDMCopyWith<$Res> {
  __$NlpSearchResponseDMCopyWithImpl(this._self, this._then);

  final _NlpSearchResponseDM _self;
  final $Res Function(_NlpSearchResponseDM) _then;

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? business = null,
    Object? nlpInfo = freezed,
  }) {
    return _then(_NlpSearchResponseDM(
      business: null == business
          ? _self._business
          : business // ignore: cast_nullable_to_non_nullable
              as List<BusinessDM>,
      nlpInfo: freezed == nlpInfo
          ? _self.nlpInfo
          : nlpInfo // ignore: cast_nullable_to_non_nullable
              as NlpInfoDM?,
    ));
  }

  /// Create a copy of NlpSearchResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NlpInfoDMCopyWith<$Res>? get nlpInfo {
    if (_self.nlpInfo == null) {
      return null;
    }

    return $NlpInfoDMCopyWith<$Res>(_self.nlpInfo!, (value) {
      return _then(_self.copyWith(nlpInfo: value));
    });
  }
}

/// @nodoc
mixin _$NlpInfoDM {
  @JsonKey(name: 'detected_categories')
  List<int> get detectedCategories;
  @JsonKey(name: 'extracted_keywords')
  List<String> get extractedKeywords;
  double get confidence;
  @JsonKey(name: 'time_filter')
  TimeFilterDM? get timeFilter;

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NlpInfoDMCopyWith<NlpInfoDM> get copyWith =>
      _$NlpInfoDMCopyWithImpl<NlpInfoDM>(this as NlpInfoDM, _$identity);

  /// Serializes this NlpInfoDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NlpInfoDM &&
            const DeepCollectionEquality()
                .equals(other.detectedCategories, detectedCategories) &&
            const DeepCollectionEquality()
                .equals(other.extractedKeywords, extractedKeywords) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.timeFilter, timeFilter) ||
                other.timeFilter == timeFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(detectedCategories),
      const DeepCollectionEquality().hash(extractedKeywords),
      confidence,
      timeFilter);

  @override
  String toString() {
    return 'NlpInfoDM(detectedCategories: $detectedCategories, extractedKeywords: $extractedKeywords, confidence: $confidence, timeFilter: $timeFilter)';
  }
}

/// @nodoc
abstract mixin class $NlpInfoDMCopyWith<$Res> {
  factory $NlpInfoDMCopyWith(NlpInfoDM value, $Res Function(NlpInfoDM) _then) =
      _$NlpInfoDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'detected_categories') List<int> detectedCategories,
      @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
      double confidence,
      @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter});

  $TimeFilterDMCopyWith<$Res>? get timeFilter;
}

/// @nodoc
class _$NlpInfoDMCopyWithImpl<$Res> implements $NlpInfoDMCopyWith<$Res> {
  _$NlpInfoDMCopyWithImpl(this._self, this._then);

  final NlpInfoDM _self;
  final $Res Function(NlpInfoDM) _then;

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
    return _then(_self.copyWith(
      detectedCategories: null == detectedCategories
          ? _self.detectedCategories
          : detectedCategories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extractedKeywords: null == extractedKeywords
          ? _self.extractedKeywords
          : extractedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _self.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timeFilter: freezed == timeFilter
          ? _self.timeFilter
          : timeFilter // ignore: cast_nullable_to_non_nullable
              as TimeFilterDM?,
    ));
  }

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeFilterDMCopyWith<$Res>? get timeFilter {
    if (_self.timeFilter == null) {
      return null;
    }

    return $TimeFilterDMCopyWith<$Res>(_self.timeFilter!, (value) {
      return _then(_self.copyWith(timeFilter: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NlpInfoDM].
extension NlpInfoDMPatterns on NlpInfoDM {
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
    TResult Function(_NlpInfoDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM() when $default != null:
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
    TResult Function(_NlpInfoDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM():
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
    TResult? Function(_NlpInfoDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM() when $default != null:
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
            @JsonKey(name: 'detected_categories') List<int> detectedCategories,
            @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
            double confidence,
            @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM() when $default != null:
        return $default(_that.detectedCategories, _that.extractedKeywords,
            _that.confidence, _that.timeFilter);
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
            @JsonKey(name: 'detected_categories') List<int> detectedCategories,
            @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
            double confidence,
            @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM():
        return $default(_that.detectedCategories, _that.extractedKeywords,
            _that.confidence, _that.timeFilter);
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
            @JsonKey(name: 'detected_categories') List<int> detectedCategories,
            @JsonKey(name: 'extracted_keywords') List<String> extractedKeywords,
            double confidence,
            @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NlpInfoDM() when $default != null:
        return $default(_that.detectedCategories, _that.extractedKeywords,
            _that.confidence, _that.timeFilter);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NlpInfoDM implements NlpInfoDM {
  const _NlpInfoDM(
      {@JsonKey(name: 'detected_categories')
      final List<int> detectedCategories = const [],
      @JsonKey(name: 'extracted_keywords')
      final List<String> extractedKeywords = const [],
      this.confidence = 0.0,
      @JsonKey(name: 'time_filter') this.timeFilter})
      : _detectedCategories = detectedCategories,
        _extractedKeywords = extractedKeywords;
  factory _NlpInfoDM.fromJson(Map<String, dynamic> json) =>
      _$NlpInfoDMFromJson(json);

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

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NlpInfoDMCopyWith<_NlpInfoDM> get copyWith =>
      __$NlpInfoDMCopyWithImpl<_NlpInfoDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NlpInfoDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NlpInfoDM &&
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

  @override
  String toString() {
    return 'NlpInfoDM(detectedCategories: $detectedCategories, extractedKeywords: $extractedKeywords, confidence: $confidence, timeFilter: $timeFilter)';
  }
}

/// @nodoc
abstract mixin class _$NlpInfoDMCopyWith<$Res>
    implements $NlpInfoDMCopyWith<$Res> {
  factory _$NlpInfoDMCopyWith(
          _NlpInfoDM value, $Res Function(_NlpInfoDM) _then) =
      __$NlpInfoDMCopyWithImpl;
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
class __$NlpInfoDMCopyWithImpl<$Res> implements _$NlpInfoDMCopyWith<$Res> {
  __$NlpInfoDMCopyWithImpl(this._self, this._then);

  final _NlpInfoDM _self;
  final $Res Function(_NlpInfoDM) _then;

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? detectedCategories = null,
    Object? extractedKeywords = null,
    Object? confidence = null,
    Object? timeFilter = freezed,
  }) {
    return _then(_NlpInfoDM(
      detectedCategories: null == detectedCategories
          ? _self._detectedCategories
          : detectedCategories // ignore: cast_nullable_to_non_nullable
              as List<int>,
      extractedKeywords: null == extractedKeywords
          ? _self._extractedKeywords
          : extractedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _self.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timeFilter: freezed == timeFilter
          ? _self.timeFilter
          : timeFilter // ignore: cast_nullable_to_non_nullable
              as TimeFilterDM?,
    ));
  }

  /// Create a copy of NlpInfoDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeFilterDMCopyWith<$Res>? get timeFilter {
    if (_self.timeFilter == null) {
      return null;
    }

    return $TimeFilterDMCopyWith<$Res>(_self.timeFilter!, (value) {
      return _then(_self.copyWith(timeFilter: value));
    });
  }
}

/// @nodoc
mixin _$TimeFilterDM {
  String? get from;
  String? get to;
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek;
  @JsonKey(name: 'meal_time')
  String? get mealTime;

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeFilterDMCopyWith<TimeFilterDM> get copyWith =>
      _$TimeFilterDMCopyWithImpl<TimeFilterDM>(
          this as TimeFilterDM, _$identity);

  /// Serializes this TimeFilterDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeFilterDM &&
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

  @override
  String toString() {
    return 'TimeFilterDM(from: $from, to: $to, dayOfWeek: $dayOfWeek, mealTime: $mealTime)';
  }
}

/// @nodoc
abstract mixin class $TimeFilterDMCopyWith<$Res> {
  factory $TimeFilterDMCopyWith(
          TimeFilterDM value, $Res Function(TimeFilterDM) _then) =
      _$TimeFilterDMCopyWithImpl;
  @useResult
  $Res call(
      {String? from,
      String? to,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'meal_time') String? mealTime});
}

/// @nodoc
class _$TimeFilterDMCopyWithImpl<$Res> implements $TimeFilterDMCopyWith<$Res> {
  _$TimeFilterDMCopyWithImpl(this._self, this._then);

  final TimeFilterDM _self;
  final $Res Function(TimeFilterDM) _then;

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
    return _then(_self.copyWith(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      mealTime: freezed == mealTime
          ? _self.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TimeFilterDM].
extension TimeFilterDMPatterns on TimeFilterDM {
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
    TResult Function(_TimeFilterDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM() when $default != null:
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
    TResult Function(_TimeFilterDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM():
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
    TResult? Function(_TimeFilterDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM() when $default != null:
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
            String? from,
            String? to,
            @JsonKey(name: 'day_of_week') int? dayOfWeek,
            @JsonKey(name: 'meal_time') String? mealTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM() when $default != null:
        return $default(_that.from, _that.to, _that.dayOfWeek, _that.mealTime);
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
            String? from,
            String? to,
            @JsonKey(name: 'day_of_week') int? dayOfWeek,
            @JsonKey(name: 'meal_time') String? mealTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM():
        return $default(_that.from, _that.to, _that.dayOfWeek, _that.mealTime);
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
            String? from,
            String? to,
            @JsonKey(name: 'day_of_week') int? dayOfWeek,
            @JsonKey(name: 'meal_time') String? mealTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimeFilterDM() when $default != null:
        return $default(_that.from, _that.to, _that.dayOfWeek, _that.mealTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TimeFilterDM implements TimeFilterDM {
  const _TimeFilterDM(
      {this.from,
      this.to,
      @JsonKey(name: 'day_of_week') this.dayOfWeek,
      @JsonKey(name: 'meal_time') this.mealTime});
  factory _TimeFilterDM.fromJson(Map<String, dynamic> json) =>
      _$TimeFilterDMFromJson(json);

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

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeFilterDMCopyWith<_TimeFilterDM> get copyWith =>
      __$TimeFilterDMCopyWithImpl<_TimeFilterDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimeFilterDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeFilterDM &&
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

  @override
  String toString() {
    return 'TimeFilterDM(from: $from, to: $to, dayOfWeek: $dayOfWeek, mealTime: $mealTime)';
  }
}

/// @nodoc
abstract mixin class _$TimeFilterDMCopyWith<$Res>
    implements $TimeFilterDMCopyWith<$Res> {
  factory _$TimeFilterDMCopyWith(
          _TimeFilterDM value, $Res Function(_TimeFilterDM) _then) =
      __$TimeFilterDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? from,
      String? to,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'meal_time') String? mealTime});
}

/// @nodoc
class __$TimeFilterDMCopyWithImpl<$Res>
    implements _$TimeFilterDMCopyWith<$Res> {
  __$TimeFilterDMCopyWithImpl(this._self, this._then);

  final _TimeFilterDM _self;
  final $Res Function(_TimeFilterDM) _then;

  /// Create a copy of TimeFilterDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? dayOfWeek = freezed,
    Object? mealTime = freezed,
  }) {
    return _then(_TimeFilterDM(
      from: freezed == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: freezed == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      mealTime: freezed == mealTime
          ? _self.mealTime
          : mealTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
