import 'package:AbdoCare_Web/Widget/sidebar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:flutter/material.dart';

import '../Widget/patientRegisterForm.dart';
import '../Widget/sidebar.dart';
import '../services/service_locator.dart';

class AddPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPatientPageState();
  }
}

class _AddPatientPageState extends State<AddPatientPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  void _submitPatientRegisterForm({
    @required String patientName,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) async {
    var patientUid =
        await _firebaseService.createPatient(collection: 'Users', data: {
      'name': patientName,
      'address': address,
      'gender': gender,
      'dob': dob,
      'patientTel': patientTel,
      'username': username,
      'uniqueKey': uniqueKey,
      'password': password,
    });
    await _firebaseService.addSubCollection(
      collection: 'Users',
      docId: patientUid,
      subCollection: 'an',
      data: {
        'an': 'testAnNumber',
        'careTakerName': careTakerName,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'weight': weight,
        'height': height,
        'operationDate': DateTime.now()
            .toString(), //TODO Change operationDate to be input not DateTime.now()
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('AbdoCare'),
        title: const Text('เพิ่มผู้ป่วย'),
        backgroundColor: Color(0xFFC37447),
      ),
      body: PatientRegisterForm(
        _submitPatientRegisterForm,
      ),
      drawer: SideBar(),
    );
  }
}
