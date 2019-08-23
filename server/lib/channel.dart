import 'package:aqueduct/managed_auth.dart';
import 'package:server/controller/notes.controller.dart';
import 'package:server/controller/register.controller.dart';
import 'package:server/controller/user.controller.dart';
import 'package:server/model/user.model.dart';

import 'server.dart';

class ServerChannel extends ApplicationChannel {
  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    CORSPolicy.defaultPolicy.allowedOrigins = [
      "http://127.0.0.1:8080",
      "http://localhost:8080",
      "https://digital-journal-client.herokuapp.com"
    ];

    CORSPolicy.defaultPolicy.allowedMethods = [
      "POST",
      "GET",
      "PUT",
      "DELETE",
      "OPTIONS"
    ];

    CORSPolicy.defaultPolicy.allowCredentials = true;

    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = DigitalJournalConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/auth/token').link(() => AuthController(authServer));

    router
        .route('/notes/[:id]')
        .link(() => Authorizer.bearer(authServer))
        .link(() => NotesController(context));

    router
        .route('/register')
        .link(() => RegisterController(context, authServer));

    router
        .route('/userProfile')
        .link(() => Authorizer.bearer(authServer))
        .link(() => UserProfileController(context));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}

class DigitalJournalConfig extends Configuration {
  DigitalJournalConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
