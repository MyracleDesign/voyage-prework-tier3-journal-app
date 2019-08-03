import 'dart:convert';

import 'package:client/model/note-model.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static Future<List<NoteModel>> getAllNotes() async {
    final response = await http.get('http://localhost:8888/notes');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var note = NoteModel.fromJson(json.decode(response.body));
      return [note];
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
