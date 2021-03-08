class PostHosData {
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

  PostHosData({
    this.map,
  }) {
    this.hn = map['hn'];
    this.name = map['name'];
    this.gender = map['gender'];
    this.age = map['age'].toString();
    this.roomNumber = map['room_number'];
    this.bedNumber = map['bed_number'];
    this.temperature = map['temperature'];
    this.respirationRate = map['respiration_rate'];
    this.heartRate = map['heart_rate'];
    this.bloodPressure = map['blood_pressure'];
    this.oxygenRate = map['oxygen_rate'];
    this.status = map['status'];
  }
}
