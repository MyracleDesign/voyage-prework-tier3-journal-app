import 'package:server/model/note.model.dart';

import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  setUp(() async {
    final notes = [
      Note()
        ..ownerId = 1
        ..noteId = 1
        ..bodyText = "Test Body Text"
        ..headerText = "Test Header Text",
      Note()
        ..ownerId = 1
        ..noteId = 2
        ..bodyText = "Test Body Text 2"
        ..headerText = "Test Header Text 2",
      Note()
        ..ownerId = 2
        ..noteId = 3
        ..bodyText = "Test should not be visible for bob"
        ..headerText = "Test should not be visible for bob",
    ];

    notes.forEach((note) async {
      final query = Query<Note>(harness.context)..values = note;
      await query.insert();
    });
  });

  group("[GET] ", () {
    test("returns 401 not authorized", () async {
      final response = await harness.agent.get('/notes');
      expectResponse(response, 401);
    });

    test("returns 200", () async {
      final agent = await harness.registerUser("bob", "Passw0rd");

      final response = await agent.get('/notes');
      expectResponse(response, 200);
    });

    test("returns 200 and a list of notes related to his account", () async {
      final agent = await harness.registerUser("bob", "Passw0rd");

      final response = await agent.get('/notes');
      expectResponse(
        response,
        200,
        body: everyElement(
          partial({
            "bodyText": isString,
            "headerText": isString,
            "noteId": isInteger
          }),
        ),
      );

      expect(response, hasBody(hasLength(2)));
    });

    test("should receive just one note if second user", () async {
      await harness.registerUser("bob", "password");
      final secondUser = await harness.registerUser("Myracle", "password");

      final response = await secondUser.get("notes");
      expect(response, hasBody(hasLength(1)));
    });

    test("should return a single note", () async {
      final user = await harness.registerUser("bob", "password");
      final response = await user.get("/notes?id=2");

      expectResponse(response, 200,
          body: partial({
            "bodyText": isString,
            "headerText": isString,
            "noteId": isNumber
          }));
    });

    test('should not have access to a different users note', () async {
      final user = await harness.registerUser("username", "password");
      final response = await user.get("/notes?id=3");

      expectResponse(response, 403);
    });
  });

  group("[POST]", () {});

  group("[DELETE]", () {});

  group("[PUT]", () {});
}
