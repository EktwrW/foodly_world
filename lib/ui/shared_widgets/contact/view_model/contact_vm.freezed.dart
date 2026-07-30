// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactVM {
  ContactRecipient get recipient;
  String? get attachmentPath;
  String? get attachmentName;
  bool get attachmentTooLarge;

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContactVMCopyWith<ContactVM> get copyWith =>
      _$ContactVMCopyWithImpl<ContactVM>(this as ContactVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContactVM &&
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

  @override
  String toString() {
    return 'ContactVM(recipient: $recipient, attachmentPath: $attachmentPath, attachmentName: $attachmentName, attachmentTooLarge: $attachmentTooLarge)';
  }
}

/// @nodoc
abstract mixin class $ContactVMCopyWith<$Res> {
  factory $ContactVMCopyWith(ContactVM value, $Res Function(ContactVM) _then) =
      _$ContactVMCopyWithImpl;
  @useResult
  $Res call(
      {ContactRecipient recipient,
      String? attachmentPath,
      String? attachmentName,
      bool attachmentTooLarge});
}

/// @nodoc
class _$ContactVMCopyWithImpl<$Res> implements $ContactVMCopyWith<$Res> {
  _$ContactVMCopyWithImpl(this._self, this._then);

  final ContactVM _self;
  final $Res Function(ContactVM) _then;

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
    return _then(_self.copyWith(
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as ContactRecipient,
      attachmentPath: freezed == attachmentPath
          ? _self.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentName: freezed == attachmentName
          ? _self.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentTooLarge: null == attachmentTooLarge
          ? _self.attachmentTooLarge
          : attachmentTooLarge // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContactVM].
extension ContactVMPatterns on ContactVM {
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
    TResult Function(_ContactVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContactVM() when $default != null:
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
    TResult Function(_ContactVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactVM():
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
    TResult? Function(_ContactVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactVM() when $default != null:
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
    TResult Function(ContactRecipient recipient, String? attachmentPath,
            String? attachmentName, bool attachmentTooLarge)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContactVM() when $default != null:
        return $default(_that.recipient, _that.attachmentPath,
            _that.attachmentName, _that.attachmentTooLarge);
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
    TResult Function(ContactRecipient recipient, String? attachmentPath,
            String? attachmentName, bool attachmentTooLarge)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactVM():
        return $default(_that.recipient, _that.attachmentPath,
            _that.attachmentName, _that.attachmentTooLarge);
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
    TResult? Function(ContactRecipient recipient, String? attachmentPath,
            String? attachmentName, bool attachmentTooLarge)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactVM() when $default != null:
        return $default(_that.recipient, _that.attachmentPath,
            _that.attachmentName, _that.attachmentTooLarge);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ContactVM implements ContactVM {
  const _ContactVM(
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

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactVMCopyWith<_ContactVM> get copyWith =>
      __$ContactVMCopyWithImpl<_ContactVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactVM &&
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

  @override
  String toString() {
    return 'ContactVM(recipient: $recipient, attachmentPath: $attachmentPath, attachmentName: $attachmentName, attachmentTooLarge: $attachmentTooLarge)';
  }
}

/// @nodoc
abstract mixin class _$ContactVMCopyWith<$Res>
    implements $ContactVMCopyWith<$Res> {
  factory _$ContactVMCopyWith(
          _ContactVM value, $Res Function(_ContactVM) _then) =
      __$ContactVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ContactRecipient recipient,
      String? attachmentPath,
      String? attachmentName,
      bool attachmentTooLarge});
}

/// @nodoc
class __$ContactVMCopyWithImpl<$Res> implements _$ContactVMCopyWith<$Res> {
  __$ContactVMCopyWithImpl(this._self, this._then);

  final _ContactVM _self;
  final $Res Function(_ContactVM) _then;

  /// Create a copy of ContactVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recipient = null,
    Object? attachmentPath = freezed,
    Object? attachmentName = freezed,
    Object? attachmentTooLarge = null,
  }) {
    return _then(_ContactVM(
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as ContactRecipient,
      attachmentPath: freezed == attachmentPath
          ? _self.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentName: freezed == attachmentName
          ? _self.attachmentName
          : attachmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentTooLarge: null == attachmentTooLarge
          ? _self.attachmentTooLarge
          : attachmentTooLarge // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
