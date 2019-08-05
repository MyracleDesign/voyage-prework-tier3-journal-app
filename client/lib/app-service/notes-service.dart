import 'dart:convert';

import 'package:client/model/note-model.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static Future<List<NoteModel>> getAllNotes() async {
    final Uri mainUri =
        Uri(host: 'localhost', port: 8888, path: '/notes', scheme: 'http');

    final response = await http.get(mainUri);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      List<NoteModel> noteList = [];
      List<dynamic> responseList = json.decode(response.body);
      responseList.forEach((responseNote) {
        noteList.add(NoteModel.fromJson(responseNote));
      });
      return noteList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
