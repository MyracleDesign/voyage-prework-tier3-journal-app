import 'dart:convert';

import 'package:client/model/note-model.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static Future<List<NoteModel>> getAllNotes() async {
    final Uri mainUri =
        Uri(host: 'localhost', port: 8888, path: '/notes', scheme: 'http');

    final response = await http.get(mainUri);

    print(response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      List<NoteModel> noteList = [];
      var responseList = json.decode(response.body);
      responseList.forEach((e) {
        noteList.add(NoteModel.fromJson(e));
      });
      return noteList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
