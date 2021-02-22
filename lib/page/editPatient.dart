import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/patient_list/editPatientForm.dart';
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

  var _currentHn = '';
  void _submitEditPatientForm({
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required DateTime dob,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required DateTime operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
    @required DateTime latestStateChange,
  }) async {
    var document = await _firebaseService.searchDocumentByField(
        collection: 'Users', field: 'hn', fieldValue: _currentHn);
    var userCollectionId = document.docs.first.id;
    var subCollection = await _firebaseService.getLatestAnSubCollection(
        docId: userCollectionId);
    var subCollectionId = subCollection['id'];

    await _firebaseService.updateDataToCollectionField(
        collection: 'Users',
        docId: userCollectionId,
        data: {
          'hn': hn,
          'name': patientName,
          'surname': patientSurname,
          'address': address,
          'gender': gender,
          'dob': dob,
          'patientTel': patientTel,
        });
    await _firebaseService.updateFieldToSubCollection(
      collection: 'Users',
      docId: userCollectionId,
      subCollection: 'an',
      subCollectionDoc: subCollectionId,
      data: {
        'an': an,
        'careTakerName': careTakerName,
        'careTakerSurname': careTakerSurname,
        'careTakerTel': careTakerTel,
        'careTakerRelationship': careTakerRelationship,
        'operationName': operationName,
        'operationMethod': operationMethod,
        'operationDate': operationDate,
        'doctorName': doctorName,
        'previousIllness': previousIllness,
        'bedNumber': bedNumber,
        'roomNumber': roomNumber,
        'state': state,
        'latestStateChange': latestStateChange,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String currentHn =
        ModalRoute.of(context).settings.arguments as String;
    setState(() {
      _currentHn = currentHn;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แก้ไขข้อมูลผู้ป่วย',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pushNamed(context, '/patientList_page'),
        ),
      ),
      body: EditPatientForm(
        _submitEditPatientForm,
      ),
    );
  }
}
