import 'package:flutter_web/material.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginHeader(
      {@required this.usernameController, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login'),
      LoginTextField(usernameController, 'Username'),
      LoginTextField(passwordController, 'Password'),
      Container()
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  LoginTextField(this.controller, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        obscureText: hintText == "Password",
        validator: (value) {
          return value.isEmpty ? "Please enter a ${hintText}" : null;
        },
        decoration: InputDecoration.collapsed(hintText: hintText),
        controller: controller,
      ),
    );
  }
}
