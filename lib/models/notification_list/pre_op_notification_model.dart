class PreOpNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  String seen;
  String formName;
  String formTime;
  String formDate;
  DateTime formDateTimeSort;
  String notiId;
  Map<String, dynamic> map;

  PreOpNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
    this.seen = map["seen"];
    this.formName = map['formName'];
    this.formTime = map['formTime'];
    this.formDate = map['formDate'];
    this.formDateTimeSort = map['formDateTimeSort'];
    this.notiId = map['notiId'];
  }
}
