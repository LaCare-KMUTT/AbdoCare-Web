import 'package:get_it/get_it.dart';

import '../Widget/evaluationForms/ultilities/form_utility/health_status_form_utility.dart';
import '../Widget/material.dart';
import '../view_models/evaluate_form/evaluationFormButton_view_model.dart';
import '../view_models/user_list/post_home_list_view_model.dart';
import '../view_models/user_list/post_hos_list_view_model.dart';
import '../view_models/user_list/pre_op_list_view_model.dart';
import 'calculation_service.dart';
import 'cloud_function_service.dart';
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
  locator.registerLazySingleton<EvaluationFormViewModel>(
      () => EvaluationFormViewModel());
  locator
      .registerLazySingleton<HealthStatusUtility>(() => HealthStatusUtility());
  locator.registerLazySingleton<CloudFunctionService>(
      () => CloudFunctionService());
}
