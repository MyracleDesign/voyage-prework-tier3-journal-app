import 'package:client/core/model/user.model.dart';
import 'package:client/core/services/api.service.dart';
import 'package:client/core/services/auth.service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentService,
  ...dependentService,
  ...uiConsumableService
];

List<SingleChildCloneableWidget> independentService = [
  Provider.value(value: ApiService())
];
List<SingleChildCloneableWidget> dependentService = [
  ProxyProvider<ApiService, AuthService>(
    builder: (context, api, auth) => AuthService(api: api),
  )
];
List<SingleChildCloneableWidget> uiConsumableService = [
  StreamProvider<User>(
    builder: (context) => Provider.of<AuthService>(context, listen: false).user,
  ),
];
