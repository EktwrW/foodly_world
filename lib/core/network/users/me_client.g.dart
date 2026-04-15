// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _MeClient implements MeClient {
  _MeClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<UserDM> fetchLoggedUser() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserDM>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserDM _value;
    try {
      _value = UserDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserDM> getUserByGuid(String uuid) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserDM>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/user/${uuid}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserDM _value;
    try {
      _value = UserDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserSessionDM> login(UserBodyLoginDTO loginDTO) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginDTO.toJson());
    final _options = _setStreamType<UserSessionDM>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserSessionDM> biometricLogin() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserSessionDM>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/biometric-login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserSessionDM> refreshToken() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserSessionDM>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/token/refresh',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<LogoutDM> logout() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<LogoutDM>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/logout',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LogoutDM _value;
    try {
      _value = LogoutDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserSessionDM> socialLogin(AuthSocialLoginDTO socialLoginDTO) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(socialLoginDTO.toJson());
    final _options = _setStreamType<UserSessionDM>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/social-login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> recoverPassword(UserRecoverPasswordDTO email) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(email.toJson());
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/forgot-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<UserSessionDM> register({
    required String name,
    required String lastName,
    required String username,
    required String dateOfBirth,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String? phone,
    required String? address,
    required String zipCode,
    required String? city,
    required String? country,
    required String gender,
    required int roleId,
    required List<MultipartFile> photo,
    String? firebasePhoneToken,
    double? latitude,
    double? longitude,
    String? provider,
    String? providerId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('last_name', lastName));
    _data.fields.add(MapEntry('username', username));
    _data.fields.add(MapEntry('date_of_birth', dateOfBirth));
    _data.fields.add(MapEntry('email', email));
    _data.fields.add(MapEntry('password', password));
    _data.fields.add(MapEntry('password_confirmation', passwordConfirmation));
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (address != null) {
      _data.fields.add(MapEntry('address', address));
    }
    _data.fields.add(MapEntry('zip_code', zipCode));
    if (city != null) {
      _data.fields.add(MapEntry('city', city));
    }
    if (country != null) {
      _data.fields.add(MapEntry('country', country));
    }
    _data.fields.add(MapEntry('gender', gender));
    _data.fields.add(MapEntry('role_id', roleId.toString()));
    _data.files.addAll(photo.map((i) => MapEntry('photo', i)));
    if (firebasePhoneToken != null) {
      _data.fields.add(MapEntry('firebase_phone_token', firebasePhoneToken));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry('latitude', latitude.toString()));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry('longitude', longitude.toString()));
    }
    if (provider != null) {
      _data.fields.add(MapEntry('provider', provider));
    }
    if (providerId != null) {
      _data.fields.add(MapEntry('provider_id', providerId));
    }
    final _options = _setStreamType<UserSessionDM>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> updateProfilePhoto({required List<MultipartFile> photo}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(photo.map((i) => MapEntry('photo', i)));
    final _options = _setStreamType<void>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/update-profile-photo',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> updatePassword(UserBodyUpdateDTO updateDTO) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = updateDTO;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/update-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> setPassword(UserBodySetPasswordDTO setPasswordDTO) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = setPasswordDTO;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/set-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<UserSessionDM> updateProfile({
    String? username,
    String? name,
    String? lastName,
    String? email,
    String? phone,
    String? dateOfBirth,
    String? password,
    String? newPassword,
    String? zipCode,
    String? address,
    String? city,
    String? country,
    String? gender,
    int? roleId,
    double? latitude,
    double? longitude,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (username != null) {
      _data.fields.add(MapEntry('username', username));
    }
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (lastName != null) {
      _data.fields.add(MapEntry('last_name', lastName));
    }
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (dateOfBirth != null) {
      _data.fields.add(MapEntry('date_of_birth', dateOfBirth));
    }
    if (password != null) {
      _data.fields.add(MapEntry('current_password', password));
    }
    if (newPassword != null) {
      _data.fields.add(MapEntry('new_password', newPassword));
    }
    if (zipCode != null) {
      _data.fields.add(MapEntry('zip_code', zipCode));
    }
    if (address != null) {
      _data.fields.add(MapEntry('address', address));
    }
    if (city != null) {
      _data.fields.add(MapEntry('city', city));
    }
    if (country != null) {
      _data.fields.add(MapEntry('country', country));
    }
    if (gender != null) {
      _data.fields.add(MapEntry('gender', gender));
    }
    if (roleId != null) {
      _data.fields.add(MapEntry('role_id', roleId.toString()));
    }
    if (latitude != null) {
      _data.fields.add(MapEntry('latitude', latitude.toString()));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry('longitude', longitude.toString()));
    }
    final _options = _setStreamType<UserSessionDM>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/update-profile',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserSessionDM _value;
    try {
      _value = UserSessionDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UsernameDM> checkUsernameAvailability(String username) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UsernameDM>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/username-available/${username}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UsernameDM _value;
    try {
      _value = UsernameDM.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> deleteAccount() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/user/delete-account',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> sendContact({
    required String recipient,
    required String subject,
    required String message,
    List<MultipartFile>? attachment,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('recipient', recipient));
    _data.fields.add(MapEntry('subject', subject));
    _data.fields.add(MapEntry('message', message));
    if (attachment != null) {
      _data.files.addAll(attachment.map((i) => MapEntry('attachment', i)));
    }
    final _options = _setStreamType<void>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/contact',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
