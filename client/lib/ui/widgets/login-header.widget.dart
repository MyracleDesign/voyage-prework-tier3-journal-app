import 'package:flutter_web/material.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginHeader(
      {@required this.usernameController, @required this.passwordController});

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
            child: Text("Login", style: TextStyle(color: Colors.white)),
          ),
          LoginTextField(usernameController, 'Username', false),
          LoginTextField(passwordController, 'Password', true),
        ]);
  }
}

class Headline extends StatelessWidget {
  const Headline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
          ),
        ),
        Text(
          "Digital ",
          style: TextStyle(
            color: Color(0xff6A71A2),
            fontSize: 32.0,
          ),
        ),
        Text(
          "Journal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
          ),
        ),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  LoginTextField(this.controller, this.hintText, this.obscureText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF0e2d3f),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          return value.isEmpty ? "Please enter a ${hintText}" : null;
        },
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFaabac1)),
        ),
        style: TextStyle(color: Colors.white),
        controller: controller,
      ),
    );
  }
}
