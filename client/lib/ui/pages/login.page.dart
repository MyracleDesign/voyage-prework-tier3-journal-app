import 'package:client/paths.dart';
import 'package:client/ui/model/login.ui-model.dart';
import 'package:client/ui/widgets/login-header.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginUiModel>.value(
        value: LoginUiModel(authService: Provider.of(context)),
        child: Consumer<LoginUiModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.blue,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(controller: _controller),
                model.busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            await Navigator.pushNamed(context, RoutePaths.Home);
                          }
                        },
                      )
              ],
            ),
          ),
        ));
  }
}
