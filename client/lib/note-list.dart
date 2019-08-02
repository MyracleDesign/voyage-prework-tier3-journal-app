import 'package:flutter_web/material.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  var notes = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[],
    );
  }
}
