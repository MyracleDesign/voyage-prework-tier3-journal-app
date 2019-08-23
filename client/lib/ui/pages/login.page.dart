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
                  LoginPageContent(
                    child: child,
                    model: model,
                    formKey: _formKey,
                    usernameController: _usernameController,
                    passwordController: _passwordController,
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

class LoginPageContent extends StatelessWidget {
  final child;
  final model;
  final formKey;
  final usernameController;
  final passwordController;

  LoginPageContent({
    this.child,
    this.model,
    this.formKey,
    this.usernameController,
    this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Color(0xFF021E2C),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    var loginSuccess = await model.login(
                      usernameController.text,
                      passwordController.text,
                    );
                    if (loginSuccess) {
                      usernameController.clear();
                      passwordController.clear();
                      await Navigator.pushNamed(context, RoutePaths.Home);
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Username or Password was wrong, please try again."),
                        ),
                      );
                    }
                  }
                }),
          ),
          SizedBox(
            width: 300,
            child: RaisedButton(
              color: Color(0xFF021E2C),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RoutePaths.Register);
              },
            ),
          ),
        ],
      ),
    );
  }
}
