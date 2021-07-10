import 'dart:async';

import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/generalForm_model.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class GeneralFormViewModel {
  String hn;
  static GeneralFormModel _generalFormModel;
  final _firebaseService = locator<IFirebaseService>();
  Map<String, dynamic> userCollection;
  var anSubCollection;

  GeneralFormViewModel();
  GeneralFormViewModel._init(this.hn) {
    _generalFormModel = new GeneralFormModel();
  }

  static Future<GeneralFormModel> getModel(String hn) async {
    var thisClass = GeneralFormViewModel._init(hn);
    var model = await thisClass.query();
    return model;
  }

  Future<GeneralFormModel> query() async {
    userCollection = await _firebaseService
        .searchDocumentByField(collection: 'Users', field: 'hn', fieldValue: hn)
        .then((value) {
      Map<String, dynamic> userCollection = value.docs.first.data();
      return {
        ...userCollection,
        'id': value.docs.first.id,
      };
    });
    var model = _generalFormModel.setUserCollectionFromDb(userCollection);
    anSubCollection = await _firebaseService.getLatestAnSubCollection(
        docId: userCollection['id']);
    model = _generalFormModel.setAnSubCollectionFromDb(anSubCollection);
    return model;
  }

  static GeneralFormModel getGeneralFormModel() {
    var model = _generalFormModel.getModel();

    return model;
  }
}
