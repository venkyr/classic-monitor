import 'package:get_it/get_it.dart';

import 'polling_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  serviceLocator.registerSingleton(PollingService());
}
