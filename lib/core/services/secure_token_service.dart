import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Stores authentication tokens in the platform's secure enclave:
/// - iOS: Keychain
/// - Android: EncryptedSharedPreferences (AES-256)
///
/// This replaces the previous approach of storing tokens in HydratedBloc,
/// which used plaintext SharedPreferences / temporary directory.
class SecureTokenService {
  static const _accessKey = 'foodly_access_token';
  static const _refreshKey = 'foodly_refresh_token';
  static const _tokenTypeKey = 'foodly_token_type';
  static const _tokenCreatedAtKey = 'foodly_token_created_at';

  final FlutterSecureStorage _storage;

  SecureTokenService()
      : _storage = const FlutterSecureStorage(
          iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        );

  /// Persists both tokens after login, biometric login, or silent refresh.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {
    await Future.wait([
      _storage.write(key: _accessKey, value: accessToken),
      _storage.write(key: _refreshKey, value: refreshToken),
      _storage.write(key: _tokenTypeKey, value: tokenType),
      if (tokenCreatedAt != null) _storage.write(key: _tokenCreatedAtKey, value: tokenCreatedAt),
    ]);
  }

  Future<String?> get accessToken => _storage.read(key: _accessKey);
  Future<String?> get refreshToken => _storage.read(key: _refreshKey);
  Future<String?> get tokenType => _storage.read(key: _tokenTypeKey);
  Future<String?> get tokenCreatedAt => _storage.read(key: _tokenCreatedAtKey);

  /// Returns true if any tokens are stored.
  Future<bool> hasTokens() async {
    final token = await accessToken;
    return token != null && token.isNotEmpty;
  }

  /// Wipes all stored tokens (logout, session clear).
  Future<void> clearAll() async {
    await Future.wait([
      _storage.delete(key: _accessKey),
      _storage.delete(key: _refreshKey),
      _storage.delete(key: _tokenTypeKey),
      _storage.delete(key: _tokenCreatedAtKey),
    ]);
  }
}
