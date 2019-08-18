import 'package:client/model/base.model.dart';
import 'package:client/model/user.model.dart';
import 'package:client/services/auth.service.dart';
import 'package:flutter_web/foundation.dart';

class RegisterUiModel extends BaseModel {
  AuthService _authService;
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  RegisterUiModel({@required AuthService authService})
      : _authService = authService;

  Future<User> registerNewUser(String username, String password) async {
    setBusy(true);
    var registeredUser = await _authService.register(username, password);
    setBusy(false);
    return registeredUser;
  }
}
