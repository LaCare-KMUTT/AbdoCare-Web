class PostHosNotiData {
  String hn;
  String name;
  String roomNumber;
  String bedNumber;
  Map<String, dynamic> map;

  PostHosNotiData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
  }
}
