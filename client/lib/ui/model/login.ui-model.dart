import 'package:client/services/auth.service.dart';
import 'package:flutter_web/foundation.dart';

class LoginUiModel extends ChangeNotifier {
  AuthService _authService;
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  LoginUiModel({@required AuthService authService})
      : _authService = authService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authService.login(userId);
    setBusy(false);
    return success;
  }
}
