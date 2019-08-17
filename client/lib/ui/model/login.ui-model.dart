import 'package:client/model/base.model.dart';
import 'package:client/services/auth.service.dart';
import 'package:flutter_web/foundation.dart';

class LoginUiModel extends BaseModel {
  AuthService _authService;
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  LoginUiModel({@required AuthService authService})
      : _authService = authService;

  Future<bool> login(String username, String password) async {
    setBusy(true);
    var success = await _authService.login(username, password);
    setBusy(false);
    return success;
  }
}
