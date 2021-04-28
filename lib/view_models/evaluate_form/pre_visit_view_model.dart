import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_model.dart';
import 'package:flutter/material.dart';

import '../../models/evalutate_form/pre_visit/pre_visit_model.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class PreVisitViewModel {
  PreVisitFormModel _preVisitFormModel;
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  GeneralFormModel _generalFormModel;
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

  void saveMapUpdateToDatabase(Map<String, dynamic> updateToDatabase,
      GeneralFormModel generalFormModel) {
    _preVisitFormModel.setUpdateToDatabase(updateToDatabase);
    _generalFormModel = generalFormModel;
  }

  Future<void> saveDataToDatabase({@required String hn}) async {
    // await _firebaseService.addDataToFormsCollection(
    //     data: _preVisitFormModel.getGeneralForm(), formName: 'General', hn: hn);

    var updateToDb = _preVisitFormModel.getUpdateToDatabase();
    print('updateToDb = $updateToDb');
    var generalForm = _preVisitFormModel.getGeneralForm();
    Map<String, dynamic> updateToAnSubCollection = {
      'previousIllness': generalForm['previousIllness'],
      'ward': generalForm['ward'],
      'oldWeight': generalForm['oldWeight'],
      'height': generalForm['height'],
      'weight': generalForm['weight'],
    };
    print('updateToAnSubCollection = $updateToAnSubCollection');
    // var userCollection = await _firebaseService
    //     .searchDocumentByField(collection: 'Users', field: 'hn', fieldValue: hn)
    //     .then((value) {
    //   return {
    //     ...value.docs.first.data(),
    //     'id': value.docs.first.id,
    //   };
    // });

    // var anSubCollection = await _firebaseService.getLatestAnSubCollection(
    //     docId: userCollection['id']);

    // await _firebaseService.updateFieldToSubCollection(
    //     collection: 'Users',
    //     docId: userCollection['id'],
    //     subCollection: 'an',
    //     subCollectionDoc: anSubCollection['id'],
    //     data: updateToAnSubCollection);

    // await _firebaseService.addDataToFormsCollection(
    //     data: _preVisitFormModel.getADLForm(), formName: 'ADL', hn: hn);

    // await _firebaseService.addDataToFormsCollection(
    //     data: _preVisitFormModel.getHealthStatusForm(),
    //     formName: 'Health Status',
    //     hn: hn);
  }
}
