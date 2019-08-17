import 'package:client/paths.dart';
import 'package:client/ui/model/login.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:client/ui/widgets/login-header.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginUiModel>(
      model: LoginUiModel(authService: Provider.of(context)),
      child: Form(
        key: _formKey,
        child: LoginHeader(
          usernameController: _usernameController,
          passwordController: _passwordController,
        ),
      ),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            RaisedButton(
                color: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    var loginSuccess = await model.login(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    if (loginSuccess) {
                      _usernameController.clear();
                      _passwordController.clear();
                      await Navigator.pushNamed(context, RoutePaths.Home);
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
