import 'package:client/core/model/user.model.dart';
import 'package:client/ui/widgets/note-form.widget.dart';
import 'package:client/ui/model/notes.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:client/ui/widgets/note-list.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Provider.of<User>(context) == null
            ? Text(title)
            : Text(
                "$title: Nice to see you ${Provider.of<User>(context).name}"),
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
        child: BaseWidget(
            model: NotesUiModel(apiService: Provider.of(context)),
            onModelReady: (model) => model.getNotes(),
            builder: (context, model, child) => Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "Digital Journal ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 36.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "| Create a note",
                                    style: TextStyle(
                                        color: Color(0xff767e86),
                                        fontSize: 24.0))
                              ]),
                        ),
                      ],
                    ),
                    NoteForm(model: model),
                    Text(
                      "Your Journal",
                      style: TextStyle(color: Colors.black, fontSize: 36.0),
                    ),
                    NoteList(model: model),
                  ],
                )),
      ),
    );
  }
}
