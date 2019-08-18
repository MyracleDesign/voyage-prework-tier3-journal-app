import 'package:client/paths.dart';
import 'package:client/ui/model/register.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:client/ui/widgets/register.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var passwordController = TextEditingController();
  var passwordValidationController = TextEditingController();
  var usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: BaseWidget<RegisterUiModel>(
        model: RegisterUiModel(authService: Provider.of(context)),
        child: RegisterWidget(
            passwordController: passwordController,
            passwordValidationController: passwordValidationController,
            usernameController: usernameController),
        builder: (context, model, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: child,
            ),
            RaisedButton(
              color: Color(0xFF4fdbc1),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  var user = await model.registerNewUser(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (user != null) {
                    await Navigator.popAndPushNamed(context, RoutePaths.Home);
                  }
                }
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Color(0xFF4fdbc1),
              child: Text(
                "Back to login",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, RoutePaths.Login);
              },
            )
          ],
        ),
      ),
    );
  }
}
