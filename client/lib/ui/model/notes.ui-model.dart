import 'package:client/core/model/base.model.dart';
import 'package:client/core/model/note.model.dart';
import 'package:client/core/services/api.service.dart';
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
    var note = await _apiService.createNote(headerText, bodyText);
    notes.add(note);
    setBusy(false);
  }

  Future deleteNote(int noteId) async {
    setBusy(true);
    var deletedNote = await _apiService.deleteNote(noteId);
    setBusy(false);

    if (deletedNote) {
      notes.removeWhere((noteModel) => noteModel.noteId == noteId);
    }
  }
}
