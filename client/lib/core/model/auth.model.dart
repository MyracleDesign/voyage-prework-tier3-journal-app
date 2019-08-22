class AuthModel {
  String accessToken;
  String tokenType;
  int expires_in;

  AuthModel({this.accessToken, this.tokenType, this.expires_in});

  static AuthModel fromJson(decode) {
    return AuthModel(
      accessToken: decode['access_token'],
      expires_in: decode['expires_in'],
      tokenType: decode['token_type'],
    );
  }
}
