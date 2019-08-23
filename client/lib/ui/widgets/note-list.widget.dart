import 'package:client/ui/model/notes.ui-model.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

import 'note.widget.dart';

class NoteList extends StatelessWidget {
  final NotesUiModel model;

  const NoteList({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.busy
        ? Center(child: CircularProgressIndicator())
        : model.notes.isEmpty
            ? Text("There are no current Notes")
            : Column(
                children: [
                  for (var note in model.notes) Note(note: note, model: model)
                ],
              );
  }
}
