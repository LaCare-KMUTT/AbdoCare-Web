class ADLFormModel {
  int _feeding;
  int _grooming;
  int _transfer;
  int _toilet;
  int _mobility;
  int _dressing;
  int _stairs;
  int _bathing;
  int _bowels;
  int _bladder;
  int _totalScore;

  ADLFormModel getModel() => this;

  void fromMap(Map<String, int> map) {
    _feeding = map['Feeding'];
    _grooming = map['Grooming'];
    _transfer = map['Transfer'];
    _toilet = map['Toilet'];
    _mobility = map['Mobility'];
    _dressing = map['Dressing'];
    _stairs = map['Stairs'];
    _bathing = map['Bathing'];
    _bowels = map['Bowels'];
    _bladder = map['Bladder'];
    _totalScore = map['TotalScoreADL'];
  }

  Map<String, int> toMap() {
    return {
      'Feeding': _feeding,
      'Grooming': _grooming,
      'Transfer': _transfer,
      'Toilet': _toilet,
      'Mobility': _mobility,
      'Dressing': _dressing,
      'Stairs': _stairs,
      'Bathing': _bathing,
      'Bowels': _bowels,
      'Bladder': _bladder,
      'TotalScore': _totalScore,
    };
  }
}
