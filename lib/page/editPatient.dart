import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../Widget/patient_list/editPatientForm.dart';
import '../Widget/sidebar.dart';
import '../services/interfaces/calculation_service_interface.dart';
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
  final ICalculationService _calculationService =
      locator<ICalculationService>();
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

    print('====> Here is updatingField to subCollection');
    print(
        '$hn, $an,$patientName, $patientSurname, $address, $gender, $dob, $patientTel');
    print(
        '$an, $careTakerName, $careTakerSurname, $careTakerTel, $careTakerRelationship, $operationDate, $operationName, $operationMethod, $doctorName, $previousIllness, $bedNumber, $roomNumber, $state');
    print('=======================e=e=e=e=e=e=e=');
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String currentHn =
        ModalRoute.of(context).settings.arguments as String;
    print('Print argument editPatient = $currentHn');
    setState(() {
      _currentHn = currentHn;
    });
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
