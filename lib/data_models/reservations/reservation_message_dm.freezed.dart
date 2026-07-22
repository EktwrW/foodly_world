// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_message_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationMessagesResponseDM {
  List<ReservationMessageDM> get messages;
  @JsonKey(name: 'server_now')
  DateTime? get serverNow;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationMessagesResponseDMCopyWith<ReservationMessagesResponseDM>
      get copyWith => _$ReservationMessagesResponseDMCopyWithImpl<
              ReservationMessagesResponseDM>(
          this as ReservationMessagesResponseDM, _$identity);

  /// Serializes this ReservationMessagesResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationMessagesResponseDM &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            (identical(other.serverNow, serverNow) ||
                other.serverNow == serverNow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(messages), serverNow);

  @override
  String toString() {
    return 'ReservationMessagesResponseDM(messages: $messages, serverNow: $serverNow)';
  }
}

/// @nodoc
abstract mixin class $ReservationMessagesResponseDMCopyWith<$Res> {
  factory $ReservationMessagesResponseDMCopyWith(
          ReservationMessagesResponseDM value,
          $Res Function(ReservationMessagesResponseDM) _then) =
      _$ReservationMessagesResponseDMCopyWithImpl;
  @useResult
  $Res call(
      {List<ReservationMessageDM> messages,
      @JsonKey(name: 'server_now') DateTime? serverNow});
}

