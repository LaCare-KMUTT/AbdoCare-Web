import 'dart:math';

import 'package:uuid/uuid.dart';

class MockFirestore {
  String _generateUniqueKey(int length) {
    var uuid = Uuid();
    return uuid.v1().substring(0, length);
  }

  String _generateRandomNumber(int length) {
    Random random = new Random();
    String min = '1';
    String max = '9';
    for (int i = 0; i < length - 1; i++) {
      min = '$min${0}';
      max = '$max${9}';
    }
    int randomedNumber =
        int.parse(min) + random.nextInt(int.parse(max) - int.parse(min));
    return randomedNumber.toString();
  }

  Map<String, dynamic> mockUsersCollection() {
    String randomedTel = '08${_generateRandomNumber(8)}';
    String username = '$randomedTel@abdocare.com';
    Map<String, dynamic> usersCollection = {
      'name': 'ทดสอบชื่อ',
      'surname': 'ทดสอบนามสกุล',
      'address': 'ทดสอบที่อยู่',
      'dob': DateTime.utc(1999, DateTime.march, 12).toLocal(),
      'gender': 'ชาย',
      'patientTel': randomedTel,
      'username': username,
      'password': '000000',
      'uniqueKey': '${_generateUniqueKey(6)}',
      'hn': 'hn${_generateRandomNumber(5)}',
    };
    return usersCollection;
  }
}
