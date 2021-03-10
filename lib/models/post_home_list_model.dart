class PostHomeData {
  String hn;
  String name;
  String gender;
  String age;
  dynamic admissionCount;
  dynamic painScore;
  String operationType;
  String woundImg;

  Map<String, dynamic> map;

  PostHomeData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.gender = map['gender'];
    this.age = map['age'].toString();
    this.admissionCount = map['admissionCount'];
    this.painScore = map['painScore'];
    this.operationType = map['operationType'];
    this.woundImg = map['woundImg'];
  }
}
