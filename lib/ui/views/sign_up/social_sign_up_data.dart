/// Payload passed as `extra` when navigating from [StartingPage] to
/// [SignUpUserPage] after a social login (Google, Facebook, etc.) where the
/// user's email does NOT yet exist in Foodly's database.
///
/// Carries the provider context that the `/register` endpoint needs to know
/// the sign-up originated from a verified social provider (and can therefore
/// skip the password requirement).
///
/// Legacy string `extra` values are still accepted by [SignUpUserPage] for
/// backwards compatibility with any code path that only has the avatar URL.
class SocialSignUpData {
  /// URL of the avatar returned by the provider (e.g. Google profile photo).
  final String? avatar;

  /// Provider identifier (e.g. `'google'`, `'facebook'`).
  /// Forwarded to `/register` as `provider`.
  final String? provider;

  /// Stable user ID issued by the provider.
  /// Forwarded to `/register` as `provider_id`.
  final String? providerId;

  const SocialSignUpData({
    this.avatar,
    this.provider,
    this.providerId,
  });

  bool get isSocial => (provider?.isNotEmpty ?? false) && (providerId?.isNotEmpty ?? false);
}
