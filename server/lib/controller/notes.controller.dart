import 'package:server/model/note.model.dart';
import 'package:server/server.dart';

class NotesController extends ResourceController {
  NotesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllNotes() async {
    final notesQuery = Query<Note>(context)
      ..where((h) => h.ownerId).equalTo(request.authorization.ownerID);
    final notes = await notesQuery.fetch();
    return notes.isEmpty ? Response.ok([]) : Response.ok(notes);
  }

  @Operation.get('id')
  Future<Response> getNoteById(@Bind.path('id') int id) async {
    final noteQuery = Query<Note>(context)
      ..where((h) => h.ownerId).equalTo(request.authorization.ownerID)
      ..where((h) => h.noteId).equalTo(id);
    final note = noteQuery.fetchOne();

    if (note == null) {
      return Response.notFound();
    } else {
      return Response.ok(note);
    }
  }

  @Operation.post()
  Future<Response> createNote() async {
    final note = Note()
      ..ownerId = request.authorization.ownerID
      ..read(await request.body.decode(), ignore: ['noteId']);
    final query = Query<Note>(context)..values = note;

    final insertedNote = await query.insert();
    return Response.ok(insertedNote);
  }

  @Operation.delete('id')
  Future<Response> deleteNote(@Bind.path('id') int id) async {
    final noteQuery = Query<Note>(context)..where((h) => h.noteId).equalTo(id);
    final note = await noteQuery.fetchOne();

    if (note.ownerId == request.authorization.ownerID) {
      final deleteQuery = Query<Note>(context)
        ..where((h) => h.noteId).equalTo(id);
      await deleteQuery.delete();
      return Response.ok(note);
    } else {
      return Response.forbidden(
        body: {"error": "You are not allowed to delete that note"},
      );
    }
  }

  @Operation.put()
  Future<Response> updateNote() async {
    final updateNote = Note()..read(await request.body.decode());

    if (updateNote.headerText == null ||
        updateNote.bodyText == null ||
        updateNote.noteId == null) {
      return Response.badRequest();
    }

    final query = Query<Note>(context)
      ..values.headerText = updateNote.headerText
      ..values.bodyText = updateNote.bodyText
      ..where((note) => note.noteId).equalTo(updateNote.noteId);

    await query.updateOne();

    return Response.ok(updateNote);
  }
}
