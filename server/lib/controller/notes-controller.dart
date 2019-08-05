import 'package:server/model/note.dart';
import 'package:server/server.dart';

class NotesController extends ResourceController {
  NotesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllNotes() async {
    final notesQuery = Query<Note>(context);
    final notes = await notesQuery.fetch();

    return Response.ok(notes);
  }

  @Operation.get('id')
  Future<Response> getNoteById(@Bind.path('id') int id) async {
    final noteQuery = Query<Note>(context)..where((h) => h.noteId).equalTo(id);
    final note = noteQuery.fetchOne();

    if (note == null) {
      return Response.notFound();
    } else {
      return Response.ok(note);
    }
  }
}
