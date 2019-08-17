import 'dart:async';

import 'package:client/model/user.model.dart';
import 'package:client/services/api.service.dart';

class AuthService {
  final ApiService _api;

  AuthService({ApiService api}) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(String username, String password) async {
    await _api.loginWithUsernamePassword(username, password);
    await _api.getUserProfile();
    return true;
  }
}
