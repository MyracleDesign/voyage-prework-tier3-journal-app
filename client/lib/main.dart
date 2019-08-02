import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Digital Journal'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                print("Login pressed");
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: "Digital Journal ",
                    style: TextStyle(color: Colors.black, fontSize: 36.0),
                    children: <TextSpan>[
                  TextSpan(
                      text: "| Create a note",
                      style: TextStyle(color: Colors.grey, fontSize: 24.0))
                ])),
          ],
        ),
      ),
    );
  }
}
