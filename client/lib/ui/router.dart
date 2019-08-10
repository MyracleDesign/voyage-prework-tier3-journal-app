import 'package:client/paths.dart';
import 'package:client/ui/pages/home.page.dart';
import 'package:client/ui/pages/login.page.dart';
import 'package:client/ui/pages/note-edit.page.dart';
import 'package:flutter_web/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.EditNote:
        return MaterialPageRoute(builder: (_) => NoteEditPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route found for this scenario"),
            ),
          ),
        );
    }
  }
}