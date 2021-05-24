class PatientListModel {
  String hn;
  String an;
  String name;
  String surname;
  String state;

  PatientListModel({Map<String, dynamic> map}) {
    this.hn = map['hn'];
    this.an = map['an'];
    this.name = map['name'];
    this.surname = map['surname'];
    this.state = map['state'];
  }
}
