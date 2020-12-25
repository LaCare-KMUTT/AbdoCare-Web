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
    const RANDOM_TEL_LENGTH = 8;
    const UNIQUE_KEY_LENGTH = 6;
    const HN_LENGTH = 5;
    String randomedTel = '08${_generateRandomNumber(RANDOM_TEL_LENGTH)}';
    String username = '$randomedTel@abdocare.com';
    Map<String, dynamic> usersCollection = {
      'name': 'ทดสอบชื่อ',
      'surname': 'ทดสอบนามสกุล',
      'address': 'ทดสอบที่อยู่',
      'dob': '1999-03-12',
      'gender': 'ชาย',
      'patientTel': randomedTel,
      'username': username,
      'password': '000000',
      'uniqueKey': '${_generateUniqueKey(UNIQUE_KEY_LENGTH)}',
      'hn': 'hn${_generateRandomNumber(HN_LENGTH)}',
    };
    return usersCollection;
  }

  Map<String, dynamic> mockAnSubCollectionOnCreatePatient() {
    const RANDOM_TEL_LENGTH = 8;
    const AN_LENGTH = 5;

    String randomedTel = '08${_generateRandomNumber(RANDOM_TEL_LENGTH)}';

    Map<String, dynamic> anSubCollectionDataOnCreatePatient = {
      'careTakerName': 'ทดสอบผู้ดูแล',
      'careTakerSurname': 'ทดสอบนามสกุลผู้ดูแล',
      'careTakerTel': randomedTel,
      'height': 170,
      'weight': 70,
      'an': 'an${_generateRandomNumber(AN_LENGTH)}',
      'operationDate': DateTime.now().toString(),
    };
    return anSubCollectionDataOnCreatePatient;
  }
}
