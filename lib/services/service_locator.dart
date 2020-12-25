import 'package:AbdoCare_Web/services/mock/firebase_service_mock.dart';
import 'package:get_it/get_it.dart';

import 'firebase_service.dart';
import 'interfaces/firebase_service_interface.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator({bool isMock = false}) {
  print('setUpServiceLocator isMock : $isMock');
  isMock
      ? locator
          .registerLazySingleton<IFirebaseService>(() => FirebaseServiceMock())
      : locator
          .registerLazySingleton<IFirebaseService>(() => FirebaseService());
}