/// @nodoc
class _$ReservationMessagesResponseDMCopyWithImpl<$Res>
    implements $ReservationMessagesResponseDMCopyWith<$Res> {
  _$ReservationMessagesResponseDMCopyWithImpl(this._self, this._then);

  final ReservationMessagesResponseDM _self;
  final $Res Function(ReservationMessagesResponseDM) _then;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? serverNow = freezed,
  }) {
    return _then(_self.copyWith(
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ReservationMessageDM>,
      serverNow: freezed == serverNow
          ? _self.serverNow
          : serverNow // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReservationMessagesResponseDM].
extension ReservationMessagesResponseDMPatterns
    on ReservationMessagesResponseDM {
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
    TResult Function(_ReservationMessagesResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM() when $default != null:
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
    TResult Function(_ReservationMessagesResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM():
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
    TResult? Function(_ReservationMessagesResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM() when $default != null:
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
    TResult Function(List<ReservationMessageDM> messages,
            @JsonKey(name: 'server_now') DateTime? serverNow)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM() when $default != null:
        return $default(_that.messages, _that.serverNow);
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
    TResult Function(List<ReservationMessageDM> messages,
            @JsonKey(name: 'server_now') DateTime? serverNow)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM():
        return $default(_that.messages, _that.serverNow);
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
    TResult? Function(List<ReservationMessageDM> messages,
            @JsonKey(name: 'server_now') DateTime? serverNow)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessagesResponseDM() when $default != null:
        return $default(_that.messages, _that.serverNow);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationMessagesResponseDM implements ReservationMessagesResponseDM {
  const _ReservationMessagesResponseDM(
      {final List<ReservationMessageDM> messages = const [],
      @JsonKey(name: 'server_now') this.serverNow})
      : _messages = messages;
  factory _ReservationMessagesResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationMessagesResponseDMFromJson(json);

  final List<ReservationMessageDM> _messages;
  @override
  @JsonKey()
  List<ReservationMessageDM> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey(name: 'server_now')
  final DateTime? serverNow;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationMessagesResponseDMCopyWith<_ReservationMessagesResponseDM>
      get copyWith => __$ReservationMessagesResponseDMCopyWithImpl<
          _ReservationMessagesResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationMessagesResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationMessagesResponseDM &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.serverNow, serverNow) ||
                other.serverNow == serverNow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messages), serverNow);

  @override
  String toString() {
    return 'ReservationMessagesResponseDM(messages: $messages, serverNow: $serverNow)';
  }
}

/// @nodoc
abstract mixin class _$ReservationMessagesResponseDMCopyWith<$Res>
    implements $ReservationMessagesResponseDMCopyWith<$Res> {
  factory _$ReservationMessagesResponseDMCopyWith(
          _ReservationMessagesResponseDM value,
          $Res Function(_ReservationMessagesResponseDM) _then) =
      __$ReservationMessagesResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ReservationMessageDM> messages,
      @JsonKey(name: 'server_now') DateTime? serverNow});
}

/// @nodoc
class __$ReservationMessagesResponseDMCopyWithImpl<$Res>
    implements _$ReservationMessagesResponseDMCopyWith<$Res> {
  __$ReservationMessagesResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationMessagesResponseDM _self;
  final $Res Function(_ReservationMessagesResponseDM) _then;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messages = null,
    Object? serverNow = freezed,
  }) {
    return _then(_ReservationMessagesResponseDM(
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ReservationMessageDM>,
      serverNow: freezed == serverNow
          ? _self.serverNow
          : serverNow // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ReservationMessageCreateResponseDM {
  bool get success;
  String get message;
  ReservationMessageDM? get data;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationMessageCreateResponseDMCopyWith<
          ReservationMessageCreateResponseDM>
      get copyWith => _$ReservationMessageCreateResponseDMCopyWithImpl<
              ReservationMessageCreateResponseDM>(
          this as ReservationMessageCreateResponseDM, _$identity);

  /// Serializes this ReservationMessageCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationMessageCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @override
  String toString() {
    return 'ReservationMessageCreateResponseDM(success: $success, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ReservationMessageCreateResponseDMCopyWith<$Res> {
  factory $ReservationMessageCreateResponseDMCopyWith(
          ReservationMessageCreateResponseDM value,
          $Res Function(ReservationMessageCreateResponseDM) _then) =
      _$ReservationMessageCreateResponseDMCopyWithImpl;
  @useResult
  $Res call({bool success, String message, ReservationMessageDM? data});

  $ReservationMessageDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReservationMessageCreateResponseDMCopyWithImpl<$Res>
    implements $ReservationMessageCreateResponseDMCopyWith<$Res> {
  _$ReservationMessageCreateResponseDMCopyWithImpl(this._self, this._then);

  final ReservationMessageCreateResponseDM _self;
  final $Res Function(ReservationMessageCreateResponseDM) _then;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReservationMessageDM?,
    ));
  }

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationMessageDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReservationMessageDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReservationMessageCreateResponseDM].
extension ReservationMessageCreateResponseDMPatterns
    on ReservationMessageCreateResponseDM {
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
    TResult Function(_ReservationMessageCreateResponseDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM() when $default != null:
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
    TResult Function(_ReservationMessageCreateResponseDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM():
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
    TResult? Function(_ReservationMessageCreateResponseDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM() when $default != null:
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
    TResult Function(bool success, String message, ReservationMessageDM? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.data);
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
    TResult Function(bool success, String message, ReservationMessageDM? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM():
        return $default(_that.success, _that.message, _that.data);
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
    TResult? Function(bool success, String message, ReservationMessageDM? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageCreateResponseDM() when $default != null:
        return $default(_that.success, _that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationMessageCreateResponseDM
    implements ReservationMessageCreateResponseDM {
  const _ReservationMessageCreateResponseDM(
      {this.success = false, this.message = '', this.data});
  factory _ReservationMessageCreateResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationMessageCreateResponseDMFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationMessageDM? data;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationMessageCreateResponseDMCopyWith<
          _ReservationMessageCreateResponseDM>
      get copyWith => __$ReservationMessageCreateResponseDMCopyWithImpl<
          _ReservationMessageCreateResponseDM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationMessageCreateResponseDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationMessageCreateResponseDM &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @override
  String toString() {
    return 'ReservationMessageCreateResponseDM(success: $success, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ReservationMessageCreateResponseDMCopyWith<$Res>
    implements $ReservationMessageCreateResponseDMCopyWith<$Res> {
  factory _$ReservationMessageCreateResponseDMCopyWith(
          _ReservationMessageCreateResponseDM value,
          $Res Function(_ReservationMessageCreateResponseDM) _then) =
      __$ReservationMessageCreateResponseDMCopyWithImpl;
  @override
  @useResult
  $Res call({bool success, String message, ReservationMessageDM? data});

  @override
  $ReservationMessageDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$ReservationMessageCreateResponseDMCopyWithImpl<$Res>
    implements _$ReservationMessageCreateResponseDMCopyWith<$Res> {
  __$ReservationMessageCreateResponseDMCopyWithImpl(this._self, this._then);

  final _ReservationMessageCreateResponseDM _self;
  final $Res Function(_ReservationMessageCreateResponseDM) _then;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_ReservationMessageCreateResponseDM(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReservationMessageDM?,
    ));
  }

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationMessageDMCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReservationMessageDMCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$ReservationMessageDM {
  @JsonKey(name: 'message_uuid')
  String? get messageUuid;
  @JsonKey(name: 'author_type')
  MessageAuthorType get authorType;
  @JsonKey(name: 'author_name')
  String? get authorName;
  @JsonKey(name: 'author_photo')
  String? get authorPhoto;
  String get body;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationMessageDMCopyWith<ReservationMessageDM> get copyWith =>
      _$ReservationMessageDMCopyWithImpl<ReservationMessageDM>(
          this as ReservationMessageDM, _$identity);

  /// Serializes this ReservationMessageDM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationMessageDM &&
            (identical(other.messageUuid, messageUuid) ||
                other.messageUuid == messageUuid) &&
            (identical(other.authorType, authorType) ||
                other.authorType == authorType) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorPhoto, authorPhoto) ||
                other.authorPhoto == authorPhoto) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageUuid, authorType,
      authorName, authorPhoto, body, createdAt);

  @override
  String toString() {
    return 'ReservationMessageDM(messageUuid: $messageUuid, authorType: $authorType, authorName: $authorName, authorPhoto: $authorPhoto, body: $body, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ReservationMessageDMCopyWith<$Res> {
  factory $ReservationMessageDMCopyWith(ReservationMessageDM value,
          $Res Function(ReservationMessageDM) _then) =
      _$ReservationMessageDMCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'message_uuid') String? messageUuid,
      @JsonKey(name: 'author_type') MessageAuthorType authorType,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'author_photo') String? authorPhoto,
      String body,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$ReservationMessageDMCopyWithImpl<$Res>
    implements $ReservationMessageDMCopyWith<$Res> {
  _$ReservationMessageDMCopyWithImpl(this._self, this._then);

  final ReservationMessageDM _self;
  final $Res Function(ReservationMessageDM) _then;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageUuid = freezed,
    Object? authorType = null,
    Object? authorName = freezed,
    Object? authorPhoto = freezed,
    Object? body = null,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      messageUuid: freezed == messageUuid
          ? _self.messageUuid
          : messageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      authorType: null == authorType
          ? _self.authorType
          : authorType // ignore: cast_nullable_to_non_nullable
              as MessageAuthorType,
      authorName: freezed == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPhoto: freezed == authorPhoto
          ? _self.authorPhoto
          : authorPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReservationMessageDM].
extension ReservationMessageDMPatterns on ReservationMessageDM {
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
    TResult Function(_ReservationMessageDM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM() when $default != null:
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
    TResult Function(_ReservationMessageDM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM():
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
    TResult? Function(_ReservationMessageDM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM() when $default != null:
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
            @JsonKey(name: 'message_uuid') String? messageUuid,
            @JsonKey(name: 'author_type') MessageAuthorType authorType,
            @JsonKey(name: 'author_name') String? authorName,
            @JsonKey(name: 'author_photo') String? authorPhoto,
            String body,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM() when $default != null:
        return $default(_that.messageUuid, _that.authorType, _that.authorName,
            _that.authorPhoto, _that.body, _that.createdAt);
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
            @JsonKey(name: 'message_uuid') String? messageUuid,
            @JsonKey(name: 'author_type') MessageAuthorType authorType,
            @JsonKey(name: 'author_name') String? authorName,
            @JsonKey(name: 'author_photo') String? authorPhoto,
            String body,
            @JsonKey(name: 'created_at') DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM():
        return $default(_that.messageUuid, _that.authorType, _that.authorName,
            _that.authorPhoto, _that.body, _that.createdAt);
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
            @JsonKey(name: 'message_uuid') String? messageUuid,
            @JsonKey(name: 'author_type') MessageAuthorType authorType,
            @JsonKey(name: 'author_name') String? authorName,
            @JsonKey(name: 'author_photo') String? authorPhoto,
            String body,
            @JsonKey(name: 'created_at') DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReservationMessageDM() when $default != null:
        return $default(_that.messageUuid, _that.authorType, _that.authorName,
            _that.authorPhoto, _that.body, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationMessageDM extends ReservationMessageDM {
  const _ReservationMessageDM(
      {@JsonKey(name: 'message_uuid') this.messageUuid,
      @JsonKey(name: 'author_type')
      this.authorType = MessageAuthorType.customer,
      @JsonKey(name: 'author_name') this.authorName,
      @JsonKey(name: 'author_photo') this.authorPhoto,
      this.body = '',
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();
  factory _ReservationMessageDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationMessageDMFromJson(json);

  @override
  @JsonKey(name: 'message_uuid')
  final String? messageUuid;
  @override
  @JsonKey(name: 'author_type')
  final MessageAuthorType authorType;
  @override
  @JsonKey(name: 'author_name')
  final String? authorName;
  @override
  @JsonKey(name: 'author_photo')
  final String? authorPhoto;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationMessageDMCopyWith<_ReservationMessageDM> get copyWith =>
      __$ReservationMessageDMCopyWithImpl<_ReservationMessageDM>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationMessageDMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationMessageDM &&
            (identical(other.messageUuid, messageUuid) ||
                other.messageUuid == messageUuid) &&
            (identical(other.authorType, authorType) ||
                other.authorType == authorType) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorPhoto, authorPhoto) ||
                other.authorPhoto == authorPhoto) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageUuid, authorType,
      authorName, authorPhoto, body, createdAt);

  @override
  String toString() {
    return 'ReservationMessageDM(messageUuid: $messageUuid, authorType: $authorType, authorName: $authorName, authorPhoto: $authorPhoto, body: $body, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ReservationMessageDMCopyWith<$Res>
    implements $ReservationMessageDMCopyWith<$Res> {
  factory _$ReservationMessageDMCopyWith(_ReservationMessageDM value,
          $Res Function(_ReservationMessageDM) _then) =
      __$ReservationMessageDMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message_uuid') String? messageUuid,
      @JsonKey(name: 'author_type') MessageAuthorType authorType,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'author_photo') String? authorPhoto,
      String body,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$ReservationMessageDMCopyWithImpl<$Res>
    implements _$ReservationMessageDMCopyWith<$Res> {
  __$ReservationMessageDMCopyWithImpl(this._self, this._then);

  final _ReservationMessageDM _self;
  final $Res Function(_ReservationMessageDM) _then;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageUuid = freezed,
    Object? authorType = null,
    Object? authorName = freezed,
    Object? authorPhoto = freezed,
    Object? body = null,
    Object? createdAt = freezed,
  }) {
    return _then(_ReservationMessageDM(
      messageUuid: freezed == messageUuid
          ? _self.messageUuid
          : messageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      authorType: null == authorType
          ? _self.authorType
          : authorType // ignore: cast_nullable_to_non_nullable
              as MessageAuthorType,
      authorName: freezed == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPhoto: freezed == authorPhoto
          ? _self.authorPhoto
          : authorPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
