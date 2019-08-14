import 'package:client/model/base.model.dart';
import 'package:client/model/note.model.dart';
import 'package:client/services/api.service.dart';
import 'package:flutter_web/cupertino.dart';

class NotesUiModel extends BaseModel {
  ApiService _apiService;

  NotesUiModel({@required ApiService apiService}) : _apiService = apiService;

  List<NoteModel> notes;

  Future getNotes() async {
    setBusy(true);
    notes = await _apiService.getAllNotesForUser();
    setBusy(false);
  }

  Future createNote(headerText, bodyText) async {
    setBusy(true);
    notes.add(await _apiService.createNote(headerText, bodyText));
    setBusy(false);
  }

  Future deleteNote(int noteId) async {
    setBusy(true);
    var deleted = await _apiService.deleteNote(noteId);
    if (deleted) {
      notes.removeWhere((test) => test.noteId == noteId);
    }
    setBusy(false);
  }
}
