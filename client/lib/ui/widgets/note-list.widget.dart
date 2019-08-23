import 'package:client/ui/model/notes.ui-model.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

import 'note.widget.dart';

class NoteList extends StatelessWidget {
  final NotesUiModel model;

  const NoteList({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF376379),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Journal",
                style: TextStyle(color: Colors.black, fontSize: 36.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: model.busy
                  ? Center(child: CircularProgressIndicator())
                  : model.notes.isEmpty
                      ? Text("There are no current Notes")
                      : Column(
                          children: [
                            for (var note in model.notes)
                              Note(note: note, model: model)
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
