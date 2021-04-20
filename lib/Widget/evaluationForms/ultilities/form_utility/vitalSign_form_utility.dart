import 'package:AbdoCare_Web/constants.dart';

class VitalSignFormUtility {
  var _state;

  VitalSignFormUtility();
  // ignore: avoid_returning_this
  VitalSignFormUtility withState(String state) {
    this._state = state;
    return this;
  }

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
    // assert(score >= 0 && score <= 10);
    // if (_state == "Post-Operation@Hospital") {
    //   if (_dayInState == 0) {
    //     score >= 8 ? result = true : result = false;
    //   } else if (_dayInState == 1) {
    //     score >= 4 ? result = true : result = false;
    //   } else if (_dayInState >= 2) {
    //     score >= 6 ? result = true : result = false;
    //   } else {
    //     result = false;
    //     throw ('getPainFormCriteria cannot define the minPainToNotify');
    //   }
    // }
    //print('$_state $score and $result');
    return result;
  }
}
