import 'package:client/ui/model/notes.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseWidget<NotesUiModel>(
        model: NotesUiModel(apiService: Provider.of(context)),
        onModelReady: (model) => {model.getNotes()},
        builder: (context, model, child) {
          return model.busy
              ? Center(child: CircularProgressIndicator())
              : model.notes.isEmpty
                  ? Center(
                      child: RaisedButton(
                      child: Text("Create one"),
                      onPressed: () {
                        model.createNote("headerText", "bodyText");
                      },
                    ))
                  : ListView(children: [
                      for (var note in model.notes)
                        Note(
                          note: note,
                          model: model,
                        )
                    ]);
        },
      ),
    );
  }
}
