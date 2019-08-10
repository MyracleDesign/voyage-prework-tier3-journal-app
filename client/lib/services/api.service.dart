import 'dart:convert';

import 'package:client/model/user.model.dart';
import 'package:http/http.dart';

class ApiService {
  static final host = 'localhost';
  static final port = 8888;
  static final scheme = 'http';

  Future<User> getUserProfile(int userId) async {
    var response =
        await get(Uri(host: host, port: port, path: '/user', scheme: scheme));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Could not load a user.');
    }
  }
}
