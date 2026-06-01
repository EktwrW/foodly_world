// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starting_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartingVM {
  StartingPageView get currentView => throw _privateConstructorUsedError;
  TextEditingController? get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController? get passwordController =>
      throw _privateConstructorUsedError;
  UserSessionDM get userSessionDM => throw _privateConstructorUsedError;
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;
  RecoverPasswordView get recoverPasswordView =>
      throw _privateConstructorUsedError;
  GoogleSignInAccount? get googleSignInAccount =>
      throw _privateConstructorUsedError; // Apple solo entrega nombre/email en la PRIMERA autorización y nunca
// dentro del identityToken (el JWT solo trae `sub` + email). Por eso los
// capturamos del lado cliente —igual que el displayName/email de Google—
// y los arrastramos al sign-up cuando el usuario es nuevo.
  String? get appleGivenName => throw _privateConstructorUsedError;
  String? get appleFamilyName => throw _privateConstructorUsedError;
  String? get appleEmail => throw _privateConstructorUsedError;
  String? get importedAvatar => throw _privateConstructorUsedError;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartingVMCopyWith<StartingVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartingVMCopyWith<$Res> {
  factory $StartingVMCopyWith(
          StartingVM value, $Res Function(StartingVM) then) =
      _$StartingVMCopyWithImpl<$Res, StartingVM>;
  @useResult
  $Res call(
      {StartingPageView currentView,
      TextEditingController? emailController,
      TextEditingController? passwordController,
      UserSessionDM userSessionDM,
      AutovalidateMode autovalidateMode,
      RecoverPasswordView recoverPasswordView,
      GoogleSignInAccount? googleSignInAccount,
      String? appleGivenName,
      String? appleFamilyName,
      String? appleEmail,
      String? importedAvatar});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class _$StartingVMCopyWithImpl<$Res, $Val extends StartingVM>
    implements $StartingVMCopyWith<$Res> {
  _$StartingVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentView = null,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? userSessionDM = null,
    Object? autovalidateMode = null,
    Object? recoverPasswordView = null,
    Object? googleSignInAccount = freezed,
    Object? appleGivenName = freezed,
    Object? appleFamilyName = freezed,
    Object? appleEmail = freezed,
    Object? importedAvatar = freezed,
  }) {
    return _then(_value.copyWith(
      currentView: null == currentView
          ? _value.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as StartingPageView,
      emailController: freezed == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      passwordController: freezed == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      recoverPasswordView: null == recoverPasswordView
          ? _value.recoverPasswordView
          : recoverPasswordView // ignore: cast_nullable_to_non_nullable
              as RecoverPasswordView,
      googleSignInAccount: freezed == googleSignInAccount
          ? _value.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      appleGivenName: freezed == appleGivenName
          ? _value.appleGivenName
          : appleGivenName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleFamilyName: freezed == appleFamilyName
          ? _value.appleFamilyName
          : appleFamilyName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleEmail: freezed == appleEmail
          ? _value.appleEmail
          : appleEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      importedAvatar: freezed == importedAvatar
          ? _value.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_value.userSessionDM, (value) {
      return _then(_value.copyWith(userSessionDM: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartingVMImplCopyWith<$Res>
    implements $StartingVMCopyWith<$Res> {
  factory _$$StartingVMImplCopyWith(
          _$StartingVMImpl value, $Res Function(_$StartingVMImpl) then) =
      __$$StartingVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StartingPageView currentView,
      TextEditingController? emailController,
      TextEditingController? passwordController,
      UserSessionDM userSessionDM,
      AutovalidateMode autovalidateMode,
      RecoverPasswordView recoverPasswordView,
      GoogleSignInAccount? googleSignInAccount,
      String? appleGivenName,
      String? appleFamilyName,
      String? appleEmail,
      String? importedAvatar});

  @override
  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$$StartingVMImplCopyWithImpl<$Res>
    extends _$StartingVMCopyWithImpl<$Res, _$StartingVMImpl>
    implements _$$StartingVMImplCopyWith<$Res> {
  __$$StartingVMImplCopyWithImpl(
      _$StartingVMImpl _value, $Res Function(_$StartingVMImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentView = null,
    Object? emailController = freezed,
    Object? passwordController = freezed,
    Object? userSessionDM = null,
    Object? autovalidateMode = null,
    Object? recoverPasswordView = null,
    Object? googleSignInAccount = freezed,
    Object? appleGivenName = freezed,
    Object? appleFamilyName = freezed,
    Object? appleEmail = freezed,
    Object? importedAvatar = freezed,
  }) {
    return _then(_$StartingVMImpl(
      currentView: null == currentView
          ? _value.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as StartingPageView,
      emailController: freezed == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      passwordController: freezed == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userSessionDM: null == userSessionDM
          ? _value.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      recoverPasswordView: null == recoverPasswordView
          ? _value.recoverPasswordView
          : recoverPasswordView // ignore: cast_nullable_to_non_nullable
              as RecoverPasswordView,
      googleSignInAccount: freezed == googleSignInAccount
          ? _value.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      appleGivenName: freezed == appleGivenName
          ? _value.appleGivenName
          : appleGivenName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleFamilyName: freezed == appleFamilyName
          ? _value.appleFamilyName
          : appleFamilyName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleEmail: freezed == appleEmail
          ? _value.appleEmail
          : appleEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      importedAvatar: freezed == importedAvatar
          ? _value.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StartingVMImpl extends _StartingVM {
  const _$StartingVMImpl(
      {this.currentView = StartingPageView.initial,
      this.emailController,
      this.passwordController,
      this.userSessionDM = const UserSessionDM(user: UserDM(), token: ''),
      this.autovalidateMode = AutovalidateMode.disabled,
      this.recoverPasswordView = RecoverPasswordView.requestPassword,
      this.googleSignInAccount,
      this.appleGivenName,
      this.appleFamilyName,
      this.appleEmail,
      this.importedAvatar})
      : super._();

  @override
  @JsonKey()
  final StartingPageView currentView;
  @override
  final TextEditingController? emailController;
  @override
  final TextEditingController? passwordController;
  @override
  @JsonKey()
  final UserSessionDM userSessionDM;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  @JsonKey()
  final RecoverPasswordView recoverPasswordView;
  @override
  final GoogleSignInAccount? googleSignInAccount;
// Apple solo entrega nombre/email en la PRIMERA autorización y nunca
// dentro del identityToken (el JWT solo trae `sub` + email). Por eso los
// capturamos del lado cliente —igual que el displayName/email de Google—
// y los arrastramos al sign-up cuando el usuario es nuevo.
  @override
  final String? appleGivenName;
  @override
  final String? appleFamilyName;
  @override
  final String? appleEmail;
  @override
  final String? importedAvatar;

  @override
  String toString() {
    return 'StartingVM(currentView: $currentView, emailController: $emailController, passwordController: $passwordController, userSessionDM: $userSessionDM, autovalidateMode: $autovalidateMode, recoverPasswordView: $recoverPasswordView, googleSignInAccount: $googleSignInAccount, appleGivenName: $appleGivenName, appleFamilyName: $appleFamilyName, appleEmail: $appleEmail, importedAvatar: $importedAvatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartingVMImpl &&
            (identical(other.currentView, currentView) ||
                other.currentView == currentView) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.userSessionDM, userSessionDM) ||
                other.userSessionDM == userSessionDM) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.recoverPasswordView, recoverPasswordView) ||
                other.recoverPasswordView == recoverPasswordView) &&
            (identical(other.googleSignInAccount, googleSignInAccount) ||
                other.googleSignInAccount == googleSignInAccount) &&
            (identical(other.appleGivenName, appleGivenName) ||
                other.appleGivenName == appleGivenName) &&
            (identical(other.appleFamilyName, appleFamilyName) ||
                other.appleFamilyName == appleFamilyName) &&
            (identical(other.appleEmail, appleEmail) ||
                other.appleEmail == appleEmail) &&
            (identical(other.importedAvatar, importedAvatar) ||
                other.importedAvatar == importedAvatar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentView,
      emailController,
      passwordController,
      userSessionDM,
      autovalidateMode,
      recoverPasswordView,
      googleSignInAccount,
      appleGivenName,
      appleFamilyName,
      appleEmail,
      importedAvatar);

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartingVMImplCopyWith<_$StartingVMImpl> get copyWith =>
      __$$StartingVMImplCopyWithImpl<_$StartingVMImpl>(this, _$identity);
}

abstract class _StartingVM extends StartingVM {
  const factory _StartingVM(
      {final StartingPageView currentView,
      final TextEditingController? emailController,
      final TextEditingController? passwordController,
      final UserSessionDM userSessionDM,
      final AutovalidateMode autovalidateMode,
      final RecoverPasswordView recoverPasswordView,
      final GoogleSignInAccount? googleSignInAccount,
      final String? appleGivenName,
      final String? appleFamilyName,
      final String? appleEmail,
      final String? importedAvatar}) = _$StartingVMImpl;
  const _StartingVM._() : super._();

  @override
  StartingPageView get currentView;
  @override
  TextEditingController? get emailController;
  @override
  TextEditingController? get passwordController;
  @override
  UserSessionDM get userSessionDM;
  @override
  AutovalidateMode get autovalidateMode;
  @override
  RecoverPasswordView get recoverPasswordView;
  @override
  GoogleSignInAccount?
      get googleSignInAccount; // Apple solo entrega nombre/email en la PRIMERA autorización y nunca
// dentro del identityToken (el JWT solo trae `sub` + email). Por eso los
// capturamos del lado cliente —igual que el displayName/email de Google—
// y los arrastramos al sign-up cuando el usuario es nuevo.
  @override
  String? get appleGivenName;
  @override
  String? get appleFamilyName;
  @override
  String? get appleEmail;
  @override
  String? get importedAvatar;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartingVMImplCopyWith<_$StartingVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
