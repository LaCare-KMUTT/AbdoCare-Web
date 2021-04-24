class AllNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  Map<String, dynamic> map;

  AllNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
  }
}
