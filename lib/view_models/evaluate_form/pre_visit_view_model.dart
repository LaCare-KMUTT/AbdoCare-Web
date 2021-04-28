import 'package:AbdoCare_Web/view_models/evaluate_form/generalForm_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/evalutate_form/pre_visit/pre_visit_model.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PreVisitViewModel {
  PreVisitFormModel _preVisitFormModel;
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  PreVisitViewModel() {
    _preVisitFormModel = PreVisitFormModel().getModel();
  }

  PreVisitFormModel getModel() {
    return _preVisitFormModel;
  }

  void saveGeneralForm(Map<String, dynamic> generalForm) {
    _preVisitFormModel.setGeneralForm(generalForm);
  }

  void saveADlForm(Map<String, dynamic> adlForm) {
    _preVisitFormModel.setADLForm(adlForm);
  }

  void saveHealthStatusForm(Map<String, dynamic> healthStatusForm) {
    _preVisitFormModel.setHealthStatusForm(healthStatusForm);
  }

  void saveMapUpdateToDatabase(Map<String, dynamic> updateToDatabase) {
    _preVisitFormModel.setUpdateToDatabase(updateToDatabase);
  }

  void saveDataToDatabase({@required String hn}) {
    _firebaseService.addDataToFormsCollection(
        data: _preVisitFormModel.getGeneralForm(), formName: 'General', hn: hn);

    GeneralFormViewModel().updateToDatabase();

    _firebaseService.addDataToFormsCollection(
        data: _preVisitFormModel.getADLForm(), formName: 'ADL', hn: hn);

    _firebaseService.addDataToFormsCollection(
        data: _preVisitFormModel.getHealthStatusForm(),
        formName: 'Health Status',
        hn: hn);
  }
}
