// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_message_dm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReservationMessagesResponseDM _$ReservationMessagesResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationMessagesResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationMessagesResponseDM {
  List<ReservationMessageDM> get messages => throw _privateConstructorUsedError;

  /// Serializes this ReservationMessagesResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationMessagesResponseDMCopyWith<ReservationMessagesResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationMessagesResponseDMCopyWith<$Res> {
  factory $ReservationMessagesResponseDMCopyWith(
          ReservationMessagesResponseDM value,
          $Res Function(ReservationMessagesResponseDM) then) =
      _$ReservationMessagesResponseDMCopyWithImpl<$Res,
          ReservationMessagesResponseDM>;
  @useResult
  $Res call({List<ReservationMessageDM> messages});
}

/// @nodoc
class _$ReservationMessagesResponseDMCopyWithImpl<$Res,
        $Val extends ReservationMessagesResponseDM>
    implements $ReservationMessagesResponseDMCopyWith<$Res> {
  _$ReservationMessagesResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ReservationMessageDM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationMessagesResponseDMImplCopyWith<$Res>
    implements $ReservationMessagesResponseDMCopyWith<$Res> {
  factory _$$ReservationMessagesResponseDMImplCopyWith(
          _$ReservationMessagesResponseDMImpl value,
          $Res Function(_$ReservationMessagesResponseDMImpl) then) =
      __$$ReservationMessagesResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReservationMessageDM> messages});
}

