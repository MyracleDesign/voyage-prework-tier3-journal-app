import 'dart:convert';

import 'package:client/model/note-model.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static final host = 'localhost';
  static final port = 8888;
  static final scheme = 'http';

  static Future<List<NoteModel>> getAllNotes() async {
    final response = await http
        .get(Uri(host: host, port: port, path: '/notes', scheme: scheme));
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

  static Future<NoteModel> createNote(
      String headerText, String bodyText) async {
    final response = await http.post(
      Uri(host: host, port: port, path: '/notes', scheme: scheme),
      body: json.encode({"headerText": headerText, "bodyText": bodyText}),
      headers: {
        "content-type": 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return NoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create a note');
    }
  }

  static Future<NoteModel> deleteNote(int noteId) async {
    final response = await http.delete(
        Uri(host: host, port: port, path: '/notes/$noteId', scheme: scheme));
    if (response.statusCode == 200) {
      return NoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to delete $noteId Note");
    }
  }
}
