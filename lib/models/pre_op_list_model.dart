class PreOpData {
  String hn;
  String name;
  String gender;
  String age;
  String roomNumber;
  String bedNumber;
  double temperature;
  double respirationRate;
  double heartRate;
  double bloodPressure;
  double oxygenRate;
  String status;
  Map<String, dynamic> map;

  PreOpData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.gender = map['gender'];
    this.age = map['age'].toString();
    this.roomNumber = map['roomNumber'];
    this.bedNumber = map['bedNumber'];
    this.temperature = map['temperature'];
    this.respirationRate = map['respirationRate'];
    this.heartRate = map['heartRate'];
    this.bloodPressure = map['bloodPressure'];
    this.oxygenRate = map['oxygenRate'];
    this.status = map['status'];
  }
}
