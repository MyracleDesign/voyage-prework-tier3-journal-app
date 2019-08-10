import 'package:aqueduct/managed_auth.dart';
import 'package:server/controller/notes.controller.dart';
import 'package:server/controller/user.controller.dart';
import 'package:server/model/user.model.dart';

import 'server.dart';

class ServerChannel extends ApplicationChannel {
  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "digital_journal_user",
        "Passw0rd",
        "localhost",
        5432,
        "digital_journal");

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/notes/[:id]').link(() => NotesController(context));

    router.route('/users/[:id]').link(() => UserController(context));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
