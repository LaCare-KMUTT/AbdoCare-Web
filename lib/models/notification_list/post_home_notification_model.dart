class PostHomeNotiData {
  String hn;
  String name;
  String seen;
  String formName;
  String formTime;
  String formDate;
  String notiId;
  Map<String, dynamic> map;

  PostHomeNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.seen = map["seen"];
    this.formName = map['formName'];
    this.formTime = map['formTime'];
    this.formDate = map['formDate'];
    this.notiId = map['notiId'];
  }
}
