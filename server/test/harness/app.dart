import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:server/server.dart';

export 'package:aqueduct/aqueduct.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:server/server.dart';
export 'package:test/test.dart';

/// A testing harness for server.
///
/// A harness for testing an aqueduct application. Example test file:
///
///         void main() {
///           Harness harness = Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final response = await harness.agent.get("/path");
///             expectResponse(response, 200);
///           });
///         }
///
class Harness extends TestHarness<ServerChannel>
    with TestHarnessAuthMixin<ServerChannel>, TestHarnessORMMixin {
  Agent publicAgent;

  @override
  Future onSetUp() async {
    await resetData();
    publicAgent = await addClient("com.aqueduct.public");
  }

  @override
  Future onTearDown() async {}

  @override
  ManagedContext get context => channel.context;

  @override
  AuthServer get authServer => channel.authServer;

  Future<Agent> registerUser(String username, String password,
      {Agent withClient}) async {
    withClient ??= publicAgent;

    final req = withClient.request('/register')
      ..body = {"username": username, "password": password};
    await req.post();

    return loginUser(withClient, username, password);
  }
}
