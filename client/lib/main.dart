import 'package:client/paths.dart';
import 'package:client/provider-setup.dart';
import 'package:client/ui/pages/home.page.dart';
import 'package:client/ui/router.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Digital Journal',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
        initialRoute: RoutePaths.Register,
        onGenerateRoute: Router.generateRoute,
        home: MyHomePage(title: 'Flutter Digital Journal - Chingu Prework'),
      ),
    );
  }
}
