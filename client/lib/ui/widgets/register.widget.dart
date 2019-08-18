import 'package:client/ui/widgets/login-header.widget.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController passwordValidationController;
  final TextEditingController usernameController;

  RegisterWidget(
      {@required this.passwordController,
      @required this.passwordValidationController,
      @required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LoginTextField(usernameController, "Username"),
        LoginTextField(passwordController, "Password"),
        LoginTextField(passwordValidationController, "Password"),
        Container()
      ],
    );
  }
}
