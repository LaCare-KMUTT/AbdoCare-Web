import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/services/cloud_function_service.dart';
import 'package:get_it/get_it.dart';

import '../view_models/pre_op_list_view_model.dart';
import '../view_models/post_home_list_view_model.dart';
import '../view_models/post_hos_list_view_model.dart';
import 'calculation_service.dart';
import 'firebase_service.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'mock/firebase_service_mock.dart';

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
  locator.registerLazySingleton<PreOpViewModel>(() => PreOpViewModel());
  locator.registerLazySingleton<PostHomeViewModel>(() => PostHomeViewModel());
  locator.registerLazySingleton<PostHosViewModel>(() => PostHosViewModel());
  locator.registerLazySingleton<CustomMaterial>(() => CustomMaterial());
  locator.registerLazySingleton<CloudFunctionService>(
      () => CloudFunctionService());
}
