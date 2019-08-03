import 'package:server/server.dart';

class NotesController extends Controller {
  final _notes = [
    {
      "noteId": "1",
      "bodyText": "This is the first note",
      "headText": "First Note"
    },
    {
      "noteId": "2",
      "bodyText": "THis is the second note",
      "headText": "Second Note"
    },
    {
      "noteId": "3",
      "bodyText": "Third note? Yes indeed.",
      "headText": "Third Note"
    }
  ];

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    return Response.ok(_notes);
  }
}
