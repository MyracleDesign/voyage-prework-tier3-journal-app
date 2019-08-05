import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future seed() async {
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
    for (final note in _notes) {
      await database.store.execute(
          "INSERT INTO _Note (bodyText, headerText) VALUES (@bodyText, @headText)",
          substitutionValues: {"bodyText": note["bodyText"], "headText": note["headText"]});
    }
  }

  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Note", [
      SchemaColumn("noteId", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("bodyText", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("headerText", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}
}
