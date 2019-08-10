import 'package:client/model/note.model.dart';
import 'package:client/services/notes.service.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  Future<List<NoteModel>> notes;

  @override
  void initState() {
    super.initState();
    notes = NotesService.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: notes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [for (var note in snapshot.data) Note(note)],
            );
          } else {
            return Text("No Notes here");
          }
        },
      ),
    );
  }
}
