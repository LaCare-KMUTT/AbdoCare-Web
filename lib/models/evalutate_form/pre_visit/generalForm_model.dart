class GeneralFormModel {
  String _hn;
  String _patientName;
  String _patientSurname;
  String _gender;
  DateTime _dob;

  String _an;
  String _ward;
  DateTime _operationDate;
  String _operationMethod;
  String _diagnosis;
  int _weight;
  int _bw;
  int _high;
  String _previousIllness;

  String _consentSigned;
  String _preMedication;
  String _typeOfAnesthesia;
  String _drugUsed;
  String _asaClass;
  String _previousSurgery;
  String _antiPlateletReason;
  String _antiPlateletDays;
  String _allergyMedication;
  String _allergySymptoms;
  String _allergyLatex;
  String _psychologicalStatus;
  String _drugAndSubstance;
  String _sleepDisorder;
  String _sleepDisorderDuration;
  String _sleepDisorderDurationAvg;

  Map<String, dynamic> dataToModel;

  GeneralFormModel();

  String get hn => _hn;
  String get patientName => _patientName;
  String get patientSurname => _patientSurname;
  String get gender => _gender;
  DateTime get dob => _dob;
  String get an => _an;
  String get ward => _ward;
  DateTime get operationDate => _operationDate;
  String get operationMethod => _operationMethod;
  String get diagnosis => _diagnosis;
  int get weight => _weight;
  int get bw => _bw;
  int get high => _high;
  String get previousIllness => _previousIllness;
  String get consentSigned => _consentSigned;
  String get preMedication => _preMedication;
  String get typeOfAnesthesia => _typeOfAnesthesia;
  String get drugUsed => _drugUsed;
  String get asaClass => _asaClass;
  String get previousSurgery => _previousSurgery;
  String get antiPlateletReason => _antiPlateletReason;
  String get antiPlateletDays => _antiPlateletDays;
  String get allergyMedication => _allergyMedication;
  String get allergySymptomps => _allergySymptoms;
  String get allergyLatex => _allergyLatex;
  String get psychologicalStatus => _psychologicalStatus;
  String get drugAndSubstance => _drugAndSubstance;
  String get sleepDisorder => _sleepDisorder;
  String get sleepDisorderDuration => _sleepDisorderDuration;
  String get sleepDisorderDurationAvg => _sleepDisorderDurationAvg;

  set hn(String hn) => this._hn = hn;

  set patientName(String patientName) => this._patientName = patientName;

  set patientSurname(String patientSurname) =>
      this._patientSurname = patientSurname;

  set gender(String gender) => this._gender = gender;

  set dob(DateTime dob) => this._dob = dob;

  set an(String an) => this._an = an;

  set ward(String ward) => this._ward = ward;

  set operationDate(DateTime operationDate) =>
      this._operationDate = operationDate;

  set operationMethod(String operationMethod) =>
      this._operationMethod = operationMethod;

  set diagnosis(String diagnosis) => this._diagnosis = diagnosis;

  set weight(int weight) => this._weight = weight;

  set bw(int bw) => this._bw = bw;

  set high(int high) => this._high = high;

  set previousIllness(String previousIllness) =>
      this._previousIllness = previousIllness;

  set consentSigned(String consentSigned) =>
      this._consentSigned = consentSigned;

  set preMedication(String preMedication) =>
      this._preMedication = preMedication;

  set typeOfAnesthesia(String typeOfAnesthesia) =>
      this._typeOfAnesthesia = typeOfAnesthesia;

  set drugUsed(String drugUsed) => this._drugUsed = drugUsed;

  set asaClass(String asaClass) => this._asaClass = asaClass;

  set previousSurgery(String previousSurgery) =>
      this._previousSurgery = previousSurgery;

  set antiPlateletReason(String antiPlateletReason) =>
      this._antiPlateletReason = antiPlateletReason;

  set anitiPlateletDays(String anitiPlateletDays) =>
      this._antiPlateletDays = anitiPlateletDays;

  set allergyMedication(String allergyMedication) =>
      this._allergyMedication = allergyMedication;

  set allergySymptoms(String allergySymptoms) =>
      this._allergySymptoms = allergySymptomps;

  set allergyLatex(String allergyLatex) => this._allergyLatex = allergyLatex;

  set psychologicalStatus(String psychologicalStatus) =>
      this._psychologicalStatus = psychologicalStatus;

  set drugAndSubstance(String drugAndSubstance) =>
      this._drugAndSubstance = drugAndSubstance;

  set sleepDisorder(String sleepDisorder) =>
      this._sleepDisorder = sleepDisorder;

  set sleepDisorderDuration(String sleepDisorderDuration) =>
      this._sleepDisorderDuration = sleepDisorderDuration;

  set sleepDisorderDurationAvg(String sleepDisorderDurationAvg) =>
      this._sleepDisorderDurationAvg = sleepDisorderDurationAvg;

  GeneralFormModel setUserCollectionFromDb(Map<String, dynamic> map) {
    _hn = map['hn'] ?? '-';
    _patientName = map['name'] ?? '-';
    _patientSurname = map['surname'] ?? '-';
    _gender = map['gender'] ?? '-';
    _dob = map['dob'].toDate() ?? '-';
    return this;
  }

  GeneralFormModel setAnSubCollectionFromDb(Map<String, dynamic> map) {
    _an = map['an'] ?? '-';
    _ward = map['ward'] ?? '-';
    _operationDate = map['operationDate'].toDate() ?? DateTime.now();
    _operationMethod = map['operationMethod'] ?? '-';
    _diagnosis = map['diagnosis'] ?? '-';
    _weight = map['oldWeight'] ?? 0;
    _bw = map['weight'] ?? 0;
    _high = map['height'] ?? 0;
    _previousIllness = map['previousIllness'] ?? '-';
    return this;
  }

  String getName() {
    return this._patientName;
  }

  GeneralFormModel getModel() {
    return this;
  }

  void fromMap(Map<String, dynamic> map) {
    _hn = map['hn'];
    _an = map['an'];
    _patientName = map['patientName'];
    _patientSurname = map['patientSurname'];
    _dob = map['dob'];
    _operationDate = map['operationDate'];
    _gender = map['gender'];
    _ward = map['ward'];
    _operationMethod = map['operationMethod'];
    _diagnosis = map['diagnosis'];
    _consentSigned = map['consentSigned'];
    _preMedication = map['preMedication'];
    _typeOfAnesthesia = map['typeOfAnesthesia'];
    _previousIllness = map['previousIllness'];
    _drugUsed = map['drugUsed'];
    _asaClass = map['asaClass'];
    _bw = map['bw'];
    _high = map['high'];
    _weight = map['weight'];
    _previousSurgery = map['previousSurgery'];
    _antiPlateletReason = map['antiPlateletReason'];
    _antiPlateletDays = map['antiPlateletDays'];
    _allergyMedication = map['allergyMedication'];
    _allergySymptoms = map['allergySymptoms'];
    _allergyLatex = map['allergyLatex'];
    _psychologicalStatus = map['psychologicalStatus'];
    _drugAndSubstance = map['drugAndSubstance'];
    _sleepDisorder = map['sleepDisorder'];
    _sleepDisorderDuration = map['sleepDisorderDuration'];
    _sleepDisorderDurationAvg = map['sleepDisorderDurationAvg'];
    print('Model is $this');
  }

  Map<String, dynamic> toMap() {
    return {
      'hn': _hn,
      'an': _an,
      'patientName': _patientName,
      'patientSurname': _patientSurname,
      'dob': _dob,
      'operationDate': _operationDate,
      'gender': _gender,
      'ward': _ward,
      'operationMethod': _operationMethod,
      'diagnosis': _diagnosis,
      'consentSigned': _consentSigned,
      'preMedication': _preMedication,
      'typeOfAnesthesia': _typeOfAnesthesia,
      'previousIllness': _previousIllness,
      'drugUsed': _drugUsed,
      'asaClass': _asaClass,
      'bw': _bw,
      'high': _high,
      'weight': _weight,
      'previousSurgery': _previousSurgery,
      'antiPlateletReason': _antiPlateletReason,
      'antiPlateletDays': _antiPlateletDays,
      'allergyMedication': _allergyMedication,
      'allergySymptoms': _allergySymptoms,
      'allergyLatex': _allergyLatex,
      'psychologicalStatus': _psychologicalStatus,
      'drugAndSubstance': _drugAndSubstance,
      'sleepDisorder': _sleepDisorder,
      'sleepDisorderDuration': _sleepDisorderDuration,
      'sleepDisorderDurationAvg': _sleepDisorderDurationAvg,
    };
  }
}
