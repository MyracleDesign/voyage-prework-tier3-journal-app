import 'dart:async';

import 'package:client/model/user.model.dart';
import 'package:client/services/api.service.dart';

class AuthService {
  final ApiService _api;

  AuthService({ApiService api}) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchUser = await _api.getUserProfile(userId);

    var hasUser = fetchUser != null;
    if (hasUser) {
      _userController.add(fetchUser);
    }

    return hasUser;
  }
}
