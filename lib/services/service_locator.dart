import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/health_status_form_utility.dart';
import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/models/evalutate_form/evaluation_model.dart';
import 'package:AbdoCare_Web/services/cloud_function_service.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/recoveryReadiness_view_model.dart';
import 'package:AbdoCare_Web/view_models/notification_list/notification_view_model.dart';
import 'package:get_it/get_it.dart';

import '../Widget/evaluationForms/ultilities/form_utility/health_status_form_utility.dart';
import '../Widget/material.dart';
import '../view_models/evaluate_form/pre_visit_view_model.dart';
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
  locator.registerLazySingleton<EvaluationModel>(() => EvaluationModel());
  locator
      .registerLazySingleton<EvaluationViewModel>(() => EvaluationViewModel());
  locator
      .registerLazySingleton<HealthStatusUtility>(() => HealthStatusUtility());
  locator.registerLazySingleton<CloudFunctionService>(
      () => CloudFunctionService());
  locator.registerLazySingleton<NotiViewModel>(() => NotiViewModel());
  locator.registerLazySingleton<PreVisitViewModel>(() => PreVisitViewModel());
  locator.registerLazySingleton<RecoveryReadinessFormViewModel>(
      () => RecoveryReadinessFormViewModel());
}
