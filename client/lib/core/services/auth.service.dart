import 'dart:async';

import 'package:client/core/model/user.model.dart';
import 'package:client/core/services/api.service.dart';

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

  Future<User> register(String username, String password) async {
    return await _api.registerWithUsernamePassword(username, password);
  }
}
