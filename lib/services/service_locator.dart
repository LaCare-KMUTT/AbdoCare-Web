import 'package:get_it/get_it.dart';

import 'firebase_service.dart';
import 'interfaces/firebase_service_interface.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<IFirebaseService>(() => FirebaseService());
}
