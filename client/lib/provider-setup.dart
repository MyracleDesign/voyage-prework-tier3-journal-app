import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentService,
  ...dependentService,
  ...uiConsumableService
];

List<SingleChildCloneableWidget> independentService = [];
List<SingleChildCloneableWidget> dependentService = [];
List<SingleChildCloneableWidget> uiConsumableService = [];
