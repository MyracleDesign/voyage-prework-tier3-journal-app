import 'package:client/services/notes.service.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

class NoteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var bodyController = TextEditingController();
    return Form(
      key: ValueKey(1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: titleController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                controller: bodyController,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Body",
                    labelStyle: TextStyle(color: Colors.black)),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  "Use the form above to create a post. Make sure you fill the required title and body fields and press submit.",
                  style: TextStyle(color: Color(0xff717A81)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff007bff),
                onPressed: () {
                  NotesService.createNote(
                      titleController.text, bodyController.text);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
