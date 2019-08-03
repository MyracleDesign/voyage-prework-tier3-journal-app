import 'package:client/model/note-model.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:uuid/uuid.dart';

import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  var notes = [
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(children: [for (var note in notes) Note(note)]));
  }
}
