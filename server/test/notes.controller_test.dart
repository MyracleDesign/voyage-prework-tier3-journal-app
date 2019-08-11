import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test("[GET] /notes returns 401 not authorized", () async {
    final response = await harness.agent.get('/notes');
    expectResponse(response, 401);
  });

  /// Currently not able to test everything behind the auth gate.
  /// Created an Issue in https://github.com/stablekernel/aqueduct/issues/687
  /// TODO: Create test for successful return
  /*test("[GET] /notes returns 200 and a list of notes", () async {
    final agent = await Harness()
        .registerUser("bob", "Passw0rd", withClient: harness.agent);

    final response = await agent.get('/notes');
    expectResponse(response, 200);
  });*/
}
