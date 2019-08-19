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
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BaseWidget<LoginUiModel>(
        model: LoginUiModel(authService: Provider.of(context)),
        child: Form(
          key: _formKey,
          child: LoginHeader(
            usernameController: _usernameController,
            passwordController: _passwordController,
          ),
        ),
        builder: (context, model, child) => Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color(0xFF4edac0)),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0xFF1e4b60),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(5, 5),
                            blurRadius: 10.0,
                            spreadRadius: -5.0)
                      ],
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        child,
                        SizedBox(
                          width: 300,
                          child: RaisedButton(
                              color: Color(0xFF4fdbc1),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
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
                                    await Navigator.pushNamed(
                                        context, RoutePaths.Home);
                                  }
                                }
                              }),
                        ),
                        SizedBox(
                          width: 300,
                          child: RaisedButton(
                            color: Color(0xFF4fdbc1),
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RoutePaths.Register);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
