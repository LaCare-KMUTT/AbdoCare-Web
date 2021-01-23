import 'package:flutter/material.dart';

import '../Widget/patient_list/patientRegisterForm.dart';
import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../services/interfaces/firebase_service_interface.dart';
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
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required String dob,
    @required String state,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) async {
    var patientUid =
        await _firebaseService.createPatient(collection: 'Users', data: {
      'hn': hn,
      'name': patientName,
      'surname': patientSurname,
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
        'state': 'Pre-Operation',
        'careTakerName': careTakerName,
        'careTakerSurname': careTakerSurname,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'operationDate': DateTime.now()
            .toString(), //TODO Change operationDate to be input not DateTime.now()
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('เพิ่มผู้ป่วย'),
        appBar: AppBar(),
      ),
      body: PatientRegisterForm(
        _submitPatientRegisterForm,
      ),
      drawer: SideBar(),
    );
  }
}
