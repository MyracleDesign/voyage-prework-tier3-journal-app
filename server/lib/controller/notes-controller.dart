import 'package:server/server.dart';

class NotesController extends Controller {
  final _notes = [
    {"noteId": "1", "bodyText": "Body", "headText": "Header"},
    {"noteId": "2", "bodyText": "Body", "headText": "Header"},
    {"noteId": "3", "bodyText": "Body", "headText": "Header"}
  ];

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    return Response.ok(_notes);
  }
}
