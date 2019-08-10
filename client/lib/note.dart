import 'package:client/model/note.model.dart';
import 'package:client/services/notes.service.dart';
import 'package:flutter_web/material.dart';

class Note extends StatefulWidget {
  final NoteModel note;

  Note(this.note);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(widget.note.noteId),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
              border: Border(
                top: BorderSide(color: Color(0xffdedede), width: 1),
                bottom: BorderSide(color: Color(0xffdedede), width: 1),
                left: BorderSide(color: Color(0xffdedede), width: 1),
                right: BorderSide(color: Color(0xffdedede), width: 1),
              ),
            ),
            child: Padding(
              child: Row(
                children: <Widget>[
                  Text(widget.note.headerText,
                      style: TextStyle(color: Colors.black, fontSize: 36.0)),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              padding: EdgeInsets.all(8),
            ),
          ),
          Padding(
            child: Row(
              children: <Widget>[Text(widget.note.bodyText)],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
              border: Border(
                top: BorderSide(color: Color(0xffdedede), width: 1),
                bottom: BorderSide(color: Color(0xffdedede), width: 1),
                left: BorderSide(color: Color(0xffdedede), width: 1),
                right: BorderSide(color: Color(0xffdedede), width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Color(0xff017bff)),
                    ),
                    onPressed: () {
                      print("Pressed Edit");
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      NotesService.deleteNote(widget.note.noteId);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
