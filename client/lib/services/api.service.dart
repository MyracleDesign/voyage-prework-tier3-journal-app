import 'dart:convert';

import 'package:client/model/auth.model.dart';
import 'package:client/model/user.model.dart';
import 'package:http/http.dart';

class ApiService {
  static final host = 'localhost';
  static final port = 8888;
  static final scheme = 'http';
  static final clientId = "com.myracledesign.flutter_web_digital_journal";
  static final secret = "";
  AuthModel authModel;

  final clientCredentials =
      Base64Encoder().convert("$clientId:$secret".codeUnits);

  /// Logs a user in with OAuth 2.0 this creates a token that is saved in the authModel
  Future<bool> loginWithUsernamePassword(
      String username, String password) async {
    var response = await post(
        Uri(host: host, port: port, path: '/auth/token', scheme: scheme),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Basic $clientCredentials"
        },
        body: {
          "username": username,
          "password": password,
          "grant_type": "password"
        });

    if (response.statusCode == 200) {
      authModel = AuthModel.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUserProfile() async {
    var response = await get(
      Uri(host: host, port: port, path: '/userProfile', scheme: scheme),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    print(response.statusCode);

    return response.statusCode == 200
        ? User.fromJson(json.decode(response.body))
        : null;
  }
}
