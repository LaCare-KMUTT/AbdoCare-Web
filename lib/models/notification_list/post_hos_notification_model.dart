class PostHosNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  String seen;
  String formName;
  String formTime;
  Map<String, dynamic> map;

  PostHosNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
    this.seen = map["seen"];
    this.formName = map['formName'];
    this.formTime = map['formTime'];
  }
}
