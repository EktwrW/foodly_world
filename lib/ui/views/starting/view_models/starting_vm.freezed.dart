// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starting_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartingVM {
  StartingPageView get currentView;
  TextEditingController? get emailController;
  TextEditingController? get passwordController;
  UserSessionDM get userSessionDM;
  AutovalidateMode get autovalidateMode;
  RecoverPasswordView get recoverPasswordView;
  GoogleSignInAccount?
      get googleSignInAccount; // Apple solo entrega nombre/email en la PRIMERA autorización y nunca
// dentro del identityToken (el JWT solo trae `sub` + email). Por eso los
// capturamos del lado cliente —igual que el displayName/email de Google—
// y los arrastramos al sign-up cuando el usuario es nuevo.
  String? get appleGivenName;
  String? get appleFamilyName;
  String? get appleEmail;
  String?
      get importedAvatar; // True solo cuando el usuario acaba de crearse vía alta social directa
// (Apple/Google). Lo usa StartingPage para mostrar el WelcomeDialog (con la
// guía de "migrar a cuenta empresarial") en ese primer ingreso al home, y
// NO en logins normales posteriores.
  bool get justSocialRegistered;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StartingVMCopyWith<StartingVM> get copyWith =>
      _$StartingVMCopyWithImpl<StartingVM>(this as StartingVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StartingVM &&
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
                other.importedAvatar == importedAvatar) &&
            (identical(other.justSocialRegistered, justSocialRegistered) ||
                other.justSocialRegistered == justSocialRegistered));
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
      importedAvatar,
      justSocialRegistered);

  @override
  String toString() {
    return 'StartingVM(currentView: $currentView, emailController: $emailController, passwordController: $passwordController, userSessionDM: $userSessionDM, autovalidateMode: $autovalidateMode, recoverPasswordView: $recoverPasswordView, googleSignInAccount: $googleSignInAccount, appleGivenName: $appleGivenName, appleFamilyName: $appleFamilyName, appleEmail: $appleEmail, importedAvatar: $importedAvatar, justSocialRegistered: $justSocialRegistered)';
  }
}

/// @nodoc
abstract mixin class $StartingVMCopyWith<$Res> {
  factory $StartingVMCopyWith(
          StartingVM value, $Res Function(StartingVM) _then) =
      _$StartingVMCopyWithImpl;
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
      String? importedAvatar,
      bool justSocialRegistered});

  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class _$StartingVMCopyWithImpl<$Res> implements $StartingVMCopyWith<$Res> {
  _$StartingVMCopyWithImpl(this._self, this._then);

  final StartingVM _self;
  final $Res Function(StartingVM) _then;

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
    Object? justSocialRegistered = null,
  }) {
    return _then(_self.copyWith(
      currentView: null == currentView
          ? _self.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as StartingPageView,
      emailController: freezed == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      passwordController: freezed == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      recoverPasswordView: null == recoverPasswordView
          ? _self.recoverPasswordView
          : recoverPasswordView // ignore: cast_nullable_to_non_nullable
              as RecoverPasswordView,
      googleSignInAccount: freezed == googleSignInAccount
          ? _self.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      appleGivenName: freezed == appleGivenName
          ? _self.appleGivenName
          : appleGivenName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleFamilyName: freezed == appleFamilyName
          ? _self.appleFamilyName
          : appleFamilyName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleEmail: freezed == appleEmail
          ? _self.appleEmail
          : appleEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      importedAvatar: freezed == importedAvatar
          ? _self.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      justSocialRegistered: null == justSocialRegistered
          ? _self.justSocialRegistered
          : justSocialRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StartingVM].
extension StartingVMPatterns on StartingVM {
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
    TResult Function(_StartingVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartingVM() when $default != null:
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
    TResult Function(_StartingVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartingVM():
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
    TResult? Function(_StartingVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartingVM() when $default != null:
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
            StartingPageView currentView,
            TextEditingController? emailController,
            TextEditingController? passwordController,
            UserSessionDM userSessionDM,
            AutovalidateMode autovalidateMode,
            RecoverPasswordView recoverPasswordView,
            GoogleSignInAccount? googleSignInAccount,
            String? appleGivenName,
            String? appleFamilyName,
            String? appleEmail,
            String? importedAvatar,
            bool justSocialRegistered)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartingVM() when $default != null:
        return $default(
            _that.currentView,
            _that.emailController,
            _that.passwordController,
            _that.userSessionDM,
            _that.autovalidateMode,
            _that.recoverPasswordView,
            _that.googleSignInAccount,
            _that.appleGivenName,
            _that.appleFamilyName,
            _that.appleEmail,
            _that.importedAvatar,
            _that.justSocialRegistered);
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
            StartingPageView currentView,
            TextEditingController? emailController,
            TextEditingController? passwordController,
            UserSessionDM userSessionDM,
            AutovalidateMode autovalidateMode,
            RecoverPasswordView recoverPasswordView,
            GoogleSignInAccount? googleSignInAccount,
            String? appleGivenName,
            String? appleFamilyName,
            String? appleEmail,
            String? importedAvatar,
            bool justSocialRegistered)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartingVM():
        return $default(
            _that.currentView,
            _that.emailController,
            _that.passwordController,
            _that.userSessionDM,
            _that.autovalidateMode,
            _that.recoverPasswordView,
            _that.googleSignInAccount,
            _that.appleGivenName,
            _that.appleFamilyName,
            _that.appleEmail,
            _that.importedAvatar,
            _that.justSocialRegistered);
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
            StartingPageView currentView,
            TextEditingController? emailController,
            TextEditingController? passwordController,
            UserSessionDM userSessionDM,
            AutovalidateMode autovalidateMode,
            RecoverPasswordView recoverPasswordView,
            GoogleSignInAccount? googleSignInAccount,
            String? appleGivenName,
            String? appleFamilyName,
            String? appleEmail,
            String? importedAvatar,
            bool justSocialRegistered)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StartingVM() when $default != null:
        return $default(
            _that.currentView,
            _that.emailController,
            _that.passwordController,
            _that.userSessionDM,
            _that.autovalidateMode,
            _that.recoverPasswordView,
            _that.googleSignInAccount,
            _that.appleGivenName,
            _that.appleFamilyName,
            _that.appleEmail,
            _that.importedAvatar,
            _that.justSocialRegistered);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StartingVM extends StartingVM {
  const _StartingVM(
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
      this.importedAvatar,
      this.justSocialRegistered = false})
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
// True solo cuando el usuario acaba de crearse vía alta social directa
// (Apple/Google). Lo usa StartingPage para mostrar el WelcomeDialog (con la
// guía de "migrar a cuenta empresarial") en ese primer ingreso al home, y
// NO en logins normales posteriores.
  @override
  @JsonKey()
  final bool justSocialRegistered;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartingVMCopyWith<_StartingVM> get copyWith =>
      __$StartingVMCopyWithImpl<_StartingVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartingVM &&
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
                other.importedAvatar == importedAvatar) &&
            (identical(other.justSocialRegistered, justSocialRegistered) ||
                other.justSocialRegistered == justSocialRegistered));
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
      importedAvatar,
      justSocialRegistered);

  @override
  String toString() {
    return 'StartingVM(currentView: $currentView, emailController: $emailController, passwordController: $passwordController, userSessionDM: $userSessionDM, autovalidateMode: $autovalidateMode, recoverPasswordView: $recoverPasswordView, googleSignInAccount: $googleSignInAccount, appleGivenName: $appleGivenName, appleFamilyName: $appleFamilyName, appleEmail: $appleEmail, importedAvatar: $importedAvatar, justSocialRegistered: $justSocialRegistered)';
  }
}

