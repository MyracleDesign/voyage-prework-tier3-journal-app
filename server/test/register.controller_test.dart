import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test("[POST] /register a new user should return 200", () async {
    final response = await harness.agent.post('/register',
        body: {"username": "username", "password": "password"});
    expectResponse(
      response,
      200,
      body: partial({
        "id": greaterThan(0),
        "username": isString,
        "password": isNotPresent
      }),
    );
  });

  test("[POST] /register should throw an error if username is not set",
      () async {
    final response = await harness.agent.post(
      '/register',
      body: {"password": "password"},
    );
    expectResponse(response, 400, body: {"error": isString});
  });

  test("[POST] /register should throw an error if password is not set",
      () async {
    final response = await harness.agent.post(
      '/register',
      body: {"username": "username"},
    );
    expectResponse(response, 400, body: {"error": isString});
  });
}
