// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactVM {
  ContactRecipient get recipient => throw _privateConstructorUsedError;
  String? get attachmentPath => throw _privateConstructorUsedError;
  String? get attachmentName => throw _privateConstructorUsedError;
  bool get attachmentTooLarge => throw _privateConstructorUsedError;

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactVMCopyWith<ContactVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactVMCopyWith<$Res> {
  factory $ContactVMCopyWith(ContactVM value, $Res Function(ContactVM) then) =
      _$ContactVMCopyWithImpl<$Res, ContactVM>;
  @useResult
  $Res call(
      {ContactRecipient recipient,
      String? attachmentPath,
      String? attachmentName,
      bool attachmentTooLarge});
}

/// @nodoc
class _$ContactVMCopyWithImpl<$Res, $Val extends ContactVM>
    implements $ContactVMCopyWith<$Res> {
  _$ContactVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? attachmentPath = freezed,
    Object? attachmentName = freezed,
    Object? attachmentTooLarge = null,
  }) {
    return _then(_value.copyWith(
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as ContactRecipient,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentName: freezed == attachmentName
          ? _value.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentTooLarge: null == attachmentTooLarge
          ? _value.attachmentTooLarge
          : attachmentTooLarge // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactVMImplCopyWith<$Res>
    implements $ContactVMCopyWith<$Res> {
  factory _$$ContactVMImplCopyWith(
          _$ContactVMImpl value, $Res Function(_$ContactVMImpl) then) =
      __$$ContactVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContactRecipient recipient,
      String? attachmentPath,
      String? attachmentName,
      bool attachmentTooLarge});
}

/// @nodoc
class __$$ContactVMImplCopyWithImpl<$Res>
    extends _$ContactVMCopyWithImpl<$Res, _$ContactVMImpl>
    implements _$$ContactVMImplCopyWith<$Res> {
  __$$ContactVMImplCopyWithImpl(
      _$ContactVMImpl _value, $Res Function(_$ContactVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? attachmentPath = freezed,
    Object? attachmentName = freezed,
    Object? attachmentTooLarge = null,
  }) {
    return _then(_$ContactVMImpl(
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as ContactRecipient,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentName: freezed == attachmentName
          ? _value.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentTooLarge: null == attachmentTooLarge
          ? _value.attachmentTooLarge
          : attachmentTooLarge // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ContactVMImpl implements _ContactVM {
  const _$ContactVMImpl(
      {this.recipient = ContactRecipient.hello,
      this.attachmentPath,
      this.attachmentName,
      this.attachmentTooLarge = false});

  @override
  @JsonKey()
  final ContactRecipient recipient;
  @override
  final String? attachmentPath;
  @override
  final String? attachmentName;
  @override
  @JsonKey()
  final bool attachmentTooLarge;

  @override
  String toString() {
    return 'ContactVM(recipient: $recipient, attachmentPath: $attachmentPath, attachmentName: $attachmentName, attachmentTooLarge: $attachmentTooLarge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactVMImpl &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.attachmentPath, attachmentPath) ||
                other.attachmentPath == attachmentPath) &&
            (identical(other.attachmentName, attachmentName) ||
                other.attachmentName == attachmentName) &&
            (identical(other.attachmentTooLarge, attachmentTooLarge) ||
                other.attachmentTooLarge == attachmentTooLarge));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipient, attachmentPath,
      attachmentName, attachmentTooLarge);

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactVMImplCopyWith<_$ContactVMImpl> get copyWith =>
      __$$ContactVMImplCopyWithImpl<_$ContactVMImpl>(this, _$identity);
}

abstract class _ContactVM implements ContactVM {
  const factory _ContactVM(
      {final ContactRecipient recipient,
      final String? attachmentPath,
      final String? attachmentName,
      final bool attachmentTooLarge}) = _$ContactVMImpl;

  @override
  ContactRecipient get recipient;
  @override
  String? get attachmentPath;
  @override
  String? get attachmentName;
  @override
  bool get attachmentTooLarge;

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactVMImplCopyWith<_$ContactVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
