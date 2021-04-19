import 'dart:math';

import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../service_locator.dart';

class MockFirestore {
  final _firestore = FirebaseFirestore.instance;

  final ICalculationService _calculationService =
      locator<ICalculationService>();
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
    String an = 'an${_generateRandomNumber(AN_LENGTH)}';
    // _an = an;

    Map<String, dynamic> anSubCollectionDataOnCreatePatient = {
      'careTakerName': 'ทดสอบผู้ดูแล',
      'careTakerSurname': 'ทดสอบนามสกุลผู้ดูแล',
      'careTakerTel': randomedTel,
      'height': 170,
      'weight': 70,
      'an': an,
      'operationDate': DateTime.now(),
      'operationMethod': 'LAP+Operation',
      'operationName': 'ผ่าตัดนิ่วในถุงน้ำดี',
      'doctorName': 'ชื่อหมอ',
      'previousIllness': 'Lung disease',
      'bedNumber': '1234',
      'roomType': 'ห้องเดี่ยว',
      'roomNumber': '1234',
      'state': 'Pre-Operation',
    };
    return anSubCollectionDataOnCreatePatient;
  }

  Map<String, dynamic> mockMedicalTeamCollection() {
    const MED_ID_LENGTH = 4;
    Map<String, dynamic> mockMedicalTeamCollection = {
      'name': 'ชื่อพยาบาล',
      'surname': 'นามสกุลพยาบาล',
      'medicalId': 'MD${_generateRandomNumber(MED_ID_LENGTH)}',
      'username': 'medtest1@abdocare.com',
      'password': 'abdc1234',
      'ward': '1'
    };
    return mockMedicalTeamCollection;
  }

  Future<Map<String, dynamic>> mockVitalSignForm({String an, String hn}) async {
    var creation = _calculationService.formatDate(date: DateTime.now());
    var userCollection = await _firestore
        .collection('Users')
        .where('hn', isEqualTo: hn)
        .limit(1)
        .get();
    var userDocId = userCollection.docs.first.id;
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(userDocId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .limit(1)
        .get();
    var patientState = await anSubCollection.docs.first.get('state');

    print(creation);
    Map<String, dynamic> mockVitalSignForm = {
      'an': an,
      'hn': hn,
      'creation': creation,
      'creator': 'พยาบาลนิรนาม',
      'formName': 'Vital Sign',
      'patientStage': patientState,
      'formData': {
        'temperature': 32.1,
        'respirationRate': 50,
        'bloodPressure': 85 / 65,
        'oxygen': 88,
        'pulseRate': 14,
        'status': 'ปกติ',
      },
    };

    print(mockVitalSignForm);
    return mockVitalSignForm;
  }
}
