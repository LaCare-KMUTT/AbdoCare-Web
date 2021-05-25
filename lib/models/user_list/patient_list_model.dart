class PatientListModel {
  String hn;
  String name;
  String surname;
  String userId;
  String anId;

  PatientListModel({Map<String, dynamic> map}) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.surname = map['surname'];
    this.userId = map['userId'];
    this.anId = map['anId'];
  }
}
