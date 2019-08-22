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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: Text('Welcome, to ',
              style: TextStyle(
                color: Colors.white,
              )),
          padding: EdgeInsets.all(8.0),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          child: Headline(),
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Register", style: TextStyle(color: Colors.white))),
        LoginTextField(usernameController, "Username", false),
        LoginTextField(passwordController, "Password", true),
        LoginTextField(
            passwordValidationController, "Please repeat your Password", true),
      ],
    );
  }
}
