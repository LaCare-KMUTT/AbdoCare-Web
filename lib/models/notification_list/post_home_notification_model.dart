class PostHomeNotiData {
  String hn;
  String name;
  String seen;
  String formName;
  String formTime;
  String formDate;
  DateTime formDateTimeSort;
  String notiId;
  String imgURL;
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
    this.formDateTimeSort = map['formDateTimeSort'];
    this.notiId = map['notiId'];
    this.imgURL = map['imgURL'];
  }
}
