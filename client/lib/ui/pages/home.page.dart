import 'package:client/ui/model/notes.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:client/ui/widgets/note-form.widget.dart';
import 'package:client/ui/widgets/note-list.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      backgroundColor: Color(0xFF4fdbc1),
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
              NoteForm(model: model),
              Text(
                "Your Journal",
                style: TextStyle(color: Colors.black, fontSize: 36.0),
              ),
              NoteList(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
