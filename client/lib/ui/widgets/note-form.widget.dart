import 'package:client/ui/model/notes.ui-model.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

class NoteForm extends StatelessWidget {
  final NotesUiModel model;

  const NoteForm({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var bodyController = TextEditingController();
    return Card(
      color: Color(0xFF376379),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: ValueKey(1),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: titleController,
                      maxLines: 1,
                      decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: bodyController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Body",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Use the form above to create a post. Make sure you fill the required title and body fields and press submit.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF021E2C),
                    onPressed: () {
                      model.createNote(
                          titleController.text, bodyController.text);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
