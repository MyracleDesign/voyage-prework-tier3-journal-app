import 'dart:convert';

import 'package:client/model/user.model.dart';
import 'package:http/http.dart';

class ApiService {
  static final host = 'localhost';
  static final port = 8888;
  static final scheme = 'http';

  Future<User> getUserProfile(int userId) async {
    var response = await get(
        Uri(host: host, port: port, path: '/user/$userId', scheme: scheme));

    return response.statusCode == 200
        ? User.fromJson(json.decode(response.body))
        : null;
  }
}