/// @nodoc
abstract mixin class _$StartingVMCopyWith<$Res>
    implements $StartingVMCopyWith<$Res> {
  factory _$StartingVMCopyWith(
          _StartingVM value, $Res Function(_StartingVM) _then) =
      __$StartingVMCopyWithImpl;
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
      String? importedAvatar,
      bool justSocialRegistered});

  @override
  $UserSessionDMCopyWith<$Res> get userSessionDM;
}

/// @nodoc
class __$StartingVMCopyWithImpl<$Res> implements _$StartingVMCopyWith<$Res> {
  __$StartingVMCopyWithImpl(this._self, this._then);

  final _StartingVM _self;
  final $Res Function(_StartingVM) _then;

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? justSocialRegistered = null,
  }) {
    return _then(_StartingVM(
      currentView: null == currentView
          ? _self.currentView
          : currentView // ignore: cast_nullable_to_non_nullable
              as StartingPageView,
      emailController: freezed == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      passwordController: freezed == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userSessionDM: null == userSessionDM
          ? _self.userSessionDM
          : userSessionDM // ignore: cast_nullable_to_non_nullable
              as UserSessionDM,
      autovalidateMode: null == autovalidateMode
          ? _self.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      recoverPasswordView: null == recoverPasswordView
          ? _self.recoverPasswordView
          : recoverPasswordView // ignore: cast_nullable_to_non_nullable
              as RecoverPasswordView,
      googleSignInAccount: freezed == googleSignInAccount
          ? _self.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      appleGivenName: freezed == appleGivenName
          ? _self.appleGivenName
          : appleGivenName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleFamilyName: freezed == appleFamilyName
          ? _self.appleFamilyName
          : appleFamilyName // ignore: cast_nullable_to_non_nullable
              as String?,
      appleEmail: freezed == appleEmail
          ? _self.appleEmail
          : appleEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      importedAvatar: freezed == importedAvatar
          ? _self.importedAvatar
          : importedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      justSocialRegistered: null == justSocialRegistered
          ? _self.justSocialRegistered
          : justSocialRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of StartingVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDMCopyWith<$Res> get userSessionDM {
    return $UserSessionDMCopyWith<$Res>(_self.userSessionDM, (value) {
      return _then(_self.copyWith(userSessionDM: value));
    });
  }
}

// dart format on
