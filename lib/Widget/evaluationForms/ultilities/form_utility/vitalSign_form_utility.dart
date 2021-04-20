import 'package:AbdoCare_Web/constants.dart';

class VitalSignFormUtility {
  VitalSignFormUtility();
  bool getVitalSignFormCriteria(_bt, _pr, _rr, _systolic, _diastolic, _o2sat) {
    bool result = false;
    if ((_bt >= Constant.btLowerCriteria && _bt <= Constant.btUpperCriteria) &&
        (_pr >= Constant.prLowerCriteria && _pr <= Constant.prUpperCriteria) &&
        (_rr >= Constant.rrLowerCriteria && _rr <= Constant.rrUpperCriteria) &&
        (_systolic < Constant.systolicCriteria &&
            _diastolic < Constant.diastolicCriteria) &&
        _o2sat > Constant.oxygenCriteria) {
      result = false;
    } else {
      result = true;
    }
    return result;
  }
}
