import 'package:flutter/material.dart';

import '../Widget/patient_list/editPatientForm.dart';
import '../Widget/appbar.dart';
import '../Widget/sidebar.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class EditPatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditPatientPageState();
  }
}

class _EditPatientPageState extends State<EditPatientPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  void _submitEditPatientForm({
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
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
        'careTakerName': careTakerName,
        'careTakerSurname': careTakerSurname,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'operationDate': DateTime.now()
            .toString(), //TODO Change operationDate to be input not DateTime.now()
        'doctorName': doctorName,
        'previousIllness': previousIllness,
        'bedNumber': bedNumber,
        'roomNumber': roomNumber,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('แก้ไขข้อมูลผู้ป่วย'),
        appBar: AppBar(),
      ),
      body: EditPatientForm(
        _submitEditPatientForm,
      ),
      drawer: SideBar(),
    );
  }
}