/// @nodoc
class __$$ReservationMessagesResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationMessagesResponseDMCopyWithImpl<$Res,
        _$ReservationMessagesResponseDMImpl>
    implements _$$ReservationMessagesResponseDMImplCopyWith<$Res> {
  __$$ReservationMessagesResponseDMImplCopyWithImpl(
      _$ReservationMessagesResponseDMImpl _value,
      $Res Function(_$ReservationMessagesResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$ReservationMessagesResponseDMImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ReservationMessageDM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationMessagesResponseDMImpl
    implements _ReservationMessagesResponseDM {
  const _$ReservationMessagesResponseDMImpl(
      {final List<ReservationMessageDM> messages = const []})
      : _messages = messages;

  factory _$ReservationMessagesResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReservationMessagesResponseDMImplFromJson(json);

  final List<ReservationMessageDM> _messages;
  @override
  @JsonKey()
  List<ReservationMessageDM> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ReservationMessagesResponseDM(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationMessagesResponseDMImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationMessagesResponseDMImplCopyWith<
          _$ReservationMessagesResponseDMImpl>
      get copyWith => __$$ReservationMessagesResponseDMImplCopyWithImpl<
          _$ReservationMessagesResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationMessagesResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationMessagesResponseDM
    implements ReservationMessagesResponseDM {
  const factory _ReservationMessagesResponseDM(
          {final List<ReservationMessageDM> messages}) =
      _$ReservationMessagesResponseDMImpl;

  factory _ReservationMessagesResponseDM.fromJson(Map<String, dynamic> json) =
      _$ReservationMessagesResponseDMImpl.fromJson;

  @override
  List<ReservationMessageDM> get messages;

  /// Create a copy of ReservationMessagesResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationMessagesResponseDMImplCopyWith<
          _$ReservationMessagesResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationMessageCreateResponseDM _$ReservationMessageCreateResponseDMFromJson(
    Map<String, dynamic> json) {
  return _ReservationMessageCreateResponseDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationMessageCreateResponseDM {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReservationMessageDM? get data => throw _privateConstructorUsedError;

  /// Serializes this ReservationMessageCreateResponseDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationMessageCreateResponseDMCopyWith<
          ReservationMessageCreateResponseDM>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationMessageCreateResponseDMCopyWith<$Res> {
  factory $ReservationMessageCreateResponseDMCopyWith(
          ReservationMessageCreateResponseDM value,
          $Res Function(ReservationMessageCreateResponseDM) then) =
      _$ReservationMessageCreateResponseDMCopyWithImpl<$Res,
          ReservationMessageCreateResponseDM>;
  @useResult
  $Res call({bool success, String message, ReservationMessageDM? data});

  $ReservationMessageDMCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReservationMessageCreateResponseDMCopyWithImpl<$Res,
        $Val extends ReservationMessageCreateResponseDM>
    implements $ReservationMessageCreateResponseDMCopyWith<$Res> {
  _$ReservationMessageCreateResponseDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReservationMessageDM?,
    ) as $Val);
  }

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReservationMessageDMCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReservationMessageDMCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReservationMessageCreateResponseDMImplCopyWith<$Res>
    implements $ReservationMessageCreateResponseDMCopyWith<$Res> {
  factory _$$ReservationMessageCreateResponseDMImplCopyWith(
          _$ReservationMessageCreateResponseDMImpl value,
          $Res Function(_$ReservationMessageCreateResponseDMImpl) then) =
      __$$ReservationMessageCreateResponseDMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ReservationMessageDM? data});

  @override
  $ReservationMessageDMCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ReservationMessageCreateResponseDMImplCopyWithImpl<$Res>
    extends _$ReservationMessageCreateResponseDMCopyWithImpl<$Res,
        _$ReservationMessageCreateResponseDMImpl>
    implements _$$ReservationMessageCreateResponseDMImplCopyWith<$Res> {
  __$$ReservationMessageCreateResponseDMImplCopyWithImpl(
      _$ReservationMessageCreateResponseDMImpl _value,
      $Res Function(_$ReservationMessageCreateResponseDMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ReservationMessageCreateResponseDMImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReservationMessageDM?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationMessageCreateResponseDMImpl
    implements _ReservationMessageCreateResponseDM {
  const _$ReservationMessageCreateResponseDMImpl(
      {this.success = false, this.message = '', this.data});

  factory _$ReservationMessageCreateResponseDMImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReservationMessageCreateResponseDMImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final ReservationMessageDM? data;

  @override
  String toString() {
    return 'ReservationMessageCreateResponseDM(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationMessageCreateResponseDMImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationMessageCreateResponseDMImplCopyWith<
          _$ReservationMessageCreateResponseDMImpl>
      get copyWith => __$$ReservationMessageCreateResponseDMImplCopyWithImpl<
          _$ReservationMessageCreateResponseDMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationMessageCreateResponseDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationMessageCreateResponseDM
    implements ReservationMessageCreateResponseDM {
  const factory _ReservationMessageCreateResponseDM(
          {final bool success,
          final String message,
          final ReservationMessageDM? data}) =
      _$ReservationMessageCreateResponseDMImpl;

  factory _ReservationMessageCreateResponseDM.fromJson(
          Map<String, dynamic> json) =
      _$ReservationMessageCreateResponseDMImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ReservationMessageDM? get data;

  /// Create a copy of ReservationMessageCreateResponseDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationMessageCreateResponseDMImplCopyWith<
          _$ReservationMessageCreateResponseDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReservationMessageDM _$ReservationMessageDMFromJson(Map<String, dynamic> json) {
  return _ReservationMessageDM.fromJson(json);
}

/// @nodoc
mixin _$ReservationMessageDM {
  @JsonKey(name: 'message_uuid')
  String? get messageUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_type')
  MessageAuthorType get authorType => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_photo')
  String? get authorPhoto => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ReservationMessageDM to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationMessageDMCopyWith<ReservationMessageDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationMessageDMCopyWith<$Res> {
  factory $ReservationMessageDMCopyWith(ReservationMessageDM value,
          $Res Function(ReservationMessageDM) then) =
      _$ReservationMessageDMCopyWithImpl<$Res, ReservationMessageDM>;
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
class _$ReservationMessageDMCopyWithImpl<$Res,
        $Val extends ReservationMessageDM>
    implements $ReservationMessageDMCopyWith<$Res> {
  _$ReservationMessageDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      messageUuid: freezed == messageUuid
          ? _value.messageUuid
          : messageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      authorType: null == authorType
          ? _value.authorType
          : authorType // ignore: cast_nullable_to_non_nullable
              as MessageAuthorType,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPhoto: freezed == authorPhoto
          ? _value.authorPhoto
          : authorPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationMessageDMImplCopyWith<$Res>
    implements $ReservationMessageDMCopyWith<$Res> {
  factory _$$ReservationMessageDMImplCopyWith(_$ReservationMessageDMImpl value,
          $Res Function(_$ReservationMessageDMImpl) then) =
      __$$ReservationMessageDMImplCopyWithImpl<$Res>;
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
class __$$ReservationMessageDMImplCopyWithImpl<$Res>
    extends _$ReservationMessageDMCopyWithImpl<$Res, _$ReservationMessageDMImpl>
    implements _$$ReservationMessageDMImplCopyWith<$Res> {
  __$$ReservationMessageDMImplCopyWithImpl(_$ReservationMessageDMImpl _value,
      $Res Function(_$ReservationMessageDMImpl) _then)
      : super(_value, _then);

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
    return _then(_$ReservationMessageDMImpl(
      messageUuid: freezed == messageUuid
          ? _value.messageUuid
          : messageUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      authorType: null == authorType
          ? _value.authorType
          : authorType // ignore: cast_nullable_to_non_nullable
              as MessageAuthorType,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPhoto: freezed == authorPhoto
          ? _value.authorPhoto
          : authorPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationMessageDMImpl extends _ReservationMessageDM {
  const _$ReservationMessageDMImpl(
      {@JsonKey(name: 'message_uuid') this.messageUuid,
      @JsonKey(name: 'author_type')
      this.authorType = MessageAuthorType.customer,
      @JsonKey(name: 'author_name') this.authorName,
      @JsonKey(name: 'author_photo') this.authorPhoto,
      this.body = '',
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$ReservationMessageDMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationMessageDMImplFromJson(json);

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

  @override
  String toString() {
    return 'ReservationMessageDM(messageUuid: $messageUuid, authorType: $authorType, authorName: $authorName, authorPhoto: $authorPhoto, body: $body, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationMessageDMImpl &&
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

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationMessageDMImplCopyWith<_$ReservationMessageDMImpl>
      get copyWith =>
          __$$ReservationMessageDMImplCopyWithImpl<_$ReservationMessageDMImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationMessageDMImplToJson(
      this,
    );
  }
}

abstract class _ReservationMessageDM extends ReservationMessageDM {
  const factory _ReservationMessageDM(
          {@JsonKey(name: 'message_uuid') final String? messageUuid,
          @JsonKey(name: 'author_type') final MessageAuthorType authorType,
          @JsonKey(name: 'author_name') final String? authorName,
          @JsonKey(name: 'author_photo') final String? authorPhoto,
          final String body,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$ReservationMessageDMImpl;
  const _ReservationMessageDM._() : super._();

  factory _ReservationMessageDM.fromJson(Map<String, dynamic> json) =
      _$ReservationMessageDMImpl.fromJson;

  @override
  @JsonKey(name: 'message_uuid')
  String? get messageUuid;
  @override
  @JsonKey(name: 'author_type')
  MessageAuthorType get authorType;
  @override
  @JsonKey(name: 'author_name')
  String? get authorName;
  @override
  @JsonKey(name: 'author_photo')
  String? get authorPhoto;
  @override
  String get body;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of ReservationMessageDM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationMessageDMImplCopyWith<_$ReservationMessageDMImpl>
      get copyWith => throw _privateConstructorUsedError;
}
