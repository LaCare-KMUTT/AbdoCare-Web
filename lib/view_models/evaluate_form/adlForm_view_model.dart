import '../../models/evalutate_form/pre_visit/adlForm_model.dart';

class ADLFormViewModel {
  static ADLFormModel _adlFormModel;

  ADLFormViewModel._init() {
    _adlFormModel = new ADLFormModel();
  }

  static Future<ADLFormModel> getModel() async {
    var thisClass = ADLFormViewModel._init();
    var model = await thisClass._getModel();
    return model;
  }

  ADLFormModel _getModel() {
    return _adlFormModel.getModel();
  }

  static ADLFormModel getADLFormModel() {
    return _adlFormModel.getModel();
  }
}
