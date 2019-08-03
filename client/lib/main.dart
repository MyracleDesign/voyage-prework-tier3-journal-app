import 'package:client/note-form.dart';
import 'package:client/note-list.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Journal',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Roboto"),
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
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              print("Login pressed");
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                print("Register pressed");
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: "Digital Journal ",
                      style: TextStyle(color: Colors.black, fontSize: 36.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: "| Create a note",
                            style: TextStyle(
                                color: Color(0xff767e86), fontSize: 24.0))
                      ]),
                ),
              ],
            ),
            NoteForm(),
            Text(
              "Your Journal",
              style: TextStyle(color: Colors.black, fontSize: 36.0),
            ),
            NoteList(),
          ],
        ),
      ),
    );
  }
}
