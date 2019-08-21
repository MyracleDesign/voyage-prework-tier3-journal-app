import 'package:client/core/model/note.model.dart';
import 'package:client/ui/model/notes.ui-model.dart';
import 'package:client/ui/widgets/dialog/note-edit.dialog.dart';
import 'package:flutter_web/material.dart';

class Note extends StatefulWidget {
  final NoteModel note;
  final NotesUiModel model;

  Note({@required this.note, @required this.model});

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    var _noteTitleController =
        TextEditingController(text: widget.note.headerText);
    var _noteBodyController = TextEditingController(text: widget.note.bodyText);

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
            child: Text(
              widget.note.bodyText,
              textAlign: TextAlign.left,
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NoteEditDialog(
                              onSave: () {
                                widget.model.updateNote(
                                  widget.note.noteId,
                                  _noteTitleController.text,
                                  _noteBodyController.text,
                                );
                                Navigator.pop(context);
                              },
                              noteTitleController: _noteTitleController,
                              noteBodyController: _noteBodyController,
                            );
                          });
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      widget.model.deleteNote(widget.note.noteId);
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
