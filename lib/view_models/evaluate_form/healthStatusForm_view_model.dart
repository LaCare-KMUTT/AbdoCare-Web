import '../../models/evalutate_form/pre_visit/healthStatusForm_model.dart';

class HealthStatusFormViewModel {
  static HealthStatusFormModel _healthStatusFormModel;

  HealthStatusFormViewModel._init() {
    _healthStatusFormModel = new HealthStatusFormModel();
  }

  static Future<HealthStatusFormModel> getModel() async {
    var thisClass = HealthStatusFormViewModel._init();
    // ignore: await_only_futures
    var model = await thisClass._getModel();
    return model;
  }

  HealthStatusFormModel _getModel() {
    return _healthStatusFormModel.getModel();
  }

  static HealthStatusFormModel getHealthStatusFormModel() {
    return _healthStatusFormModel.getModel();
  }
}
