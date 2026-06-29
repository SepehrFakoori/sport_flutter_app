class AuthModel {
  final String accessToken;
  final String refreshToken;

  AuthModel.fromJson(Map<String, dynamic> json)
    : accessToken = json['access_token'],
      refreshToken = json['refresh_token'];
}
