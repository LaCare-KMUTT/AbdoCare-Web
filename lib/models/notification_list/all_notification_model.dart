class AllNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  String patientState;
  String seen;
  String formName;
  String formTime;
  DateTime formDateTimeSort;
  String formDate;
  String notiId;
  Map<String, dynamic> map;

  AllNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
    this.patientState = map['patientState'];
    this.seen = map["seen"];
    this.formName = map['formName'];
    this.formTime = map['formTime'];
    this.formDateTimeSort = map['formDateTimeSort'];
    this.formDate = map['formDate'];
    this.notiId = map['notsiId'];
  }
}
