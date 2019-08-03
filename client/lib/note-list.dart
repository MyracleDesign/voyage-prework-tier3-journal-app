import 'package:client/model/note-model.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:uuid/uuid.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  var notes = [
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
    NoteModel(Uuid().v4(), "HeadText", "BodyText"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            for (var _ in notes)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Placeholder(),
              )
          ],
        ),
      ),
    );
  }
}
