import 'package:aqueduct/aqueduct.dart';
import 'package:server/model/user.model.dart';

class UserProfileController extends ResourceController {
  UserProfileController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getUserProfile() async {
    final id = request.authorization.ownerID;
    final query = Query<User>(context)..where((u) => u.id).equalTo(id);

    return Response.ok(await query.fetchOne());
  }
}
