import 'package:client/ui/model/notes.ui-model.dart';
import 'package:client/ui/widgets/base.widget.dart';
import 'package:client/ui/widgets/note-form.widget.dart';
import 'package:client/ui/widgets/note-list.widget.dart';
import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF1e4b60),
      ),
      backgroundColor: Color(0xFF4fdbc1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
        child: BaseWidget(
          model: NotesUiModel(apiService: Provider.of(context)),
          onModelReady: (model) => model.getNotes(),
          builder: (context, model, child) => ListView(
            children: <Widget>[
              NoteForm(model: model),
              NoteList(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
