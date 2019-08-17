import 'package:flutter_web/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var passwordController = TextEditingController();
  var passwordValidationController = TextEditingController();
  var usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(child: Text("Not implemented yet")),
    );
  }
}
