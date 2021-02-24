import 'package:AbdoCare_Web/services/interfaces/storage_service_interface.dart';
import 'package:get_it/get_it.dart';

import 'calculation_service.dart';
import 'firebase_service.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'mock/firebase_service_mock.dart';
import 'storage_service.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator({bool isMock = false}) {
  print('setUpServiceLocator isMock : $isMock');
  isMock
      ? locator
          .registerLazySingleton<IFirebaseService>(() => FirebaseServiceMock())
      : locator
          .registerLazySingleton<IFirebaseService>(() => FirebaseService());
  locator
      .registerLazySingleton<ICalculationService>(() => CalculationService());
  locator.registerLazySingleton<IStorageService>(() => StorageService());
}
