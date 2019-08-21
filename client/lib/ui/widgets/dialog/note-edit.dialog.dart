import 'package:flutter_web/material.dart';

class NoteEditDialog extends StatelessWidget {
  final noteTitleController;
  final noteBodyController;
  final onSave;

  NoteEditDialog({
    this.noteBodyController,
    this.noteTitleController,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Edit Note"),
        content: Form(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: noteTitleController,
                    decoration: InputDecoration(
                      hintText: "Note Title",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: noteBodyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Note Body",
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("Save"),
            onPressed: onSave,
          )
        ]);
  }
}
