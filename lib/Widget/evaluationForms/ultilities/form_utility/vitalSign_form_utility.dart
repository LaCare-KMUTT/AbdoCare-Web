import 'package:AbdoCare_Web/form_criteria.dart';

class VitalSignFormUtility {
  VitalSignFormUtility();
  bool getVitalSignFormCriteria(_bt, _pr, _rr, _systolic, _diastolic, _o2sat) {
    bool result = false;
    if ((_bt >= FormCriteria.BT_LOWER_CRITERIA &&
            _bt <= FormCriteria.BT_UPPER_CRITERIA) &&
        (_pr >= FormCriteria.PR_LOWER_CRITERIA &&
            _pr <= FormCriteria.PR_UPPER_CRITERIA) &&
        (_rr >= FormCriteria.RR_LOWER_CRITERIA &&
            _rr <= FormCriteria.RR_UPPER_CRITERIA) &&
        (_systolic < FormCriteria.SYSTOLIC_CRITERIA &&
            _diastolic < FormCriteria.DIASTOLIC_CRITERIA) &&
        _o2sat > FormCriteria.OXYGEN_CRITERIA) {
      result = false;
    } else {
      result = true;
    }
    return result;
  }
}
