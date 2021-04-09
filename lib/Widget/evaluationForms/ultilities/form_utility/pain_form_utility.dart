class PainFormUtility {
  var _state;
  var _dayInState;

  PainFormUtility();
  // ignore: avoid_returning_this
  PainFormUtility withState(String state) {
    this._state = state;
    return this;
  }

  // ignore: avoid_returning_this
  PainFormUtility withDayInState(int dayInState) {
    this._dayInState = dayInState;
    return this;
  }

  bool getPainFormCriteria(double score) {
    bool result = false;
    assert(score >= 0 && score <= 10);
    if (_state == "Post-Operation@Hospital") {
      if (_dayInState == 0) {
        score >= 8 ? result = true : false;
      } else if (_dayInState == 1) {
        score >= 4 ? result = true : false;
      } else if (_dayInState >= 2 && _dayInState <= 7) {
        score >= 6 ? result = true : false;
      } else {
        result = false;
        throw ('getPainFormCriteria cannot define the minPainToNotify');
      }
    }
    print('$_state $_dayInState $score and $result');
    return result;
  }
}
