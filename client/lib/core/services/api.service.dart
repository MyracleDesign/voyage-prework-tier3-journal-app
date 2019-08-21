import 'dart:convert';

import 'package:client/core/model/auth.model.dart';
import 'package:client/core/model/note.model.dart';
import 'package:client/core/model/user.model.dart';
import 'package:http/http.dart';

class ApiService {
  static final host = 'localhost';
  static final port = 8888;
  static final scheme = 'http';
  static final clientId = "com.myracledesign.flutter_web_digital_journal";
  static final secret = "";
  AuthModel authModel;

  final clientCredentials =
      Base64Encoder().convert("$clientId:$secret".codeUnits);

  /// Logs a user in with OAuth 2.0 this creates a token that is saved in the authModel
  Future<bool> loginWithUsernamePassword(
      String username, String password) async {
    var response = await post(
        Uri(
          host: host,
          port: port,
          path: '/auth/token',
          scheme: scheme,
        ),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Basic $clientCredentials"
        },
        body: {
          "username": username,
          "password": password,
          "grant_type": "password"
        });

    if (response.statusCode == 200) {
      authModel = AuthModel.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUserProfile() async {
    var response = await get(
      Uri(
        host: host,
        port: port,
        path: '/userProfile',
        scheme: scheme,
      ),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    return response.statusCode == 200
        ? User.fromJson(json.decode(response.body))
        : null;
  }

  Future<List<NoteModel>> getAllNotesForUser() async {
    var response = await get(
        Uri(
          host: host,
          port: port,
          path: '/notes',
          scheme: scheme,
        ),
        headers: {"Authorization": "Bearer ${authModel.accessToken}"});

    if (response.statusCode == 200) {
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

  Future<NoteModel> createNote(String headerText, String bodyText) async {
    final response = await post(
      Uri(
        host: host,
        port: port,
        path: '/notes',
        scheme: scheme,
      ),
      body: json.encode({"headerText": headerText, "bodyText": bodyText}),
      headers: {
        "content-type": 'application/json',
        "Authorization": "Bearer ${authModel.accessToken}"
      },
    );

    if (response.statusCode == 200) {
      return NoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create a note');
    }
  }

  Future<NoteModel> updateNote(
      int noteId, String headerText, String bodyText) async {
    final response = await put(
      Uri(
        host: host,
        port: port,
        path: '/notes/$noteId',
        scheme: scheme,
      ),
      headers: {"content-type": 'application/json'},
      body: json.encode({
        "noteId": noteId,
        "headerText": headerText,
        "bodyText": bodyText,
      }),
    );

    if (response.statusCode == 200) {
      return NoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update the note");
    }
  }

  Future<bool> deleteNote(int noteId) async {
    final response = await delete(
      Uri(
        host: host,
        port: port,
        path: '/notes/$noteId',
        scheme: scheme,
      ),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    return response.statusCode == 200
        ? true
        : throw Exception("Failed to delete $noteId Note");
  }

  Future<User> registerWithUsernamePassword(
      String username, String password) async {
    final response = await post(
      Uri(
        host: host,
        port: port,
        path: '/register',
        scheme: scheme,
      ),
      headers: {"content-type": 'application/json'},
      body: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
