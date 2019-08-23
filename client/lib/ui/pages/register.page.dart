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
      body: BaseWidget<RegisterUiModel>(
        model: RegisterUiModel(authService: Provider.of(context)),
        child: RegisterWidget(
          passwordController: passwordController,
          passwordValidationController: passwordValidationController,
          usernameController: usernameController,
        ),
        builder: (context, model, child) => Container(
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
                          spreadRadius: -5.0),
                    ],
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: child,
                      ),
                      SizedBox(
                        width: 300,
                        child: RaisedButton(
                          color: Color(0xFF65A882),
                          onPressed: () async {
                            var password = passwordController.text;
                            var passwordValidation =
                                passwordValidationController.text;
                            if (password != passwordValidation) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Password and validation are not identical",
                                  ),
                                ),
                              );
                            } else if (_formKey.currentState.validate()) {
                              var user = await model.registerNewUser(
                                usernameController.text,
                                password,
                              );
                              if (user != null) {
                                await Navigator.popAndPushNamed(
                                    context, RoutePaths.Home);
                              }
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: RaisedButton(
                          color: Color(0xFF65A882),
                          child: Text(
                            "Back to login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RoutePaths.Login);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
