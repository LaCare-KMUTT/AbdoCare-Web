class PreOpNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  Map<String, dynamic> map;

  PreOpNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
  }
}
