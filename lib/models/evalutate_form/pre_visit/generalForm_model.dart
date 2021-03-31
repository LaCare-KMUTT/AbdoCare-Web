class GeneralFormModel {
  String hn;
  String patientName;
  String patientSurname;
  String gender;
  DateTime dob;

  String an;
  String ward;
  DateTime operationDate;
  String operationMethod;
  String diagnosis;
  int weight;
  int bw;
  int high;
  String previousIllness;

  String consentSigned;
  String preMedication;
  String typeOfAnesthesia;
  String drugUsed;
  String asaClass;
  String previousSurgery;
  String antiPlateletReason;
  String antiPlateletDays;
  String allergyMedication;
  String allergyLatex;
  String psychologicalStatus;
  String drugAndSubstance;
  String sleepDisorder;
  String sleepDisorderDuration;
  String sleepDisorderDurationAvg;

  Map<String, dynamic> dataToModel;

  GeneralFormModel();

  GeneralFormModel setUserCollection(Map<String, dynamic> map) {
    hn = map['hn'] ?? '-';
    patientName = map['name'] ?? '-';
    patientSurname = map['surname'] ?? '-';
    gender = map['gender'] ?? '-';
    dob = map['dob'].toDate() ?? '-';

    print('hn = $hn');
    print('name = $patientName');
    print('surname = $patientSurname');
    return this;
  }

  GeneralFormModel setAnSubCollection(Map<String, dynamic> map) {
    an = map['an'] ?? '-';
    ward = map['ward'] ?? '-';
    operationDate = map['operationDate'].toDate() ?? DateTime.now();
    operationMethod = map['operationMethod'] ?? '-';
    diagnosis = map['diagnosis'] ?? '-';
    weight = map['oldWeight'] ?? 0;
    bw = map['weight'] ?? 0;
    high = map['height'] ?? 0;
    previousIllness = map['previousIllness'] ?? '-';
    return this;
  }

  String getName() {
    return this.patientName;
  }
}
