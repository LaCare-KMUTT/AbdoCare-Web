import '../../models/evalutate_form/pre_visit/adlForm_model.dart';

class ADLFormViewModel {
  static ADLFormModel _adlFormModel;

  ADLFormViewModel() {
    _adlFormModel = new ADLFormModel();
  }

  Future<ADLFormModel> getModel() async {
    var model = _adlFormModel.getModel();
    return model;
  }
}
