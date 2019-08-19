import 'package:server/server.dart';

class Note extends ManagedObject<_Note> implements _Note {}

class _Note {
  @primaryKey
  int noteId;

  @Column()
  int ownerId;

  @Column(unique: false)
  String bodyText;

  @Column(unique: false)
  String headerText;
}
