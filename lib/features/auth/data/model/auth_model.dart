class AuthModel {
  final String accessToken;
  final String refreshToken;
  final bool isNewUser;

  AuthModel.fromJson(Map<String, dynamic> json)
    : accessToken = json['access'],
      refreshToken = json['refresh'],
      isNewUser = json['is_new_user'];
}
