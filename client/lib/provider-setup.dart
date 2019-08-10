import 'package:client/services/api.service.dart';
import 'package:client/services/auth.service.dart';
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
List<SingleChildCloneableWidget> uiConsumableService = [];
