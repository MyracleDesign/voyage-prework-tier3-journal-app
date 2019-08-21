import 'dart:async';

import 'package:client/core/model/note.model.dart';
import 'package:client/core/services/api.service.dart';

class NotesService {
  final ApiService _api;

  NotesService({ApiService api}) : _api = api;

  StreamController<List<NoteModel>> notesController =
      StreamController<List<NoteModel>>();

  Stream<List<NoteModel>> get user => notesController.stream;

  Future<List<NoteModel>> getAllNotes() async {
    return await _api.getAllNotesForUser();
  }

  Future<bool> deleteNote(int noteId) async {
    return await _api.deleteNote(noteId);
  }

  Future<NoteModel> createNote(NoteModel note) async {
    return await _api.createNote(note.headerText, note.bodyText);
  }
}
